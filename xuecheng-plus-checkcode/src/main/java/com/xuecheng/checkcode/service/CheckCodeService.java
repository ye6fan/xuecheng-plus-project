package com.xuecheng.checkcode.service;

import com.xuecheng.checkcode.model.CheckCodeParamsDto;
import com.xuecheng.checkcode.model.CheckCodeResultDto;

/**
 * @author Mr.M
 * @version 1.0
 * &#064;description  验证码接口
 */
public interface CheckCodeService {


    /**
     * &#064;description  生成验证码
     *
     * @param checkCodeParamsDto 生成验证码参数
     * @return com.xuecheng.checkcode.model.CheckCodeResultDto 验证码结果
     * @author Mr.M
     */
    CheckCodeResultDto generate(CheckCodeParamsDto checkCodeParamsDto);

    /**
     * &#064;description  校验验证码
     *
     * @param key key
     * @param code code
     * @return boolean
     * @author Mr.M
     */
    boolean verify(String key, String code);


    /**
     * &#064;description  验证码生成器
     *
     * @author Mr.M
     */
    interface CheckCodeGenerator {
        /**
         * 验证码生成
         *
         * @return 验证码
         */
        String generate(int length);

    }

    /**
     * &#064;description  key生成器
     *
     * @author Mr.M
     */
    interface KeyGenerator {

        /**
         * key生成
         *
         * @return 验证码
         */
        String generate(String prefix);
    }


    /**
     * &#064;description  验证码存储
     *
     * @author Mr.M
     */
    interface CheckCodeStore {

        /**
         * &#064;description  向缓存设置key
         *
         * @param key    key
         * @param value  value
         * @param expire 过期时间,单位秒
         * @author Mr.M
         */
        void set(String key, String value, Integer expire);

        String get(String key);

        void remove(String key);
    }
}
