package api.Dto.keyWord;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class searchResultDto {
    private String title;
    private String link;
    private String category;
    private String address;
    private String roadAddress;
    private String mapx;
    private String mapy;
}
