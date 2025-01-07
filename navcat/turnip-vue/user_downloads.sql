CREATE TABLE IF NOT EXISTS `user_downloads` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '下载记录ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `wallpaper_id` int NOT NULL COMMENT '壁纸ID',
  `download_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '下载时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_download_time` (`download_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户下载记录表';