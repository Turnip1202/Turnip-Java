/*
 Navicat Premium Dump SQL

 Source Server         : MySQL84-3308
 Source Server Type    : MySQL
 Source Server Version : 80402 (8.4.2)
 Source Host           : localhost:3308
 Source Schema         : turnip-vue

 Target Server Type    : MySQL
 Target Server Version : 80402 (8.4.2)
 File Encoding         : 65001

 Date: 12/03/2025 15:51:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `real_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `password_salt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码盐值',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `gender` tinyint(1) NULL DEFAULT 0 COMMENT '性别：0-未知，1-男，2-女',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像URL',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '简介',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用，2-锁定，3-已删除',
  `role_id` int NULL DEFAULT NULL COMMENT '角色ID',
  `department_id` int NULL DEFAULT NULL COMMENT '部门ID',
  `register_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '注册IP',
  `login_attempts` int NULL DEFAULT 0 COMMENT '登录失败次数',
  `version` int NULL DEFAULT 1 COMMENT '乐观锁版本号',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `idx_phone`(`phone` ASC) USING BTREE,
  UNIQUE INDEX `idx_email`(`email` ASC) USING BTREE,
  INDEX `idx_department_id`(`department_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '后台用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, 'admin', 'Turnip', 'c5be0029024f3e44bb1af2a03f2d1e58', '94634f02532f4128b7f8', '17633505861', 'turnip1202@qq.com', 1, 'https://www.helloimg.com/i/2025/01/09/677f76c4af7e7.jpg', '1985-06-15', '超级管理员', 1, 1, 1, '192.168.1.100', 0, 1, '2023-01-01 09:00:00', '2025-02-23 01:36:24', NULL);

-- ----------------------------
-- Table structure for admin_user_login_history
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_login_history`;
CREATE TABLE `admin_user_login_history`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户ID',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `login_type` tinyint(1) NULL DEFAULT 1 COMMENT '登录类型：1-账号密码，2-手机验证码，3-微信，4-其他',
  `login_status` tinyint(1) NULL DEFAULT 1 COMMENT '登录状态：0-失败，1-成功',
  `device_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `user_agent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器代理信息',
  `login_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP归属地',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_login_time`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户登录历史记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user_login_history
-- ----------------------------
INSERT INTO `admin_user_login_history` VALUES (1, 1, '2025-01-06 21:55:09', '127.0.0.1', 1, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL, NULL);
INSERT INTO `admin_user_login_history` VALUES (2, 1, '2025-01-06 22:01:16', '127.0.0.1', 1, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL, NULL);
INSERT INTO `admin_user_login_history` VALUES (3, 1, '2025-01-07 10:27:43', '127.0.0.1', 1, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL, NULL);
INSERT INTO `admin_user_login_history` VALUES (4, 1, '2025-01-07 11:17:35', '127.0.0.1', 1, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL, NULL);
INSERT INTO `admin_user_login_history` VALUES (5, 1, '2025-01-07 11:32:06', '127.0.0.1', 1, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL, NULL);
INSERT INTO `admin_user_login_history` VALUES (6, 1, '2025-01-07 11:32:11', '127.0.0.1', 1, 1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL, NULL);
INSERT INTO `admin_user_login_history` VALUES (7, 1, '2025-01-07 11:33:12', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (8, 1, '2025-01-07 13:36:50', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (9, 1, '2025-01-07 13:36:56', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (10, 1, '2025-01-07 13:37:28', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (11, 1, '2025-01-07 13:38:15', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (12, 1, '2025-01-07 13:39:02', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (13, 1, '2025-01-07 13:39:09', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (14, 1, '2025-01-07 13:41:55', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (15, 1, '2025-01-07 13:45:27', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (16, 1, '2025-01-07 13:48:42', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (17, 1, '2025-01-09 19:59:57', '192.168.1.69', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (18, 1, '2025-01-09 20:13:37', '192.168.1.69', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (19, 1, '2025-01-09 20:15:57', '192.168.1.69', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (20, 1, '2025-01-09 20:16:02', '192.168.1.69', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (21, 1, '2025-01-09 20:33:26', '192.168.1.19', 1, 1, NULL, 'Mozilla/5.0 (Macintosh; CPU OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5.1 Mobile/15E148 Safari/604.1', NULL);
INSERT INTO `admin_user_login_history` VALUES (22, 1, '2025-01-09 21:09:19', '192.168.1.19', 1, 1, NULL, 'Mozilla/5.0 (Macintosh; CPU OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5.1 Mobile/15E148 Safari/604.1', NULL);
INSERT INTO `admin_user_login_history` VALUES (23, 1, '2025-01-09 21:09:51', '192.168.1.19', 1, 1, NULL, 'Mozilla/5.0 (Macintosh; CPU OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5.1 Mobile/15E148 Safari/604.1', NULL);
INSERT INTO `admin_user_login_history` VALUES (24, 1, '2025-01-09 21:10:11', '192.168.1.19', 1, 1, NULL, 'Mozilla/5.0 (Macintosh; CPU OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5.1 Mobile/15E148 Safari/604.1', NULL);
INSERT INTO `admin_user_login_history` VALUES (25, 1, '2025-01-09 21:10:13', '192.168.1.19', 1, 1, NULL, 'Mozilla/5.0 (Macintosh; CPU OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5.1 Mobile/15E148 Safari/604.1', NULL);
INSERT INTO `admin_user_login_history` VALUES (26, 1, '2025-01-09 21:10:14', '192.168.1.19', 1, 1, NULL, 'Mozilla/5.0 (Macintosh; CPU OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5.1 Mobile/15E148 Safari/604.1', NULL);
INSERT INTO `admin_user_login_history` VALUES (27, 1, '2025-01-09 21:10:14', '192.168.1.19', 1, 1, NULL, 'Mozilla/5.0 (Macintosh; CPU OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5.1 Mobile/15E148 Safari/604.1', NULL);
INSERT INTO `admin_user_login_history` VALUES (28, 1, '2025-01-09 21:10:14', '192.168.1.19', 1, 1, NULL, 'Mozilla/5.0 (Macintosh; CPU OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5.1 Mobile/15E148 Safari/604.1', NULL);
INSERT INTO `admin_user_login_history` VALUES (29, 1, '2025-01-09 21:10:14', '192.168.1.19', 1, 1, NULL, 'Mozilla/5.0 (Macintosh; CPU OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5.1 Mobile/15E148 Safari/604.1', NULL);
INSERT INTO `admin_user_login_history` VALUES (30, 1, '2025-01-09 21:10:15', '192.168.1.19', 1, 1, NULL, 'Mozilla/5.0 (Macintosh; CPU OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5.1 Mobile/15E148 Safari/604.1', NULL);
INSERT INTO `admin_user_login_history` VALUES (31, 1, '2025-01-09 21:10:15', '192.168.1.19', 1, 1, NULL, 'Mozilla/5.0 (Macintosh; CPU OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5.1 Mobile/15E148 Safari/604.1', NULL);
INSERT INTO `admin_user_login_history` VALUES (32, 1, '2025-01-09 21:10:28', '192.168.1.69', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (33, 1, '2025-01-09 21:11:06', '192.168.1.70', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (34, 1, '2025-01-09 21:11:33', '192.168.1.70', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (35, 1, '2025-01-09 21:12:17', '192.168.1.70', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (36, 1, '2025-01-09 21:12:21', '192.168.1.70', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (37, 1, '2025-01-09 21:14:48', '192.168.1.70', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (38, 1, '2025-01-09 21:15:09', '192.168.1.70', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (39, 1, '2025-01-09 21:16:34', '192.168.1.70', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (40, 1, '2025-01-09 21:18:32', '192.168.1.70', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (41, 1, '2025-01-09 21:19:41', '192.168.1.70', 1, 1, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:135.0) Gecko/20100101 Firefox/135.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (42, 1, '2025-02-19 14:29:27', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (43, 1, '2025-02-19 15:12:30', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (44, 12, '2025-02-19 16:50:53', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (45, 11, '2025-02-21 21:19:47', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (46, 11, '2025-02-21 22:44:04', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (47, 11, '2025-02-21 23:03:34', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (48, 11, '2025-02-23 00:31:56', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (49, 1, '2025-03-12 11:01:32', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0', NULL);
INSERT INTO `admin_user_login_history` VALUES (50, 1, '2025-03-12 11:35:05', '127.0.0.1', 1, 1, '\"Windows\"', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0', NULL);

-- ----------------------------
-- Table structure for admin_user_login_history_archive
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_login_history_archive`;
CREATE TABLE `admin_user_login_history_archive`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户ID',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `login_type` tinyint(1) NULL DEFAULT 1 COMMENT '登录类型：1-账号密码，2-手机验证码，3-微信，4-其他',
  `login_status` tinyint(1) NULL DEFAULT 1 COMMENT '登录状态：0-失败，1-成功',
  `device_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `user_agent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器代理信息',
  `login_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP归属地',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_login_time`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户登录历史记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user_login_history_archive
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '分类描述',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序顺序',
  `parent_id` int NULL DEFAULT NULL COMMENT '父分类ID',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_name`(`name` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `user_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '用户类型：1-普通用户，2-管理员，3-会员',
  `wallpaper_id` int NOT NULL COMMENT '壁纸ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0-待审，1-通过，2-拒绝',
  `parent_id` int NULL DEFAULT NULL COMMENT '父评论ID',
  `likes` int NULL DEFAULT 0 COMMENT '点赞数',
  `reported` tinyint(1) NULL DEFAULT 0 COMMENT '是否被举报：0-未举报，1-已举报',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_wallpaper_id`(`wallpaper_id` ASC) USING BTREE,
  INDEX `idx_user_type`(`user_type` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for download_limits
-- ----------------------------
DROP TABLE IF EXISTS `download_limits`;
CREATE TABLE `download_limits`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '下载限制ID',
  `user_type` tinyint(1) NOT NULL COMMENT '用户类型：1-普通用户，2-管理员，3-会员',
  `daily_limit` int NOT NULL COMMENT '每日下载限制',
  `monthly_limit` int NOT NULL COMMENT '每月下载限制',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_type`(`user_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '下载限制表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of download_limits
-- ----------------------------

-- ----------------------------
-- Table structure for event_registrations
-- ----------------------------
DROP TABLE IF EXISTS `event_registrations`;
CREATE TABLE `event_registrations`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '报名ID',
  `event_id` int NOT NULL COMMENT '活动ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `registration_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '报名时间',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0-取消，1-有效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_event`(`user_id` ASC, `event_id` ASC) USING BTREE,
  INDEX `idx_event_id`(`event_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_registration_time`(`registration_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '活动报名表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of event_registrations
-- ----------------------------

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0-草稿，1-发布，2-取消',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '活动类型：0-普通用户活动，1-会员用户活动',
  `max_participants` int NULL DEFAULT NULL COMMENT '最大参与人数',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time` ASC) USING BTREE,
  INDEX `idx_end_time`(`end_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of events
-- ----------------------------

-- ----------------------------
-- Table structure for favorites
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `wallpaper_id` int NOT NULL COMMENT '壁纸ID',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0-无效，1-有效',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_wallpaper`(`user_id` ASC, `wallpaper_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_wallpaper_id`(`wallpaper_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorites
-- ----------------------------

-- ----------------------------
-- Table structure for feedbacks
-- ----------------------------
DROP TABLE IF EXISTS `feedbacks`;
CREATE TABLE `feedbacks`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '反馈ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '反馈内容',
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '反馈类型：1-问题，2-建议，3-投诉',
  `priority` tinyint(1) NULL DEFAULT 1 COMMENT '优先级：0-低，1-中，2-高',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态：0-未处理，1-已处理',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '反馈时间',
  `processed_at` datetime NULL DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_type`(`type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedbacks
-- ----------------------------

-- ----------------------------
-- Table structure for member_points
-- ----------------------------
DROP TABLE IF EXISTS `member_points`;
CREATE TABLE `member_points`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '积分ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `points` int NOT NULL COMMENT '积分',
  `points_type` tinyint(1) NOT NULL COMMENT '积分类型：1-奖励积分，2-消费积分',
  `source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '积分来源',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0-无效，1-有效',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '获取时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员积分表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_points
-- ----------------------------

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `level` tinyint(1) NOT NULL COMMENT '会员等级',
  `expiry_date` date NOT NULL COMMENT '会员有效期',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0-无效，1-有效',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of members
-- ----------------------------

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_id` int NULL DEFAULT NULL COMMENT '父菜单ID',
  `menu_type` enum('directory','menu','button') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单类型（目录/菜单/按钮）',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '显示名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由路径',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所需权限标识',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_permission`(`permission` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, NULL, 'directory', '系统管理', 'system', NULL, 1, NULL, '2025-02-23 01:07:22', '2025-03-12 14:12:41');
INSERT INTO `menus` VALUES (2, 1, 'menu', '用户管理', 'user', '/system/users', 1, 'user:view', '2025-02-23 01:07:22', '2025-03-12 14:11:47');
INSERT INTO `menus` VALUES (3, 1, 'menu', '角色管理', 'role', '/system/roles', 12, 'role:view', '2025-02-23 01:07:22', '2025-02-23 01:07:22');
INSERT INTO `menus` VALUES (4, NULL, 'button', '删除用户', NULL, NULL, 0, 'user:delete', '2025-02-23 01:07:22', '2025-02-23 01:07:22');
INSERT INTO `menus` VALUES (5, NULL, 'directory', '高级管理', 'setting', NULL, 11, NULL, '2025-02-23 01:28:51', '2025-03-12 15:06:53');
INSERT INTO `menus` VALUES (6, 5, 'menu', '审计日志', NULL, NULL, 8, 'audit:view', '2025-02-23 01:28:51', '2025-03-12 14:13:31');
INSERT INTO `menus` VALUES (7, 5, 'button', '导出日志', NULL, NULL, 0, 'audit:export', '2025-02-23 01:28:51', '2025-02-23 01:28:51');
INSERT INTO `menus` VALUES (8, 1, 'menu', '菜单管理', NULL, '/system/menus', 6, 'system:menus', '2025-03-12 11:22:56', '2025-03-12 14:11:36');

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '通知ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '通知内容',
  `type` tinyint(1) NOT NULL COMMENT '通知类型：1-短信，2-邮件，3-推送',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态：0-未读，1-已读',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `read_at` datetime NULL DEFAULT NULL COMMENT '读取时间',
  `priority` tinyint(1) NULL DEFAULT 1 COMMENT '优先级：0-低，1-中，2-高',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE,
  INDEX `idx_type`(`type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notifications
-- ----------------------------

-- ----------------------------
-- Table structure for role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限标识',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permissions
-- ----------------------------
INSERT INTO `role_permissions` VALUES (1, 1, 'user:view', '2025-02-23 01:18:36', '2025-02-23 01:18:36');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '角色描述',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_superadmin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否超级管理员（0-否 1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '超级管理员', '拥有所有权限', '2025-02-23 01:27:13', '2025-02-23 01:27:13', 1);

-- ----------------------------
-- Table structure for spring_session
-- ----------------------------
DROP TABLE IF EXISTS `spring_session`;
CREATE TABLE `spring_session`  (
  `PRIMARY_ID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SESSION_ID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATION_TIME` bigint NOT NULL,
  `LAST_ACCESS_TIME` bigint NOT NULL,
  `MAX_INACTIVE_INTERVAL` int NOT NULL,
  `EXPIRY_TIME` bigint NOT NULL,
  `PRINCIPAL_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`) USING BTREE,
  UNIQUE INDEX `SPRING_SESSION_IX1`(`SESSION_ID` ASC) USING BTREE,
  INDEX `SPRING_SESSION_IX2`(`EXPIRY_TIME` ASC) USING BTREE,
  INDEX `SPRING_SESSION_IX3`(`PRINCIPAL_NAME` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spring_session
-- ----------------------------

-- ----------------------------
-- Table structure for spring_session_attributes
-- ----------------------------
DROP TABLE IF EXISTS `spring_session_attributes`;
CREATE TABLE `spring_session_attributes`  (
  `SESSION_PRIMARY_ID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`) USING BTREE,
  CONSTRAINT `spring_session_attributes_ibfk_1` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spring_session_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for system_logs
-- ----------------------------
DROP TABLE IF EXISTS `system_logs`;
CREATE TABLE `system_logs`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作类型',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '操作描述',
  `request_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求路径',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '请求参数',
  `response_status` int NULL DEFAULT NULL COMMENT '响应状态码',
  `device_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备类型',
  `browser_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '浏览器信息',
  `log_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日志级别',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模块或服务',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_created_at`(`created_at` ASC) USING BTREE,
  INDEX `idx_response_status`(`response_status` ASC) USING BTREE,
  INDEX `idx_log_level`(`log_level` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_logs
-- ----------------------------

-- ----------------------------
-- Table structure for user_downloads
-- ----------------------------
DROP TABLE IF EXISTS `user_downloads`;
CREATE TABLE `user_downloads`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '下载记录ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `wallpaper_id` int NOT NULL COMMENT '壁纸ID',
  `download_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下载时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_download_time`(`download_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户下载记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_downloads
-- ----------------------------

-- ----------------------------
-- Table structure for user_login_history
-- ----------------------------
DROP TABLE IF EXISTS `user_login_history`;
CREATE TABLE `user_login_history`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` int NOT NULL COMMENT '用户ID',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `login_type` tinyint(1) NULL DEFAULT 1 COMMENT '登录类型：1-用户名密码，2-第三方登录',
  `login_status` tinyint(1) NULL DEFAULT 1 COMMENT '登录状态：0-失败，1-成功',
  `device_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '设备类型',
  `user_agent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '浏览器代理信息',
  `login_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP归属地',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_login_time`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户登录历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_login_history
-- ----------------------------

-- ----------------------------
-- Table structure for user_profiles
-- ----------------------------
DROP TABLE IF EXISTS `user_profiles`;
CREATE TABLE `user_profiles`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `real_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `gender` tinyint(1) NULL DEFAULT 0 COMMENT '性别：0-未知，1-男，2-女',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像URL',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '简介',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `idx_phone`(`phone` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户扩展信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_profiles
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `password_salt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码盐值',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用，2-锁定，3-已删除',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `idx_email`(`email` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for wallpaper_reviews
-- ----------------------------
DROP TABLE IF EXISTS `wallpaper_reviews`;
CREATE TABLE `wallpaper_reviews`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '审核ID',
  `wallpaper_id` int NOT NULL COMMENT '壁纸ID',
  `reviewer_id` int NOT NULL COMMENT '审核员ID',
  `status` tinyint(1) NOT NULL COMMENT '审核状态：0-待审，1-通过，2-拒绝',
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '审核意见',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_wallpaper_id`(`wallpaper_id` ASC) USING BTREE,
  INDEX `idx_reviewer_id`(`reviewer_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '壁纸审核记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wallpaper_reviews
-- ----------------------------

-- ----------------------------
-- Table structure for wallpapers
-- ----------------------------
DROP TABLE IF EXISTS `wallpapers`;
CREATE TABLE `wallpapers`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '壁纸ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '描述',
  `category_id` int NOT NULL COMMENT '分类ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '壁纸URL',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态：0-待审，1-通过，2-拒绝',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_id`(`category_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '壁纸表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wallpapers
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
