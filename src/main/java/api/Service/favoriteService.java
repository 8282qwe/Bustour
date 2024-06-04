package api.Service;

import api.Dto.keyWord.favoriteRequestDto;
import api.Dto.keyWord.favoriteResponseDto;
import api.mapper.favoriteMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@RequiredArgsConstructor
public class favoriteService {
    final favoriteMapper mapper;

    public void insertStar(favoriteRequestDto dto, HttpSession session) {
        dto.setId(session.getAttribute("id").toString());
        mapper.insertStar(dto);
    }

    public void deleteStar(favoriteRequestDto dto, HttpSession session) {
        dto.setId(session.getAttribute("id").toString());
        mapper.deleteStar(dto);
    }

    public List<favoriteResponseDto> selectStars(HttpSession session) {
        return mapper.getStar(session.getAttribute("id").toString());
    }
}
