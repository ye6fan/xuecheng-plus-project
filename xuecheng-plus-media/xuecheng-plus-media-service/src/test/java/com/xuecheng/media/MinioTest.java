package com.xuecheng.media;

import io.minio.*;
import io.minio.errors.*;
import io.minio.messages.Item;
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

public class MinioTest {
    MinioClient minioClient = MinioClient.builder()
            .endpoint("http://47.122.93.131:9000")
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
    public void test_stat() {
        try {
            minioClient.statObject(
                    StatObjectArgs.builder().bucket("video")
                            .object("3/e/3ed9d0e0349c7fce14371dbc4d3bbc92/3ed9d0e0349c7fce14371dbc4d3bbc92.mp4").build()
            );
        } catch (Exception e) {
            System.out.println(false);
        }
        System.out.println(true);
    }

    @Test
    public void test_list() throws ServerException, InsufficientDataException, ErrorResponseException, IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        ListObjectsArgs build = ListObjectsArgs.builder().bucket("mediafiles").prefix("course/").build();
        // 获取目录下的文件列表
        Iterable<Result<Item>> results = minioClient.listObjects(build);

        // 计数器
        int fileCount = 0;

        // 遍历文件列表并统计文件个数
        for (Result<Item> result : results) {
            Item item = result.get();
            if (!item.isDir()) {
                fileCount++;
            }
        }
        System.out.println(fileCount);
    }

}
