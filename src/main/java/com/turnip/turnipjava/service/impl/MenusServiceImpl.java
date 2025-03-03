package com.turnip.turnipjava.service.impl;

import com.turnip.turnipjava.common.R;
import com.turnip.turnipjava.model.entity.MenusEntity;
import com.turnip.turnipjava.mapper.MenusMapper;
import com.turnip.turnipjava.model.vo.MenusVO;
import com.turnip.turnipjava.service.intf.IMenusService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 菜单表 服务实现类
 * </p>
 *
 * @author Turnip
 * @since 2025-02-23
 */
@Service
public class MenusServiceImpl extends ServiceImpl<MenusMapper, MenusEntity> implements IMenusService {
    @Autowired
    private MenusMapper menusMapper;

    @Override
    public R<List<MenusVO>,Object> getMenus() {
        List<MenusVO> menus = menusMapper.getMenus();

        return R.success(menus);
    }
}
