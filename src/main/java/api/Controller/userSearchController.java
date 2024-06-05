package api.Controller;

import api.mapper.userMapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1")
@Api(tags = {"유저 ID,PW 검색 API"})
public class userSearchController {
    final userMapper mapper;

    @ApiOperation(value = "유저의 이름(name) 기반 검색", notes = "유저의 이름(name)을 기반으로 ID를 검색")
    @GetMapping("/searchID")
    public Map<String,String> getID(@ApiParam(name = "유저의 name")String name) {
        Map<String,String> map = new HashMap<>();
        map.put("id",mapper.searchByName(name));
        return map;
    }

    @ApiOperation(value = "유저의 아이디(ID) 기반 검색", notes = "유저의 아이디(ID)를 기반으로 PW를 검색")
    @GetMapping("/searchPW")
    public Map<String,String> getPW(@ApiParam(name = "유저의 ID")String id) {
        Map<String,String> map = new HashMap<>();
        map.put("pw",mapper.searchByID(id));
        return map;
    }
}
