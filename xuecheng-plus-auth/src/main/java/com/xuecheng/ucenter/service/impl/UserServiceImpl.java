package com.xuecheng.ucenter.service.impl;

import com.alibaba.fastjson.JSON;
import com.xuecheng.ucenter.mapper.XcMenuMapper;
import com.xuecheng.ucenter.mapper.XcUserMapper;
import com.xuecheng.ucenter.model.dto.AuthParamsDto;
import com.xuecheng.ucenter.model.dto.XcUserExt;
import com.xuecheng.ucenter.model.po.XcMenu;
import com.xuecheng.ucenter.service.AuthService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
//继承了UserDetailsService实现loadUserByUsername接口，在这里进行检验
public class UserServiceImpl implements UserDetailsService {
    @Autowired
    XcUserMapper xcUserMapper;
    @Autowired
    ApplicationContext applicationContext;
    @Autowired
    XcMenuMapper xcMenuMapper;

    //实现UserDetailsService接口并重写loadUserByUsername方法
    //这里面有拦截器拦截到的登陆校验
    @Override
    public UserDetails loadUserByUsername(String json) throws UsernameNotFoundException {
        //json转object||AuthParamsDto
        AuthParamsDto authParamsDto;
        try {
            authParamsDto = JSON.parseObject(json, AuthParamsDto.class);
        } catch (Exception e) {
            throw new RuntimeException("请求参数不符合要求");
        }
        //拿数据，登录类型
        String authType = authParamsDto.getAuthType();
        //拼接相应的bean名字
        String beanName = authType + "_authservice";
        AuthService authService = applicationContext.getBean(beanName, AuthService.class);
        //认证
        XcUserExt xcUserExt = authService.execute(authParamsDto);
        //封装
        return getUserPrincipal(xcUserExt);
    }

    public UserDetails getUserPrincipal(XcUserExt xcUserExt) {
        String password = xcUserExt.getPassword();
        List<XcMenu> xcMenuList = xcMenuMapper.selectPermissionByUserId(xcUserExt.getId());
        String[] authorities = {"test"};
        if (xcMenuList.size() > 0) {
            authorities = xcMenuList.stream().map(XcMenu::getCode).toArray(String[]::new);
        }
        xcUserExt.setPassword(null);
        String userJson = JSON.toJSONString(xcUserExt);
        return User.withUsername(userJson).password(password).authorities(authorities).build();
    }
}
