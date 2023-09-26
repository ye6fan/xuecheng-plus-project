package top.yefan.service;

import java.io.File;

/**
 * @author Mr.M
 * @version 1.0
 */
public interface MediaFileService {

    String getFileById(String mediaId);

    File downloadFileFromMinio(String bucket, String objectName);

    boolean addMediaFilesToMinIO(String localFilePath, String mimeType, String bucket, String objectName);
}
