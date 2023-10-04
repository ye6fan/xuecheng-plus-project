package com.xuecheng.auth.controller;

import com.xuecheng.ucenter.model.po.XcUser;
import com.xuecheng.ucenter.service.WxAuthService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class WxLoginController {
    @Autowired
    WxAuthService wxAuthService;

    //微信扫码登录
    @RequestMapping("/wxLogin")
    public String wxLogin(String code, String state) {
        //前端请求微信通过appId和回调地址和一个无序的字符串生成二维码
        //二维码是网址加参数，所以用户扫描后会确认登陆，也就是给微信发确认
        //然后微信回调接口并传递code
        log.debug("微信扫码回调,code:{},state:{}",code, state);
        //通过code加appId和appSecret获取token
        //请求微信申请令牌，拿到令牌查询用户信息，将用户信息写入本项目数据库
        XcUser xcUser = wxAuthService.wxAuth(code);
        String username = xcUser.getUsername();
        //获取成功后重定向到认证
        return "redirect:http://localhost:7777/sign.html?username="+username+"&authType=wx";
    }
}
