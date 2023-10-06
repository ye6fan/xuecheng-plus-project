package com.xuecheng.content.service.impl;

import com.alibaba.fastjson.JSON;
import com.xuecheng.content.config.CourseNotifyConfig;
import com.xuecheng.messagesdk.model.po.MqMessage;
import com.xuecheng.messagesdk.service.MqMessageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageBuilder;
import org.springframework.amqp.core.MessageDeliveryMode;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;

@Slf4j
@Service
public class NotifyResult {
    @Autowired
    MqMessageService mqMessageService;
    @Autowired
    RabbitTemplate rabbitTemplate;

    public void notifyCourseResult(MqMessage message, String routingKey) {
        Long id = message.getId();
        String jsonString = JSON.toJSONString(message);
        //rabbitMq的类中方法，转为字节数组，并消息传送模式为持久化，保存到磁盘
        Message msg = MessageBuilder.withBody(jsonString.getBytes(StandardCharsets.UTF_8))
                .setDeliveryMode(MessageDeliveryMode.PERSISTENT).build();
        //还是rabbitMq的类，用于关联消息，跟踪和标识发送的消息。correlation相关联的
        CorrelationData correlationData = new CorrelationData();
        //concurrent并发，future未来，好像JUC的内容
        //添加回调callback，返回结果result，一个成功回调函数，一个异常回调函数
        correlationData.getFuture().addCallback(result -> {
            if (result != null) {
                //判断类型
                if (result.isAck()) {
                    log.info("发送消息成功:{}", jsonString);
                } else {
                    log.error("消息发送失败:{}", jsonString);
                }
            }
        }, ex -> log.error("消息发送失败:{}", jsonString));
        //发送消息，就是在这里添加的回调CorrelationData
        //ListenableFuture 是一个可监听的异步任务结果，可以在发送消息后获取一个 Future 对象来监视消息的确认结果
        //交换机，路由key，消息，信息确认
        rabbitTemplate.convertAndSend(CourseNotifyConfig.COURSE_EXCHANGE_DIRECT, routingKey,
                msg, correlationData);
    }
}
