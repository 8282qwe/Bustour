package api.mapper;

import api.Dto.keyWord.favoriteRequestDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface favoriteMapper {
    @Insert("insert into star (id, title, link, category, address, roadAddress) values (#{id},#{title},#{link},#{category},#{address},#{roadAddress})")
    void insertStar(favoriteRequestDto requestDto);
}
