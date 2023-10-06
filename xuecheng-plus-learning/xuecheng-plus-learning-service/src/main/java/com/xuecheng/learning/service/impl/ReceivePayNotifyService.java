package com.xuecheng.learning.service.impl;

import com.alibaba.fastjson.JSON;
import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.learning.config.PayNotifyConfig;
import com.xuecheng.learning.service.MyCourseTablesService;
import com.xuecheng.messagesdk.model.po.MqMessage;
import com.xuecheng.messagesdk.service.MqMessageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class ReceivePayNotifyService {

    @Autowired
    private RabbitTemplate rabbitTemplate;
    @Autowired
    MqMessageService mqMessageService;
    @Autowired
    MyCourseTablesService myCourseTablesService;

    //绑定队列
    @RabbitListener(queues = PayNotifyConfig.PAY_NOTIFY_QUEUE)
    public void receive(Message message) {
        byte[] body = message.getBody();
        String jsonString = new String(body);
        //解析为消息表的记录
        MqMessage mqMessage = JSON.parseObject(jsonString, MqMessage.class);
        String chooseCourseId = mqMessage.getBusinessKey1();
        String orderType = mqMessage.getBusinessKey2();
        //调用保存课程，根据订单类型，购买课程标识
        if (orderType.equals("60201")) {
            boolean flag = myCourseTablesService.saveChooseCourseSuccess(chooseCourseId);
            if (!flag) XueChengPlusException.cast("保存选课记录失败");
        }
    }

}
