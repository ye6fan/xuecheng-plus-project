package com.xuecheng;

import com.spring4all.swagger.EnableSwagger2Doc;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

import java.util.TimeZone;

/**
 * @author Mr.M
 * @version 1.0
 * &#064;description  内容管理服务启动类
 * &#064;date  2023/2/11 15:49
 */
@EnableSwagger2Doc
@SpringBootApplication
@EnableDiscoveryClient
@MapperScan("com.xuecheng.content.mapper")
@EnableFeignClients(basePackages = {"com.xuecheng.content.feignclient"})
public class ContentApplication {
    public static void main(String[] args) {
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Shanghai"));
        SpringApplication.run(ContentApplication.class, args);
    }
}
