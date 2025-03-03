package com.turnip.turnipjava.model.vo;

import com.turnip.turnipjava.model.dto.BaseDTO;
import com.turnip.turnipjava.model.entity.MenusEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;


@Data
@Builder
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false) // 添加: 指定不调用超类的equals和hashCode方法
public class MenusVO extends BaseDTO<MenusEntity> implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 菜单ID
     */
    private Integer id;

    /**
     * 父菜单ID
     */
    @Schema(description = "父菜单ID",requiredMode = Schema.RequiredMode.AUTO)
    private Integer parentId;

    /**
     * 菜单类型（目录/菜单/按钮）
     */
    @Schema(description = "菜单类型（目录/菜单/按钮）",requiredMode = Schema.RequiredMode.AUTO)
    private String menuType;

    /**
     * 显示名称
     */
    @Schema(description = "显示名称",requiredMode = Schema.RequiredMode.AUTO)
    private String name;

    /**
     * 图标
     */
    @Schema(description = "图标",requiredMode = Schema.RequiredMode.AUTO)
    private String icon;

    /**
     * 路由路径
     */
    @Schema(description = "路由路径",requiredMode = Schema.RequiredMode.AUTO)
    private String path;

    /**
     * 排序
     */
    @Schema(description = "排序",requiredMode = Schema.RequiredMode.AUTO)
    private Integer sort;

    /**
     * 所需权限标识
     */
    @Schema(description = "所需权限标识",requiredMode = Schema.RequiredMode.AUTO)
    private String permission;

    /**
     * 创建时间
     */
    @Schema(description = "创建时间",requiredMode = Schema.RequiredMode.AUTO)
    private LocalDateTime createdAt;

    /**
     * 更新时间
     */
    @Schema(description = "更新时间",requiredMode = Schema.RequiredMode.AUTO)
    private LocalDateTime updatedAt;
}
