package com.xuecheng.content.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xuecheng.content.model.po.TeachplanMedia;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author itcast
 */
@Mapper
public interface TeachplanMediaMapper extends BaseMapper<TeachplanMedia> {
    @Delete("delete from teachplan_media where course_id = #{courseId}")
    void deleteBycourseId(Long courseId);
}
