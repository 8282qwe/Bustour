package api.Service;

import api.Dto.keyWord.favoriteRequestDto;
import api.mapper.favoriteMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class favoriteService {
    final favoriteMapper mapper;

    public void insertStar(favoriteRequestDto dto) {
        mapper.insertStar(dto);
    }
}
