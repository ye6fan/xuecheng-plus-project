package com.xuecheng.search.service.impl;

import com.alibaba.fastjson.JSON;
import com.xuecheng.base.model.PageParams;
import com.xuecheng.search.dto.SearchCourseParamDto;
import com.xuecheng.search.dto.SearchPageResultDto;
import com.xuecheng.search.po.CourseIndex;
import com.xuecheng.search.service.CourseSearchService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.lucene.search.TotalHits;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.MultiMatchQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author Mr.M
 * @version 1.0
 * &#064;description  课程搜索service实现类
 */
@Slf4j
@Service
public class CourseSearchServiceImpl implements CourseSearchService {

    @Value("${elasticsearch.course.index}")
    private String courseIndexStore;
    @Value("${elasticsearch.course.source_fields}")
    private String sourceFields;

    @Autowired
    RestHighLevelClient client;

    @Override
    public SearchPageResultDto<CourseIndex> queryCoursePubIndex(PageParams pageParams,
                                                                SearchCourseParamDto courseSearchParam) {

        //设置索引||搜索请求||指定索引表
        SearchRequest searchRequest = new SearchRequest(courseIndexStore);
        //和增删改不太一样，因为增删改是直接操作搜索请求的，这里是创建了搜索的请求的构造器
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        //搜索请求中boolean查询的构造器，最终要放到，搜索构造器中
        BoolQueryBuilder boolQueryBuilder = QueryBuilders.boolQuery();
        //source源字段过虑，就是指定的字段或者属性
        String[] sourceFieldsArray = sourceFields.split(",");
        //包含与排除，包含前者，排除后者
        searchSourceBuilder.fetchSource(sourceFieldsArray, new String[]{});
        //传入的课程搜索Dto
        if (courseSearchParam == null) {
            courseSearchParam = new SearchCourseParamDto();
        }
        //关键字
        if (StringUtils.isNotEmpty(courseSearchParam.getKeywords())) {
            //匹配关键字，通过查询构造器里的多重匹配方法，构造一个查询条件
            MultiMatchQueryBuilder multiMatchQueryBuilder =
                    QueryBuilders.multiMatchQuery(courseSearchParam.getKeywords(),
                            "name", "description");
            //设置匹配占比
            multiMatchQueryBuilder.minimumShouldMatch("70%");
            //提升另个字段的Boost值，提升课程名字的占比
            multiMatchQueryBuilder.field("name", 10);
            //把参数设置到bool构造器里面，must必须匹配
            boolQueryBuilder.must(multiMatchQueryBuilder);
        }
        //过滤，把分类和课程等级进行过滤，并设置到bool构造器中
        if (StringUtils.isNotEmpty(courseSearchParam.getMt())) {
            boolQueryBuilder.filter(QueryBuilders.termQuery("mtName", courseSearchParam.getMt()));
        }
        if (StringUtils.isNotEmpty(courseSearchParam.getSt())) {
            boolQueryBuilder.filter(QueryBuilders.termQuery("stName", courseSearchParam.getSt()));
        }
        if (StringUtils.isNotEmpty(courseSearchParam.getGrade())) {
            boolQueryBuilder.filter(QueryBuilders.termQuery("grade", courseSearchParam.getGrade()));
        }
        //分页，也就是查询的个数
        Long pageNo = pageParams.getPageNo();
        Long pageSize = pageParams.getPageSize();
        int start = (int) ((pageNo - 1) * pageSize);
        //设置查询分页，这个分页是直接通过，最大的搜索构造器设置的
        // 应该是因为在使用es时，查询也是需要各种各样的参数和规则，才对应到Java也是有很多层
        searchSourceBuilder.from(start);
        searchSourceBuilder.size(Math.toIntExact(pageSize));
        //布尔查询。也就是把上面的的must匹配和filter过滤的bool构造器构造的值设进去
        searchSourceBuilder.query(boolQueryBuilder);
        //高亮设置，一个新的类
        HighlightBuilder highlightBuilder = new HighlightBuilder();
        highlightBuilder.preTags("<font class='eslight'>");
        highlightBuilder.postTags("</font>");
        //设置高亮字段，课程name
        highlightBuilder.fields().add(new HighlightBuilder.Field("name"));
        //这里通过最大的构造器把高亮设置进去
        searchSourceBuilder.highlighter(highlightBuilder);
        //请求搜索，这里是直接调用搜索方法，把最大的构造器传入
        searchRequest.source(searchSourceBuilder);
        //聚合设置
        buildAggregation(searchRequest);
        SearchResponse searchResponse;
        try {
            //搜索的响应
            searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
        } catch (IOException e) {
            e.printStackTrace();
            log.error("课程搜索异常：{}", e.getMessage());
            return new SearchPageResultDto<>(new ArrayList<>(), 0, 0, 0);
        }

        //结果集处理，双重hit
        SearchHits hits = searchResponse.getHits();
        //hits的hits才是真正结果
        SearchHit[] searchHits = hits.getHits();
        //记录总数，在第一层hits
        TotalHits totalHits = hits.getTotalHits();
        //数据列表
        List<CourseIndex> list = new ArrayList<>();
        //结果hits第二层
        for (SearchHit hit : searchHits) {
            //数据就在这里面，额三层hit，不过第三层是真实数据
            String sourceAsString = hit.getSourceAsString();
            //转为实体类
            CourseIndex courseIndex = JSON.parseObject(sourceAsString, CourseIndex.class);

            //取出source
            Map<String, Object> sourceAsMap = hit.getSourceAsMap();

            //课程id，也是索引的id
            Long id = courseIndex.getId();
            //取出名称
            String name = courseIndex.getName();
            //取出高亮字段内容
            Map<String, HighlightField> highlightFields = hit.getHighlightFields();
            //高亮字段处理，fields领域
            if (highlightFields != null) {
                HighlightField nameField = highlightFields.get("name");
                if (nameField != null) {
                    //fragments片段
                    Text[] fragments = nameField.getFragments();
                    StringBuilder stringBuilder = new StringBuilder();
                    for (Text str : fragments) {
                        stringBuilder.append(str.string());
                    }
                    name = stringBuilder.toString();
                }
            }
            //这个setId怎么有点奇怪
            courseIndex.setId(id);
            courseIndex.setName(name);
            //添加到结果集
            list.add(courseIndex);

        }
        //新的dto，是继承响应PageResult后加了，大分类和小分类字段的列表
        SearchPageResultDto<CourseIndex> pageResult = new SearchPageResultDto<>(
                list, totalHits.value, pageNo, pageSize);

        //获取聚合结果searchResponse.getAggregations()，响应里面有aggregation聚合的数据，聚合时候的聚合名字
        List<String> mtList = getAggregation(searchResponse.getAggregations(), "mtAgg");
        List<String> stList = getAggregation(searchResponse.getAggregations(), "stAgg");
        //装载
        pageResult.setMtList(mtList);
        pageResult.setStList(stList);
        //返回
        return pageResult;
    }


    private void buildAggregation(SearchRequest request) {
        //通过请求的source()直接设置
        request.source().aggregation(AggregationBuilders
                .terms("mtAgg")     //聚合的名字
                .field("mtName")    //要聚合的字段
                .size(100)
        );
        request.source().aggregation(AggregationBuilders
                .terms("stAgg")
                .field("stName")
                .size(100)
        );

    }

    private List<String> getAggregation(Aggregations aggregations, String aggName) {
        // 4.1.根据聚合名称获取聚合结果
        Terms brandTerms = aggregations.get(aggName);
        // 4.2.获取buckets
        List<? extends Terms.Bucket> buckets = brandTerms.getBuckets();
        // 4.3.遍历
        List<String> brandList = new ArrayList<>();
        for (Terms.Bucket bucket : buckets) {
            // 4.4.获取key
            String key = bucket.getKeyAsString();
            brandList.add(key);
        }
        //分类的列表，例如java，c，c++，python
        return brandList;
    }
}
