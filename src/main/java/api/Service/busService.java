package api.Service;

import api.Dto.bus.busRouteResponseDto;
import api.Dto.bus.busStopDto;
import api.Dto.bus.busStopListRequestDto;
import api.Dto.bus.citysDto;
import api.mapper.cityCodeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class busService {
    final cityCodeMapper mapper;

    @Value("${bus-api-key}")
    private String api_key;

    public List<citysDto> getCityCode() {
        return mapper.selectCitysCodeAll();
    }

    public List<busStopDto> getBusStopList(busStopListRequestDto dto) {
        StringBuilder sb = new StringBuilder("http://apis.data.go.kr/1613000/BusRouteInfoInqireService/getRouteAcctoThrghSttnList");
        sb.append("?serviceKey=").append(api_key);
        sb.append("&_type=json&numOfRows=100");
        sb.append("&routeId=").append(dto.getRouteId());
        sb.append("&cityCode=").append(dto.getCityCode());

        RestTemplate restTemplate = new RestTemplate();
        String jsonString = restTemplate.getForObject(sb.toString(), String.class);
        JSONParser jsonParser = new JSONParser();
        try {
            JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
            JSONObject jsonResponse = (JSONObject) jsonObject.get("response");
            JSONObject jsonbody = (JSONObject) jsonResponse.get("body");
            JSONObject jsonItems = (JSONObject) jsonbody.get("items");
            JSONArray jsonItemList = (JSONArray) jsonItems.get("item");
            List<busStopDto> result = new ArrayList<>();

            for (Object o : jsonItemList) {
                JSONObject item = (JSONObject) o;
                result.add(busStopDto.builder()
                        .gpslati(String.valueOf(item.get("gpslati")))
                        .gpslong(String.valueOf(item.get("gpslong")))
                        .nodeid(String.valueOf(item.get("nodeid")))
                        .nodenm(String.valueOf(item.get("nodenm")))
                        .nodeno(Integer.parseInt(String.valueOf(item.get("nodeno") != null ? item.get("nodeno") : 0)))
                        .routeid(String.valueOf(item.get("routeid")))
                        .nodeord(Integer.parseInt(String.valueOf(item.get("nodeord"))))
                        .build());
            }
            return result;
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    //창인이 몫(postman의 노선정보 항목 조회 참고. 버스 노선별 첫차, 막차 시간, 출발지, 종점지 등을 조회)
    public List<busRouteResponseDto> getBusLineInfo(String citycode, String routeno){
        StringBuilder sb = new StringBuilder("http://apis.data.go.kr/1613000/BusRouteInfoInqireService/getRouteNoList");
        sb.append("?serviceKey=").append(api_key);
        sb.append("&_type=json&numOfRows=100");
        sb.append("&cityCode=").append(citycode);
        sb.append("&routeNo=").append(routeno);

        RestTemplate restTemplate = new RestTemplate();
        String jsonString = restTemplate.getForObject(sb.toString(), String.class);
        JSONParser jsonParser = new JSONParser();

        try {
            JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
            JSONObject jsonResponse = (JSONObject) jsonObject.get("response");
            JSONObject jsonbody = (JSONObject) jsonResponse.get("body");
            if ((JSONObject)jsonbody.get("items") == null) return new ArrayList<busRouteResponseDto>();
            JSONObject jsonItems = (JSONObject) jsonbody.get("items");
            JSONArray jsonItemList = (JSONArray) jsonItems.get("item");
            List<busRouteResponseDto> result = new ArrayList<>();

            for (Object o : jsonItemList) {
                JSONObject item = (JSONObject) o;
                result.add(busRouteResponseDto.builder()
                                .endnodenm(item.get("endnodenm").toString())
                                .endvehicletime(item.get("endvehicletime").toString())
                                .routeid(item.get("routeid").toString())
                                .routeno(item.get("routeno").toString())
                                .routetp(item.get("routetp").toString())
                                .startnodenm(item.get("startnodenm").toString())
                                .startvehicletime(item.get("startvehicletime").toString())
                        .build());
            }
            return result;
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
}
