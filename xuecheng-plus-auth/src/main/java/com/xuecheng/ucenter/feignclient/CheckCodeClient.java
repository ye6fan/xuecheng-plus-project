package com.xuecheng.ucenter.feignclient;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "checkcode", fallbackFactory = CheckCodeClientFallbackFactory.class)
@RequestMapping("/checkcode")
public interface CheckCodeClient {
    //远程调用验证码接口的验证
    @PostMapping(value = "/verify")
    Boolean verify(@RequestParam("key") String key, @RequestParam("code") String code);
}
