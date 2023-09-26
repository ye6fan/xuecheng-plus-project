package com.xuecheng.media.service;

import com.xuecheng.media.model.po.MediaProcess;

import java.util.List;

public interface MediaProcessService {
    List<MediaProcess> selectListByShardIndex(int total, int index, int count);

    boolean startTask(long id);

    void saveProcessFinishStatus(Long taskId, String status, String fileId, String url, String errorMsg);

    boolean clearAVI(String bucket, String objectName);
}
