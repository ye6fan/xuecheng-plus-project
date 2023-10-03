package com.xuecheng.learning.service.impl;

import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.base.model.RestResponse;
import com.xuecheng.content.model.po.CoursePublish;
import com.xuecheng.learning.feignclient.ContentServiceClient;
import com.xuecheng.learning.feignclient.MediaServiceClient;
import com.xuecheng.learning.model.dto.XcCourseTablesDto;
import com.xuecheng.learning.service.LearningService;
import com.xuecheng.learning.service.MyCourseTablesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
@Slf4j
public class LearningServiceImpl implements LearningService {
    @Autowired
    MyCourseTablesService myCourseTablesService;
    @Autowired
    ContentServiceClient contentServiceClient;
    @Autowired
    MediaServiceClient mediaServiceClient;

    @Override
    public RestResponse<String> getVideo(String userId, Long courseId, Long teachplanId, String mediaId) {
        //查询课程信息
        CoursePublish coursePublish = contentServiceClient.getCoursePublish(courseId);
        if(coursePublish==null){
            XueChengPlusException.cast("课程信息不存在");
        }
        //获取学习资格
        if (StringUtils.hasText(userId)) {
            XcCourseTablesDto courseTablesDto = myCourseTablesService.getLearningStatus(userId, courseId);
            String learnStatus = courseTablesDto.getLearnStatus();
            if ("702002".equals(learnStatus)) {
                return RestResponse.validfail("无法学习，因为没有选课或没有支付");
            } else if ("702003".equals(learnStatus)) {
                return RestResponse.validfail("无法学习，因为已经过期");
            } else {
                return mediaServiceClient.getPlayUrlByMediaId(mediaId);
            }
        }
        //没有登陆
        //todo
        //查询课程收费规则
        String charge = coursePublish.getCharge();
        if ("201000".equals(charge)) {
            return mediaServiceClient.getPlayUrlByMediaId(mediaId);
        }
        //调用媒资服务获取播放地址
        return RestResponse.validfail("没有选课");
    }
}
