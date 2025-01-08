package com.turnip.turnipjava.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.turnip.turnipjava.common.R;
import com.turnip.turnipjava.constant.consist.RStateConstants;
import com.turnip.turnipjava.model.dto.AdminUserLoginDTO;
import com.turnip.turnipjava.model.dto.AdminUserLoginHistoryDTO;
import com.turnip.turnipjava.model.entity.AdminUserLoginHistoryEntity;
import com.turnip.turnipjava.model.vo.AdminUserLoginVO;
import com.turnip.turnipjava.model.entity.AdminUserEntity;
import com.turnip.turnipjava.mapper.AdminUserMapper;
import com.turnip.turnipjava.service.intf.IAdminUserLoginHistoryService;
import com.turnip.turnipjava.service.intf.IAdminUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.turnip.turnipjava.utils.IPUtil;
import com.turnip.turnipjava.utils.JWTUtil;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


    @Override
    public R<AdminUserLoginVO, String> login(AdminUserLoginDTO loginInfo, HttpServletRequest request) {

        log.info("loginInfo:{}",loginInfo.toString());

        String remoteAddr = IPUtil.getIpAddr(request);
        String UserAgent = request.getHeader("User-Agent");
        String Platform = request.getHeader("Sec-Ch-Ua-Platform");

        QueryWrapper<AdminUserEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", loginInfo.getUsername()).eq("password", loginInfo.getPassword());
        AdminUserEntity user = this.getOne(queryWrapper);
        if (user == null) {
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

    @Override
    public R register() {
        return null;
    }
}
