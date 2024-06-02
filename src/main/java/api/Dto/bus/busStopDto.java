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
public class busStopDto {
    @ApiModelProperty(example = "정류소의 x좌표")
    private String gpslati;
    @ApiModelProperty(example = "정류소의 y좌표")
    private String gpslong;
    @ApiModelProperty(example = "정류소의 ID")
    private String nodeid;
    @ApiModelProperty(example = "")
    private String nodenm;
    @ApiModelProperty(example = "정류소 번호")
    private int nodeno;
    @ApiModelProperty(example = "정류소의 순서")
    private int nodeord;
    @ApiModelProperty(example = "노선의 ID")
    private String routeid;
}
