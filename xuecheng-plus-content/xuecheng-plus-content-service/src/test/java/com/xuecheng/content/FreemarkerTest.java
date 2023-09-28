package com.xuecheng.content;

import com.xuecheng.content.model.dto.CoursePreviewDto;
import com.xuecheng.content.service.CoursePublishService;
import com.xuecheng.messagesdk.mapper.MqMessageHistoryMapper;
import com.xuecheng.messagesdk.mapper.MqMessageMapper;
import com.xuecheng.messagesdk.model.po.MqMessage;
import com.xuecheng.messagesdk.model.po.MqMessageHistory;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.apache.commons.io.IOUtils;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@SpringBootTest
@MapperScan("com.xuecheng.content.mapper")
public class FreemarkerTest {
    @Autowired
    MqMessageMapper mqMessageMapper;
    @Autowired
    MqMessageHistoryMapper mqMessageHistoryMapper;
    @Autowired
    CoursePublishService coursePublishService;

    @Test
    public void testGenerateHtmlByTemplate() throws IOException, TemplateException {
        Configuration configuration = new Configuration(Configuration.getVersion());
        //classpath拿到路径
        String path = Objects.requireNonNull(this.getClass().getResource("/")).getPath();
        configuration.setDirectoryForTemplateLoading(new File(path + "/templates/"));
        configuration.setDefaultEncoding("utf-8");
        Template template = configuration.getTemplate("course_template.ftl");
        CoursePreviewDto coursePreviewInfo = coursePublishService.getCoursePreviewInfo(124L);
        Map<String, CoursePreviewDto> map = new HashMap<>();
        map.put("model", coursePreviewInfo);
        String html = FreeMarkerTemplateUtils.processTemplateIntoString(template, map);
        InputStream inputStream = IOUtils.toInputStream(html, "utf-8");
        FileOutputStream outputStream = new FileOutputStream("D:\\124.html");
        IOUtils.copy(inputStream, outputStream);
    }

    @Test
    public void turnTest() {
        List<MqMessageHistory> mqMessageHistoryList = mqMessageHistoryMapper.selectList(null);
        for (MqMessageHistory mqMessageHistory : mqMessageHistoryList) {
            MqMessage mqMessage = new MqMessage();
            mqMessageHistory.setStageState1("0");
            mqMessageHistory.setStageState2("0");
            mqMessageHistory.setStageState3("0");
            BeanUtils.copyProperties(mqMessageHistory, mqMessage);
            mqMessageMapper.insert(mqMessage);
        }
    }
}
