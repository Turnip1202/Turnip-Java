package com.turnip.turnipjava.controller.admin.user;

import com.turnip.turnipjava.annotation.InterfaceEnabled;
import com.turnip.turnipjava.common.R;
import com.turnip.turnipjava.common.validate.Insert;
import com.turnip.turnipjava.model.dto.AdminUserLoginDTO;
import com.turnip.turnipjava.model.dto.AdminUserRegisterDTO;
import com.turnip.turnipjava.model.vo.AdminUserLoginVO;
import com.turnip.turnipjava.service.intf.IAdminUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.tags.Tags;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.groups.Default;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 后台用户表 前端控制器
 * </p>
 *
 * @author Turnip
 * @since 2024-12-27
 */
@Tag(name="管理员 - 01.用户相关")
@RestController
@RequestMapping("/admin-user")
public class AdminUserController {

    @Autowired
    private IAdminUserService adminUserService;

    @Operation(summary = "登录")
    @PostMapping("/login")
    public R<AdminUserLoginVO,String> login(@RequestBody @Validated(Default.class) AdminUserLoginDTO loginInfo, HttpServletRequest request) {
     return adminUserService.login(loginInfo,request);
    }

    @InterfaceEnabled(value = true)
    @Operation(summary = "注册")
    @PostMapping("/register")
    public R register(@RequestBody @Validated(Default.class) AdminUserRegisterDTO registerInfo) {
        return R.success();
    }

}
