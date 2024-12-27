package com.turnip.turnipjava.config;

// 导入必要的Spring框架包
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 配置类，用于定义Spring的配置信息
@Configuration
public class ResourcesConfig implements WebMvcConfigurer {

    // 定义一个Bean，返回一个CorsFilter实例，用于处理跨域请求
    @Bean
    public CorsFilter corsConfig() {
        // 创建CORS配置对象
        CorsConfiguration corsConfiguration = new CorsConfiguration();

        // 允许所有头部信息
        corsConfiguration.addAllowedHeader("*");

        // 允许所有HTTP方法
        corsConfiguration.addAllowedMethod("*");

        // 允许发送Cookie
        corsConfiguration.setAllowCredentials(true);


        // 预检请求的有效期，单位为秒
        corsConfiguration.setMaxAge(3600L);

        // 允许暴露所有头部信息
        corsConfiguration.addExposedHeader("*");

        // 允许所有来源的请求
        corsConfiguration.addAllowedOriginPattern("*");

        // 创建基于URL的CORS配置源
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();

        // 注册CORS配置，"/**"表示对所有路径生效
        source.registerCorsConfiguration("/**", corsConfiguration);

        // 返回一个新的CorsFilter实例，用于过滤跨域请求
        return new CorsFilter(source);
    }
}
