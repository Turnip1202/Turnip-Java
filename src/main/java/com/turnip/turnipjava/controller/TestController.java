package com.turnip.turnipjava.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
