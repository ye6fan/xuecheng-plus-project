package com.xuecheng.ucenter.feignclient;

import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class CheckCodeClientFallbackFactory implements FallbackFactory<CheckCodeClient> {
    @Override
    public CheckCodeClient create(Throwable throwable) {
        return (key, code) -> {
            log.error("调用验证码服务熔断：{}", throwable.getMessage());
            return false;
        };
    }
}
