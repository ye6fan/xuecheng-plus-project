/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : xcplus_learning

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 10/10/2023 12:04:37
*/
create database xcplus_learning;
use xcplus_learning;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xc_choose_course
-- ----------------------------
DROP TABLE IF EXISTS `xc_choose_course`;
CREATE TABLE `xc_choose_course`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `course_id` bigint NOT NULL COMMENT '课程id',
  `course_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `company_id` bigint NOT NULL COMMENT '机构id',
  `order_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '选课类型',
  `create_date` datetime NOT NULL COMMENT '添加时间',
  `course_price` float(10, 2) NOT NULL COMMENT '课程价格',
  `valid_days` int NOT NULL COMMENT '课程有效期(天)',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '选课状态',
  `validtime_start` datetime NOT NULL COMMENT '开始服务时间',
  `validtime_end` datetime NOT NULL COMMENT '结束服务时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xc_choose_course
-- ----------------------------
INSERT INTO `xc_choose_course` VALUES (21, 141, 'Mybatis+Plus', '48', 1232141425, '700001', '2023-10-01 17:09:01', 0.00, 365, '701001', '2023-10-01 17:09:01', '2024-09-30 17:09:01', NULL);
INSERT INTO `xc_choose_course` VALUES (22, 142, '收费课程Html', '48', 1232141425, '700002', '2023-10-02 16:40:40', 1.00, 365, '701002', '2023-10-02 16:40:40', '2024-10-01 16:40:40', NULL);

-- ----------------------------
-- Table structure for xc_course_tables
-- ----------------------------
DROP TABLE IF EXISTS `xc_course_tables`;
CREATE TABLE `xc_course_tables`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `choose_course_id` bigint NOT NULL COMMENT '选课记录id',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `course_id` bigint NOT NULL COMMENT '课程id',
  `company_id` bigint NOT NULL COMMENT '机构id',
  `course_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称',
  `course_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程类型',
  `create_date` datetime NOT NULL COMMENT '添加时间',
  `validtime_start` datetime NULL DEFAULT NULL COMMENT '开始服务时间',
  `validtime_end` datetime NOT NULL COMMENT '到期时间',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `course_tables_unique`(`user_id` ASC, `course_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xc_course_tables
-- ----------------------------
INSERT INTO `xc_course_tables` VALUES (12, 21, '48', 141, 1232141425, 'Mybatis+Plus', '700001', '2023-10-01 17:09:01', '2023-10-01 17:09:01', '2024-09-30 17:09:01', '2023-10-01 17:09:15', NULL);

SET FOREIGN_KEY_CHECKS = 1;
