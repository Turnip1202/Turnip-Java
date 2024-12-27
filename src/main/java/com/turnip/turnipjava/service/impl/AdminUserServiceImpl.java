package com.turnip.turnipjava.service.impl;

import com.turnip.turnipjava.model.entity.AdminUserEntity;
import com.turnip.turnipjava.mapper.AdminUserMapper;
import com.turnip.turnipjava.service.intf.IAdminUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 后台用户表 服务实现类
 * </p>
 *
 * @author Turnip
 * @since 2024-12-27
 */
@Service
public class AdminUserServiceImpl extends ServiceImpl<AdminUserMapper, AdminUserEntity> implements IAdminUserService {

}
