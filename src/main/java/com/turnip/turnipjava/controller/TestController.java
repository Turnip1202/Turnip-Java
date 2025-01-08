package com.turnip.turnipjava.controller;


import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Tag(name = "测试接口",description = "测试接口")
@RestController
@RequestMapping("/test")
public class TestController {


    /**
     * 测试接口
     * @param  test 测试参数
     * @return 测试返回值
     */
    @GetMapping("/")
    public Object test(String test){
        return "test";
    }
}
