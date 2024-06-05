package api.Dto.bus;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class busRouteResponseDto {
    @ApiModelProperty(example = "종점")
    private String endnodenm;
    @ApiModelProperty(example = "막차 시간")
    private String endvehicletime;
    @ApiModelProperty(example = "노선 ID")
    private String routeid;
    @ApiModelProperty(example = "노선 번호")
    private String routeno;
    @ApiModelProperty(example = "버스 종류")
    private String routetp;
    @ApiModelProperty(example = "기점")
    private String startnodenm;
    @ApiModelProperty(example = "첫차 시간")
    private String startvehicletime;
}
