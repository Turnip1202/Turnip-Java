CREATE TABLE IF NOT EXISTS `wallpapers` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '壁纸ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `description` text COMMENT '描述',
  `category_id` int NOT NULL COMMENT '分类ID',
  `url` varchar(255) NOT NULL COMMENT '壁纸URL',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：0-待审，1-通过，2-拒绝',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` int DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='壁纸表';
