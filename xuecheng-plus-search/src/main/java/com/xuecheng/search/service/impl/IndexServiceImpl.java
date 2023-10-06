package com.xuecheng.search.service.impl;

import com.alibaba.fastjson.JSON;
import com.xuecheng.base.exception.XueChengPlusException;
import com.xuecheng.search.service.IndexService;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.action.DocWriteResponse;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.action.update.UpdateResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.xcontent.XContentType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

/**
 * @author Mr.M
 * @version 1.0
 * &#064;description  课程索引管理接口实现
 */
@Slf4j
@Service
public class IndexServiceImpl implements IndexService {

    @Autowired
    RestHighLevelClient client;

    @Override
    public Boolean addCourseIndex(String indexName, String id, Object object) {
        //indexName就是表名
        String jsonString = JSON.toJSONString(object);
        //根据表名和id，创建es的数据
        IndexRequest indexRequest = new IndexRequest(indexName).id(id);
        //指定索引文档内容，设置数据内容和传输方式
        indexRequest.source(jsonString, XContentType.JSON);
        //索引响应对象
        IndexResponse indexResponse = null;
        try {
            //添加索引的方法，默认
            indexResponse = client.index(indexRequest, RequestOptions.DEFAULT);
        } catch (IOException e) {
            log.error("添加索引出错:{}", e.getMessage());
            e.printStackTrace();
            XueChengPlusException.cast("添加索引出错");
        }
        //返回是，操作的方式
        String name = indexResponse.getResult().name();
        return name.equalsIgnoreCase("created") || name.equalsIgnoreCase("updated");

    }

    @Override
    public Boolean updateCourseIndex(String indexName, String id, Object object) {
        //先转换数据为string
        String jsonString = JSON.toJSONString(object);
        //更新参数，进行配置
        UpdateRequest updateRequest = new UpdateRequest(indexName, id);
        updateRequest.doc(jsonString, XContentType.JSON);
        UpdateResponse updateResponse = null;
        try {
            //更新返回结果
            updateResponse = client.update(updateRequest, RequestOptions.DEFAULT);
        } catch (IOException e) {
            log.error("更新索引出错:{}", e.getMessage());
            e.printStackTrace();
            XueChengPlusException.cast("更新索引出错");
        }
        //更新的结果
        DocWriteResponse.Result result = updateResponse.getResult();
        //忽略大小写
        return result.name().equalsIgnoreCase("updated");

    }

    @Override
    public Boolean deleteCourseIndex(String indexName, String id) {
        //创建请求，构造请求，发送请求||返回响应
        //删除索引请求对象，主要的就是Id
        DeleteRequest deleteRequest = new DeleteRequest(indexName, id);
        //响应对象
        DeleteResponse deleteResponse = null;
        try {
            deleteResponse = client.delete(deleteRequest, RequestOptions.DEFAULT);
        } catch (IOException e) {
            log.error("删除索引出错:{}", e.getMessage());
            e.printStackTrace();
            XueChengPlusException.cast("删除索引出错");
        }
        //获取响应结果
        DocWriteResponse.Result result = deleteResponse.getResult();
        return result.name().equalsIgnoreCase("deleted");
    }
}
