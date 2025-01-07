package com.turnip.turnipjava;


import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import org.junit.jupiter.api.Test;

import java.util.Collections;

public class FastAutoGeneratorTest {
    @Test
    void FastAutoGenerator() {
        // 使用 FastAutoGenerator 快速配置代码生成器
        FastAutoGenerator.create("jdbc:mysql://localhost:3308/turnip-vue?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true&zeroDateTimeBehavior=convertToNull",
                        "kang", "kang")
                .globalConfig(builder -> {
                    builder.author("Turnip") // 设置作者
                            .outputDir("src\\main\\java"); // 输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("com.turnip.turnipjava") // 设置父包名
//                            .controller("controller.admin.user") // 设置 Controller 包名
                            .entity("model.entity") // 设置实体类包名
                            .mapper("mapper") // 设置 Mapper 接口包名
                            .service("service.intf") // 设置 Service 接口包名
                            .serviceImpl("service.impl") // 设置 Service 实现类包名
                            .xml("mappers").pathInfo(Collections.singletonMap(OutputFile.xml, "src\\main\\resources\\mappers")).build(); // 设置 Mapper XML 文件包名
                })
                .strategyConfig(builder -> {
                    builder.addInclude("admin_user_login_history") // 设置需要生成的表名
                            .entityBuilder().formatFileName("%sEntity")
                            .enableLombok() // 启用 Lombok
                            .enableTableFieldAnnotation() // 启用字段注解
                            .controllerBuilder()
                            .enableRestStyle(); // 启用 REST 风格
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用 Freemarker 模板引擎
                .execute(); // 执行生成
    }
}
