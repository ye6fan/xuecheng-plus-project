package top.yefan.task;

import com.xuecheng.messagesdk.model.po.MqMessage;
import com.xuecheng.messagesdk.service.MessageProcessAbstract;
import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.handler.annotation.XxlJob;
import org.springframework.stereotype.Component;

@Component
public class MsgSDKTask extends MessageProcessAbstract {
    @XxlJob("videoTranscoding")
    public void videoTranscoding() {
        int index = XxlJobHelper.getShardIndex();
        int total = XxlJobHelper.getShardTotal();
        //这个process过程是传递类型的，如何去读取信息，数量和超时时间
        process(index, total, "video_transcoding", 4, 60);
    }

    @Override
    public boolean execute(MqMessage mqMessage) {
        //转码执行
        return true;
    }
}
