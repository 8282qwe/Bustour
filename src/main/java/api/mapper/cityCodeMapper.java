package api.mapper;

import api.Dto.bus.citysDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface cityCodeMapper {

    @Select("select * from citys")
    List<citysDto> selectCitysCodeAll();
}
