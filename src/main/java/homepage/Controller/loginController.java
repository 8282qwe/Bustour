package homepage.Controller;

import homepage.Service.memberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class loginController {
    final homepage.Service.memberService memberService;
    @GetMapping("/login")
    public String login(){
        return "member/login";
    }
    @GetMapping("/idsearch")
    public String idsearch(){
        return "member/idsearch";
    }
    @GetMapping("/pwsearch")
    public String pwsearch(){
        return "member/pwsearch";
    }
    @GetMapping("/memberinsert")
    public String memberinsert(){
        return "member/memberinsert";
    }
    @GetMapping("/member/login")
    @ResponseBody
    public Map<String,String> memberLogin(String id, String pw, HttpSession session){
        return memberService.memberLogin(id,pw,session);
    }
    @GetMapping("/busnosun")
    public String busnosun(){
        return "search/busnosun";
    }
}
