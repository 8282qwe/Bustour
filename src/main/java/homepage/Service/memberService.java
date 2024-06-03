package homepage.Service;

import homepage.dto.MemberDto;
import homepage.mapper.MemberMapperInter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class memberService {
    final MemberMapperInter mapperInter;

    public void insertMember(MemberDto dto, HttpSession session){
        mapperInter.insertMember(dto);
        session.setAttribute("id",dto.getId());
    }
    public Map<String,Boolean> getIdCheckCount(String searchid){
        Map<String,Boolean> map=new HashMap<>();
        int count=mapperInter.getIdCheckCount(searchid);
        map.put("isCheck", count == 1);
        return map;
    }
    public Map<String,Boolean> getNickCheckCount(String searchnick){
        Map<String,Boolean> map=new HashMap<>();
        int count=mapperInter.getNickCheckCount(searchnick);
        map.put("isCheck", count == 1);
        return map;
    }
}
