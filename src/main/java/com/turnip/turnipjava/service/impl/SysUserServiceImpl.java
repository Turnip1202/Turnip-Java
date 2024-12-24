package com.turnip.turnipjava.service.impl;

import com.turnip.turnipjava.model.entity.SysUserEntity;
import com.turnip.turnipjava.mapper.SysUserMapper;
import com.turnip.turnipjava.service.intf.ISysUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 后台用户表 服务实现类
 * </p>
 *
 * @author Turnip
 * @since 2024-12-24
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUserEntity> implements ISysUserService {

}
