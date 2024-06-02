package api.Controller;

import api.Dto.bus.busStopDto;
import api.Dto.bus.busStopListRequestDto;
import api.Dto.bus.citysDto;
import api.Service.busService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1")
public class busController {
    final busService busService;

    @GetMapping("/getCityCode")
    public List<citysDto> getCityCode() {
        return busService.getCityCode();
    }

    @PostMapping("/getBusStopList")
    public List<busStopDto> getBusStopList(@RequestBody busStopListRequestDto request) {
        return busService.getBusStopList(request);
    }
}
