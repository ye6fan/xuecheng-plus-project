package com.xuecheng.content.feignclient;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(value = "search", fallbackFactory = SearchServiceClientFallbackFactory.class)
public interface SearchServiceClient {
    //远程调用
    @PostMapping("/search/index/course")
    Boolean add(@RequestBody CourseIndex courseIndex);

    @DeleteMapping("/search/index/course/{id}")
    Boolean delete(@PathVariable("id") Long id);
}
