package com.xuecheng.content.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xuecheng.content.mapper.CourseCategoryMapper;
import com.xuecheng.content.model.dto.CourseCategoryTreeDto;
import com.xuecheng.content.model.po.CourseCategory;
import com.xuecheng.content.service.CourseCategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Mr.M
 * @version 1.0
 * &#064;date  2023/2/12 14:49
 */
@Slf4j
@Service
public class CourseCategoryServiceImpl implements CourseCategoryService {

    @Autowired
    CourseCategoryMapper courseCategoryMapper;

    @Override
    public List<CourseCategoryTreeDto> queryTreeNodes(String id) {
        List<CourseCategory> courseCategories = courseCategoryMapper
                .selectList(new LambdaQueryWrapper<CourseCategory>().eq(CourseCategory::getParentid, id));

        return courseCategories.stream().map(this::buildCourseCategoryTree).collect(Collectors.toList());

    }


    private CourseCategoryTreeDto buildCourseCategoryTree(CourseCategory category) {

        CourseCategoryTreeDto dto = new CourseCategoryTreeDto();

        BeanUtils.copyProperties(category, dto);

        List<CourseCategory> children = courseCategoryMapper
                .selectList(new LambdaQueryWrapper<CourseCategory>().eq(CourseCategory::getParentid, category.getId()));

        if (!children.isEmpty()) {
            dto.setChildrenTreeNodes(children.stream().map(this::buildCourseCategoryTree).collect(Collectors.toList()));
        }

        return dto;
    }
}
