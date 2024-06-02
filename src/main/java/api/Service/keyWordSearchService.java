package api.Service;

import api.Dto.keyWord.searchResultDto;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class keyWordSearchService {

    @Value("${NAVER_KEY}")
    private String api_key;

    @Value("${NAVER_SECRET}")
    private String api_secret;

    public List<searchResultDto> searchKeyWord(String spot, String keyword) {
        String text = null;
        text = URLEncoder.encode(spot+" 근처 "+keyword, StandardCharsets.UTF_8);
        String apiURL = "https://openapi.naver.com/v1/search/local.json?display=10&start=1&sort=comment&query=" + text;

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", api_key);
        requestHeaders.put("X-Naver-Client-Secret", api_secret);
        String responseBody = get(apiURL, requestHeaders);

        JSONParser jsonParser = new JSONParser();
        try {
            JSONObject jsonObject = (JSONObject) jsonParser.parse(responseBody);
            JSONArray jsonItems = (JSONArray) jsonObject.get("items");
            List<searchResultDto> result = new ArrayList<>();

            for (Object o : jsonItems) {
                JSONObject item = (JSONObject) o;
                result.add(searchResultDto.builder()
                        .title(item.get("title").toString())
                        .link(item.get("link").toString())
                        .category(item.get("category").toString())
                        .address(item.get("address").toString())
                        .roadAddress(item.get("roadAddress").toString())
                        .mapx(item.get("mapx").toString())
                        .mapy(item.get("mapy").toString())
                        .build());

            }
            return result;
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 오류 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
        }
    }
}
