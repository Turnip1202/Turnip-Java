package com.turnip.turnipjava.controller.admin.menus;

import com.turnip.turnipjava.common.R;
import com.turnip.turnipjava.model.vo.MenusVO;
import com.turnip.turnipjava.service.intf.IMenusService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 菜单表 前端控制器
 * </p>
 *
 * @author Turnip
 * @since 2025-02-23
 */
@Tag(name="管理员 - 01.菜单管理")
@RestController
@RequestMapping("/admin-menus")
public class MenusController {
    @Autowired
    private IMenusService menusService;

    @Operation(summary = "菜单管理")
    @GetMapping("/test")
    public R<List<MenusVO>,Object> test(){
        R<List<MenusVO>,Object>  menus = menusService.getMenus();
        return menus;
    }

}
