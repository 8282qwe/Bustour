package homepage.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class loginController {
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
}
