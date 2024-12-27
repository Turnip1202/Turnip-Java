package com.turnip.turnipjava.common;

import com.turnip.turnipjava.constant.consist.ResultState;
import com.turnip.turnipjava.constant.consist.RStateConstants;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;


@Data
public class R<T> implements Serializable {

    /**
     * 错误码
     *
     * @see ResultState#getCode()
     */
    private Integer code;

    /**
     * 返回数据
     */
    private T data;

    /**
     * 错误提示，用户可阅读
     *
     * @see ResultState#getMsg() ()
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
    private T errors;

    public static <T> R<T> error(R<T> result) {
        return error(result.getCode(), result.getMsg(), result.getErrors(), result.getPath());
    }

    public static <T> R<T> error(Integer code, String msg) {
        return error(code, msg, null, null);
    }

    public static <T> R<T> error(Integer code, String msg, T errors) {
        return error(code, msg, errors, null);
    }

    public static <T> R<T> error(Integer code, String msg, T errors, String path) {
        if (RStateConstants.SUCCESS.getCode().equals(code)) {
            throw new IllegalArgumentException("Code should not be success code");
        }
        R<T> r = new R<>();
        r.setCode(code);
        r.setMsg(msg);
        r.setErrors(errors);
        r.setPath(path);
        r.setSuccess(false);
        return r;
    }

    public static <T> R<T> error(ResultState rState) {
        return error(rState.getCode(), rState.getMsg(), null, null);
    }

    public static <T> R<T> error(ResultState rState, T errors) {
        return error(rState.getCode(), rState.getMsg(), errors, null);
    }

    public static <T> R<T> error(ResultState rState, T errors, String path) {
        return error(rState.getCode(), rState.getMsg(), errors, path);
    }

    /**
     * 成功返回，使用默认成功状态码
     */
    public static <T> R<T> success(T data) {
        return success(RStateConstants.SUCCESS, data, null);
    }

    /**
     * 成功返回，可以指定成功状态码
     */
    public static <T> R<T> success(ResultState rState, T data) {
        return success(rState, data, null);
    }

    /**
     * 成功返回，无数据
     */
    public static <T> R<T> success() {
        return success(RStateConstants.SUCCESS, null, null);
    }

    /**
     * 成功返回，仅状态码
     */
    public static <T> R<T> success(ResultState rState) {
        return success(rState, null, null);
    }

    /**
     * 成功返回，使用默认成功状态码，并包含路径
     */
    public static <T> R<T> success(T data, String path) {
        return success(RStateConstants.SUCCESS, data, path);
    }

    /**
     * 成功返回，可以指定成功状态码，并包含路径
     */
    public static <T> R<T> success(ResultState rState, T data, String path) {
        R<T> r = new R<>();
        r.setCode(rState.getCode());
        r.setData(data);
        r.setMsg(rState.getMsg());
        r.setPath(path);
        r.setSuccess(true);
        return r;
    }
}
