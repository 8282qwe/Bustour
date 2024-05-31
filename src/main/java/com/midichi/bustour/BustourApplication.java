package com.midichi.bustour;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"tiles.config","com.*","minio.*","testController","api.*"})
public class BustourApplication {

    public static void main(String[] args) {
        SpringApplication.run(BustourApplication.class, args);
    }

}
