package com.xuecheng.auth.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;
@Component
public class DaoAuthenticationProviderCustom extends DaoAuthenticationProvider {
    //使用@Autowired注解将UserDetailsService接口的实现对象注入到DaoAuthenticationProviderCustom中
    @Autowired
    public void setUserDetailsService(UserDetailsService userDetailsService) {
        super.setUserDetailsService(userDetailsService);
    }
    //必须继承DaoAuthenticationProvider，dao层身份验证提供者，实现additionalAuthenticationChecks，附加的校验检查
    //并置为空
    //用于在用户名和密码的验证之后对用户进行附加的校验检查。在本例中，我们不需要任何额外的检查
    @Override
    protected void additionalAuthenticationChecks(UserDetails userDetails,
                                                  UsernamePasswordAuthenticationToken authentication)
            throws AuthenticationException {
    }
}
