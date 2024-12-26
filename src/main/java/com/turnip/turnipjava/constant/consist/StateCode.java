package com.turnip.turnipjava.constant.consist;

import lombok.Data;

@Data
public class StateCode {
    /**
     * 错误码
     */
    private final Integer code;
    /**
     * 错误提示
     */
    private final String msg;

    public StateCode(Integer code, String message) {
        this.code = code;
        this.msg = message;
    }

}
