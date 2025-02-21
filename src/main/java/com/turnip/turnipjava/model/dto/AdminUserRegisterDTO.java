package com.turnip.turnipjava.model.dto;



import com.turnip.turnipjava.model.entity.AdminUserEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.*;
import jakarta.validation.groups.Default;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Builder
@Accessors(chain = true)
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
    @NotBlank(message = "用户名不能为空字符串！")
    @Schema(description = "用户名",requiredMode = Schema.RequiredMode.REQUIRED)
    private String username;

    /**
     * 真实姓名
     */
    @Schema(description = "真实姓名",requiredMode = Schema.RequiredMode.AUTO)
    private String realName;

    /**
     * 密码
     */
    @NotNull(message = "密码不能为null！",groups = Default.class)
    @NotBlank(message = "密码不能为空字符串！",groups = Default.class)
    @Schema(description = "密码",requiredMode = Schema.RequiredMode.REQUIRED)
    private String password;

    /**
     * 密码盐值
     */
    @Schema(description = "密码盐值",requiredMode = Schema.RequiredMode.AUTO)
    private String passwordSalt;

    /**
     * 手机号
     */
    @NotNull(message = "手机号不能为null！",groups = Default.class)
    @NotBlank(message = "手机号不能为空字符串！",groups = Default.class)
    @Pattern(regexp = "^1[3-9]\\d{9}$",message = "手机号格式不正确！")
    @Schema(description = "手机号",requiredMode = Schema.RequiredMode.REQUIRED)
    private String phone;

    /**
     * 邮箱
     */
    @NotNull(message = "邮箱不能为null！",groups = Default.class)
    @NotBlank(message = "邮箱不能为空字符串！",groups = Default.class)
    @Email(message = "邮箱格式不正确！")
    @Schema(description = "邮箱",requiredMode = Schema.RequiredMode.REQUIRED)
    private String email;

    /**
     * 性别：0-未知，1-男，2-女
     */
    @Schema(description = "性别：0-未知，1-男，2-女",requiredMode = Schema.RequiredMode.AUTO)
    private Integer gender;

    /**
     * 头像URL
     */
    @Pattern(regexp = "^(http|https)://.*",message = "头像URL格式不正确！")
    @Schema(description = "头像URL",requiredMode = Schema.RequiredMode.AUTO)
    private String avatar;

    /**
     * 生日
     */
    @Schema(description = "生日",requiredMode = Schema.RequiredMode.AUTO)
    private LocalDate birthday;

    /**
     * 简介
     */
    @Schema(description = "简介",requiredMode = Schema.RequiredMode.AUTO)
    private String bio;

    /**
     * 状态：0-禁用，1-启用，2-锁定，3-已删除
     */
    @Schema(description = "状态：0-禁用，1-启用，2-锁定，3-已删除",requiredMode = Schema.RequiredMode.AUTO)
    private Boolean status;

    /**
     * 角色ID
     */
    @Schema(description = "角色ID",requiredMode = Schema.RequiredMode.AUTO)
    private Integer roleId;

    /**
     * 部门ID
     */
    @Schema(description = "部门ID",requiredMode = Schema.RequiredMode.AUTO)
    private Integer departmentId;

    /**
     * 注册IP
     */
    @Schema(description = "注册IP",requiredMode = Schema.RequiredMode.AUTO)
    private String registerIp;

    /**
     * 登录失败次数
     */
    @Schema(description = "登录失败次数",requiredMode = Schema.RequiredMode.AUTO)
    private Integer loginAttempts;

    /**
     * 乐观锁版本号
     */
    @Schema(description = "乐观锁版本号",requiredMode = Schema.RequiredMode.AUTO)
    private Integer version;


}
