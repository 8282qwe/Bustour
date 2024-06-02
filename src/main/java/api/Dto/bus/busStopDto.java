package api.Dto.bus;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class busStopDto {
    private String gpslati;
    private String gpslong;
    private String nodeid;
    private String nodenm;
    private int nodeno;
    private int nodeord;
    private String routeid;
}
