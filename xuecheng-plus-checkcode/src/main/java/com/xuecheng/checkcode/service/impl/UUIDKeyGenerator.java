package com.xuecheng.checkcode.service.impl;

import com.xuecheng.checkcode.service.CheckCodeService;
import org.springframework.stereotype.Component;

import java.util.UUID;

/**
 * @author Mr.M
 * @version 1.0
 * &#064;description  uuid生成器
 */
@Component("UUIDKeyGenerator")
public class UUIDKeyGenerator implements CheckCodeService.KeyGenerator {
    @Override
    public String generate(String prefix) {
        //uuid是key
        String uuid = UUID.randomUUID().toString();
        return prefix + uuid.replaceAll("-", "");
    }
}
