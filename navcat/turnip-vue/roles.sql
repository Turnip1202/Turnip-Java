CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `description` text COMMENT '角色描述',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色表';


ALTER TABLE `roles` 
ADD COLUMN `is_superadmin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否超级管理员（0-否 1-是）';

INSERT INTO `roles` (`name`, `description`, `is_superadmin`)
VALUES ('超级管理员', '拥有所有权限', 1);
