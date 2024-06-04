package api.mapper;

import api.Dto.keyWord.favoriteRequestDto;
import api.Dto.keyWord.favoriteResponseDto;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface favoriteMapper {
    @Insert("insert into star (id, title, link, category, address, roadAddress) values (#{id},#{title},#{link},#{category},#{address},#{roadaddress})")
    void insertStar(favoriteRequestDto requestDto);

    @Select("select title,link,category,address,roadAddress from star where id=#{id}")
    List<favoriteResponseDto> getStar(String id);

    @Delete("delete from star where title=#{title} and id=#{id}")
    void deleteStar(favoriteRequestDto responseDto);
}
