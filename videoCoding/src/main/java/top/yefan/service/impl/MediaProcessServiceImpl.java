package top.yefan.service.impl;

import io.minio.MinioClient;
import io.minio.RemoveObjectArgs;
import io.minio.errors.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import top.yefan.mapper.MediaFilesMapper;
import top.yefan.mapper.MediaProcessHistoryMapper;
import top.yefan.mapper.MediaProcessMapper;
import top.yefan.pojo.MediaFiles;
import top.yefan.pojo.MediaProcess;
import top.yefan.pojo.MediaProcessHistory;
import top.yefan.service.MediaProcessService;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.util.List;

@Service
@Slf4j
public class MediaProcessServiceImpl implements MediaProcessService {
    @Autowired
    MediaProcessMapper mediaProcessMapper;
    @Autowired
    MediaProcessHistoryMapper mediaProcessHistoryMapper;
    @Autowired
    MediaFilesMapper mediaFilesMapper;
    @Autowired
    MinioClient minioClient;

    @Override
    public List<MediaProcess> selectListByShardIndex(int total, int index, int count) {
        return mediaProcessMapper.selectListByShardIndex(total, index, count);
    }

    @Override
    public boolean startTask(long id) {
        int flag = mediaProcessMapper.startTask(id);
        return flag >= 0;
    }

    @Override
    @Transactional
    public void saveProcessFinishStatus(Long taskId, String status, String fileId, String url, String errorMsg) {
        MediaProcess mediaProcess = mediaProcessMapper.selectById(taskId);
        if (mediaProcess == null) return;
        if ("3".equals(status)) {
            log.info("Entering a failed route，taskId:{}   3333", taskId);
            mediaProcess.setErrormsg(errorMsg);
            mediaProcess.setStatus("3");
            mediaProcess.setFailCount(mediaProcess.getFailCount() + 1);
            mediaProcessMapper.updateById(mediaProcess);
        }
        if ("2".equals(status)) {
            log.info("Enter the successful route，taskId:{}    2222", taskId);
            MediaProcessHistory mediaProcessHistory = new MediaProcessHistory();
            mediaProcess.setStatus("2");
            BeanUtils.copyProperties(mediaProcess, mediaProcessHistory);
            mediaProcessHistory.setFinishDate(LocalDateTime.now());
            mediaProcessHistoryMapper.insert(mediaProcessHistory);
            mediaProcessMapper.deleteById(taskId);
            MediaFiles mediaFiles = mediaFilesMapper.selectById(fileId);
            mediaFiles.setUrl(url);
            mediaFilesMapper.updateById(mediaFiles);
        }
    }

    @Override
    public boolean clearAVI(String bucket, String objectName) {
        log.info("");
        RemoveObjectArgs args = RemoveObjectArgs.builder().bucket(bucket).object(objectName).build();
        try {
            minioClient.removeObject(args);
        } catch (ErrorResponseException | InsufficientDataException | InternalException | InvalidKeyException |
                 InvalidResponseException | IOException | NoSuchAlgorithmException | ServerException |
                 XmlParserException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
