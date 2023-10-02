package com.xuecheng.media;

import io.minio.ComposeObjectArgs;
import io.minio.ComposeSource;
import io.minio.MinioClient;
import io.minio.UploadObjectArgs;
import io.minio.errors.*;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class BigFileTest {

    private final MinioClient minioClient = MinioClient.builder()
            .endpoint("http://47.122.94.185:9000")
            .credentials("AKIAIOSFODNN7EXAMPLE", "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY")
            .build();

    @Test
    public void testChunk() throws IOException {
        File sourceFile = new File("D:\\Messy\\Video\\mp4\\253782856-1-160.mp4");
        String chunkFilePath = "D:\\Messy\\Video\\test\\chunk\\";
        int chunkSize = 1024 * 1024 * 5;
        int chunkNum = (int) Math.ceil(sourceFile.length() * 1.0 / chunkSize);
        RandomAccessFile raf_r = new RandomAccessFile(sourceFile, "r");
        byte[] bytes = new byte[1024];
        for (int i = 0; i < chunkNum; i++) {
            File chunkFile = new File(chunkFilePath + i);
            RandomAccessFile raf_rw = new RandomAccessFile(chunkFile, "rw");
            int len;
            while ((len = raf_r.read(bytes)) != -1) {
                raf_rw.write(bytes, 0, len);
                if (chunkFile.length() >= chunkSize) {
                    break;
                }
            }
            raf_rw.close();
        }
        raf_r.close();
    }

    @Test
    public void testMerge() throws IOException {
        File chunkFolder = new File("D:\\Messy\\Video\\test\\chunk\\");
        File mergeFile = new File("D:\\Messy\\Video\\test\\1.mp4");
        File[] files = chunkFolder.listFiles();
        assert files != null;
        List<File> fileList = Arrays.asList(files);
        fileList.sort(Comparator.comparingInt(f -> Integer.parseInt(f.getName())));
        RandomAccessFile raf_rw = new RandomAccessFile(mergeFile, "rw");
        for (File file : fileList) {
            RandomAccessFile raf_r = new RandomAccessFile(file, "r");
            int len;
            byte[] bytes = new byte[1024];
            while ((len = raf_r.read(bytes)) != -1) {
                raf_rw.write(bytes, 0, len);
            }
            raf_r.close();
        }
        raf_rw.close();
    }

    @Test
    public void uploadChunk() throws IOException, ServerException, InsufficientDataException, ErrorResponseException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        for (int i = 0; i < 20; i++) {
            UploadObjectArgs upArgs = UploadObjectArgs.builder()
                    .bucket("testbucket")
                    .filename("D:\\Messy\\Video\\test\\chunk\\" + i)
                    .object("chunk/" + i)
                    .build();
            minioClient.uploadObject(upArgs);
            System.out.println(i);
        }
    }

    @Test
    public void uploadMerge() throws IOException, ServerException, InsufficientDataException, ErrorResponseException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        List<ComposeSource> sourceList = Stream.iterate(0, i -> ++i).limit(20).map(i -> ComposeSource
                .builder()
                .bucket("testbucket")
                .object("chunk/" + i)
                .build()).collect(Collectors.toList());

        ComposeObjectArgs composeObjectArgs = ComposeObjectArgs
                .builder()
                .bucket("testbucket")
                .object("1.mp4")
                .sources(sourceList)
                .build();
        minioClient.composeObject(composeObjectArgs);
    }
}
