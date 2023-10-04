package com.xuecheng.freemarker.jobhandler;

import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.content.feignclient.CourseIndex;
import com.xuecheng.content.feignclient.SearchServiceClient;
import com.xuecheng.content.mapper.CoursePublishMapper;
import com.xuecheng.content.model.po.CoursePublish;
import com.xuecheng.content.service.CoursePublishService;
import com.xuecheng.messagesdk.model.po.MqMessage;
import com.xuecheng.messagesdk.service.MessageProcessAbstract;
import com.xuecheng.messagesdk.service.MqMessageService;
import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;

@Slf4j
@Component  //通过继承消息虚拟类，导入SDK就可以写自己代码，也就是说每个库都有自己的消息表
public class CoursePublishTask extends MessageProcessAbstract {
    @Autowired
    CoursePublishService coursePublishService;
    @Autowired
    SearchServiceClient searchServiceClient;
    @Autowired
    CoursePublishMapper coursePublishMapper;

    @XxlJob("CoursePublishJobHandler")
    public void coursePublishJobHandler() {
        int index = XxlJobHelper.getShardIndex();
        int total = XxlJobHelper.getShardTotal();
        //这个process过程是传递类型的，如何去读取信息，数量和超时时间
        process(index, total, "course_publish", 4, 60);
    }

    @Override   //实现父类的方法，这个方法会在process里的线程中被调用
    public boolean execute(MqMessage mqMessage) {
        //拿到待处理的消息
        Long courseId = Long.parseLong(mqMessage.getBusinessKey1());
        Long id = mqMessage.getId();
        //课程静态化上传minio
        generateCourseHtml(id, courseId);
        //向es写索引
        saveCourseIndex(id, courseId);
        //向redis写缓存
        saveCourseCache(id, courseId);
        return true;
    }

    private void saveCourseCache(Long id, Long courseId) {
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

    private void saveCourseIndex(Long id, Long courseId) {
        MqMessageService mqMessageService = this.getMqMessageService();
        int stageTwo = mqMessageService.getStageTwo(id);
        if (stageTwo > 0) {
            log.info("课程：{}，已经创建索引", id);
            return;
        }
        //进行处理
        CoursePublish coursePublish = coursePublishMapper.selectById(courseId);
        CourseIndex courseIndex = new CourseIndex();
        BeanUtils.copyProperties(coursePublish, courseIndex);
        Boolean add = searchServiceClient.add(courseIndex);
        if(!add) XueChengPlusException.cast("远程调用加入课程索引失败");
        //写入消息表
        mqMessageService.completedStageTwo(id);
    }

    private void generateCourseHtml(Long id, Long courseId) {
        MqMessageService mqMessageService = this.getMqMessageService();
        int stageOne = mqMessageService.getStageOne(id);
        if (stageOne > 0) {
            log.info("课程：{}，已经静态化", id);
            return;
        }
        //进行处理
        File file = coursePublishService.generateCourseHtml(courseId);
        if (file == null) XueChengPlusException.cast("静态页面为空");
        //上传
        coursePublishService.uploadCourseHtml(courseId, file);
        //写入消息表
        mqMessageService.completedStageOne(id);
    }
}
