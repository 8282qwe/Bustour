package api.Controller;

import api.Dto.keyWord.favoriteRequestDto;
import api.Dto.keyWord.favoriteResponseDto;
import api.Service.favoriteService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1")
@Api(tags = {"즐겨찾기 API"})
@Slf4j
public class favoriteController {
    final favoriteService service;

    @ApiOperation(value = "즐겨찾기 추가", notes = "즐겨찾기 버튼 틀릭 시 즐겨찾기에 추가됨")
    @PostMapping("/insertfavorite")
    ResponseEntity<Object> insertFavorite(@ApiParam(name = "즐겨찾기 추가를 위한 RequestDto")@RequestBody favoriteRequestDto dto, @ApiIgnore HttpSession session) {
        service.insertStar(dto,session);
        return ResponseEntity.ok().build();
    }

    @ApiOperation(value = "즐겨찾기 삭제", notes = "이미 추가된 즐겨찾기 버튼 틀릭 시 즐겨찾기에 삭제됨")
    @PostMapping("/deletefavorite")
    ResponseEntity<Object> deleteFavorite(@ApiParam(name = "즐겨찾기 삭제를 위한 RequestDto")@RequestBody favoriteRequestDto dto, @ApiIgnore HttpSession session) {
        service.deleteStar(dto,session);
        return ResponseEntity.ok().build();
    }

    @ApiOperation(value = "즐겨찾기 조회", notes = "사용자의 즐겨찾기 항목을 출력")
    @GetMapping("/favorite")
    List<favoriteResponseDto> favorite(@ApiIgnore HttpSession session) {
        return service.selectStars(session);
    }
}
