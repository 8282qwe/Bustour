package homepage.Controller;

import homepage.Service.memberService;
import homepage.dto.MemberDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1")
public class memberSearchController {
    final memberService service;
    @GetMapping("/searchuser")
    public MemberDto searchUser(String id){
        return service.searchUser(id);
    }
}
