package api.Service;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;

@Service
@Slf4j
public class convertService {

    @Value("${zio-api}")
    protected String api_key;

    public String converXY(String x, String y){
        String searchType = "PARCEL";
        String searchPoint = x+","+y;
        String epsg = "epsg:4326";

        StringBuilder sb = new StringBuilder("https://api.vworld.kr/req/address");
        sb.append("?service=address");
        sb.append("&request=getaddress");
        sb.append("&format=json");
        sb.append("&crs=" + epsg);
        sb.append("&key=" + api_key);
        sb.append("&type=" + searchType);
        sb.append("&point=" + searchPoint);

        try {
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject) jsonParser.parse(new BufferedReader(new InputStreamReader(new URL(sb.toString()).openStream(), StandardCharsets.UTF_8)));
            JSONObject jsonResponse = (JSONObject) jsonObject.get("response");
            System.out.println(jsonResponse.toString());
            JSONArray jsonresult = (JSONArray) jsonResponse.get("result");
            JSONObject jsonStructures = (JSONObject) jsonresult.get(0);
            JSONObject jsonStructure = (JSONObject) jsonStructures.get("structure");
            return jsonStructure.get("level2").toString()+" "+jsonStructure.get("level4L");
        } catch (ParseException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
