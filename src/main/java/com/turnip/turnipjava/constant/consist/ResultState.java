package com.turnip.turnipjava.constant.consist;

import lombok.Data;
import org.springframework.http.HttpStatus;

@Data
public class ResultState {
    /**
     * 错误码
     */
    private final Integer code;
    /**
     * 错误提示
     */
    private final String msg;

    public ResultState(Integer code, String message) {
        this.code = code;
        this.msg = message;
    }

    // 定义一些常见的错误状态常量
    public static final ResultState BAD_REQUEST = new ResultState(HttpStatus.BAD_REQUEST.value(), "参数校验错误");
}
