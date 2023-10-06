package com.xuecheng.checkcode.service.impl;

import com.xuecheng.checkcode.service.CheckCodeService;
import org.springframework.stereotype.Component;

import java.util.Random;

/**
 * @author Mr.M
 * @version 1.0
 * &#064;description  数字字母生成器
 */
@Component("NumberLetterCheckCodeGenerator")
public class NumberLetterCheckCodeGenerator implements CheckCodeService.CheckCodeGenerator {


    @Override
    public String generate(int length) {
        //这是验证码所可能包含的字母与数字
        String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        //随机4次
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(36);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }


}
