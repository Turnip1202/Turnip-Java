CREATE TABLE IF NOT EXISTS `favorites` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `wallpaper_id` int NOT NULL COMMENT '壁纸ID',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0-无效，1-有效',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_wallpaper` (`user_id`, `wallpaper_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_wallpaper_id` (`wallpaper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收藏表';