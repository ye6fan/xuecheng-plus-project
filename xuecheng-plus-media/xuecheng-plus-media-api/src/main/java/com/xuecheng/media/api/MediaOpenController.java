package com.xuecheng.media.api;

import com.xuecheng.base.model.RestResponse;
import com.xuecheng.media.feignclient.LearningServiceClient;
import com.xuecheng.media.model.dto.XcCourseTablesDto;
import com.xuecheng.media.service.MediaFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/open")
public class MediaOpenController {
    @Autowired
    MediaFileService mediaFileService;
    @Autowired
    LearningServiceClient learningServiceClient;

    @GetMapping("/preview/{mediaId}")
    public RestResponse<String> getPlayUrlByMediaId(@PathVariable String mediaId) {
        if("fcf1a86835270adaab6e0c968470ba22".equals(mediaId)) {
            XcCourseTablesDto courseTablesDto = learningServiceClient.getLearnStatus(142L);
            if (courseTablesDto == null) {
                return RestResponse.validfail("此课程收费，请先购买此课程");
            }
            String learnStatus = courseTablesDto.getLearnStatus();
            if (!"702001".equals(learnStatus)) {
                return RestResponse.validfail("此课程收费，请先购买此课程");
            }
        }
        String url = mediaFileService.getFileById(mediaId);
        return RestResponse.success(url);
    }

}
