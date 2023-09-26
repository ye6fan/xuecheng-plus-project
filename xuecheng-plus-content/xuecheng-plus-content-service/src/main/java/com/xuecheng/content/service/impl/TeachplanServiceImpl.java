package com.xuecheng.content.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.xuecheng.base.exception.CommonError;
import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.content.mapper.TeachplanMapper;
import com.xuecheng.content.mapper.TeachplanMediaMapper;
import com.xuecheng.content.model.dto.BindTeachplanMediaDto;
import com.xuecheng.content.model.dto.SaveTeachplanDto;
import com.xuecheng.content.model.dto.TeachplanDto;
import com.xuecheng.content.model.po.Teachplan;
import com.xuecheng.content.model.po.TeachplanMedia;
import com.xuecheng.content.service.TeachplanService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class TeachplanServiceImpl implements TeachplanService {
    @Autowired
    TeachplanMapper teachplanMapper;
    @Autowired
    TeachplanMediaMapper teachplanMediaMapper;

    @Override
    public List<TeachplanDto> findTeachplanTree(Long courseId) {
        return teachplanMapper.selectTreeNodes(courseId);
    }

    @Override
    public void saveTeachplan(SaveTeachplanDto teachplanDto) {
        Long id = teachplanDto.getId();
        if (id == null) {
            Teachplan teachplan = new Teachplan();
            BeanUtils.copyProperties(teachplanDto, teachplan);
            Long courseId = teachplanDto.getCourseId();
            Long parentid = teachplanDto.getParentid();
            LambdaQueryWrapper<Teachplan> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(Teachplan::getCourseId, courseId).eq(Teachplan::getParentid, parentid);
            Integer count = teachplanMapper.selectCount(wrapper);
            teachplan.setOrderby(count + 1);
            teachplan.setStatus(1);
            teachplanMapper.insert(teachplan);
        } else {
            Teachplan teachplan = teachplanMapper.selectById(id);
            BeanUtils.copyProperties(teachplanDto, teachplan);
            teachplanMapper.updateById(teachplan);
        }
    }

    @Transactional
    @Override
    public void deleteTeachplan(Long teachplanId) {
        if (teachplanId == null) {
            XueChengPlusException.cast("教学计划id为空");
        }
        Teachplan teachplan = teachplanMapper.selectById(teachplanId);
        Long courseId = teachplan.getCourseId();
        Integer orderby = teachplan.getOrderby();
        Integer grade = teachplan.getGrade();
        if (grade == 1) {
            LambdaQueryWrapper<Teachplan> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(Teachplan::getParentid, teachplanId);
            Integer count = teachplanMapper.selectCount(wrapper);
            if (count > 0) {
                XueChengPlusException.cast("课程计划信息还有子级信息，无法操作");
            }
            teachplanMapper.deleteById(teachplanId);
            LambdaQueryWrapper<Teachplan> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(Teachplan::getGrade, grade)
                    .gt(Teachplan::getOrderby, orderby);
            List<Teachplan> teachplanList = teachplanMapper.selectList(queryWrapper);
            teachplanList.forEach(t -> {
                t.setOrderby(t.getOrderby() - 1);
                teachplanMapper.updateById(t);
            });
        } else {
            teachplanMapper.deleteById(teachplanId);
            LambdaQueryWrapper<Teachplan> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(Teachplan::getCourseId, courseId)
                    .gt(Teachplan::getOrderby, orderby)
                    .eq(Teachplan::getGrade, grade);
            List<Teachplan> teachplans = teachplanMapper.selectList(wrapper);
            teachplans.forEach(t -> {
                t.setOrderby(t.getOrderby() - 1);
                teachplanMapper.updateById(t);
            });
        }
    }

    @Transactional
    @Override
    public void moveupTeachplan(Long teachplanId) {
        if (teachplanId == null) {
            XueChengPlusException.cast(CommonError.REQUEST_NULL);
        }
        Teachplan teachplan = teachplanMapper.selectById(teachplanId);
        if (teachplan == null) {
            XueChengPlusException.cast(CommonError.QUERY_NULL);
        }
        LambdaQueryWrapper<Teachplan> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Teachplan::getCourseId, teachplan.getCourseId())
                .eq(Teachplan::getGrade, teachplan.getGrade())
                .eq(Teachplan::getOrderby, teachplan.getOrderby() - 1)
                .eq(Teachplan::getParentid, teachplan.getParentid());
        Teachplan up = teachplanMapper.selectOne(wrapper);
        if (ObjectUtils.isEmpty(up)) {
            XueChengPlusException.cast("到顶了");
        }
        up.setOrderby(up.getOrderby() + 1);
        teachplan.setOrderby(teachplan.getOrderby() - 1);
        teachplanMapper.updateById(teachplan);
        teachplanMapper.updateById(up);
    }

    @Transactional
    @Override
    public void movedownTeachplan(Long teachplanId) {
        if (teachplanId == null) {
            XueChengPlusException.cast(CommonError.REQUEST_NULL);
        }
        Teachplan teachplan = teachplanMapper.selectById(teachplanId);
        if (teachplan == null) {
            XueChengPlusException.cast(CommonError.QUERY_NULL);
        }
        LambdaQueryWrapper<Teachplan> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Teachplan::getCourseId, teachplan.getCourseId())
                .eq(Teachplan::getGrade, teachplan.getGrade())
                .eq(Teachplan::getOrderby, teachplan.getOrderby() + 1)
                .eq(Teachplan::getParentid, teachplan.getParentid());
        Teachplan down = teachplanMapper.selectOne(wrapper);
        if (ObjectUtils.isEmpty(down)) {
            XueChengPlusException.cast("到底了");
        }
        down.setOrderby(down.getOrderby() - 1);
        teachplan.setOrderby(teachplan.getOrderby() + 1);
        teachplanMapper.updateById(teachplan);
        teachplanMapper.updateById(down);
    }

    @Transactional
    @Override
    public void associationMedia(BindTeachplanMediaDto bindTeachplanMediaDto) {
        Long teachplanId = bindTeachplanMediaDto.getTeachplanId();
        Teachplan teachplan = teachplanMapper.selectById(teachplanId);
        if(teachplan==null){
            XueChengPlusException.cast("教学计划不存在");
        }
        Integer grade = teachplan.getGrade();
        if(grade!=2){
            XueChengPlusException.cast("只允许第二级教学计划绑定媒资文件");
        }
        Long courseId = teachplan.getCourseId();
        String fileName = bindTeachplanMediaDto.getFileName();
        LambdaQueryWrapper<TeachplanMedia> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(TeachplanMedia::getTeachplanId, teachplanId);
        teachplanMediaMapper.delete(wrapper);
        TeachplanMedia teachplanMedia = new TeachplanMedia();
        BeanUtils.copyProperties(bindTeachplanMediaDto, teachplanMedia);
        teachplanMedia.setCourseId(courseId);
        teachplanMedia.setMediaFilename(fileName);
        teachplanMedia.setCreateDate(LocalDateTime.now());
        teachplanMediaMapper.insert(teachplanMedia);
    }


}
