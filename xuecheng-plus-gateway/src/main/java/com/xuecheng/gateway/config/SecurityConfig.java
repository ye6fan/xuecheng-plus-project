package com.xuecheng.gateway.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;

/**
 * &#064;description  安全配置类
 *
 * @author Mr.M
 * @version 1.0
 */
@EnableWebFluxSecurity
@Configuration
public class SecurityConfig {

    //安全拦截配置
    @Bean
    public SecurityWebFilterChain webFluxSecurityFilterChain(ServerHttpSecurity http) {
        return http.authorizeExchange()
                .pathMatchers("/**").permitAll()
                .anyExchange().authenticated()//必须放在最后面，不然冲突
                //禁用了CSRF保护功能
                .and().csrf().disable().build();
    }

}
