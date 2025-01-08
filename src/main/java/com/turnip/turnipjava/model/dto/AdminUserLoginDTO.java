package com.turnip.turnipjava.model.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

@Data
public class AdminUserLoginDTO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @NotNull(message= "用户名不能为null！")
    @NotEmpty(message = "用户名不能为空字符串！")
    private String username;

    @NotNull(message= "密码不能为null！")
    @NotEmpty(message = "密码不能为空字符串！")
    private String password;

    @NotNull(message= "登录类型不能为null！")
    @NotEmpty(message = "登录类型不能为空字符串！")
    private Integer type;

    @NotNull(message= "验证码不能为null！")
    @NotEmpty(message = "验证码不能为空字符串！")
    private String code;

}
