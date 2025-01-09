package com.turnip.turnipjava.model.vo;


import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Accessors(chain = true)
public class AdminUserInfoVO {


    /**
     * 用户ID
     */
    private Integer id;

    /**
     * 用户名
     */
    private String username;

    /**
     * 真实姓名
     */
    private String realName;


    /**
     * 手机号
     */
    private String phone;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 性别：0-未知，1-男，2-女
     */
    private Integer gender;

    /**
     * 头像URL
     */
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
    private Integer status;

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
     * 创建时间
     */
    private LocalDateTime createdAt;

    /**
     * 更新时间
     */
    private LocalDateTime updatedAt;

    /**
     * 删除时间
     */
    private LocalDateTime deletedAt;
}