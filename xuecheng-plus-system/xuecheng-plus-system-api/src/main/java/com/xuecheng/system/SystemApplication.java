package com.xuecheng.system;

import com.spring4all.swagger.EnableSwagger2Doc;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.util.TimeZone;

/**
 * <p>
 *     系统管理启动类
 * </p>
 *
 * &#064;Description:
 */
@EnableSwagger2Doc
@EnableDiscoveryClient
@SpringBootApplication
@MapperScan("com.xuecheng.system.mapper")
public class SystemApplication {

    public static void main(String[] args) {
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Shanghai"));
        SpringApplication.run(SystemApplication.class,args);
    }
}