package com.xuecheng.learning.api;

import com.xuecheng.base.model.PageResult;
import com.xuecheng.learning.model.dto.MyCourseTableParams;
import com.xuecheng.learning.model.dto.XcChooseCourseDto;
import com.xuecheng.learning.model.dto.XcCourseTablesDto;
import com.xuecheng.learning.model.po.XcCourseTables;
import com.xuecheng.learning.service.MyCourseTablesService;
import com.xuecheng.learning.util.SecurityUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Mr.M
 * @version 1.0
 * &#064;description  我的课程表接口
 */

@Api(value = "我的课程表接口", tags = "我的课程表接口")
@Slf4j
@RestController
public class MyCourseTablesController {
    @Autowired
    MyCourseTablesService myCourseTablesService;

    @ApiOperation("添加选课")
    @PostMapping("/choosecourse/{courseId}")
    public XcChooseCourseDto addChooseCourse(@PathVariable("courseId") Long courseId) {
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        String userId = null;
        if (user != null) {
            userId = user.getId();
        }
        return myCourseTablesService.addChooseCourse(userId, courseId);
    }

    @ApiOperation("查询学习资格")
    @PostMapping("/choosecourse/learnstatus/{courseId}")
    public XcCourseTablesDto getLearnstatus(@PathVariable("courseId") Long courseId) {
        SecurityUtil.XcUser user = SecurityUtil.getUser();
        String userId = null;
        if (user != null) {
            userId = user.getId();
        }
        return myCourseTablesService.getLearningStatus(userId, courseId);
    }

    @ApiOperation("我的课程表")
    @GetMapping("/mycoursetable")
    public PageResult<XcCourseTables> mycoursetable(MyCourseTableParams params) {
        return myCourseTablesService.mycourestabls(params);
    }

}
