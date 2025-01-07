CREATE TABLE IF NOT EXISTS `members` (
  `user_id` int NOT NULL COMMENT '用户ID',
  `level` tinyint(1) NOT NULL COMMENT '会员等级',
  `expiry_date` date NOT NULL COMMENT '会员有效期',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0-无效，1-有效',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '加入时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员表';
