
CREATE TABLE IF NOT EXISTS `event_registrations` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '报名ID',
  `event_id` int NOT NULL COMMENT '活动ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `registration_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '报名时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0-取消，1-有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_event` (`user_id`, `event_id`),
  KEY `idx_event_id` (`event_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_registration_time` (`registration_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动报名表';