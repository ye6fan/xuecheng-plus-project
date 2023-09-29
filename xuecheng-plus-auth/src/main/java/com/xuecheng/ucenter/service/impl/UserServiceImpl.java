package com.xuecheng.ucenter.service.impl;

import com.alibaba.fastjson.JSON;
import com.xuecheng.ucenter.mapper.XcUserMapper;
import com.xuecheng.ucenter.model.dto.AuthParamsDto;
import com.xuecheng.ucenter.model.dto.XcUserExt;
import com.xuecheng.ucenter.service.AuthService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserServiceImpl implements UserDetailsService {
    @Autowired
    XcUserMapper xcUserMapper;
    @Autowired
    ApplicationContext applicationContext;
    //AuthParamsDto
    @Override
    public UserDetails loadUserByUsername(String json) throws UsernameNotFoundException {
        //json转object
        AuthParamsDto authParamsDto;
        try {
            authParamsDto = JSON.parseObject(json, AuthParamsDto.class);
        } catch (Exception e) {
            throw new RuntimeException("请求参数不符合要求");
        }
        //拿数据
        String authType = authParamsDto.getAuthType();
        String beanName = authType + "_authservice";
        AuthService authService = applicationContext.getBean(beanName, AuthService.class);
        //认证
        XcUserExt xcUserExt = authService.execute(authParamsDto);
        //封装
        return getUserPrincipal(xcUserExt);
    }

    public UserDetails getUserPrincipal(XcUserExt xcUserExt) {
        String password = xcUserExt.getPassword();
        String[] authorities = {"test"};
        xcUserExt.setPassword(null);
        String userJson = JSON.toJSONString(xcUserExt);
        return User.withUsername(userJson).password(password).authorities(authorities).build();
    }
}
