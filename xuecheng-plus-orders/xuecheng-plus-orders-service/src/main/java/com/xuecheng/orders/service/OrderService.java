package com.xuecheng.orders.service;

import com.xuecheng.orders.model.dto.AddOrderDto;
import com.xuecheng.orders.model.dto.PayRecordDto;
import com.xuecheng.orders.model.dto.PayStatusDto;
import com.xuecheng.orders.model.po.XcPayRecord;

public interface OrderService {

   /**
    * &#064;description  创建商品订单
    * @param addOrderDto 订单信息
    * @return PayRecordDto 支付交易记录(包括二维码)
    */
   PayRecordDto createOrder(String userId, AddOrderDto addOrderDto);

   /**
    * &#064;description  查询支付交易记录
    * @param payNo  交易记录号
    * @return com.xuecheng.orders.model.po.XcPayRecord
    * @author Mr.M
    */
   XcPayRecord getPayRecordByPayno(String payNo);

   /**
    * 请求支付宝查询支付结果
    * @param payNo 支付记录id
    * @return 支付记录信息
    */
   PayRecordDto queryPayResult(String payNo);


   void saveAliPayStatus(PayStatusDto payStatusDto);
}