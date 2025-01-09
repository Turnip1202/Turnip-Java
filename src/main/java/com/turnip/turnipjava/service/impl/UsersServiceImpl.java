package com.turnip.turnipjava.service.impl;

import com.turnip.turnipjava.model.entity.UsersEntity;
import com.turnip.turnipjava.mapper.UsersMapper;
import com.turnip.turnipjava.service.intf.IUsersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;


@Service
public class UsersServiceImpl extends ServiceImpl<UsersMapper, UsersEntity> implements IUsersService {

}
