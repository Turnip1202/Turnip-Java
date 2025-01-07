package com.turnip.turnipjava.service.impl;

import com.turnip.turnipjava.model.entity.AdminUserLoginHistoryEntity;
import com.turnip.turnipjava.mapper.AdminUserLoginHistoryMapper;
import com.turnip.turnipjava.service.intf.IAdminUserLoginHistoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户登录历史记录 服务实现类
 * </p>
 *
 * @author Turnip
 * @since 2025-01-06
 */
@Service
public class AdminUserLoginHistoryServiceImpl extends ServiceImpl<AdminUserLoginHistoryMapper, AdminUserLoginHistoryEntity> implements IAdminUserLoginHistoryService {

}
