package homepage.mapper;

import homepage.dto.MemberDto;
import homepage.dto.profileDto;
import homepage.dto.userInfoDto;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface MemberMapperInter {
    @Insert("""
            insert into user (id,pw,name,ph,address) values 
            (#{id},#{pw},#{name},#{ph},#{address})
            """)
    public void insertMember(MemberDto dto);
    @Select("select count(*) from user where id=#{searchid}")
    public int getIdCheckCount(String searchid);
    @Select("select count(*) from user where nickname=#{searchnick}")
    public int getNickCheckCount(String searchnick);
    @Update("update user set nickname=#{nickname},photo=#{photo} where id=#{id}")
    public void insertProfile(profileDto dto);
    @Select("""
            select count(*) from user where id=#{id} and pw=#{pw}
            """)
    public boolean memberLogin(String id, String pw);

    @Select("select nickname,photo from user where id=#{id} and pw=#{pw}")
    userInfoDto selectUserInfobyIDandPw(String id,String pw);
    @Update("update user set nickname=#{nickname} where id=#{id}")
    public void updateprofile(profileDto dto);
    @Update("update user set pw=#{pw},name=#{name},ph=#{ph},address=#{address} where id=#{id}")
    public void updatememder(MemberDto dto);

    @Select("select * from user where id=#{id}")
    MemberDto searchByidUser(String id);
}
