package com.xuecheng.content.jobhandler;

import com.xuecheng.messagesdk.model.po.MqMessage;
import com.xuecheng.messagesdk.service.MessageProcessAbstract;
import com.xuecheng.messagesdk.service.MqMessageService;
import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class CoursePublishTask extends MessageProcessAbstract {
    
    @XxlJob("CoursePublishJobHandler")
    public void coursePublishJobHandler() {
        int index = XxlJobHelper.getShardIndex();
        int total = XxlJobHelper.getShardTotal();
        process(index, total, "course_publish", 4, 60);
    }

    @Override
    public boolean execute(MqMessage mqMessage) {
        //拿到待处理的消息
        Long courseId = Long.parseLong(mqMessage.getBusinessKey1());
        Long id = mqMessage.getId();
        //课程静态化上传minio
        generateCourseHtml(mqMessage, id, courseId);
        //向es写索引
        saveCourseIndex(mqMessage, id, courseId);
        //向redis写缓存
        saveCourseCache(mqMessage, id, courseId);
        return true;
    }

    private void saveCourseCache(MqMessage mqMessage, Long id, Long courseId) {
        MqMessageService mqMessageService = this.getMqMessageService();
        int stageThree = mqMessageService.getStageThree(id);
        if (stageThree > 0) {
            log.info("课程：{}，已经加入缓存", id);
            return;
        }
        //进行处理
        //todo
        //写入消息表
        mqMessageService.completedStageThree(id);
    }

    private void saveCourseIndex(MqMessage mqMessage, Long id, Long courseId) {
        MqMessageService mqMessageService = this.getMqMessageService();
        int stageTwo = mqMessageService.getStageTwo(id);
        if (stageTwo > 0) {
            log.info("课程：{}，已经创建索引", id);
            return;
        }
        //进行处理
        //todo
        //写入消息表
        mqMessageService.completedStageTwo(id);
    }

    private void generateCourseHtml(MqMessage mqMessage, Long id, Long courseId) {
        MqMessageService mqMessageService = this.getMqMessageService();
        int stageOne = mqMessageService.getStageOne(id);
        if (stageOne > 0) {
            log.info("课程：{}，已经静态化", id);
            return;
        }
        //进行处理
        //todo
        //写入消息表
        mqMessageService.completedStageOne(id);
    }
}
