package api.Controller;

import api.Dto.keyWord.favoriteRequestDto;
import api.Service.favoriteService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1")
@Api(tags = {"즐겨찾기 API"})
@Slf4j
public class favoriteController {
    final favoriteService service;

    @PostMapping("/insertfavorite")
    ResponseEntity<Object> insertFavorite(@RequestBody favoriteRequestDto dto) {
        service.insertStar(dto);
        return ResponseEntity.ok().build();
    }
}
