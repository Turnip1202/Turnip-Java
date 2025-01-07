CREATE TABLE `admin_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `real_name` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `password_salt` varchar(32) DEFAULT NULL COMMENT '密码盐值',
  `phone` char(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `gender` tinyint(1) DEFAULT '0' COMMENT '性别：0-未知，1-男，2-女',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像URL',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` text COMMENT '简介',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0-禁用，1-启用，2-锁定，3-已删除',
  `role_id` int DEFAULT NULL COMMENT '角色ID',
  `department_id` int DEFAULT NULL COMMENT '部门ID',
  `register_ip` varchar(45) DEFAULT NULL COMMENT '注册IP',
  `login_attempts` int DEFAULT '0' COMMENT '登录失败次数',
  `version` int DEFAULT '1' COMMENT '乐观锁版本号',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  UNIQUE KEY `idx_phone` (`phone`),
  UNIQUE KEY `idx_email` (`email`),
  KEY `idx_department_id` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台用户表';

SHOW CREATE TABLE admin_user



INSERT INTO `admin_user` 
(`username`, `real_name`, `password`, `phone`, `email`, `gender`, 
`avatar`, `birthday`, `bio`, `status`, `role_id`, 
`department_id`, `register_ip`, `created_at`) 
VALUES 
-- 管理员账号
('admin', 'Turnip', '123456', '13901234567', 'zhangwei@example.com', 1, 
'https://example.com/avatars/1.jpg', '1985-06-15', '系统管理员，负责系统维护与管理', 1, 1, 
1, '192.168.1.100', '2023-01-01 09:00:00'),

-- 普通员工
('liuyang', '刘洋', '$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC', '13812345678', 'liuyang@example.com', 1, 
'https://example.com/avatars/2.jpg', '1990-03-22', '销售部主管，负责华东区销售', 1, 2, 
2, '192.168.1.101', '2023-02-15 10:30:00'),

('wangxiao', '王晓', '$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC', '13923456789', 'wangxiao@example.com', 2, 
'https://example.com/avatars/3.jpg', '1988-12-05', '人力资源专员，负责招聘与培训', 1, 2, 
3, '192.168.1.102', '2023-03-01 14:20:00'),

('zhangli', '张丽', '$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC', '13834567890', 'zhangli@example.com', 2, 
'https://example.com/avatars/4.jpg', '1992-09-18', '财务部会计，负责日常账务处理', 1, 2, 
4, '192.168.1.103', '2023-03-10 11:15:00'),

('chenming', '陈明', '$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC', '13745678901', 'chenming@example.com', 1, 
'https://example.com/avatars/5.jpg', '1987-07-30', '技术部开发工程师，全栈开发', 1, 2, 
5, '192.168.1.104', '2023-04-01 09:45:00'),

('linfei', '林飞', '$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC', '13656789012', 'linfei@example.com', 1, 
'https://example.com/avatars/6.jpg', '1991-11-11', '市场部经理，负责品牌推广', 1, 2, 
2, '192.168.1.105', '2023-04-15 16:30:00'),

('zhoujie', '周杰', '$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC', '13567890123', 'zhoujie@example.com', 1, 
'https://example.com/avatars/7.jpg', '1986-04-25', '研发部主管，负责产品研发', 1, 2, 
5, '192.168.1.106', '2023-05-01 13:20:00'),

-- 已离职员工
('wanghua', '王华', '$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC', '13478901234', 'wanghua@example.com', 1, 
'https://example.com/avatars/8.jpg', '1989-08-08', '前销售经理', 0, 2, 
2, '192.168.1.107', '2023-01-10 08:00:00'),

-- 锁定账号
('zhangsan', '张三', '$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC', '13389012345', 'zhangsan@example.com', 1, 
'https://example.com/avatars/9.jpg', '1993-05-20', '客服专员', 2, 2, 
3, '192.168.1.108', '2023-02-20 10:00:00'),

-- 新入职员工
('lixiang', '李想', '$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC', '13290123456', 'lixiang@example.com', 2, 
'https://example.com/avatars/10.jpg', '1995-12-25', '实习生，市场部', 1, 2, 
2, '192.168.1.109', NOW());