package api.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface userMapper {
    @Select("select id from user where name=#{name}")
    String searchByName(String name);

    @Select("select pw from user where id=#{id}")
    String searchByID(String id);
}
