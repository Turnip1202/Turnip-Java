
CREATE TABLE IF NOT EXISTS `member_points` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '积分ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `points` int NOT NULL COMMENT '积分',
  `points_type` tinyint(1) NOT NULL COMMENT '积分类型：1-奖励积分，2-消费积分',
  `source` varchar(100) NOT NULL COMMENT '积分来源',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0-无效，1-有效',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '获取时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员积分表';