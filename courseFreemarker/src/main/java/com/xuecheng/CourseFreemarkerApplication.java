package com.xuecheng;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableDiscoveryClient
@MapperScan("com.xuecheng.content.mapper")
@EnableFeignClients(basePackages = {"com.xuecheng.content.feignclient"})
public class CourseFreemarkerApplication {

    public static void main(String[] args) {
        SpringApplication.run(CourseFreemarkerApplication.class, args);
    }

}
