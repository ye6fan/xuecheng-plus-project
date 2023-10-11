package com.xuecheng;


import com.spring4all.swagger.EnableSwagger2Doc;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

import java.util.TimeZone;

@EnableSwagger2Doc
@EnableDiscoveryClient
@SpringBootApplication
@EnableFeignClients(basePackages = {"com.xuecheng.media.feignclient"})
@MapperScan("com.xuecheng.media.mapper")
public class MediaApplication {
    public static void main(String[] args) {
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Shanghai"));
        SpringApplication.run(MediaApplication.class, args);
    }
}