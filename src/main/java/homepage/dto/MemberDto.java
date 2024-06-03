package homepage.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@Alias("MemberDto")
@Builder
@AllArgsConstructor
public class MemberDto {
    private String id;
    private String pw;
    private String name;
    private String ph;
    private String address;
}
