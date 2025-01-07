package com.turnip.turnipjava.service.intf;

import com.turnip.turnipjava.common.R;
import com.turnip.turnipjava.model.dto.AdminUserLoginDTO;
import com.turnip.turnipjava.model.vo.AdminUserLoginVO;
import com.turnip.turnipjava.model.entity.AdminUserEntity;
import com.baomidou.mybatisplus.extension.service.IService;
import jakarta.servlet.http.HttpServletRequest;

/**
 * <p>
 * 后台用户表 服务类
 * </p>
 *
 * @author Turnip
 * @since 2024-12-27
 */
public interface IAdminUserService extends IService<AdminUserEntity> {
    R<AdminUserLoginVO,String> login(AdminUserLoginDTO loginInfo, HttpServletRequest request);
    R register();
}
