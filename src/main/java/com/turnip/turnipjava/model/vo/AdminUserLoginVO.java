package com.turnip.turnipjava.model.vo;


import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class AdminUserLoginVO {
    private Integer id;
    private String tkToken;
}
