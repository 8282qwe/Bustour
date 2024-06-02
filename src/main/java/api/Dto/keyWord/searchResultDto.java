package api.Dto.keyWord;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class searchResultDto {
    @ApiModelProperty(example = "가게 이름")
    private String title;
    @ApiModelProperty(example = "가게 홈페이지 링크")
    private String link;
    @ApiModelProperty(example = "가게 카테고리")
    private String category;
    @ApiModelProperty(example = "가게 주소")
    private String address;
    @ApiModelProperty(example = "가게의 도로명 주소")
    private String roadAddress;
    @ApiModelProperty(example = "네이버 맵 사용할 때 사용하는 x좌표")
    private String mapx;
    @ApiModelProperty(example = "네이버 맵 사용할 때 사용하는 y좌표")
    private String mapy;
}
