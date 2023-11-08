package com.xuecheng.auth.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;

import javax.annotation.Resource;

/**
 * @author Mr.M
 * @version 1.0 Spring OAuth2则专注于实现OAuth2协议相关的功能，包括颁发和管理访问令牌（access token）
 * &#064;description  授权服务器配置
 */
//OAuth2AuthenticationProcessingFilter,通过请求头Authorization提取token,
// SecurityContextHolder清空或者设置token
//this.authenticationManager.authenticate(authentication);校验
//SecurityContextHolder.getContext().setAuthentication(authResult);
//校验后过滤chain.doFilter(request, response);
@Configuration
@EnableAuthorizationServer//配置OAuth2授权服务器
public class AuthorizationServer extends AuthorizationServerConfigurerAdapter {
    //都是继承oauth2的Adapter适配器,spring，管理令牌的服务接口
    @Resource(name = "authorizationServerTokenServicesCustom")
    private AuthorizationServerTokenServices authorizationServerTokenServices;
    //将AuthenticationManager接口的实现对象注入，处理身份验证的接口
    //会委托给DaoAuthenticationProvider关联的UserDetailsService去验证用户名和密码
    //provider.authenticate(authentication); AuthenticationProvider，DaoAuthenticationProvider
    //总结：SecurityContextPersistenceFilter取放取放, SecurityContextHolder
    //它会被用户密码过滤器调用,UsernamePasswordAuthenticationFilter，操作UsernamePasswordAuthenticationToken
    //AuthenticationManager(ProviderManager), 11 AuthenticationProvider(AbstractUserDetailsAuthenticationProvider)
    //11 user = this.retrieveUser(username, (UsernamePasswordAuthenticationToken)authentication);retrieve检索
    //22 DaoAuthenticationProvider的retrieveUser方法，因为父类是虚拟方法
    //22 UserDetails loadedUser = this.getUserDetailsService().loadUserByUsername(username);
    //ExceptionTranslationFilter, FilterSecurityInterceptor,
    @Autowired
    private AuthenticationManager authenticationManager;

    //第一部：客户端详情服务
    @Override
    public void configure(ClientDetailsServiceConfigurer clients)
            throws Exception {
        clients.inMemory()// 使用in-memory存储
                //前端拿着id和secret来后端申请令牌
                .withClient("XcWebApp")// client_id客户端ID
                .secret(new BCryptPasswordEncoder().encode("XcWebApp"))//客户端密钥
                .resourceIds("xuecheng-plus")//资源列表
                //该client允许的授权类型authorization_code,password,refresh_token,implicit,client_credentials
                .authorizedGrantTypes("authorization_code", "password", "client_credentials",
                        "implicit", "refresh_token")
                .scopes("all")// 客户端允许的授权范围|标识
                .autoApprove(false)//false|跳转到授权页面
                //客户端接收授权码的重定向地址
                .redirectUris("https://www.yefan.xyz/course/search.html");
    }

    //第二步：令牌端点的访问配置
    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
        endpoints
                .authenticationManager(authenticationManager)//认证管理器，密码模式
                .tokenServices(authorizationServerTokenServices)//令牌管理服务
//                .authorizationCodeServices()授权码模式
                .allowedTokenEndpointRequestMethods(HttpMethod.POST);
    }

    //第三步：令牌访问端点的安全配置
    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) {
        //即任何人都可以访问获取公钥和检查令牌的端点
        security
                .tokenKeyAccess("permitAll()")  //oauth/token_key是公开|提供公钥端点
                .checkTokenAccess("permitAll()")    //oauth/check_token公开|检查令牌
                .allowFormAuthenticationForClients();   //允许表单认证（申请令牌）
    }

}
