
 CREATE TABLE IF NOT EXISTS `admin_user_login_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户ID',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `ip_address` varchar(45) DEFAULT NULL COMMENT 'IP地址',
  `login_type` tinyint(1) DEFAULT '1' COMMENT '登录类型：1-账号密码，2-手机验证码，3-微信，4-其他',
  `login_status` tinyint(1) DEFAULT '1' COMMENT '登录状态：0-失败，1-成功',
  `device_type` varchar(200) DEFAULT NULL COMMENT '设备类型',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '浏览器代理信息',
  `login_location` varchar(100) DEFAULT NULL COMMENT 'IP归属地',
  PRIMARY KEY (`id`),  -- id必须是第一个
  KEY `idx_user_id` (`user_id`),
  KEY `idx_login_time` (`login_time`)
) 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_general_ci 
COMMENT='用户登录历史记录';
-- PARTITION BY RANGE (TO_DAYS(login_time)) (
--     PARTITION p202301 VALUES LESS THAN (TO_DAYS('2023-02-01')),
--     PARTITION p202302 VALUES LESS THAN (TO_DAYS('2023-03-01')),
--     PARTITION p_max VALUES LESS THAN MAXVALUE
-- );


-- 创建归档表
CREATE TABLE `admin_user_login_history_archive` LIKE `admin_user_login_history`;

-- 定期执行归档脚本
INSERT INTO admin_user_login_history_archive 
SELECT * FROM admin_user_login_history 
WHERE login_time < DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH);

DELETE FROM admin_user_login_history 
WHERE login_time < DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH);
