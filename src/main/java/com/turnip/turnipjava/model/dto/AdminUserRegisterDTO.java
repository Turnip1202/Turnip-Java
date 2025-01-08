package com.turnip.turnipjava.model.dto;



import com.turnip.turnipjava.model.entity.AdminUserEntity;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.groups.Default;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Builder
@EqualsAndHashCode(callSuper = false) // 添加: 指定不调用超类的equals和hashCode方法
public class AdminUserRegisterDTO extends BaseDTO<AdminUserEntity> implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    private Integer id;

    /**
     * 用户名
     */
    @NotNull(message = "用户名不能为null！")
    @NotEmpty(message = "用户名不能为空字符串！")
    private String username;

    /**
     * 真实姓名
     */
    private String realName;

    /**
     * 密码
     */
    @NotNull(message = "密码不能为null！",groups = Default.class)
    @NotEmpty(message = "密码不能为空字符串！",groups = Default.class)
    private String password;

    /**
     * 密码盐值
     */
    private String passwordSalt;

    /**
     * 手机号
     */
    @NotNull(message = "手机号不能为null！",groups = Default.class)
    @NotEmpty(message = "手机号不能为空字符串！",groups = Default.class)
    @Pattern(regexp = "^1[3-9]\\d{9}$",message = "手机号格式不正确！")
    private String phone;

    /**
     * 邮箱
     */
    @NotNull(message = "邮箱不能为null！",groups = Default.class)
    @NotEmpty(message = "邮箱不能为空字符串！",groups = Default.class)
    @Email(message = "邮箱格式不正确！")
    private String email;

    /**
     * 性别：0-未知，1-男，2-女
     */
    private Boolean gender;

    /**
     * 头像URL
     */
    @Pattern(regexp = "^(http|https)://.*",message = "头像URL格式不正确！")
    private String avatar;

    /**
     * 生日
     */
    private LocalDate birthday;

    /**
     * 简介
     */
    private String bio;

    /**
     * 状态：0-禁用，1-启用，2-锁定，3-已删除
     */
    private Boolean status;

    /**
     * 角色ID
     */
    private Integer roleId;

    /**
     * 部门ID
     */
    private Integer departmentId;

    /**
     * 注册IP
     */
    private String registerIp;

    /**
     * 登录失败次数
     */
    private Integer loginAttempts;

    /**
     * 乐观锁版本号
     */
    private Integer version;


}
