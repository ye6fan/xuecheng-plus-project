package top.yefan.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import top.yefan.pojo.MediaProcess;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author itcast
 */
@Mapper
public interface MediaProcessMapper extends BaseMapper<MediaProcess> {
    @Select("SELECT * FROM media_process WHERE id % #{total} = #{index} AND (status = '1' OR status = '3') AND fail_count < 3 LIMIT #{count}")
    List<MediaProcess> selectListByShardIndex(@Param("total") int total, @Param("index") int index, @Param("count") int count);

    @Update("update media_process set status = 4 where (status = '1' or  status = '3') and fail_count < 3 and id = #{id}")
    int startTask(@Param("id") long id);
}
