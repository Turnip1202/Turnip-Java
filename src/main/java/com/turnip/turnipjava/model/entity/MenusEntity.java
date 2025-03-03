package com.turnip.turnipjava.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 菜单表
 * </p>
 *
 * @author Turnip
 * @since 2025-02-23
 */
@Getter
@Setter
@TableName("menus")
public class MenusEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 菜单ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 父菜单ID
     */
    @TableField("parent_id")
    private Integer parentId;

    /**
     * 菜单类型（目录/菜单/按钮）
     */
    @TableField("menu_type")
    private String menuType;

    /**
     * 显示名称
     */
    @TableField("name")
    private String name;

    /**
     * 图标
     */
    @TableField("icon")
    private String icon;

    /**
     * 路由路径
     */
    @TableField("path")
    private String path;

    /**
     * 排序
     */
    @TableField("sort")
    private Integer sort;

    /**
     * 所需权限标识
     */
    @TableField("permission")
    private String permission;

    /**
     * 创建时间
     */
    @TableField("created_at")
    private LocalDateTime createdAt;

    /**
     * 更新时间
     */
    @TableField("updated_at")
    private LocalDateTime updatedAt;
}
