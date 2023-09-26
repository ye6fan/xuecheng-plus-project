package com.xuecheng.media;

import io.minio.*;
import io.minio.errors.*;
import org.apache.commons.io.IOUtils;
import org.junit.jupiter.api.Test;

import java.io.FileOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class MinioTest {
    MinioClient minioClient = MinioClient.builder()
            .endpoint("http://47.122.78.79:9000")
            .credentials("AKIAIOSFODNN7EXAMPLE", "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY")
            .build();

    @Test
    public void test_upload() throws IOException, ServerException, InsufficientDataException, ErrorResponseException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        UploadObjectArgs upArgs = UploadObjectArgs.builder()
                .bucket("testbucket")
                .filename("D:\\Messy\\Video\\1247415973-1-192.mp4")
                .object("test/20/ounijiang.mp4")
                .build();
        minioClient.uploadObject(upArgs);
    }

    @Test
    public void test_put() throws IOException, ServerException, InsufficientDataException, ErrorResponseException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        InputStream inputStream = Files.newInputStream(Paths.get("D:\\Messy\\Video\\mp4\\1265308212-1-16.mp4"));
        PutObjectArgs putArgs = PutObjectArgs.builder()
                .bucket("testbucket")
                .stream(inputStream, inputStream.available(), -1)
                .object("2023/09/23/1.mp4")
                .build();
        minioClient.putObject(putArgs);
    }

    @Test
    public void test_delete() throws IOException, ServerException, InsufficientDataException, ErrorResponseException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        RemoveObjectArgs removeArgs = RemoveObjectArgs.builder()
                .bucket("testbucket")
                .object("ounijiang.mp4")
                .build();
        minioClient.removeObject(removeArgs);
    }

    @Test
    public void test_getFile() throws IOException, ServerException, InsufficientDataException, ErrorResponseException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        GetObjectArgs getArgs = GetObjectArgs.builder()
                .bucket("testbucket")
                .object("test/20/ounijiang.mp4")
                .build();
        FilterInputStream filterInputStream = minioClient.getObject(getArgs);
        FileOutputStream fileOutputStream = new FileOutputStream("D:\\Messy\\Video\\test\\1.mp4");
        IOUtils.copy(filterInputStream, fileOutputStream);
    }

    @Test
    public void test_thread() {
        new ThreadPoolExecutor(2, 2, 60,
                TimeUnit.SECONDS, new LinkedBlockingQueue<>(4),
                new ThreadPoolExecutor.DiscardPolicy());

    }

}
