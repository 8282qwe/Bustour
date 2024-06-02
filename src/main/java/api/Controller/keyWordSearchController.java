package api.Controller;

import api.Dto.keyWord.searchResultDto;
import api.Service.convertService;
import api.Service.keyWordSearchService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1")
@Api(tags = {"네이버 검색 API"})
@Slf4j
public class keyWordSearchController {
    final keyWordSearchService keyWordSearchService;
    final convertService convertService;

    @ApiOperation(value = "Naver open API를 활용하여 맛집 등을 검색", notes = "결과물은 5개씩 출력, 리뷰와 인기 많은 순으로 정렬하여 출력")
    @GetMapping("/search")
    public List<searchResultDto> search(@ApiParam(value = "정류장 X좌표",required = true) String x, @ApiParam(value = "정류장 Y좌표",required = true)String y, @ApiParam(value = "검색하고 싶은 유형(ex.맛집, 술집...)",required = true)String keyword) {
        return keyWordSearchService.searchKeyWord(convertService.converXY(x,y), keyword);
    }
}
