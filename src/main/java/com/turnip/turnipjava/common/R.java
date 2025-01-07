package com.turnip.turnipjava.common;

import com.turnip.turnipjava.constant.consist.ResultState;
import com.turnip.turnipjava.constant.consist.RStateConstants;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class R<T, E> implements Serializable {
    /**
     * 状态码
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
    private E errors;

    public static <T,E> R<T,E> error(){
        return error(RStateConstants.FAIL,null, null);
    }


    /**
     * 通过R类型返回错误信息和详细的错误数据
     * @param result
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> error(R<T, E> result) {
        return error(result.getCode(), result.getMsg(), result.getErrors(), result.getPath());
    }

    /**
     * 返回错误信息
     * @param code
     * @param msg
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> error(Integer code, String msg) {
        return error(code, msg, null, null);
    }

    /**
     * 直接返回错误信息和详细的错误数据
     * @param code
     * @param msg
     * @param errors
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> error(Integer code, String msg, E errors) {
        return error(code, msg, errors, null);
    }

    /**
     * 返回错误信息、详细的错误数据和请求路径
     * @param code
     * @param msg
     * @param errors
     * @param path
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> error(Integer code, String msg, E errors, String path) {
        if (RStateConstants.SUCCESS.getCode().equals(code)) {
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

    /**
     * 只返回错误状态码和错误提示
     * @param RState
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> error(ResultState RState) {
        return error(RState.getCode(), RState.getMsg(), null, null);
    }

    /**
     * 通过状态码和错误提示返回错误信息
     * @param RState
     * @param errors
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> error(ResultState RState, E errors) {
        return error(RState.getCode(), RState.getMsg(), errors, null);
    }

    /**
     * 通过状态码、错误提示和请求路径返回错误信息
     * @param RState
     * @param errors
     * @param path
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> error(ResultState RState, E errors, String path) {
        return error(RState.getCode(), RState.getMsg(), errors, path);
    }

    /**
     * 返回成功数据
     * @param data
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> success(T data) {
        return success(RStateConstants.SUCCESS, data, null);
    }

    /**
     * 通过状态码和数据返回成功信息
     * @param RState
     * @param data
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> success(ResultState RState, T data) {
        return success(RState, data, null);
    }

    /**
     * 返回成功状态
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> success() {
        return success(RStateConstants.SUCCESS, null, null);
    }

    /**
     * 返回成功状态码和数据
     * @param RState
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> success(ResultState RState) {
        return success(RState, null, null);
    }

    /**
     * 返回成功的数据和请求路径
     * @param data
     * @param path
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> success(T data, String path) {
        return success(RStateConstants.SUCCESS, data, path);
    }

    /**
     * 返回成功的状态码、数据、请求路径
     * @param RState
     * @param data
     * @param path
     * @return
     * @param <T>
     * @param <E>
     */
    public static <T, E> R<T, E> success(ResultState RState, T data, String path) {
        R<T, E> r = new R<>();
        r.setCode(RState.getCode());
        r.setData(data);
        r.setMsg(RState.getMsg());
        r.setPath(path);
        r.setSuccess(true);
        return r;
    }

}