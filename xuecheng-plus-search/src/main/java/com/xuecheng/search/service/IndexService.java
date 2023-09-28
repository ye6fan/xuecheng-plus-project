package com.xuecheng.search.service;

/**
 * @author Mr.M
 * @version 1.0
 */
public interface IndexService {

    /**
     * @param indexName 索引名称
     * @param id        主键
     * @param object    索引对象
     * @return Boolean true表示成功,false失败
     * &#064;description  添加索引
     * @author Mr.M
     */
    Boolean addCourseIndex(String indexName, String id, Object object);


    /**
     * &#064;description  更新索引
     *
     * @param indexName 索引名称
     * @param id        主键
     * @param object    索引对象
     * @return Boolean true表示成功,false失败
     * @author Mr.M
     */
    Boolean updateCourseIndex(String indexName, String id, Object object);

    /**
     * &#064;description  删除索引
     *
     * @param indexName 索引名称
     * @param id        主键
     * @return java.lang.Boolean
     * @author Mr.M
     */
    Boolean deleteCourseIndex(String indexName, String id);

}
