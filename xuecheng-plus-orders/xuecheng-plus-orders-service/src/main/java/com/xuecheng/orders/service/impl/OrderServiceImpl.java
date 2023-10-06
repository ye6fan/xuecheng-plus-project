package com.xuecheng.orders.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.alipay.api.response.AlipayTradeWapPayResponse;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.base.utils.IdWorkerUtils;
import com.xuecheng.base.utils.QRCodeUtil;
import com.xuecheng.messagesdk.model.po.MqMessage;
import com.xuecheng.messagesdk.service.MqMessageService;
import com.xuecheng.orders.config.AlipayConfig;
import com.xuecheng.orders.config.PayNotifyConfig;
import com.xuecheng.orders.mapper.XcOrdersGoodsMapper;
import com.xuecheng.orders.mapper.XcOrdersMapper;
import com.xuecheng.orders.mapper.XcPayRecordMapper;
import com.xuecheng.orders.model.dto.AddOrderDto;
import com.xuecheng.orders.model.dto.PayRecordDto;
import com.xuecheng.orders.model.dto.PayStatusDto;
import com.xuecheng.orders.model.po.XcOrders;
import com.xuecheng.orders.model.po.XcOrdersGoods;
import com.xuecheng.orders.model.po.XcPayRecord;
import com.xuecheng.orders.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageBuilder;
import org.springframework.amqp.core.MessageDeliveryMode;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class OrderServiceImpl implements OrderService {
    @Autowired
    private XcOrdersMapper ordersMapper;
    @Autowired
    private XcOrdersGoodsMapper ordersGoodsMapper;
    @Autowired
    private XcPayRecordMapper payRecordMapper;
    @Autowired
    OrderService orderService;
    @Autowired
    RabbitTemplate rabbitTemplate;
    @Autowired
    MqMessageService mqMessageService;

    @Value("${pay.qrcodeurl}")
    private String qrcodeurl;
    @Value("${pay.alipay.APP_ID}")
    String APP_ID;
    @Value("${pay.alipay.APP_PRIVATE_KEY}")
    String APP_PRIVATE_KEY;

    @Override   //得到支付记录通过payNo
    public XcPayRecord getPayRecordByPayno(String payNo) {
        return payRecordMapper.selectOne(new LambdaQueryWrapper<XcPayRecord>()
                .eq(XcPayRecord::getPayNo, payNo));
    }

    @Override   //查询支付结果通过payNo
    public PayRecordDto queryPayResult(String payNo) {
        //调用支付包接口查询支付结果
        PayStatusDto payStatusDto = queryPayResultFromAlipay(payNo);
        //拿到支付结果更新支付记录表和订单表，代理对象调用
        orderService.saveAliPayStatus(payStatusDto);
        //获取支付记录，目的是为了返回
        XcPayRecord payRecord = getPayRecordByPayno(payNo);
        PayRecordDto payRecordDto = new PayRecordDto();
        //多了一个二维码
        BeanUtils.copyProperties(payRecord, payRecordDto);
        return payRecordDto;
    }

    @Transactional
    @Override   //生成二维码代码
    public PayRecordDto createOrder(String userId, AddOrderDto addOrderDto) {
        //插入订单
        XcOrders xcOrders = saveXcOrders(userId, addOrderDto);
        //插入支付记录
        XcPayRecord payRecord = createPayRecord(xcOrders);
        //生成二维码通过payNo，不过，没想到生成二维码要做这么多数据处理
        Long payNo = payRecord.getPayNo();
        QRCodeUtil qrCodeUtil = new QRCodeUtil();
        //通过payNo生成二维码和地址，也就是说二维码是网址，payNo是网址的参数，%s占位符
        //用户一扫，就带着参数请求我的地址了
        String url = String.format(qrcodeurl, payNo);
        String qrCode = qrCodeUtil.createQRCode(url, 200, 200);
        PayRecordDto payRecordDto = new PayRecordDto();
        //就多了个二维码String参数
        BeanUtils.copyProperties(payRecord, payRecordDto);
        payRecordDto.setQrcode(qrCode);
        return payRecordDto;
    }

    @Transactional  //生成二维码之前先保存订单
    public XcOrders saveXcOrders(String userId, AddOrderDto addOrderDto) {
        //插入订单||外部系统的业务Id
        //幂等性||这个businessId到底从哪里来的，前端生成的随机的，应该
        XcOrders xcOrders = getOrderByBusinessId(addOrderDto.getOutBusinessId());
        //查到businessId直接返回已有订单直接返回
        if (xcOrders != null) return xcOrders;
        xcOrders = new XcOrders();
        //雪花算法||高位是时间戳，中间部分是数据中心和工作机器的标识，低位是每个节点自增的序号
        //这里定义了5位工作机器ID，5位数据中心ID，12位序列号（总共22位），
        //使用系统当前时间作为起始时间戳，以毫秒为单位计算时间戳差值，并在序列号用尽时等待下一个毫秒再生成
        //单例模式
        long orderId = IdWorkerUtils.getInstance().nextId();
        //订单Id和外部系统业务Id不是一个东西
        xcOrders.setId(orderId);
        xcOrders.setTotalPrice(addOrderDto.getTotalPrice());    //总价
        xcOrders.setCreateDate(LocalDateTime.now());   //时间
        xcOrders.setStatus("600001");   //未支付
        xcOrders.setOrderType("60201");  //购买课程
        xcOrders.setOrderName(addOrderDto.getOrderName());  //名字
        xcOrders.setOrderDescrip(addOrderDto.getOrderDescrip());  //描述
        xcOrders.setOrderDetail(addOrderDto.getOrderDetail());  //详情
        xcOrders.setOutBusinessId(addOrderDto.getOutBusinessId());  //外部业务Id
        xcOrders.setUserId(userId);    //用户Id
        int insert = ordersMapper.insert(xcOrders);
        if (insert <= 0) XueChengPlusException.cast("添加订单失败");
        //订单明细表，属于重复字段，但是方便检索
        String orderDetail = addOrderDto.getOrderDetail();
        //可能有多个商品
        List<XcOrdersGoods> ordersGoodsList = JSON.parseArray(orderDetail, XcOrdersGoods.class);
        ordersGoodsList.forEach(goods -> {
            //orderId是联系
            goods.setOrderId(orderId);
            int flag = ordersGoodsMapper.insert(goods);
            if (flag <= 0) XueChengPlusException.cast("添加订单详情失败");
        });
        return xcOrders;
    }

    @Transactional  //生成二维码之前先创建支付记录
    public XcPayRecord createPayRecord(XcOrders orders) {
        //订单号
        Long ordersId = orders.getId();
        XcOrders xcOrders = ordersMapper.selectById(ordersId);
        if (xcOrders == null) XueChengPlusException.cast("订单不存在");
        String status = orders.getStatus();
        //已支付
        if ("601002".equals(status)) XueChengPlusException.cast("此订单已支付");
        XcPayRecord xcPayRecord = new XcPayRecord();
        //payNo要唯一，因为使用过一次就不可以使用第二次了，支付号
        xcPayRecord.setPayNo(IdWorkerUtils.getInstance().nextId());
        //订单id也就说，一个订单可以有多个支付记录
        xcPayRecord.setOrderId(ordersId);
        xcPayRecord.setOrderName(xcOrders.getOrderName());  //名字
        xcPayRecord.setTotalPrice(xcOrders.getTotalPrice());    //总价
        xcPayRecord.setCurrency("CNY");     //币种
        xcPayRecord.setCreateDate(LocalDateTime.now());     //时间
        xcPayRecord.setStatus("601001");    //未支付，订单交易类型和支付记录交易类型不一样
        xcPayRecord.setUserId(xcOrders.getUserId());    //用户Id，从订单表取
        int insert = payRecordMapper.insert(xcPayRecord);
        if (insert <= 0) XueChengPlusException.cast("插入支付记录失败");
        return xcPayRecord;
    }

    //查询订单通过businessId
    public XcOrders getOrderByBusinessId(String businessId) {
        return ordersMapper.selectOne(new LambdaQueryWrapper<XcOrders>()
                .eq(XcOrders::getOutBusinessId, businessId));
    }

    //查询支付结果
    public PayStatusDto queryPayResultFromAlipay(String payNo) {
        //获得初始化的AlipayClient，感觉可以提出来但是算了就这样吧
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.URL, APP_ID,
                APP_PRIVATE_KEY, AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.SIGNTYPE);
        //构造请求所用的类
        AlipayTradeWapPayRequest alipayRequest = new AlipayTradeWapPayRequest();
        JSONObject bizContent = new JSONObject();
        //传递所需参数，毕竟appId和payNo组合是不会重复的
        bizContent.put("out_trade_no", payNo);
        alipayRequest.setBizContent(bizContent.toString());
        //阿里的返回参数类
        AlipayTradeWapPayResponse response;
        String body = null;
        try {
            response = alipayClient.execute(alipayRequest);
            if (!response.isSuccess()) XueChengPlusException.cast("交易失败");
            body = response.getBody();
        } catch (AlipayApiException e) {
            e.printStackTrace();
            XueChengPlusException.cast("请求支付查询失败");
        }
        //解析支付结果，并封装返回
        Map<String, String> map = JSON.parseObject(body, Map.class);
        PayStatusDto payStatusDto = new PayStatusDto();
        payStatusDto.setOut_trade_no(payNo);
        //这个trade_on应该是支付宝的支付好号
        payStatusDto.setTrade_no(map.get("trade_on"));
        payStatusDto.setTrade_status(map.get("trade_status"));  //交易状态
        payStatusDto.setApp_id(APP_ID);
        payStatusDto.setTotal_amount(map.get("total_amount"));  //总金额
        return payStatusDto;
    }

    @Transactional
    @Override   //保存支付状态到订单表和支付记录表
    public void saveAliPayStatus(PayStatusDto payStatusDto) {
        //得到自己的支付号
        String payNo = payStatusDto.getOut_trade_no();
        //交易记录
        XcPayRecord xcPayRecord = getPayRecordByPayno(payNo);
        if (xcPayRecord == null) XueChengPlusException.cast("找不到相关记录");
        //得到订单id
        Long orderId = xcPayRecord.getOrderId();
        XcOrders xcOrders = ordersMapper.selectById(orderId);
        if (xcOrders == null) XueChengPlusException.cast("找不到相关的订单");
        String status = xcPayRecord.getStatus();
        if ("601002".equals(status)) return;    //已支付
        String trade_status = payStatusDto.getTrade_status();
        if ("TRADE_SUCCESS".equals(trade_status)) {
            //更新支付记录
            xcPayRecord.setStatus("601002");    //已支付
            xcPayRecord.setOutPayNo(payStatusDto.getTrade_no());
            xcPayRecord.setOutPayChannel("Alipay");     //支付类型
            xcPayRecord.setPaySuccessTime(LocalDateTime.now());
            payRecordMapper.updateById(xcPayRecord);
            //更新订单
            xcOrders.setStatus("600002");   //已支付
            ordersMapper.updateById(xcOrders);
            //好了，要发送信息到信息表了，每个库有自己的消息表，但是sdk包是一个
            //一个消息类型，三个消息的处理标识，一个businessId，一个订单类型
            //这个businessId就是选课Id
            MqMessage message = mqMessageService.addMessage("payresult_notify",
                    xcOrders.getOutBusinessId(), xcOrders.getOrderType(), null);
            //通知支付成功，并发送消息到rabbitMq。消息表的消息
            notifyPayResult(message);
        }
    }

    @Override   //通知支付成功
    public void notifyPayResult(MqMessage message) {
        Long id = message.getId();
        String jsonString = JSON.toJSONString(message);
        //rabbitMq的类中方法，转为字节数组，并消息传送模式为持久化，保存到磁盘
        Message msg = MessageBuilder.withBody(jsonString.getBytes(StandardCharsets.UTF_8))
                .setDeliveryMode(MessageDeliveryMode.PERSISTENT).build();
        //还是rabbitMq的类，用于关联消息，跟踪和标识发送的消息。correlation相关联的
        CorrelationData correlationData = new CorrelationData();
        //concurrent并发，future未来，好像JUC的内容
        //添加回调callback，返回结果result
        correlationData.getFuture().addCallback(result -> {
            if (result != null) {
                //判断类型
                if (result.isAck()) {
                    log.info("发送消息成功:{}", jsonString);
                    mqMessageService.completed(id);
                } else {
                    log.error("消息发送失败:{}", jsonString);
                }
            }
        }, ex -> log.error("消息发送失败:{}", jsonString));
        //发送消息，就是在这里添加的回调CorrelationData
        //ListenableFuture 是一个可监听的异步任务结果，可以在发送消息后获取一个 Future 对象来监视消息的确认结果
        //交换机，路由key，消息，信息确认
        rabbitTemplate.convertAndSend(PayNotifyConfig.PAY_NOTIFY_EXCHANGE_FANOUT, "",
                msg, correlationData);
    }

}
