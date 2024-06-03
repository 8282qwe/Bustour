package homepage.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@NoArgsConstructor
@Alias("profileDto")
@Builder
@AllArgsConstructor
public class profileDto {
    private String id;
    private String nickname;
    private String photo;
}
