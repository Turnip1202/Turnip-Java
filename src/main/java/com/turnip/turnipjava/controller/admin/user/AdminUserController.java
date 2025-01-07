package com.turnip.turnipjava.controller.admin.user;

import com.turnip.turnipjava.annotation.InterfaceEnabled;
import com.turnip.turnipjava.common.R;
import com.turnip.turnipjava.model.dto.AdminUserLoginDTO;
import com.turnip.turnipjava.model.vo.AdminUserLoginVO;
import com.turnip.turnipjava.service.intf.IAdminUserService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
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
@RestController
@RequestMapping("/admin-user")
public class AdminUserController {

    @Autowired
    private IAdminUserService adminUserService;

    @PostMapping("/login")
    public R<AdminUserLoginVO,String> login(@RequestBody AdminUserLoginDTO loginInfo, HttpServletRequest request) {
     return adminUserService.login(loginInfo,request);
    }

    @InterfaceEnabled()
    @PostMapping("/register")
    public R register(){
        return adminUserService.register();
    }

}
