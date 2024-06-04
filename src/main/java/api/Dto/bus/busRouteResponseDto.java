package api.Dto.bus;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class busRouteResponseDto {
    private String endnodenm;
    private String endvehicletime;
    private String routeid;
    private String routeno;
    private String routetp;
    private String startnodenm;
    private String startvehicletime;
}
