package api.Dto.keyWord;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("favoriteResponseDto")
public class favoriteResponseDto {
    private String title;
    private String link;
    private String category;
    private String address;
    private String roadaddress;
}
