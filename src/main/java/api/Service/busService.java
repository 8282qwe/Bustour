package api.Service;

import api.Dto.busStopDto;
import api.Dto.busStopListRequestDto;
import api.Dto.citysDto;
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
public class busService {

    @Value("${BUS_KEY}")
    private String api_key;

    public List<citysDto> getCityCode() {
        StringBuilder sb = new StringBuilder("http://apis.data.go.kr/1613000/BusRouteInfoInqireService/getCtyCodeList");
        sb.append("?serviceKey=").append(api_key);
        sb.append("&_type=json");

        RestTemplate restTemplate = new RestTemplate();
        String jsonString = restTemplate.getForObject(sb.toString(), String.class);
        JSONParser jsonParser = new JSONParser();
        try {
            JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
            JSONObject jsonResponse = (JSONObject) jsonObject.get("response");
            JSONObject jsonbody = (JSONObject) jsonResponse.get("body");
            JSONObject jsonItems = (JSONObject) jsonbody.get("items");
            JSONArray jsonItemList = (JSONArray) jsonItems.get("item");
            List<citysDto> result = new ArrayList<>();

            for (Object o : jsonItemList) {
                JSONObject item = (JSONObject) o;
                result.add(citysDto.builder()
                        .citycode(Integer.parseInt(String.valueOf(item.get("citycode"))))
                        .cityname(String.valueOf(item.get("cityname")))
                        .build());
            }
            return result;
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public List<busStopDto> getBusStopList(busStopListRequestDto dto) {
        StringBuilder sb = new StringBuilder("http://apis.data.go.kr/1613000/BusRouteInfoInqireService/getRouteAcctoThrghSttnList");
        sb.append("?serviceKey=").append(api_key);
        sb.append("&_type=json&numOfRows=100");
        sb.append("&routeId=").append(dto.getRouteId());
        sb.append("&cityCode=").append(dto.getCityCode());

        System.out.println(sb);
        RestTemplate restTemplate = new RestTemplate();
        String jsonString = restTemplate.getForObject(sb.toString(), String.class);
        System.out.println(jsonString);
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
                System.out.println(item.toString());
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
}