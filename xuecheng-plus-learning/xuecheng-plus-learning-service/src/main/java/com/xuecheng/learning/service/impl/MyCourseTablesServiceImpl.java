package com.xuecheng.learning.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.base.model.PageResult;
import com.xuecheng.content.model.po.CoursePublish;
import com.xuecheng.learning.feignclient.ContentServiceClient;
import com.xuecheng.learning.mapper.XcChooseCourseMapper;
import com.xuecheng.learning.mapper.XcCourseTablesMapper;
import com.xuecheng.learning.model.dto.MyCourseTableParams;
import com.xuecheng.learning.model.dto.XcChooseCourseDto;
import com.xuecheng.learning.model.dto.XcCourseTablesDto;
import com.xuecheng.learning.model.po.XcChooseCourse;
import com.xuecheng.learning.model.po.XcCourseTables;
import com.xuecheng.learning.service.MyCourseTablesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@Service
public class MyCourseTablesServiceImpl implements MyCourseTablesService {
    @Autowired
    XcChooseCourseMapper chooseCourseMapper;    //选课记录
    @Autowired
    XcCourseTablesMapper courseTablesMapper;    //我的课程表
    @Autowired
    ContentServiceClient contentServiceClient;

    @Transactional
    @Override
    public XcChooseCourseDto addChooseCourse(String userId, Long courseId) {
        //查询收费规则
        CoursePublish coursePublish = contentServiceClient.getCoursePublish(courseId);
        if (coursePublish == null) XueChengPlusException.cast("课程不存在");
        //免费        //收费
        String charge = coursePublish.getCharge();
        XcChooseCourse result;
        //免费
        if ("201000".equals(charge)) {
            //先有一个记录
            result = addFreeCourse(userId, coursePublish);
            //直接加入我的课程表
            addCourseTables(result);
        } else {
            result = addChargeCourse(userId, coursePublish);
            //支付是前端完成后，回调会添加的
        }
        //查询学习资格
        XcCourseTablesDto cTD = getLearningStatus(userId, courseId);
        //继承选课记录，多了学习资格标识。
        // 感觉这个项目的后期真的是乱七八糟，接口都没有设计好，也可能是自己目光短浅
        XcChooseCourseDto xcChooseCourseDto = new XcChooseCourseDto();
        //result是选课记录
        BeanUtils.copyProperties(result, xcChooseCourseDto);
        //设置学习资格
        xcChooseCourseDto.setLearnStatus(cTD.getLearnStatus());
        //返回选课记录的进阶版
        return xcChooseCourseDto;
    }

    @Override
    public XcCourseTablesDto getLearningStatus(String userId, Long courseId) {
        //用户ID和课程ID，查我的课程表
        XcCourseTables xcCourseTables = getXcCourseTables(userId, courseId);
        //继承我的课程表，但是多了学习资格标识
        XcCourseTablesDto xcCourseTablesDto = new XcCourseTablesDto();
        if (xcCourseTables == null) {
            xcCourseTablesDto.setLearnStatus("702002");     //没有选课，或者未支付
            return xcCourseTablesDto;
        }
        //判断时间
        boolean before = xcCourseTables.getValidtimeEnd().isBefore(LocalDateTime.now());
        if (before) {
            BeanUtils.copyProperties(xcCourseTables, xcCourseTablesDto);
            xcCourseTablesDto.setLearnStatus("702003");     //已过期需要申请续期或重新支付
            return xcCourseTablesDto;
        }
        xcCourseTablesDto.setLearnStatus("702001");     //正常学习
        return xcCourseTablesDto;
    }

    @Transactional
    @Override   //选课成功后就开始保存到数据库了
    public boolean saveChooseCourseSuccess(String chooseCourseId) {
        //选课记录表
        XcChooseCourse xcChooseCourse = chooseCourseMapper.selectById(chooseCourseId);
        if (xcChooseCourse == null) {
            log.error("购买课程时，根据选课id从数据库找不到选课记录：{}", chooseCourseId);
            return false;
        }
        String status = xcChooseCourse.getStatus();
        //待支付标识
        if ("701002".equals(status)) {
            //支付成功标识
            xcChooseCourse.setStatus("701001");
            //更新选课记录表
            int update = chooseCourseMapper.updateById(xcChooseCourse);
            if (update <= 0) {
                log.error("添加选课记录失败：{}", chooseCourseId);
                XueChengPlusException.cast("添加选课记录失败");
            }
            //我的课程表添加记录
            XcCourseTables xcCourseTables = addCourseTables(xcChooseCourse);
            log.info("{}", xcCourseTables);     //没有任何意义
        }
        return true;
    }

    @Override
    public PageResult<XcCourseTables> mycourestabls(MyCourseTableParams params) {
        //分页设置
        Page<XcCourseTables> objectPage = new Page<>(params.getPage(), params.getSize());
        LambdaQueryWrapper<XcCourseTables> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(XcCourseTables::getUserId, params.getUserId());
        //根据用户Id查
        Page<XcCourseTables> courseTablesPage = courseTablesMapper.selectPage(objectPage, wrapper);
        return new PageResult<>(courseTablesPage.getRecords(), courseTablesPage.getTotal(),
                params.getPage(), params.getSize());
    }

    @Transactional
    //添加免费课程,免费课程加入选课记录表、我的课程表
    public XcChooseCourse addFreeCourse(String userId, CoursePublish coursepublish) {
        Long courseId = coursepublish.getId();
        LambdaQueryWrapper<XcChooseCourse> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(XcChooseCourse::getUserId, userId)   //用户Id
                .eq(XcChooseCourse::getCourseId, courseId)      //课程Id
                .eq(XcChooseCourse::getOrderType, "700001")     //订单类型为免费课程
                .eq(XcChooseCourse::getStatus, "701001");       //选课成功
        //查询
        List<XcChooseCourse> xcChooseCourseList = chooseCourseMapper.selectList(wrapper);
        if (xcChooseCourseList.size() > 0) {
            return xcChooseCourseList.get(0);
        }
        //开始插入
        XcChooseCourse xcChooseCourse = new XcChooseCourse();
        xcChooseCourse.setCourseId(courseId);   //课程Id
        xcChooseCourse.setCourseName(coursepublish.getName());  //课程名字
        xcChooseCourse.setUserId(userId);   //用户Id
        xcChooseCourse.setCompanyId(coursepublish.getCompanyId());  //课程公司
        xcChooseCourse.setOrderType("700001");  //订单类型为免费课程
        xcChooseCourse.setCoursePrice(coursepublish.getPrice());      //售价
        xcChooseCourse.setValidDays(365);   //有效期
        xcChooseCourse.setStatus("701001");     //选课成功
        xcChooseCourse.setCreateDate(LocalDateTime.now());      //创建时间
        xcChooseCourse.setValidtimeStart(LocalDateTime.now());     //有效期开始时间
        xcChooseCourse.setValidtimeEnd(LocalDateTime.now().plusDays(365));  //有效期结束时间
        int insert = chooseCourseMapper.insert(xcChooseCourse);     //插入
        if (insert <= 0) {
            XueChengPlusException.cast("添加选课记录失败");
        }
        return xcChooseCourse;
    }

    //添加收费课程
    public XcChooseCourse addChargeCourse(String userId, CoursePublish coursepublish) {
        Long courseId = coursepublish.getId();
        //判断
        LambdaQueryWrapper<XcChooseCourse> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(XcChooseCourse::getUserId, userId)
                .eq(XcChooseCourse::getCourseId, courseId)
                .eq(XcChooseCourse::getOrderType, "700002")     //收费课程
                .eq(XcChooseCourse::getStatus, "701002");   //待支付
        //插入前先查询是否已经存在
        List<XcChooseCourse> chooseCourseList = chooseCourseMapper.selectList(wrapper);
        if (chooseCourseList.size() > 0) {
            return chooseCourseList.get(0);
        }
        //插入
        XcChooseCourse xcChooseCourse = new XcChooseCourse();
        xcChooseCourse.setCourseId(courseId);   //课程Id
        xcChooseCourse.setCourseName(coursepublish.getName());  //课程名字
        xcChooseCourse.setUserId(userId);   //用户Id
        xcChooseCourse.setCompanyId(coursepublish.getCompanyId());     //公司Id
        xcChooseCourse.setOrderType("700002");      //收费课程
        xcChooseCourse.setCoursePrice(coursepublish.getPrice());    //价格
        xcChooseCourse.setValidDays(365);   //有效天数
        xcChooseCourse.setStatus("701002");     //待支付
        xcChooseCourse.setCreateDate(LocalDateTime.now());  //创建时间
        xcChooseCourse.setValidtimeStart(LocalDateTime.now());  //开始时间
        xcChooseCourse.setValidtimeEnd(LocalDateTime.now().plusDays(365));     //结束时间，有问题
        int insert = chooseCourseMapper.insert(xcChooseCourse);     //插入
        if (insert <= 0) {
            XueChengPlusException.cast("添加选课记录失败");
        }
        return xcChooseCourse;
    }

    @Transactional      //添加到我的课程表
    public XcCourseTables addCourseTables(XcChooseCourse xcChooseCourse) {
        String status = xcChooseCourse.getStatus();
        //选课成功标识
        if (!"701001".equals(status)) {
            XueChengPlusException.cast("选课没有成功无法添加课程表");
        }
        XcCourseTables xcCourseTables = getXcCourseTables(xcChooseCourse.getUserId(),
                xcChooseCourse.getCourseId());
        if (xcCourseTables != null) {
            return xcCourseTables;
        }
        //我的课程表，添加
        xcCourseTables = new XcCourseTables();
        BeanUtils.copyProperties(xcChooseCourse, xcCourseTables);
        xcCourseTables.setChooseCourseId(xcChooseCourse.getId());   //选课记录Id，businessId
        xcCourseTables.setCourseType(xcChooseCourse.getOrderType());    //订单类型（选课类型）
        xcCourseTables.setUpdateDate(LocalDateTime.now());        //更新时间
        courseTablesMapper.insert(xcCourseTables);      //插入我的课程表
        return xcCourseTables;
    }

    public XcCourseTables getXcCourseTables(String userId, Long courseId) {
        //通过用户Id和课程id来判断是否选过
        return courseTablesMapper.selectOne(
                new LambdaQueryWrapper<XcCourseTables>().eq(XcCourseTables::getUserId, userId)
                        .eq(XcCourseTables::getCourseId, courseId));
    }

}
