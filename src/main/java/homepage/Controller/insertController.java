package homepage.Controller;

import homepage.Service.memberService;
import homepage.dto.MemberDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class insertController {
    final memberService memberService;
    @PostMapping("/memberinsert")
    public String memberinsert(@ModelAttribute MemberDto dto, HttpSession session){
        memberService.insertMember(dto,session);
        return "member/profileinsert";
    }
    @GetMapping("/idcheck")
    @ResponseBody
    public Map<String,Boolean> memberidcheck(String searchid){
        return memberService.getIdCheckCount(searchid);
    }
    @GetMapping("/nickcheck")
    @ResponseBody
    public Map<String,Boolean> nickcheck(String searchnick){
        return memberService.getNickCheckCount(searchnick);
    }
}
