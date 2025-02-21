package com.turnip.turnipjava.service.impl;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.ICaptcha;
import cn.hutool.core.codec.Base64;
import cn.hutool.core.lang.Console;
import cn.hutool.json.JSON;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.turnip.turnipjava.common.R;
import com.turnip.turnipjava.constant.consist.RStateConstants;
import com.turnip.turnipjava.constant.consist.ResultState;
import com.turnip.turnipjava.model.dto.AdminUserLoginDTO;
import com.turnip.turnipjava.model.dto.AdminUserLoginHistoryDTO;
import com.turnip.turnipjava.model.dto.AdminUserRegisterDTO;
import com.turnip.turnipjava.model.entity.AdminUserLoginHistoryEntity;
import com.turnip.turnipjava.model.vo.AdminUserLoginVO;
import com.turnip.turnipjava.model.entity.AdminUserEntity;
import com.turnip.turnipjava.mapper.AdminUserMapper;
import com.turnip.turnipjava.service.intf.IAdminUserLoginHistoryService;
import com.turnip.turnipjava.service.intf.IAdminUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.turnip.turnipjava.utils.IPUtil;
import com.turnip.turnipjava.utils.JWTUtil;
import com.turnip.turnipjava.utils.MD5Utils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.util.HashMap;
import java.util.UUID;

/**
 * <p>
 * 后台用户表 服务实现类
 * </p>
 *
 * @author Turnip
 * @since 2024-12-27
 */
@Log4j2
@Service
public class AdminUserServiceImpl extends ServiceImpl<AdminUserMapper, AdminUserEntity> implements IAdminUserService {

    @Autowired
    private IAdminUserLoginHistoryService adUshService;
    @Autowired
    private  AdminUserMapper adminUserMapper;


    private static ICaptcha captcha = null;


    @Override
    public R getCaptcha(String uuid, HttpServletRequest request, HttpServletResponse response) {
        log.info("uuid:{}",uuid);

        captcha = CaptchaUtil.createCircleCaptcha(200, 100,4, 100);
        Console.log(captcha.getCode());
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        captcha.write(outputStream);
        String base64Image = Base64.encode(outputStream.toByteArray());
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("uuid",uuid);
        hashMap.put("type","image");
        hashMap.put("captcha","data:image/png;base64,"+base64Image);
        return R.success(hashMap);
    }

    @Override
    public R<AdminUserLoginVO, String> login(AdminUserLoginDTO loginInfo, HttpServletRequest request) {

        log.info("loginInfo:{}",loginInfo.toString());

        String remoteAddr = IPUtil.getIpAddr(request);
        String UserAgent = request.getHeader("User-Agent");
        String Platform = request.getHeader("Sec-Ch-Ua-Platform");

        String code = loginInfo.getCode();
        if (captcha == null) {
            return R.error(RStateConstants.LOGIN_ERROR, "请先获取验证码！");
        }
        boolean verify = captcha.verify(code);
        if (!verify) {
            return R.error(RStateConstants.LOGIN_ERROR, "验证码错误");
        }

        QueryWrapper<AdminUserEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", loginInfo.getUsername());
        AdminUserEntity user = this.getOne(queryWrapper);
        if (user == null) {
            return R.error(RStateConstants.LOGIN_ERROR, "用户名不存在");
        }
        boolean verified = MD5Utils.verifyEncryptTimes(loginInfo.getPassword(), user.getPasswordSalt(), 3, user.getPassword());
        if (!verified) {
            return R.error(RStateConstants.LOGIN_ERROR, "用户名或密码错误");
        }

        // 用户存在, 记录登录历史信息
        AdminUserLoginHistoryDTO adUshDTO = AdminUserLoginHistoryDTO.builder()
                .userId(user.getId()).deviceType(Platform).loginType(loginInfo.getType()).ipAddress(remoteAddr).userAgent(UserAgent).build();
        adUshService.save(adUshDTO.getEntity(AdminUserLoginHistoryEntity.class));
        //生成token
        String token = JWTUtil.generateToken(UUID.randomUUID().toString(),loginInfo.getUsername(),new HashMap<>(){{put("name","Turnip");}});

        return R.success(new AdminUserLoginVO().setTkToken(token).setId(user.getId()));
    }

    @Transactional
    @Override
    public R<ResultState,Object> register(AdminUserRegisterDTO registerInfo, HttpServletRequest request) {
        String remoteAddr = IPUtil.getIpAddr(request);



        log.info("registerInfo:{}",registerInfo.toString());
        String password = registerInfo.getPassword().trim();
        String salt = MD5Utils.generateSalt();
        String npwd = MD5Utils.encryptTimes(password,salt, 3);
        registerInfo.setPassword(npwd).setPasswordSalt(salt);
        registerInfo.setRegisterIp(remoteAddr);



        //查询用户信息,分别验证用户名、手机号、邮箱是否已存在
        QueryWrapper<AdminUserEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",registerInfo.getUsername());
        AdminUserEntity user = this.getOne(queryWrapper);
        if(user != null){
            return R.error(RStateConstants.REGISTER_ERROR,"用户名已存在");
        }
        queryWrapper.clear();
        queryWrapper.eq("phone",registerInfo.getPhone());
        user = this.getOne(queryWrapper);
        if(user != null){
            return R.error(RStateConstants.REGISTER_ERROR,"手机号已存在");
        }
        queryWrapper.clear();
        queryWrapper.eq("email",registerInfo.getEmail());
        user = this.getOne(queryWrapper);
        if(user != null){
            return R.error(RStateConstants.REGISTER_ERROR,"邮箱已存在");
        }


        AdminUserEntity entity = registerInfo.getEntity(AdminUserEntity.class);
        log.info("entity:{}", JSONUtil.toJsonStr(entity));
        boolean save = this.save(entity);

        return R.success(RStateConstants.REGISTER_SUCCESS);
    }
}
