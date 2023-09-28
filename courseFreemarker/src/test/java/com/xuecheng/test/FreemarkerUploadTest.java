package com.xuecheng.test;

import com.xuecheng.freemarker.feignclient.MediaServiceClient;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@SpringBootTest
public class FreemarkerUploadTest {
    @Autowired
    MediaServiceClient mediaServiceClient;

    @Test
    public void test01() {
        File file = new File("D:\\124.html");
        MultipartFile multipartFile = MultipartSupportConfig.getMultipartFile(file);
        mediaServiceClient.upload(multipartFile, "course/124.html");
    }

}
