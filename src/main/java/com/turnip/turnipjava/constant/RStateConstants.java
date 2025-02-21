package com.turnip.turnipjava.constant;

import com.turnip.turnipjava.constant.consist.ResultState;

public interface RStateConstants {
    // 通用状态码
    ResultState SUCCESS = new ResultState(0, "成功");
    ResultState FAIL = new ResultState(-1, "失败");

    // 认证相关状态码 (1000-1999)
    ResultState LOGIN_SUCCESS = new ResultState(1000, "登录成功");
    ResultState REGISTER_SUCCESS = new ResultState(1001, "注册成功");
    ResultState REGISTER_ERROR = new ResultState(1002,"注册失败");
    ResultState LOGOUT_SUCCESS = new ResultState(1003, "退出成功");
    ResultState LOGIN_ERROR = new ResultState(1004, "登录失败");

    // 用户相关状态码 (2000-2999)
    ResultState USER_NOT_FOUND = new ResultState(2000, "用户不存在");
    ResultState USER_DISABLED = new ResultState(2001, "用户已禁用");
    ResultState USER_LOCKED = new ResultState(2002, "用户已锁定");

    // 权限相关状态码 (3000-3999)
    ResultState UNAUTHORIZED = new ResultState(3000, "未授权访问");
    ResultState FORBIDDEN = new ResultState(3001, "禁止访问");

    // 业务相关状态码 (4000-4999)
    ResultState PARAM_ERROR = new ResultState(4000, "参数错误");
    ResultState DATA_NOT_FOUND = new ResultState(4001, "数据不存在");

    // 系统相关状态码 (5000-5999)
    ResultState SYSTEM_ERROR = new ResultState(5000, "系统错误");
    ResultState SERVICE_UNAVAILABLE = new ResultState(5001, "服务不可用");
}
