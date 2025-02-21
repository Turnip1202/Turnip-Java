package com.turnip.turnipjava;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.baomidou.mybatisplus.generator.fill.Column;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.type.JdbcType;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@SpringBootTest

public class FastAutoGeneratorTest {

    static class DatabaseConfig {
        public String url;
        public String username;
        public String password;
    }

    static class GeneratorConfig {
        public DatabaseConfig database;
        public String[] tables;
        public String author;
        public String outputDir;
        public String parent;
        public String entityPackage;
        public String mapperPackage;
        public String servicePackage;
        public String serviceImplPackage;
        public String xmlPackage;
        public String xmlPath;
        public String dtoPackage;
        public boolean enableLombok;
        public boolean enableTableFieldAnnotation;
        public boolean disableController;
        public boolean enableDto;
    }

    @Test
    void fastAutoGenerator() throws IOException {
        // 读取JSON配置文件
        ObjectMapper objectMapper = new ObjectMapper();
        GeneratorConfig config = objectMapper.readValue(Resources.getResourceAsFile("generator-config.json"), GeneratorConfig.class);

        FastAutoGenerator.create(config.database.url, config.database.username, config.database.password)
                .dataSourceConfig(builder -> {
                    builder.typeConvertHandler(((globalConfig, typeRegistry, metaInfo) -> {
                        if (JdbcType.TINYINT == metaInfo.getJdbcType()){
                            return DbColumnType.INTEGER;
                        }
                        return typeRegistry.getColumnType(metaInfo);
                    }));
                })
                .globalConfig(builder -> {
                    builder.author(config.author) // 设置作者
                            .outputDir(config.outputDir); // 输出目录
                })
                .packageConfig(builder -> {
                    builder.parent(config.parent) // 设置父包名
                            .entity(config.entityPackage) // 设置实体类包名
                            .mapper(config.mapperPackage) // 设置 Mapper 接口包名
                            .service(config.servicePackage) // 设置 Service 接口包名
                            .serviceImpl(config.serviceImplPackage) // 设置 Service 实现类包名
                            .xml(config.xmlPackage).pathInfo(Collections.singletonMap(OutputFile.xml, config.xmlPath)); // 设置 Mapper XML 文件包名
                })
                .strategyConfig(builder -> {
                    builder.addInclude(config.tables) // 设置需要生成的表名
                            .entityBuilder()
                            .enableFileOverride() // 覆盖已有文件
                            .formatFileName("%sEntity"); // 格式化文件名
                    // 根据配置文件控制Lombok的启用
                    if (config.enableLombok) {
                        builder.entityBuilder().enableLombok();
                    }

                    // 根据配置文件控制字段注解的启用
                    if (config.enableTableFieldAnnotation) {
                        builder.entityBuilder().enableTableFieldAnnotation();
                    }

                    // 根据配置文件控制Controller的生成
                    if (config.disableController) {
                        builder.controllerBuilder().disable(); // 禁用 Controller 生成
                    } else {
                        builder.controllerBuilder().enableRestStyle(); // 启用 REST 风格
                    }
                })
                .injectionConfig(builder -> {
                    if (config.enableDto) {
                        // 自定义 DTO 文件输出路径
                        //builder.customFile(Collections.singletonMap("DTO.java", "/templates/dto.java.ftl"));
                    }
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用 Freemarker 模板引擎
                .execute(); // 执行生成
    }
}