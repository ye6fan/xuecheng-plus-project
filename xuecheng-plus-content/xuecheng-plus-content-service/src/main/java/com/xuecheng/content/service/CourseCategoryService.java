package com.xuecheng.content.service;

import com.xuecheng.content.model.dto.CourseCategoryTreeDto;

import java.util.List;

/**
 * @author Mr.M
 * @version 1.0
 * &#064;description  TODO
 * &#064;date  2023/2   /12 14:49
 */
public interface CourseCategoryService {
    /**
     * 课程分类树形结构查询
     */
    List<CourseCategoryTreeDto> queryTreeNodes(String id);
}
