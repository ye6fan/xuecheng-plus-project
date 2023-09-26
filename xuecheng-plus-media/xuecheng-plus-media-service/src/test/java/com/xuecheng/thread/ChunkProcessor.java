package com.xuecheng.thread;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;

public class ChunkProcessor implements Runnable {
    private final File sourceFile;
    private final String chunkFilePath;
    private final int chunkSize;
    private final int startChunkIndex;
    private final int endChunkIndex;

    public ChunkProcessor(File sourceFile, String chunkFilePath, int chunkSize, int startChunkIndex, int endChunkIndex) {
        this.sourceFile = sourceFile;
        this.chunkFilePath = chunkFilePath;
        this.chunkSize = chunkSize;
        this.startChunkIndex = startChunkIndex;
        this.endChunkIndex = endChunkIndex;
    }

    @Override
    public void run() {
        try (RandomAccessFile raf_r = new RandomAccessFile(sourceFile, "r")) {
            int chunkIndex = startChunkIndex;
            long offset = (long) chunkIndex * chunkSize;
            while (chunkIndex <= endChunkIndex && offset < sourceFile.length()) {
                File chunkFile = new File(chunkFilePath + chunkIndex);
                try (RandomAccessFile raf_rw = new RandomAccessFile(chunkFile, "rw")) {
                    //移动到指定位置
                    raf_r.seek(offset);
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = raf_r.read(buffer)) != -1) {
                        raf_rw.write(buffer, 0, bytesRead);
                        if (raf_rw.length() >= chunkSize) {
                            break;
                        }
                    }
                }

                chunkIndex++;
                offset = (long) chunkIndex * chunkSize;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
