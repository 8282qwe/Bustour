package api.Controller;

import api.Dto.bus.busStopDto;
import api.Dto.bus.busStopListRequestDto;
import api.Dto.bus.citysDto;
import api.Service.busService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1")
@Api(tags = {"버스 노선 조회 API"})
@Slf4j
public class busController {
    final busService busService;

    @ApiOperation(value = "버스 도시 코드 조회", notes = "버스 노선조회를 위한 도시 코드 조회")
    @GetMapping("/getCityCode")
    public List<citysDto> getCityCode() {
        return busService.getCityCode();
    }

    @ApiOperation(value = "버스 노선별 정류소 조회", notes = "버스 노선별 정류소 조회")
    @PostMapping("/getBusStopList")
    public List<busStopDto> getBusStopList(@RequestBody busStopListRequestDto request) {
        return busService.getBusStopList(request);
    }
}
