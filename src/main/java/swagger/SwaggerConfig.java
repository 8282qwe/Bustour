package swagger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2//스프링 실행시 설정파일 읽어드리기 위한 어노테이션
public class SwaggerConfig {

    @Bean
    public Docket api() {
        return new Docket(DocumentationType.OAS_30)
                .useDefaultResponseMessages(false)
                .select()
                .apis(RequestHandlerSelectors.basePackage("api.Controller"))
                .paths(PathSelectors.any())
                .build().apiInfo(apiInfo());
    }
    public ApiInfo apiInfo(){
        return new ApiInfoBuilder()
                .title("창인이와 함께 떠나는 버스 여행 REST API")
                .version("0.1")
                .description("각종 버스 노선 정보, 네이버 검색 기능 API 입니다.")
                .build();
    }
}

