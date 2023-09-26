package com.xuecheng.content.model.dto;

import com.xuecheng.content.model.po.CourseTeacher;
import lombok.Data;
import lombok.ToString;

import java.util.List;

@Data
@ToString
public class CoursePreviewDto {

    //课程基本信息,课程营销信息
    private CourseBaseInfoDto courseBase;

    //课程计划信息
    private List<TeachplanDto> teachplans;

    //师资信息暂时不加...
    private CourseTeacher courseTeacher;
}
