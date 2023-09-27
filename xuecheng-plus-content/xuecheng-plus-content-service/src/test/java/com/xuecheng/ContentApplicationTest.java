package com.xuecheng;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author Mr.M
 * @version 1.0
 * &#064;description  内容管理服务启动类
 * &#064;date  2023/2/11 15:49
 */
@SpringBootApplication
@EnableDiscoveryClient
@MapperScan("com.xuecheng.content.mapper")
public class ContentApplicationTest {
    public static void main(String[] args) {
        SpringApplication.run(ContentApplicationTest.class, args);
    }
}
