CREATE TABLE IF NOT EXISTS `feedbacks` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '反馈ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `content` text NOT NULL COMMENT '反馈内容',
  `type` tinyint(1) DEFAULT '1' COMMENT '反馈类型：1-问题，2-建议，3-投诉',
  `priority` tinyint(1) DEFAULT '1' COMMENT '优先级：0-低，1-中，2-高',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：0-未处理，1-已处理',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '反馈时间',
  `processed_at` datetime DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_status` (`status`),
  KEY `idx_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='反馈表';