CREATE TABLE IF NOT EXISTS `comments` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `user_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户类型：1-普通用户，2-管理员，3-会员',
  `wallpaper_id` int NOT NULL COMMENT '壁纸ID',
  `content` text NOT NULL COMMENT '评论内容',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0-待审，1-通过，2-拒绝',
  `parent_id` int DEFAULT NULL COMMENT '父评论ID',
  `likes` int DEFAULT '0' COMMENT '点赞数',
  `reported` tinyint(1) DEFAULT '0' COMMENT '是否被举报：0-未举报，1-已举报',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_wallpaper_id` (`wallpaper_id`),
  KEY `idx_user_type` (`user_type`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论表';