package homepage.Service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class pwcrypto {
    final  BCryptPasswordEncoder passwordEncoder;
    protected String normalToCrypto(String normal){
        return passwordEncoder.encode(normal);
    }

    protected boolean matchPw(String InsertPW, String StoredPW) {
        return passwordEncoder.matches(InsertPW,StoredPW);
    }
}
