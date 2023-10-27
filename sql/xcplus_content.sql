/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : xcplus_content

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 10/10/2023 12:04:27
*/
create database xcplus_content;
use xcplus_content;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course_base
-- ----------------------------
DROP TABLE IF EXISTS `course_base`;
CREATE TABLE `course_base`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_id` bigint NOT NULL COMMENT '机构ID',
  `company_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程名称',
  `users` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '适用人群',
  `tags` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程标签',
  `mt` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '大分类',
  `st` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '小分类',
  `grade` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程等级',
  `teachmode` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '教育模式(common普通，record 录播，live直播等）',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '课程介绍',
  `pic` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程图片',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `change_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_people` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `change_people` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `audit_status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '审核状态',
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1' COMMENT '课程发布状态 未发布  已发布 下线',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '课程基本信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_base
-- ----------------------------
-- ----------------------------
-- Table structure for course_category
-- ----------------------------
DROP TABLE IF EXISTS `course_category`;
CREATE TABLE `course_category`  (
  `id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '分类名称',
  `label` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类标签默认和名称一样',
  `parentid` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '父结点id（第一级的父节点是0，自关联字段id）',
  `is_show` tinyint NULL DEFAULT NULL COMMENT '是否显示',
  `orderby` int NULL DEFAULT NULL COMMENT '排序字段',
  `is_leaf` tinyint NULL DEFAULT NULL COMMENT '是否叶子',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '课程分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_category
-- ----------------------------
INSERT INTO `course_category` VALUES ('1', '根结点', '根结点', '0', 1, 1, 0);
INSERT INTO `course_category` VALUES ('1-1', '前端开发', '前端开发', '1', 1, 1, 0);
INSERT INTO `course_category` VALUES ('1-1-1', 'HTML/CSS', 'HTML/CSS', '1-1', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-1-10', '其它', '其它', '1-1', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-1-2', 'JavaScript', 'JavaScript', '1-1', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-1-3', 'jQuery', 'jQuery', '1-1', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-1-4', 'ExtJS', 'ExtJS', '1-1', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-1-5', 'AngularJS', 'AngularJS', '1-1', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-1-6', 'ReactJS', 'ReactJS', '1-1', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-1-7', 'Bootstrap', 'Bootstrap', '1-1', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-1-8', 'Node.js', 'Node.js', '1-1', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-1-9', 'Vue', 'Vue', '1-1', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-10', '研发管理', '研发管理', '1', 1, 10, 0);
INSERT INTO `course_category` VALUES ('1-10-1', '敏捷开发', '敏捷开发', '1-10', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-10-2', '软件设计', '软件设计', '1-10', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-10-3', '软件测试', '软件测试', '1-10', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-10-4', '研发管理', '研发管理', '1-10', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-10-5', '其它', '其它', '1-10', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-11', '系统运维', '系统运维', '1', 1, 11, 0);
INSERT INTO `course_category` VALUES ('1-11-1', 'Linux', 'Linux', '1-11', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-11-10', '其它', '其它', '1-11', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-11-2', 'Windows', 'Windows', '1-11', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-11-3', 'UNIX', 'UNIX', '1-11', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-11-4', 'Mac OS', 'Mac OS', '1-11', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-11-5', '网络技术', '网络技术', '1-11', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-11-6', '路由协议', '路由协议', '1-11', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-11-7', '无线网络', '无线网络', '1-11', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-11-8', 'Ngnix', 'Ngnix', '1-11', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-11-9', '邮件服务器', '邮件服务器', '1-11', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-12', '产品经理', '产品经理', '1', 1, 12, 0);
INSERT INTO `course_category` VALUES ('1-12-1', '交互设计', '交互设计', '1-12', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-12-2', '产品设计', '产品设计', '1-12', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-12-3', '原型设计', '原型设计', '1-12', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-12-4', '用户体验', '用户体验', '1-12', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-12-5', '需求分析', '需求分析', '1-12', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-12-6', '其它', '其它', '1-12', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-13', '企业/办公/职场', '企业/办公/职场', '1', 1, 13, 0);
INSERT INTO `course_category` VALUES ('1-13-1', '运营管理', '运营管理', '1-13', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-13-2', '企业信息化', '企业信息化', '1-13', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-13-3', '网络营销', '网络营销', '1-13', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-13-4', 'Office/WPS', 'Office/WPS', '1-13', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-13-5', '招聘/面试', '招聘/面试', '1-13', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-13-6', '电子商务', '电子商务', '1-13', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-13-7', 'CRM', 'CRM', '1-13', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-13-8', 'ERP', 'ERP', '1-13', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-13-9', '其它', '其它', '1-13', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-14', '信息安全', '信息安全', '1', 1, 14, 0);
INSERT INTO `course_category` VALUES ('1-14-1', '密码学/加密/破解', '密码学/加密/破解', '1-14', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-14-10', '其它', '其它', '1-14', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-14-2', '渗透测试', '渗透测试', '1-14', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-14-3', '社会工程', '社会工程', '1-14', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-14-4', '漏洞挖掘与利用', '漏洞挖掘与利用', '1-14', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-14-5', '云安全', '云安全', '1-14', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-14-6', '防护加固', '防护加固', '1-14', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-14-7', '代码审计', '代码审计', '1-14', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-14-8', '移动安全', '移动安全', '1-14', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-14-9', '病毒木马', '病毒木马', '1-14', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-15', '测试目录', '测试目录', '1', 1, 15, 0);
INSERT INTO `course_category` VALUES ('1-15-1', '测试目录01', '测试目录01', '1-15', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-2', '移动开发', '移动开发', '1', 1, 2, 0);
INSERT INTO `course_category` VALUES ('1-2-1', '微信开发', '微信开发', '1-2', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-2-2', 'iOS', 'iOS', '1-2', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-2-3', '手游开发', '手游开发', '1-2', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-2-4', 'Swift', 'Swift', '1-2', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-2-5', 'Android', 'Android', '1-2', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-2-6', 'ReactNative', 'ReactNative', '1-2', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-2-7', 'Cordova', 'Cordova', '1-2', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-2-8', '其它', '其它', '1-2', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-3', '编程开发', '编程开发', '1', 1, 3, 0);
INSERT INTO `course_category` VALUES ('1-3-1', 'C/C++', 'C/C++', '1-3', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-3-2', 'Java', 'Java', '1-3', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-3-3', '.NET', '.NET', '1-3', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-3-4', 'Objective-C', 'Objective-C', '1-3', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-3-5', 'Go语言', 'Go语言', '1-3', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-3-6', 'Python', 'Python', '1-3', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-3-7', 'Ruby/Rails', 'Ruby/Rails', '1-3', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-3-8', '其它', '其它', '1-3', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-4', '数据库', '数据库', '1', 1, 4, 0);
INSERT INTO `course_category` VALUES ('1-4-1', 'Oracle', 'Oracle', '1-4', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-4-2', 'MySQL', 'MySQL', '1-4', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-4-3', 'SQL Server', 'SQL Server', '1-4', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-4-4', 'DB2', 'DB2', '1-4', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-4-5', 'NoSQL', 'NoSQL', '1-4', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-4-6', 'Mongo DB', 'Mongo DB', '1-4', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-4-7', 'Hbase', 'Hbase', '1-4', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-4-8', '数据仓库', '数据仓库', '1-4', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-4-9', '其它', '其它', '1-4', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-5', '人工智能', '人工智能', '1', 1, 5, 0);
INSERT INTO `course_category` VALUES ('1-5-1', '机器学习', '机器学习', '1-5', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-5-2', '深度学习', '深度学习', '1-5', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-5-3', '语音识别', '语音识别', '1-5', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-5-4', '计算机视觉', '计算机视觉', '1-5', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-5-5', 'NLP', 'NLP', '1-5', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-5-6', '强化学习', '强化学习', '1-5', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-5-7', '其它', '其它', '1-5', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-6', '云计算/大数据', '云计算/大数据', '1', 1, 6, 0);
INSERT INTO `course_category` VALUES ('1-6-1', 'Spark', 'Spark', '1-6', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-6-2', 'Hadoop', 'Hadoop', '1-6', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-6-3', 'OpenStack', 'OpenStack', '1-6', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-6-4', 'Docker/K8S', 'Docker/K8S', '1-6', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-6-5', '云计算基础架构', '云计算基础架构', '1-6', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-6-6', '虚拟化技术', '虚拟化技术', '1-6', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-6-7', '云平台', '云平台', '1-6', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-6-8', 'ELK', 'ELK', '1-6', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-6-9', '其它', '其它', '1-6', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-7', 'UI设计', 'UI设计', '1', 1, 7, 0);
INSERT INTO `course_category` VALUES ('1-7-1', 'Photoshop', 'Photoshop', '1-7', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-7-10', 'InDesign', 'InDesign', '1-7', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-7-11', 'Pro/Engineer', 'Pro/Engineer', '1-7', 1, 11, 1);
INSERT INTO `course_category` VALUES ('1-7-12', 'Cinema 4D', 'Cinema 4D', '1-7', 1, 12, 1);
INSERT INTO `course_category` VALUES ('1-7-13', '3D Studio', '3D Studio', '1-7', 1, 13, 1);
INSERT INTO `course_category` VALUES ('1-7-14', 'After Effects（AE）', 'After Effects（AE）', '1-7', 1, 14, 1);
INSERT INTO `course_category` VALUES ('1-7-15', '原画设计', '原画设计', '1-7', 1, 15, 1);
INSERT INTO `course_category` VALUES ('1-7-16', '动画制作', '动画制作', '1-7', 1, 16, 1);
INSERT INTO `course_category` VALUES ('1-7-17', 'Dreamweaver', 'Dreamweaver', '1-7', 1, 17, 1);
INSERT INTO `course_category` VALUES ('1-7-18', 'Axure', 'Axure', '1-7', 1, 18, 1);
INSERT INTO `course_category` VALUES ('1-7-19', '其它', '其它', '1-7', 1, 19, 1);
INSERT INTO `course_category` VALUES ('1-7-2', '3Dmax', '3Dmax', '1-7', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-7-3', 'Illustrator', 'Illustrator', '1-7', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-7-4', 'Flash', 'Flash', '1-7', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-7-5', 'Maya', 'Maya', '1-7', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-7-6', 'AUTOCAD', 'AUTOCAD', '1-7', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-7-7', 'UG', 'UG', '1-7', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-7-8', 'SolidWorks', 'SolidWorks', '1-7', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-7-9', 'CorelDraw', 'CorelDraw', '1-7', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-8', '游戏开发', '游戏开发', '1', 1, 8, 0);
INSERT INTO `course_category` VALUES ('1-8-1', 'Cocos', 'Cocos', '1-8', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-8-2', 'Unity3D', 'Unity3D', '1-8', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-8-3', 'Flash', 'Flash', '1-8', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-8-4', 'SpriteKit 2D', 'SpriteKit 2D', '1-8', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-8-5', 'Unreal', 'Unreal', '1-8', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-8-6', '其它', '其它', '1-8', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-9', '智能硬件/物联网', '智能硬件/物联网', '1', 1, 9, 0);
INSERT INTO `course_category` VALUES ('1-9-1', '无线通信', '无线通信', '1-9', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-9-10', '物联网技术', '物联网技术', '1-9', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-9-11', '其它', '其它', '1-9', 1, 11, 1);
INSERT INTO `course_category` VALUES ('1-9-2', '电子工程', '电子工程', '1-9', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-9-3', 'Arduino', 'Arduino', '1-9', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-9-4', '体感技术', '体感技术', '1-9', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-9-5', '智能硬件', '智能硬件', '1-9', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-9-6', '驱动/内核开发', '驱动/内核开发', '1-9', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-9-7', '单片机/工控', '单片机/工控', '1-9', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-9-8', 'WinCE', 'WinCE', '1-9', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-9-9', '嵌入式', '嵌入式', '1-9', 1, 9, 1);

-- ----------------------------
-- Table structure for course_market
-- ----------------------------
DROP TABLE IF EXISTS `course_market`;
CREATE TABLE `course_market`  (
  `id` bigint NOT NULL COMMENT '主键，课程id',
  `charge` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收费规则，对应数据字典',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '现价',
  `original_price` float(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `qq` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '咨询qq',
  `wechat` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '微信',
  `phone` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话',
  `valid_days` int NULL DEFAULT NULL COMMENT '有效期天数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '课程营销信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_market
-- ----------------------------
-- ----------------------------
-- Table structure for course_publish
-- ----------------------------
DROP TABLE IF EXISTS `course_publish`;
CREATE TABLE `course_publish`  (
  `id` bigint NOT NULL COMMENT '主键',
  `company_id` bigint NOT NULL COMMENT '机构ID',
  `company_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程名称',
  `users` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '适用人群',
  `tags` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标签',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `mt` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '大分类',
  `mt_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '大分类名称',
  `st` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '小分类',
  `st_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '小分类名称',
  `grade` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程等级',
  `teachmode` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '教育模式',
  `pic` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程图片',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '课程介绍',
  `market` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '课程营销信息，json格式',
  `teachplan` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '所有课程计划，json格式',
  `teachers` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '教师信息，json格式',
  `create_date` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `online_date` datetime NULL DEFAULT NULL COMMENT '上架时间',
  `offline_date` datetime NULL DEFAULT NULL COMMENT '下架时间',
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '发布状态',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `charge` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收费规则，对应数据字典--203',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '现价',
  `original_price` float(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `valid_days` int NULL DEFAULT NULL COMMENT '课程有效期天数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '课程发布' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_publish
-- ----------------------------
-- ----------------------------
-- Table structure for course_publish_pre
-- ----------------------------
DROP TABLE IF EXISTS `course_publish_pre`;
CREATE TABLE `course_publish_pre`  (
  `id` bigint NOT NULL COMMENT '主键',
  `company_id` bigint NOT NULL COMMENT '机构ID',
  `company_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程名称',
  `users` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '适用人群',
  `tags` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标签',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `mt` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '大分类',
  `mt_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '大分类名称',
  `st` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '小分类',
  `st_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '小分类名称',
  `grade` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程等级',
  `teachmode` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '教育模式',
  `pic` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程图片',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '课程介绍',
  `market` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '课程营销信息，json格式',
  `teachplan` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '所有课程计划，json格式',
  `teachers` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '教师信息，json格式',
  `create_date` datetime NULL DEFAULT NULL COMMENT '提交时间',
  `audit_date` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '状态',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `charge` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '收费规则，对应数据字典--203',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '现价',
  `original_price` float(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `valid_days` int NULL DEFAULT NULL COMMENT '课程有效期天数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '课程发布' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_publish_pre
-- ----------------------------

-- ----------------------------
-- Table structure for course_teacher
-- ----------------------------
DROP TABLE IF EXISTS `course_teacher`;
CREATE TABLE `course_teacher`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `course_id` bigint NULL DEFAULT NULL COMMENT '课程标识',
  `teacher_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师标识',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师职位',
  `introduction` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师简介',
  `photograph` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '照片',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `courseid_teacherId_unique`(`course_id` ASC, `teacher_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程-教师关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_teacher
-- ----------------------------
-- ----------------------------
-- Table structure for mq_message
-- ----------------------------
DROP TABLE IF EXISTS `mq_message`;
CREATE TABLE `mq_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息类型代码: course_publish ,  media_test',
  `business_key1` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `execute_num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '通知次数',
  `state` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '处理状态，0:初始，1:成功',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `execute_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '阶段1处理状态, 0:初始，1:成功',
  `stage_state2` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '阶段2处理状态, 0:初始，1:成功',
  `stage_state3` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '阶段3处理状态, 0:初始，1:成功',
  `stage_state4` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '阶段4处理状态, 0:初始，1:成功',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message
-- ----------------------------

-- ----------------------------
-- Table structure for mq_message_history
-- ----------------------------
DROP TABLE IF EXISTS `mq_message_history`;
CREATE TABLE `mq_message_history`  (
  `id` bigint NOT NULL COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息类型代码',
  `business_key1` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `execute_num` int UNSIGNED NULL DEFAULT NULL COMMENT '通知次数',
  `state` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '处理状态，0:初始，1:成功，2:失败',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `execute_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stage_state2` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stage_state3` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stage_state4` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message_history
-- ----------------------------
INSERT INTO `mq_message_history` VALUES (74, 'course_publish', '134', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '0');

-- ----------------------------
-- Table structure for teachplan
-- ----------------------------
DROP TABLE IF EXISTS `teachplan`;
CREATE TABLE `teachplan`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pname` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程计划名称',
  `parentid` bigint NOT NULL COMMENT '课程计划父级Id',
  `grade` smallint NOT NULL COMMENT '层级，分为1、2、3级',
  `media_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '课程类型:1视频、2文档',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始直播时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '直播结束时间',
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '章节及课程时介绍',
  `timelength` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时长，单位时:分:秒',
  `orderby` int NULL DEFAULT 0 COMMENT '排序字段',
  `course_id` bigint NOT NULL COMMENT '课程标识',
  `course_pub_id` bigint NULL DEFAULT NULL COMMENT '课程发布标识',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态（1正常  0删除）',
  `is_preview` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '是否支持试学或预览（试看）',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `change_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 371 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '课程计划' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teachplan
-- ----------------------------
-- ----------------------------
-- Table structure for teachplan_media
-- ----------------------------
DROP TABLE IF EXISTS `teachplan_media`;
CREATE TABLE `teachplan_media`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `media_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '媒资文件id',
  `teachplan_id` bigint NOT NULL COMMENT '课程计划标识',
  `course_id` bigint NOT NULL COMMENT '课程标识',
  `media_fileName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '媒资文件原始名称',
  `create_date` datetime NULL DEFAULT NULL,
  `create_people` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `change_people` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teachplan_media
-- ----------------------------
SET FOREIGN_KEY_CHECKS = 1;
