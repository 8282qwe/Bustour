package testController;

import lombok.RequiredArgsConstructor;
import minio.service.storageService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

@RestController
@RequiredArgsConstructor
public class uploadtest {
    final storageService storageService;

    @PostMapping("/upload")
    public void upload(@RequestParam("image")MultipartFile file) throws IOException {
        InputStream inputStream =  new BufferedInputStream(file.getInputStream());
        storageService.uploadFile("bustour",file.getOriginalFilename(),inputStream,"image/png");
    }
}
