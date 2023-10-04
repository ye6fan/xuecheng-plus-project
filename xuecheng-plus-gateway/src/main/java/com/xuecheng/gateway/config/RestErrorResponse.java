package com.xuecheng.gateway.config;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

/**
 * 错误响应参数包装
 */
@Data
@AllArgsConstructor
public class RestErrorResponse implements Serializable {
    private String errMessage;
}
