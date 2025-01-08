package com.turnip.turnipjava.model.dto;

import org.springframework.beans.BeanUtils;

import java.io.Serializable;

public class BaseDTO<T> implements Serializable {

    public T getEntity(Class<T> clazz) {
        try {
            T entity = clazz.getDeclaredConstructor().newInstance();
            BeanUtils.copyProperties(this, entity);
            return entity;
        } catch (Exception e) {
            throw new RuntimeException("Failed to convert DTO to Entity", e);
        }
    }
}