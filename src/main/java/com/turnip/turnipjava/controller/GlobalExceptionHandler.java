package com.turnip.turnipjava.controller;

import com.turnip.turnipjava.common.R;
import com.turnip.turnipjava.constant.consist.ResultState;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.ConstraintViolationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Map;
import java.util.stream.Collectors;

@RestControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /**
     * 处理 @RequestBody 参数校验异常
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public R<Object, Map<String, String>> handleMethodArgumentNotValidException(MethodArgumentNotValidException ex) {
        Map<String, String> errors = extractErrors(ex.getBindingResult());
        logger.error("MethodArgumentNotValidException: {}", errors);
        return R.error(ResultState.BAD_REQUEST, errors);
    }

    /**
     * 处理表单绑定参数校验异常
     */
    @ExceptionHandler(BindException.class)
    public R<Object, Map<String, String>> handleBindException(BindException ex) {
        Map<String, String> errors = extractErrors(ex.getBindingResult());
        logger.error("BindException: {}", errors);
        return R.error(ResultState.BAD_REQUEST, errors);
    }

    /**
     * 处理普通参数校验异常
     */
    @ExceptionHandler(ConstraintViolationException.class)
    public R<Object, Map<String, String>> handleConstraintViolationException(ConstraintViolationException ex) {
        Map<String, String> errors = ex.getConstraintViolations().stream()
                .collect(Collectors.toMap(
                        violation -> violation.getPropertyPath().toString(),
                        ConstraintViolation::getMessage,
                        (existing, replacement) -> existing
                ));
        logger.error("ConstraintViolationException: {}", errors);
        return R.error(ResultState.BAD_REQUEST, errors);
    }

    /**
     * 提取 BindingResult 中的错误信息
     */
    private Map<String, String> extractErrors(BindingResult bindingResult) {
        return bindingResult.getFieldErrors().stream()
                .filter(error -> error.getDefaultMessage() != null) // 过滤掉 null 值
                .collect(Collectors.toMap(
                        FieldError::getField,
                        FieldError::getDefaultMessage,
                        (existing, replacement) -> existing
                ));
    }
}
