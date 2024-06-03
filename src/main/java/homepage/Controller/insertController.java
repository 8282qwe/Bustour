package homepage.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class insertController {
    @PostMapping("/profileinsert")
    public String profileinsert(){
        return "member/profileinsert";
    }
}
