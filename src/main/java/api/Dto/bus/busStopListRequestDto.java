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
public class busStopListRequestDto {
    @ApiModelProperty(example = "원하는 도시의 날짜 코드")
    private int cityCode;
    @ApiModelProperty(example = "원하는 노선의 ID")
    private String routeId;
}
