package com.xuecheng.freemarker.jobhandler;

import com.alibaba.fastjson.JSON;
import com.xuecheng.content.config.CourseNotifyConfig;
import com.xuecheng.content.feignclient.SearchServiceClient;
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
public class ReceiveCourseNotifyService {
    @Autowired
    SearchServiceClient searchServiceClient;
    @Autowired
    private RabbitTemplate rabbitTemplate;
    @Autowired
    MqMessageService mqMessageService;
    @Autowired
    CourseHandlerTask courseHandlerTask;

    //绑定发布队列
    @RabbitListener(queues = CourseNotifyConfig.PUBLISH_NOTIFY_QUEUE)
    public void publishCourse(Message message) {
        MqMessage mqMessage = analysis(message);
        //拿到待处理的消息
        Long courseId = Long.parseLong(mqMessage.getBusinessKey1());
        Long id = mqMessage.getId();
        //课程静态化上传minio
        courseHandlerTask.generateCourseHtml(id, courseId);
        //向es写索引
        courseHandlerTask.saveCourseIndex(id, courseId);
        //向redis写缓存
        courseHandlerTask.saveCourseCache(id, courseId);
        //完成
        mqMessageService.completed(id);
    }

    //绑定删除队列
    @RabbitListener(queues = CourseNotifyConfig.DELETE_NOTIFY_QUEUE)
    public void deleteCourse(Message message) {
        MqMessage mqMessage = analysis(message);
        //拿到待处理的消息
        Long id = mqMessage.getId();
        Long courseId = Long.parseLong(mqMessage.getBusinessKey1());
        searchServiceClient.delete(courseId);
        mqMessageService.completed(id);
    }

    private MqMessage analysis(Message message) {
        byte[] body = message.getBody();
        String jsonString = new String(body);
        //解析为消息表的记录
        return JSON.parseObject(jsonString, MqMessage.class);
    }

}
