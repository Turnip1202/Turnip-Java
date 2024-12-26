package com.turnip.turnipjava.common;

import com.turnip.turnipjava.constant.consist.StateCode;
import com.turnip.turnipjava.constant.consist.StateConstants;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Map;

@Data
public class R<T, E> implements Serializable {
    /**
     * 状态码
     * @see StateCode#getCode()
     */
    private Integer code;
    /**
     * 返回数据
     */
    private T data;
    /**
     * 错误提示，用户可阅读
     *
     * @see StateCode#getMsg() ()
     */
    private String msg;
    /**
     * 请求路径
     */
    private String path;
    /**
     * 成功标志
     */
    private Boolean success;
    /**
     * 时间戳
     */
    private LocalDateTime timestamp = LocalDateTime.now();
    /**
     * 错误详细信息
     */
    private E errors;

    /**
     * 错误
     * @param result
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> error(R<T, E> result) {
        return error(result.getCode(), result.getMsg(), result.getErrors(), result.getPath());
    }

    public static <T, E> R<T, E> error(Integer code, String msg) {
        return error(code, msg, null, null);
    }

    public static <T, E> R<T, E> error(Integer code, String msg, E errors) {
        return error(code, msg, errors, null);
    }

    public static <T, E> R<T, E> error(Integer code, String msg, E errors, String path) {
        if (StateConstants.SUCCESS.getCode().equals(code)) {
            throw new IllegalArgumentException("Code should not be success code");
        }
        R<T, E> r = new R<>();
        r.setCode(code);
        r.setMsg(msg);
        r.setErrors(errors);
        r.setPath(path);
        r.setSuccess(false);
        return r;
    }

    public static <T, E> R<T, E> error(StateCode stateCode) {
        return error(stateCode.getCode(), stateCode.getMsg(), null, null);
    }

    public static <T, E> R<T, E> error(StateCode stateCode, E errors) {
        return error(stateCode.getCode(), stateCode.getMsg(), errors, null);
    }

    public static <T, E> R<T, E> error(StateCode stateCode, E errors, String path) {
        return error(stateCode.getCode(), stateCode.getMsg(), errors, path);
    }

    public static <T, E> R<T, E> success(T data) {
        return success(StateConstants.SUCCESS, data, null);
    }

    public static <T, E> R<T, E> success(StateCode stateCode, T data) {
        return success(stateCode, data, null);
    }

    public static <T, E> R<T, E> success() {
        return success(StateConstants.SUCCESS, null, null);
    }

    public static <T, E> R<T, E> success(StateCode stateCode) {
        return success(stateCode, null, null);
    }

    public static <T, E> R<T, E> success(T data, String path) {
        return success(StateConstants.SUCCESS, data, path);
    }

    public static <T, E> R<T, E> success(StateCode stateCode, T data, String path) {
        R<T, E> r = new R<>();
        r.setCode(stateCode.getCode());
        r.setData(data);
        r.setMsg(stateCode.getMsg());
        r.setPath(path);
        r.setSuccess(true);
        return r;
    }
}
