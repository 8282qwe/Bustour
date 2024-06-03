package com.midichi.bustour;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@MapperScan("api.mapper")
public class mainController {
    @GetMapping("/")
    public String home() {
        return "layout/main";
    }
}
