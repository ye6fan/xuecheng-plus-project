package top.yefan;

import org.junit.jupiter.api.Test;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import top.yefan.mapper.MediaFilesMapper;
import top.yefan.mapper.MediaProcessHistoryMapper;
import top.yefan.mapper.MediaProcessMapper;
import top.yefan.pojo.MediaFiles;
import top.yefan.pojo.MediaProcess;
import top.yefan.pojo.MediaProcessHistory;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

@SpringBootTest
class VideoCodingApplicationTests {
    @Autowired
    MediaProcessMapper mediaProcessMapper;
    @Autowired
    MediaProcessHistoryMapper mediaProcessHistoryMapper;
    @Autowired
    MediaFilesMapper mediaFilesMapper;

    @Test
    void contextLoads() {
        List<MediaProcessHistory> mediaProcessHistoryList = mediaProcessHistoryMapper.selectList(null);
        for (MediaProcessHistory mediaProcessHistory : mediaProcessHistoryList) {
            MediaProcess mediaProcess = new MediaProcess();
            BeanUtils.copyProperties(mediaProcessHistory, mediaProcess);
            mediaProcess.setStatus("1");
            mediaProcessMapper.insert(mediaProcess);
        }
    }

    @Test
    void test01() {
        List<MediaProcess> mediaProcessList = mediaProcessMapper.selectList(null);
        for (MediaProcess mediaProcess : mediaProcessList) {
            MediaFiles mediaFiles = new MediaFiles();
            BeanUtils.copyProperties(mediaProcess, mediaFiles);
            mediaFilesMapper.updateById(mediaFiles);
        }
    }

    private static final String ffmpegEXE = "/usr/bin/ffmpeg";
    private static final String videoInputPath = "/opt/ffmpeg-4.4/bin/ffmpeg";
    private static final String videoOutPath = "/opt/ffmpeg-4.4/bin/ffmpeg";
    @Test
    void ffmpeg() {
        String videoCommend = ffmpegEXE + " -y -i " + videoInputPath + " -vcodec h264 " + videoOutPath;
        try {
            Runtime rt = Runtime.getRuntime();
            Process proc = rt.exec(videoCommend);
            InputStream stderr = proc.getErrorStream();
            InputStreamReader isr = new InputStreamReader(stderr);
            BufferedReader br = new BufferedReader(isr);
            String line;
            while ((line = br.readLine()) != null)
                System.out.println(line);

            int exitVal = proc.waitFor();
            System.out.println("Process exitValue: " + exitVal);
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

}
