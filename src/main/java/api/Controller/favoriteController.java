package api.Controller;

import api.Dto.keyWord.favoriteRequestDto;
import api.Dto.keyWord.favoriteResponseDto;
import api.Service.favoriteService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1")
@Api(tags = {"즐겨찾기 API"})
@Slf4j
public class favoriteController {
    final favoriteService service;

    @PostMapping("/insertfavorite")
    ResponseEntity<Object> insertFavorite(@RequestBody favoriteRequestDto dto, HttpSession session) {
        service.insertStar(dto,session);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/deletefavorite")
    ResponseEntity<Object> deleteFavorite(@RequestBody favoriteRequestDto dto, HttpSession session) {
        service.deleteStar(dto,session);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/favorite")
    List<favoriteResponseDto> favorite(HttpSession session) {
        return service.selectStars(session);
    }
}
