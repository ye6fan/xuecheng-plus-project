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
        if ("0e908e1ec7829290144b3e47837dbb0d".equals(mediaId) || "b510913a0504859d1c477d1ccc50838a".equals(mediaId) || "f8fed7171f25900a242919e7dd0b734c".equals(mediaId)) {
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
