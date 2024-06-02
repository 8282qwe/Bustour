package api.Dto.bus;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class citysDto {
    @ApiModelProperty(example = "도시 코드")
    private int citycode;
    @ApiModelProperty(example = "도시의 이름")
    private String cityname;
}
