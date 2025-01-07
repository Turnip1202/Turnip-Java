package com.turnip.turnipjava.controller.admin.VO;


import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class AdminUserLoginVO {
    private Integer id;
    private String token;
}
