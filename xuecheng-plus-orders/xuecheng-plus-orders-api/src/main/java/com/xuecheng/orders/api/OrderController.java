package com.xuecheng.orders.api;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.orders.config.AlipayConfig;
import com.xuecheng.orders.model.dto.AddOrderDto;
import com.xuecheng.orders.model.dto.PayRecordDto;
import com.xuecheng.orders.model.dto.PayStatusDto;
import com.xuecheng.orders.model.po.XcPayRecord;
import com.xuecheng.orders.service.OrderService;
import com.xuecheng.orders.util.SecurityUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

@Api(value = "订单支付接口", tags = "订单支付接口")
@Slf4j
@RestController
//其实重点就是订单号和支付号不一样，和回调。不写注释看代码好难受
public class OrderController {
    @Autowired
    OrderService orderService;
    @Value("${pay.alipay.APP_ID}")
    String APP_ID;
    @Value("${pay.alipay.APP_PRIVATE_KEY}")
    String APP_PRIVATE_KEY;
    @Value("${pay.alipay.ALIPAY_PUBLIC_KEY}")
    String ALIPAY_PUBLIC_KEY;

    @ApiOperation("生成支付二维码")
    @PostMapping("/generatepaycode")
    public PayRecordDto generatePayCode(@RequestBody AddOrderDto addOrderDto) {
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        String userId = null;
        if (user != null) userId = user.getId();
        //生成订单，返回支付二维码
        return orderService.createOrder(userId, addOrderDto);
    }

    @ApiOperation("扫码下单接口")
    @GetMapping("/requestpay")
    public void requestpay(String payNo, HttpServletResponse httpResponse) throws AlipayApiException, IOException {
        //获得初始化的AlipayClient阿里支付客户端
        //支付请求地址，appId，密钥，支付宝公钥，json模式，utf-8，RSA2加密
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.URL, APP_ID,
                APP_PRIVATE_KEY, AlipayConfig.FORMAT, AlipayConfig.CHARSET, AlipayConfig.SIGNTYPE);
        //创建API对应的request
        AlipayTradeWapPayRequest alipayRequest = new AlipayTradeWapPayRequest();
        XcPayRecord xcPayRecord = orderService.getPayRecordByPayno(payNo);
        //果然是支付的记录payNo作为支付号
        if (xcPayRecord == null) XueChengPlusException.cast("支付记录不存在");
        String status = xcPayRecord.getStatus();
        //已支付
        if ("601002".equals(status)) XueChengPlusException.cast("已支付无需重复支付");
        //设置回调也就是通知地址
        alipayRequest.setNotifyUrl("http://www.yefan.xyz/api/orders/paynotify");
        //填充业务参数||biz生意
        alipayRequest.setBizContent("{" +
                "    \"out_trade_no\":\"" + payNo + "\"," +
                "    \"total_amount\":" + xcPayRecord.getTotalPrice() + "," +
                "    \"subject\":\"" + xcPayRecord.getOrderName() + "\"," +
                "    \"product_code\":\"QUICK_WAP_WAY\"" +
                "  }");
        //发送请求并得到返回的数据
        String form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单，下单
        httpResponse.setContentType("text/html;charset=" + AlipayConfig.CHARSET);
        //把返回的数据交给支付宝，出现支付页面
        httpResponse.getWriter().write(form);//直接将完整的表单html输出到页面
        httpResponse.getWriter().flush();
        //支付成功后，钱就到了商家的账户
    }

    @ApiOperation("查询支付结果")
    @GetMapping("/payresult")
    public PayRecordDto payresult(String payNo) {
        //查询支付结果
        return orderService.queryPayResult(payNo);
    }

    @ApiOperation("支付后回调地址")
    @PostMapping("/paynotifytest")
    public void paynotify(HttpServletRequest request, HttpServletResponse response)
            throws AlipayApiException, IOException {
        //获取支付宝POST过来反馈信息
        Map<String, String> params = new HashMap<>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (String name : requestParams.keySet()) {
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
            params.put(name, valueStr);
        }
        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//

        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
        //计算得出通知验证结果
        //boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String publicKey, String charset, String sign_type)
        boolean verify_result = AlipaySignature.rsaCheckV1(params,
                ALIPAY_PUBLIC_KEY, AlipayConfig.CHARSET, "RSA2");

        if (verify_result) {
            //验证成功
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no")
                    .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no")
                    .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            //交易状态
            String trade_status = new String(request.getParameter("trade_status")
                    .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            //交易金额
            String total_amount = new String(request.getParameter("total_amount")
                    .getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            //请在这里加上商户的业务逻辑程序代码
            //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
            if (trade_status.equals("TRADE_SUCCESS")) {
                PayStatusDto payStatusDto = new PayStatusDto();
                payStatusDto.setTrade_status(trade_status);
                payStatusDto.setTrade_no(trade_no);
                payStatusDto.setOut_trade_no(out_trade_no);
                payStatusDto.setTotal_amount(total_amount);
                payStatusDto.setApp_id(APP_ID);
                orderService.saveAliPayStatus(payStatusDto);
            }

            //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
            response.getWriter().write("success");

        } else {
            //验证失败
            response.getWriter().write("fail");
        }
    }

}
