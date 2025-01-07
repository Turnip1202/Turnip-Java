CREATE TABLE IF NOT EXISTS `user_login_history` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'IP地址',
  `login_type` tinyint(1) DEFAULT '1' COMMENT '登录类型：1-用户名密码，2-第三方登录',
  `login_status` tinyint(1) DEFAULT '1' COMMENT '登录状态：0-失败，1-成功',
  `device_type` varchar(200) DEFAULT NULL COMMENT '设备类型',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '浏览器代理信息',
  `login_location` varchar(100) DEFAULT NULL COMMENT 'IP归属地',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_login_time` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户登录历史记录表';