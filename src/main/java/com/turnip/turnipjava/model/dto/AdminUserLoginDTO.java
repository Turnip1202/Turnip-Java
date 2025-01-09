package com.turnip.turnipjava.model.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

import java.io.Serial;
import java.io.Serializable;

@Data
public class AdminUserLoginDTO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @NotNull(message= "用户名不能为null！")
    @NotBlank(message = "用户名不能为空字符串！")
    private String username;

    @NotNull(message= "密码不能为null！")
    @NotBlank(message = "密码不能为空字符串！")
    private String password;

    @NotNull(message= "登录类型不能为空字符！")//空白字符串会被转换为null
    @Range(min = 1, max = 2, message = "登录类型错误！")
    private Integer type;

    @NotNull(message= "验证码不能为null！")
    @NotBlank(message = "验证码不能为空字符串！")
    private String code;

}
