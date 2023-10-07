package com.xuecheng.media.feignclient;

import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class LearningServiceClientFallbackFactory implements FallbackFactory<LearningServiceClient> {

    @Override
    public LearningServiceClient create(Throwable throwable) {
        return courseId -> {
            log.error("调用学习管理服务发生熔断:{}", throwable.toString(),throwable);
            return null;
        };
    }
}
