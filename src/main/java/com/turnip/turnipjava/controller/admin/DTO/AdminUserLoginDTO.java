package com.turnip.turnipjava.controller.admin.DTO;

import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.NonNull;

import java.io.Serial;
import java.io.Serializable;

@Data
public class AdminUserLoginDTO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;
    @NotNull(message= "用户名不能为空！")
    private String username;
    @NotNull(message= "密码不能为空！")
    private String password;
    @NotNull(message= "登录类型不能为空！")
    private String type;
    @NotNull(message= "验证码不能为空！")
    private String code;

}
