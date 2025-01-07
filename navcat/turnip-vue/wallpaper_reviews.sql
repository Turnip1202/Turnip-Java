
CREATE TABLE IF NOT EXISTS `wallpaper_reviews` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '审核ID',
  `wallpaper_id` int NOT NULL COMMENT '壁纸ID',
  `reviewer_id` int NOT NULL COMMENT '审核员ID',
  `status` tinyint(1) NOT NULL COMMENT '审核状态：0-待审，1-通过，2-拒绝',
  `comments` text COMMENT '审核意见',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `idx_wallpaper_id` (`wallpaper_id`),
  KEY `idx_reviewer_id` (`reviewer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='壁纸审核记录表';