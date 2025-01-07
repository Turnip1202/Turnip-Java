CREATE TABLE IF NOT EXISTS `download_limits` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '下载限制ID',
  `user_type` tinyint(1) NOT NULL COMMENT '用户类型：1-普通用户，2-管理员，3-会员',
  `daily_limit` int NOT NULL COMMENT '每日下载限制',
  `monthly_limit` int NOT NULL COMMENT '每月下载限制',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_type` (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='下载限制表';

