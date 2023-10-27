package top.yefan.task;

import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import top.yefan.pojo.MediaProcess;
import top.yefan.service.MediaFileService;
import top.yefan.service.MediaProcessService;
import top.yefan.utils.Mp4VideoUtil;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/**
 * XxlJob开发示例（Bean模式）
 *
 * @author xuxueli 2019-12-11 21:52:51
 */
@Component
@Slf4j
public class VideoTask {
    @Autowired
    MediaProcessService mediaProcessService;
    @Autowired
    MediaFileService mediaFileService;

    @Value("${videoprocess.ffmpegpath}")
    private String ffmpegPath;

    //MP4小，兼容性好
    @XxlJob("videoJobHandler")
    public void videoJobHandler() throws InterruptedException {
        int index = XxlJobHelper.getShardIndex();
        int total = XxlJobHelper.getShardTotal();
        //没有必要，我的视频全部MP4
        int processors = Runtime.getRuntime().availableProcessors();
        log.info("cpu Number of cores is：{}", processors);
        //查询
        List<MediaProcess> mediaProcessList = mediaProcessService.selectListByShardIndex(total, index, 1);
        int size = mediaProcessList.size();
        if (size <= 0) {
            log.info("There are no tasks to handle");
            return;
        }
        //没必要。。。。
        ExecutorService threadPool = Executors.newFixedThreadPool(size);
        CountDownLatch countDownLatch = new CountDownLatch(size);
        mediaProcessList.forEach(mediaProcess -> threadPool.execute(() -> {
            try {
                Long taskId = mediaProcess.getId();
                boolean flag = mediaProcessService.startTask(taskId);
                if (!flag) {
                    log.error("Preemption failed, task id：{}", taskId);
                    return;
                }
                //下载minio到本地
                String bucket = mediaProcess.getBucket();
                String objectName = mediaProcess.getFilePath();
                File file = mediaFileService.downloadFileFromMinio(bucket, objectName);
                String fileId = mediaProcess.getFileId();
                if (file == null) {
                    log.error("Error downloading video，task id：{}, bucket：{}，objectName：{}", taskId, bucket, objectName);
                    mediaProcessService.saveProcessFinishStatus(taskId, "3", fileId, null, "下载视频失败");
                    return;
                }
                //ffmpeg的路径
                String ffmpeg_path = ffmpegPath;
                //要转码的AVi的路径
                String video_path = file.getAbsolutePath();
                //MP4名字,毫无意义,不会被使用
                String mp4_name = "";
                //转换后的MP4文件路径
                File mp4File;
                try {
                    mp4File = File.createTempFile("minio", ".mp4");
                } catch (IOException e) {
                    log.error("Failed to create temporary file：{}", e.getMessage());
                    mediaProcessService.saveProcessFinishStatus(taskId, "3", fileId, null, "创建临时文件失败");
                    e.printStackTrace();
                    return;
                }
                //获取转码后mp4的文件路径
                String mp4_path = mp4File.getAbsolutePath();
                //创建工具类对象
                Mp4VideoUtil videoUtil = new Mp4VideoUtil(ffmpeg_path, video_path, mp4_name, mp4_path);
                //开始视频转换，成功将返回success，调用工具类只用传，ffmpeg的路径，转码后路径，源文件路径
                String res = videoUtil.generateMp4();
                if (!"success".equals(res)) {
                    log.error("coding failed");
                    mediaProcessService.saveProcessFinishStatus(taskId, "3", fileId, null, res);
                    return;
                }
                String clearObjectName = objectName;
                objectName = objectName.substring(0, objectName.lastIndexOf(".")) + ".mp4";
                //直接使用avi的md5值
                String url = "/" + bucket + "/" +objectName;
                boolean upload = mediaFileService.addMediaFilesToMinIO(mp4_path, "vedio/mp4", bucket, objectName);
                if (!upload) {
                    log.error("Upload video to minio failed, taskId:{}, fileId:{}", taskId, fileId);
                    mediaProcessService.saveProcessFinishStatus(taskId, "3", fileId, url, "上传视频到minio失败");
                    return;
                }
                try {
                    mediaProcessService.saveProcessFinishStatus(taskId, "2", fileId, url, null);
                } catch (Exception e) {
                    e.printStackTrace();
                    mediaProcessService.saveProcessFinishStatus(taskId, "3", fileId, url, "事务回滚");
                    return;
                }
                boolean clearAVI = mediaProcessService.clearAVI(bucket, clearObjectName);
                if (!clearAVI) log.error("AVi Video deletion failed");
            } finally {
                countDownLatch.countDown();
            }
        }));
        boolean await = countDownLatch.await(10, TimeUnit.MINUTES);
        log.info("Whether the wait was successful:{}", await);
    }

}
