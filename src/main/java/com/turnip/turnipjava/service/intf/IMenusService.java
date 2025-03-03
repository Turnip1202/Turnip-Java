package com.turnip.turnipjava.service.intf;

import com.turnip.turnipjava.common.R;
import com.turnip.turnipjava.model.entity.MenusEntity;
import com.baomidou.mybatisplus.extension.service.IService;
import com.turnip.turnipjava.model.vo.MenusVO;

import java.util.List;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author Turnip
 * @since 2025-02-23
 */
public interface IMenusService extends IService<MenusEntity> {
    R<List<MenusVO>,Object> getMenus();

}
