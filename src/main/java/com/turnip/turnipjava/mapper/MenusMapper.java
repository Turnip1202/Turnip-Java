package com.turnip.turnipjava.mapper;

import com.turnip.turnipjava.model.entity.MenusEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.turnip.turnipjava.model.vo.MenusVO;

import java.util.List;

/**
 * <p>
 * 菜单表 Mapper 接口
 * </p>
 *
 * @author Turnip
 * @since 2025-02-23
 */
public interface MenusMapper extends BaseMapper<MenusEntity> {
    List<MenusVO> getMenus();

}
