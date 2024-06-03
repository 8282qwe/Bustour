package homepage.Service;

import homepage.dto.MemberDto;
import homepage.dto.profileDto;
import homepage.mapper.MemberMapperInter;
import lombok.RequiredArgsConstructor;
import minio.service.storageService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class memberService {
    final MemberMapperInter mapperInter;
    final storageService storageService;

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
    public void insertProfile(
            String nickname,
            HttpSession session,
            MultipartFile upload
    ){
        String filename = UUID.randomUUID().toString();
        profileDto dto = new profileDto().builder()
                .id("1234")
                .nickname(nickname)
                .photo(filename)
                .build();

        mapperInter.insertProfile(dto);
        //스토리지에 업로드하기
        try {
            storageService.uploadFile("bustour","/profile/"+filename,upload.getInputStream(),upload.getContentType());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public Map<String,String> memberLogin(
            String id,
            String pw,
            HttpSession session
    ){
        Map<String,String> map=new HashMap<>();
        //로그인 상태
        boolean loginStatus=mapperInter.memberLogin(id, pw);
        if (loginStatus){
            //아이디와 비번이 맞은경우
            map.put("status","success");
            //로그인 성공시 세션에 저장
            session.setAttribute("loginok","yes");
            session.setAttribute("loginid",id);
        }else {
            //아이디와 비번이 틀린경우
            map.put("status","fail");
        }
        return map;
    }
}
