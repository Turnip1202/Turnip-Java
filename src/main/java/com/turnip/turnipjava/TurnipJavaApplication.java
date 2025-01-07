package com.turnip.turnipjava;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
@MapperScan("com.turnip.turnipjava.mapper")
public class TurnipJavaApplication {

    public static void main(String[] args) {
        SpringApplication.run(TurnipJavaApplication.class, args);
    }

}
