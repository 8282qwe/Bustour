package homepage.Controller;

import homepage.Service.memberService;
import homepage.dto.MemberDto;
import homepage.dto.profileDto;
import homepage.mapper.MemberMapperInter;
import lombok.RequiredArgsConstructor;
import minio.service.storageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class updateController {
    final homepage.Service.memberService memberService;
    @GetMapping("/profileupdate")
    public String profileupdate(){
        return "member/profileupdate";
    }
    @PostMapping("/profilesave")
    public String insertProfile(@RequestParam("nickname") String nickname,
                                @RequestParam("profile") MultipartFile file,
                                HttpSession session){
        memberService.updateProfile(file,nickname,session);
        return "layout/main";
    }
    @GetMapping("/memberupdate")
    public String memberupdate(){
        return "member/memberupdate";
    }
    @PostMapping("/membersave")
    public String update(@ModelAttribute MemberDto dto,HttpSession session) {
        memberService.updatemember(dto,session);
        //수정후 디테일 페이지로 이동
        return "redirect:/";
    }
}

