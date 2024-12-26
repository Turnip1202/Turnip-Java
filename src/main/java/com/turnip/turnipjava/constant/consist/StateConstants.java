package com.turnip.turnipjava.constant.consist;

public interface StateConstants {
    // 通用状态码
    StateCode SUCCESS = new StateCode(0, "成功");
    StateCode FAIL = new StateCode(-1, "失败");

    // 认证相关状态码 (1000-1999)
    StateCode LOGIN_SUCCESS = new StateCode(1000, "登录成功");
    StateCode REGISTER_SUCCESS = new StateCode(1001, "注册成功");
    StateCode REGISTER_ERROR = new StateCode(1002,"注册失败");
    StateCode LOGOUT_SUCCESS = new StateCode(1003, "退出成功");
    StateCode LOGIN_ERROR = new StateCode(1004, "登录失败");

    // 用户相关状态码 (2000-2999)
    StateCode USER_NOT_FOUND = new StateCode(2000, "用户不存在");
    StateCode USER_DISABLED = new StateCode(2001, "用户已禁用");
    StateCode USER_LOCKED = new StateCode(2002, "用户已锁定");

    // 权限相关状态码 (3000-3999)
    StateCode UNAUTHORIZED = new StateCode(3000, "未授权访问");
    StateCode FORBIDDEN = new StateCode(3001, "禁止访问");

    // 业务相关状态码 (4000-4999)
    StateCode PARAM_ERROR = new StateCode(4000, "参数错误");
    StateCode DATA_NOT_FOUND = new StateCode(4001, "数据不存在");

    // 系统相关状态码 (5000-5999)
    StateCode SYSTEM_ERROR = new StateCode(5000, "系统错误");
    StateCode SERVICE_UNAVAILABLE = new StateCode(5001, "服务不可用");
}
