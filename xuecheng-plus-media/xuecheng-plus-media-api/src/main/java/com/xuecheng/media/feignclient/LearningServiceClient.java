package com.xuecheng.media.feignclient;

import com.xuecheng.media.model.dto.XcCourseTablesDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@FeignClient(value = "learning-api", fallbackFactory = LearningServiceClientFallbackFactory.class)
public interface LearningServiceClient {

    //学习资格的查询
    @ResponseBody
    @PostMapping("/learning/choosecourse/learnstatus/{courseId}")
    XcCourseTablesDto getLearnStatus(@PathVariable("courseId") Long courseId);
}
