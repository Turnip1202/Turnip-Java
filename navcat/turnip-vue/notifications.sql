CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '通知ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `message` text NOT NULL COMMENT '通知内容',
  `type` tinyint(1) NOT NULL COMMENT '通知类型：1-短信，2-邮件，3-推送',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：0-未读，1-已读',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `read_at` datetime DEFAULT NULL COMMENT '读取时间',
  `priority` tinyint(1) DEFAULT '1' COMMENT '优先级：0-低，1-中，2-高',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='通知表';