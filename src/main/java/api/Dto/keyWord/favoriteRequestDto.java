package api.Dto.keyWord;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("favoriteRequestDto")
public class favoriteRequestDto {
    @ApiModelProperty(example = "유저의 ID")
    private String id;
    @ApiModelProperty(example = "가게 이름")
    private String title;
    @ApiModelProperty(example = "가게 링크")
    private String link;
    @ApiModelProperty(example = "가게 카테고리")
    private String category;
    @ApiModelProperty(example = "가게 주소")
    private String address;
    @ApiModelProperty(example = "가게 도로명 주소")
    private String roadaddress;
}
