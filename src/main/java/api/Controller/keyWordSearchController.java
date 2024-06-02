package api.Controller;

import api.Dto.keyWord.searchResultDto;
import api.Service.keyWordSearchService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1")
public class keyWordSearchController {
    final keyWordSearchService keyWordSearchService;

    @GetMapping("/search")
    public List<searchResultDto> search(String spot, String keyword) {
        return keyWordSearchService.searchKeyWord(spot, keyword);
    }
}
