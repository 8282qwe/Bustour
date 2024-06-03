package api.Controller;

import api.mapper.userMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1")
public class userSearchController {
    final userMapper mapper;

    @GetMapping("/searchID")
    public Map<String,String> getID(String name) {
        Map<String,String> map = new HashMap<>();
        map.put("id",mapper.searchByName(name));
        return map;
    }

    @GetMapping("/searchPW")
    public Map<String,String> getPW(String id) {
        Map<String,String> map = new HashMap<>();
        map.put("pw",mapper.searchByID(id));
        return map;
    }
}
