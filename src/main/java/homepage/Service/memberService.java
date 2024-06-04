package homepage.Service;

import homepage.dto.MemberDto;
import homepage.dto.profileDto;
import homepage.dto.userInfoDto;
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
                .id(session.getAttribute("id").toString())
                .nickname(nickname)
                .photo(filename)
                .build();

        session.setAttribute("photo",filename);
        session.setAttribute("nickname",nickname);
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
            userInfoDto dto = mapperInter.selectUserInfobyIDandPw(id,pw);
            session.setAttribute("id",id);
            session.setAttribute("nickname",dto.getNickname());
            session.setAttribute("photo",dto.getPhoto());
        }else {
            //아이디와 비번이 틀린경우
            map.put("status","fail");
        }
        return map;
    }

    public void updateProfile( MultipartFile file,
                              String nickname,
                              HttpSession session){
        //파일이 비어있다면
        if (!file.isEmpty()){
            //사진이름 = session.getAttribues("photo")
            String photo = session.getAttribute("photo").toString();
            //먼저 있던 사진 삭제
            storageService.deleteFile("bustour","/profile/"+photo);
            //사진 추가
            insertProfile(nickname,session,file);
        }
        else {
            mapperInter.updateprofile(new profileDto().builder()
                    .id(session.getAttribute("id").toString())
                    .nickname(nickname)
                    .build());
            session.setAttribute("nickname",nickname);
        }
    }
    public void updatemember(MemberDto dto,HttpSession session)
    {
        dto.setId(session.getAttribute("id").toString());
        mapperInter.updatememder(dto);
    }

    public MemberDto searchUser(String id){
        return mapperInter.searchByidUser(id);
    }
}
