package com.xuecheng.auth.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.provider.ClientDetailsService;

/**
 * @author 感觉这个就像是为测试才写的配置类，仅仅只是个人猜测
 * @version 1.0
 * &#064;description  安全管理配置
 */
//Spring Security负责处理认证（authentication）和授权（authorization）
@EnableWebSecurity//该注解用于开启Web安全性配置支持
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
//该注解用于启用Spring Security的方法级安全性
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private DaoAuthenticationProviderCustom daoAuthenticationProviderCustom;
    //第一步：用于配置身份验证，指定使用DaoAuthenticationProviderCustom类进行身份验证
    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(daoAuthenticationProviderCustom);
    }
    //第二步：获取AuthenticationManager实例
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }
    //第三步：密码加密方式的实例,用户密码加密
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    //配置安全拦截机制
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .anyRequest().permitAll()//其它请求全部放行
                .and()
                .formLogin().successForwardUrl("/login-success");//登录成功跳转到/login-success
        http.logout().logoutUrl("/logout");
    }

}
