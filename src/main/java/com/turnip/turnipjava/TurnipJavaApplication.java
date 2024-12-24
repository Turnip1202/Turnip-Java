package com.turnip.turnipjava;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@OpenAPIDefinition(info = @Info(title = "turnip-java", version = "1.0", description = "turnip-java"))
public class TurnipJavaApplication {

    public static void main(String[] args) {
        SpringApplication.run(TurnipJavaApplication.class, args);
    }

}
