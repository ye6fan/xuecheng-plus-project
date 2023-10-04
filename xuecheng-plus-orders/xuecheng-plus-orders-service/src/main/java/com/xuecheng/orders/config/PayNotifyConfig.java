package com.xuecheng.orders.config;

import com.alibaba.fastjson.JSON;
import com.xuecheng.messagesdk.model.po.MqMessage;
import com.xuecheng.messagesdk.service.MqMessageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author Mr.M
 * @version 1.0
 * &#064;description  rabbitmq
 */
@Slf4j
@Configuration
//当一个类实现了ApplicationContextAware接口并且被Spring容器管理时
//Spring会在创建该Bean的实例后，自动调用setApplicationContext()方法，并将ApplicationContext对象作为参数传递进来
public class PayNotifyConfig implements ApplicationContextAware {

    //交换机   fanout  扇形
    public static final String PAYNOTIFY_EXCHANGE_FANOUT = "paynotify_exchange_fanout";
    //支付结果通知消息类型
    public static final String MESSAGE_TYPE = "payresult_notify";
    //支付通知队列
    public static final String PAYNOTIFY_QUEUE = "paynotify_queue";

    //声明交换机，且持久化，原来是这样，FanoutExchange
    @Bean(PAYNOTIFY_EXCHANGE_FANOUT)
    public FanoutExchange paynotify_exchange_fanout() {
        // 三个参数：交换机名称、是否持久化、当没有queue与其绑定时是否自动删除
        return new FanoutExchange(PAYNOTIFY_EXCHANGE_FANOUT, true, false);
    }

    //支付通知队列,且持久化，durable耐用的，QueueBuilder
    @Bean(PAYNOTIFY_QUEUE)
    public Queue course_publish_queue() {
        return QueueBuilder.durable(PAYNOTIFY_QUEUE).build();
    }

    //交换机和支付通知队列绑定，qualifier修饰符，BindingBuilder
    @Bean
    public Binding binding_course_publish_queue(@Qualifier(PAYNOTIFY_QUEUE) Queue queue,
                                                @Qualifier(PAYNOTIFY_EXCHANGE_FANOUT) FanoutExchange exchange) {
        return BindingBuilder.bind(queue).to(exchange);     //注意语法
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        // 获取RabbitTemplate
        RabbitTemplate rabbitTemplate = applicationContext.getBean(RabbitTemplate.class);
        //消息处理service，因为导入了SDK所以可以注入MqMessageService
        MqMessageService mqMessageService = applicationContext.getBean(MqMessageService.class);
        // 设置ReturnCallback回调，以下参数的意义
        //message表示发送的消息对象。rabbitMq的消息类
        //replyCode表示服务器返回的应答码，用于标识错误类型。
        //replyText表示服务器返回的应答文本，用于说明错误原因。
        //exchange表示消息发送时使用的交换机。
        //routingKey表示消息发送时使用的路由键。
        //ReturnCallback 回调是在消息无法被正确路由到指定队列时触发的回调
        rabbitTemplate.setReturnCallback((message, replyCode, replyText, exchange, routingKey) -> {
            // 投递失败，记录日志
            log.info("消息发送失败，应答码{}，原因{}，交换机{}，路由键{},消息{}",
                    replyCode, replyText, exchange, routingKey, message);
            MqMessage mqMessage = JSON.parseObject(message.toString(), MqMessage.class);
            //将消息再添加到消息表，这个是xxl-job的信息表
            mqMessageService.addMessage(mqMessage.getMessageType(),
                    mqMessage.getBusinessKey1(), mqMessage.getBusinessKey2(), mqMessage.getBusinessKey3());

        });
    }
}
