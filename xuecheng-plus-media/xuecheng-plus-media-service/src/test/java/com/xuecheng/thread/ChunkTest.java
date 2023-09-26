package com.xuecheng.thread;

import java.io.File;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class ChunkTest {
    public static void main(String[] args) throws InterruptedException {
        File sourceFile = new File("D:\\Messy\\Video\\mp4\\253782856-1-160.mp4");
        String chunkFilePath = "D:\\Messy\\Video\\test\\chunk\\";
        int chunkSize = 1024 * 1024 * 5;
        int chunkNum = (int) Math.ceil(sourceFile.length() * 1.0 / chunkSize);
        int threads = 4; // 指定线程数

        // 创建多个线程处理分块
        ExecutorService executor = Executors.newFixedThreadPool(threads);
        for (int i = 0; i < threads; i++) {
            int startChunkIndex = i * (chunkNum / threads);
            int endChunkIndex = (i + 1) * (chunkNum / threads) - 1;
            if (i == threads - 1) {
                endChunkIndex = chunkNum - 1;
            }

            ChunkProcessor processor = new ChunkProcessor(sourceFile, chunkFilePath, chunkSize, startChunkIndex, endChunkIndex);
            executor.execute(processor);
        }

        // 等待所有线程完成
        executor.shutdown();
        boolean flag = executor.awaitTermination(Long.MAX_VALUE, TimeUnit.NANOSECONDS);
        if (flag) System.out.println("sucess");
    }
}
