CREATE TABLE IF NOT EXISTS `menus` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_id` int DEFAULT NULL COMMENT '父菜单ID',
  `menu_type` enum('directory','menu','button') NOT NULL COMMENT '菜单类型（目录/菜单/按钮）',
  `name` varchar(100) NOT NULL COMMENT '显示名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径',
  `sort` int DEFAULT '0' COMMENT '排序',
  `permission` varchar(255) DEFAULT NULL COMMENT '所需权限标识',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单表';


-- 假设当前角色ID为1
WITH RECURSIVE menu_tree AS (
  SELECT 
    m.id,
    m.parent_id,
    m.menu_type,
    m.name,
    m.icon,
    m.path,
    m.sort,
    m.permission
  FROM menus m
  WHERE 
    m.parent_id IS NULL  -- 从根节点开始
    AND (m.permission IS NULL OR EXISTS (
      SELECT 1 
      FROM role_permissions 
      WHERE role_id = 1 
        AND permission = m.permission
    ))
    AND m.menu_type != 'button'  -- 过滤按钮类型

  UNION ALL

  SELECT 
    m.id,
    m.parent_id,
    m.menu_type,
    m.name,
    m.icon,
    m.path,
    m.sort,
    m.permission
  FROM menus m
  INNER JOIN menu_tree mt ON m.parent_id = mt.id
  WHERE 
    (m.permission IS NULL OR EXISTS (
      SELECT 1 
      FROM role_permissions 
      WHERE role_id = 1 
        AND permission = m.permission
    ))
    AND m.menu_type != 'button'
)
SELECT * FROM menu_tree
ORDER BY sort;


-- 目录（无需权限）
INSERT INTO menus (parent_id, menu_type, name, icon, path, sort) 
VALUES (NULL, 'directory', '系统管理', 'system', '/system', 10);

-- 菜单项（需要权限）
INSERT INTO menus (parent_id, menu_type, name, icon, path, sort, permission)
VALUES 
  (1, 'menu', '用户管理', 'user', '/system/users', 11, 'user:view'),
  (1, 'menu', '角色管理', 'role', '/system/roles', 12, 'role:view');

-- 按钮权限（通过接口控制）
INSERT INTO menus (menu_type, name, permission) 
VALUES ('button', '删除用户', 'user:delete');

-- 创建测试菜单
INSERT INTO menus 
  (parent_id, menu_type, name, permission)
VALUES
  (NULL, 'directory', '高级管理', NULL),
  (5, 'menu', '审计日志', 'audit:view'),
  (5, 'button', '导出日志', 'audit:export');



-- ==================================查询角色拥有的菜单权限数据，超级管理员直接拥有所有菜单数据
-- 设置目标角色ID（示例值）
SET @target_role_id = 1;
SET @is_superadmin = (SELECT is_superadmin FROM roles WHERE id = @target_role_id);

WITH RECURSIVE menu_tree AS (
  SELECT 
    m.id,
    m.parent_id,
    m.menu_type,
    m.name,
    m.icon,
    m.path,
    m.sort,
    m.permission,
    m.created_at,
    m.updated_at
  FROM menus m
  WHERE 
    m.parent_id IS NULL
    AND (
      @is_superadmin = 1  -- 超级管理员直接放行
      OR (
        m.permission IS NULL  -- 无需权限的菜单项
        OR EXISTS (
          SELECT 1 
          FROM role_permissions 
          WHERE 
            role_id = @target_role_id 
            AND permission = m.permission
        )
      )
    )
    AND m.menu_type != 'button'  -- 过滤按钮

  UNION ALL

  SELECT 
    m.id,
    m.parent_id,
    m.menu_type,
    m.name,
    m.icon,
    m.path,
    m.sort,
    m.permission,
    m.created_at,
    m.updated_at
  FROM menus m
  INNER JOIN menu_tree mt 
    ON m.parent_id = mt.id
  WHERE 
    (
      @is_superadmin = 1
      OR (
        m.permission IS NULL
        OR EXISTS (
          SELECT 1 
          FROM role_permissions 
          WHERE 
            role_id = @target_role_id 
            AND permission = m.permission
        )
      )
    )
    AND m.menu_type != 'button'  -- 持续过滤按钮
)

SELECT 
  id,
  parent_id,
  menu_type,
  permission,
  name,
  icon,
  path,
  sort,
  created_at,
  updated_at
FROM menu_tree
ORDER BY sort;




WITH RECURSIVE 
vars AS ( -- 先定义变量
  SELECT 
    @target_role_id := 1 AS target_role_id, -- 在此处设置目标角色ID
    (SELECT is_superadmin FROM roles WHERE id = @target_role_id) AS is_superadmin
),

menu_tree AS (
  SELECT 
    m.id,
    m.parent_id,
    m.menu_type,
    m.name,
    m.icon,
    m.path,
    m.sort,
    m.permission,
    m.created_at,
    m.updated_at
  FROM menus m, vars
  WHERE 
    m.parent_id IS NULL
    AND (
      vars.is_superadmin = 1  -- 直接使用 vars 中的变量
      OR (
        m.permission IS NULL
        OR EXISTS (
          SELECT 1 
          FROM role_permissions 
          WHERE 
            role_id = vars.target_role_id 
            AND permission = m.permission
        )
      )
    )
    AND m.menu_type != 'button'

  UNION ALL

  SELECT 
    m.id,
    m.parent_id,
    m.menu_type,
    m.name,
    m.icon,
    m.path,
    m.sort,
    m.permission,
    m.created_at,
    m.updated_at
  FROM menus m
  INNER JOIN menu_tree mt 
    ON m.parent_id = mt.id, vars
  WHERE 
    (
      vars.is_superadmin = 1
      OR (
        m.permission IS NULL
        OR EXISTS (
          SELECT 1 
          FROM role_permissions 
          WHERE 
            role_id = vars.target_role_id 
            AND permission = m.permission
        )
      )
    )
    AND m.menu_type != 'button'
)

SELECT 
  id,
  parent_id,
  menu_type,
  name,
  icon,
  path,
  sort,
  permission,
  created_at,
  updated_at
FROM menu_tree
ORDER BY sort;




-- ===========================================查询角色拥有的按钮权限信息
-- 设置目标角色ID（与菜单查询使用相同角色）
SET @target_role_id = 1;
SET @is_superadmin = (SELECT is_superadmin FROM roles WHERE id = @target_role_id);

SELECT 
  DISTINCT permission  -- 去重

FROM menus
WHERE 
  menu_type = 'button'  -- 仅查询按钮类型
  AND permission IS NOT NULL  -- 排除空权限
  AND (
    @is_superadmin = 1  -- 超级管理员获取所有按钮权限
    OR EXISTS (
      SELECT 1 
      FROM role_permissions 
      WHERE 
        role_id = @target_role_id 
        AND permission = menus.permission
    )
  );
  
  
  
-- =================================== 查询当前角色拥有的所有按钮权限信息
SET @target_role_id = 1;
SET @is_superadmin = (SELECT is_superadmin FROM roles WHERE id = @target_role_id);

SELECT 
  m.id,
  m.name AS button_name,
  m.icon,
  m.permission
FROM menus m
WHERE 
  m.menu_type = 'button'
  AND m.permission IS NOT NULL
  AND (
    @is_superadmin = 1
    OR EXISTS (
      SELECT 1 
      FROM role_permissions 
      WHERE 
        role_id = @target_role_id 
        AND permission = m.permission
    )
  );




// 示例：JavaScript 转换逻辑
function buildMenuTree(flatData) {
  const map = new Map();
  const tree = [];
  
  flatData.forEach(item => {
    map.set(item.id, { ...item, children: [] });
  });

  flatData.forEach(item => {
    if (item.parent_id !== null) {
      const parent = map.get(item.parent_id);
      parent?.children.push(map.get(item.id));
    } else {
      tree.push(map.get(item.id));
    }
  });

  return tree;
}

