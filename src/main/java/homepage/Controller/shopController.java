package homepage.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class shopController {
    @GetMapping("/shoplist")
    public String foodlist(){
        return "search/foodlist";
    }
}
