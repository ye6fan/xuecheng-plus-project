package com.xuecheng.learning.service;

import com.xuecheng.base.model.RestResponse;

/**
 * &#064;description  学习过程管理service接口
 */
public interface LearningService {

    /**
     * &#064;description  获取教学视频
     *
     * @param courseId    课程id
     * @param teachplanId 课程计划id
     * @param mediaId     视频文件id
     */
    RestResponse<String> getVideo(String userId, Long courseId, Long teachplanId, String mediaId);
}
