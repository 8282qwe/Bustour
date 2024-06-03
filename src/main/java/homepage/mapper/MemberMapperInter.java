package homepage.mapper;

import homepage.dto.MemberDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberMapperInter {
    @Insert("""
            insert into user (id,pw,name,ph,address) values 
            (#{id},#{pw},#{name},#{ph},#{address})
            """)
    void insertMember(MemberDto dto);
    @Select("select count(*) from user where id=#{searchid}")
    public int getIdCheckCount(String searchid);
    @Select("select count(*) from user where nickname=#{searchnick}")
    public int getNickCheckCount(String searchnick);

}
