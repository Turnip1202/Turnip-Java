CREATE TABLE IF NOT EXISTS `role_permissions` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  `permission` varchar(255) NOT NULL COMMENT '权限标识',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色权限表';



-- 插入权限数据
INSERT INTO role_permissions (role_id, permission) 
VALUES (1, 'user:view');