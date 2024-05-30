package testController;

import lombok.RequiredArgsConstructor;
import minio.service.storageService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class viewtest {
    final storageService storageService;

    @PostMapping("/view")
    public String view(String bucketName, String objectName) {
        return storageService.getFile(bucketName, objectName).toString();
    }
}
