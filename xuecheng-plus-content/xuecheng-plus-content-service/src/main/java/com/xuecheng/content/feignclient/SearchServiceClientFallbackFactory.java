package com.xuecheng.content.feignclient;

import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class SearchServiceClientFallbackFactory implements FallbackFactory<SearchServiceClient> {

    @Override
    public SearchServiceClient create(Throwable throwable) {
        log.info("发生熔断：{}", throwable.toString());
        return courseIndex -> {
            log.error("发生熔断，索引：{}", courseIndex);
            return false;
        };
    }
}
