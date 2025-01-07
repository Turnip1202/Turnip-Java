package com.turnip.turnipjava.controller.admin.user;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.turnip.turnipjava.common.R;
import com.turnip.turnipjava.constant.consist.RStateConstants;
import com.turnip.turnipjava.controller.admin.DTO.AdminUserLoginDTO;
import com.turnip.turnipjava.controller.admin.DTO.AdminUserLoginHistoryDTO;
import com.turnip.turnipjava.controller.admin.VO.AdminUserLoginVO;
import com.turnip.turnipjava.model.entity.AdminUserEntity;
import com.turnip.turnipjava.service.intf.IAdminUserLoginHistoryService;
import com.turnip.turnipjava.service.intf.IAdminUserService;
import com.turnip.turnipjava.utils.IPUtil;
import com.turnip.turnipjava.utils.JWTUtil;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.UUID;

/**
 * <p>
 * 后台用户表 前端控制器
 * </p>
 *
 * @author Turnip
 * @since 2024-12-27
 */
@Slf4j
@RestController
@RequestMapping("/admin-user")
public class AdminUserController {

    @Autowired
    private IAdminUserService adminUserService;
    @Autowired
    private IAdminUserLoginHistoryService adUshService;
    @PostMapping("/login")
    public R<AdminUserLoginVO,String> login(@RequestBody AdminUserLoginDTO loginInfo, HttpServletRequest request) {
        log.info("loginInfo:{}",loginInfo.toString());
        String remoteAddr = IPUtil.getIpAddr(request);
        log.info("remoteAddr:{}",remoteAddr);
        String deviceType = request.getHeader("User-Agent");
        QueryWrapper<AdminUserEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",loginInfo.getUsername());
        AdminUserEntity checkUserName = adminUserService.getOne(queryWrapper);
        if (checkUserName==null) return R.error(RStateConstants.LOGIN_ERROR,"用户名错误");
        queryWrapper.eq("password",loginInfo.getPassword());
        AdminUserEntity checkPassWord = adminUserService.getOne(queryWrapper);
        log.info("checkPassWord:{}",checkPassWord);
        if(checkPassWord!=null){
            //用户存在,记录登录历史信息
            AdminUserLoginHistoryDTO adUshDTO = new AdminUserLoginHistoryDTO();
            adUshDTO.setUserId(checkPassWord.getId()).
                    setIpAddress(remoteAddr)
                    .setDeviceType(deviceType);
            adUshService.save(adUshDTO.getEntity());

        }else return R.error(RStateConstants.LOGIN_ERROR,"密码错误");

        //生成token
        String token = JWTUtil.generateToken(UUID.randomUUID().toString(),loginInfo.getUsername(),new HashMap<>(){{put("name","Turnip");}});
        return R.success(RStateConstants.LOGIN_SUCCESS,new AdminUserLoginVO().setToken(token).setId(checkPassWord.getId()));
    }

}
