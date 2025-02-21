package com.turnip.turnipjava.controller.admin.user;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.ICaptcha;
import cn.hutool.captcha.LineCaptcha;
import cn.hutool.core.codec.Base64;
import cn.hutool.core.lang.Console;
import com.turnip.turnipjava.annotation.InterfaceEnabled;
import com.turnip.turnipjava.common.R;
import com.turnip.turnipjava.common.validate.Insert;
import com.turnip.turnipjava.common.validate.Query;
import com.turnip.turnipjava.common.validate.Update;
import com.turnip.turnipjava.constant.consist.RStateConstants;
import com.turnip.turnipjava.constant.consist.ResultState;
import com.turnip.turnipjava.model.dto.AdminUserLoginDTO;
import com.turnip.turnipjava.model.dto.AdminUserRegisterDTO;
import com.turnip.turnipjava.model.entity.AdminUserEntity;
import com.turnip.turnipjava.model.vo.AdminUserInfoVO;
import com.turnip.turnipjava.model.vo.AdminUserLoginVO;
import com.turnip.turnipjava.service.intf.IAdminUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.tags.Tags;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.groups.Default;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayOutputStream;
import java.util.HashMap;

/**
 * <p>
 * 后台用户表 前端控制器
 * </p>
 *
 * @author Turnip
 * @since 2024-12-27
 */
@Tag(name="管理员 - 01.用户相关")
@Slf4j
@RestController
@RequestMapping("/admin-user")
public class AdminUserController {

    @Autowired
    private IAdminUserService adminUserService;


    /**
     * 获取验证码
     */
    @GetMapping("/captcha")
    public Object getCaptcha(@Param("uuid")  String uuid, HttpServletRequest request, HttpServletResponse response)   {
     try{
         return adminUserService.getCaptcha(uuid,request,response);
     }catch(Exception e){
        return R.error(RStateConstants.FAIL);
     }

    }

    @GetMapping("/{id}")
    public R<AdminUserInfoVO,Object> getUserInfo(@PathVariable("id") Integer id) {
        AdminUserEntity userInfo = adminUserService.getById(id);
        AdminUserInfoVO adminUserInfoVO = new AdminUserInfoVO();
        BeanUtils.copyProperties(userInfo, adminUserInfoVO);
        return R.success(adminUserInfoVO);
    }


    @Operation(summary = "登录")
    @PostMapping("/login")
    public R<AdminUserLoginVO,String> login(@RequestBody @Validated(Query.class) AdminUserLoginDTO loginInfo, HttpServletRequest request) {
     return adminUserService.login(loginInfo,request);
    }

    @InterfaceEnabled(value = true)
    @Operation(summary = "注册")
    @PostMapping("/register")
    public R<ResultState,Object> register(@RequestBody @Validated(Insert.class) AdminUserRegisterDTO registerInfo, HttpServletRequest request) {
        return adminUserService.register(registerInfo,request);
    }

}
