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
INSERT INTO `course_base` VALUES (124, 1232141425, 'itcast', '数据结构与算法', '在校大学生，前后端，工作人员都适合', '数据结构与算法', '1-3', '1-3-2', '204001', '200002', '数据结构与算法', '/mediafiles/2023/09/28/6bd0f3c52758b2a770e330816881f63e.png', '2023-09-26 19:34:14', '2023-10-07 18:11:54', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (125, 1232141425, 'itcast', '操作系统', '老少皆宜，帅的丑的都可以学习', '操作系统', '1-11', '1-11-1', '204001', '200002', '操作系统', '/mediafiles/2023/09/26/066e6e4a07dd3b6cb051827d645d181a.jpg', '2023-09-26 19:40:21', '2023-10-07 18:12:00', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (126, 1232141425, 'itcast', '数据库', '学习计算机的学生，备考的大学生，工作的人', '数据库', '1-4', '1-4-2', '204002', '200002', '数据库', '/mediafiles/2023/09/26/3a34c72c6c0702fa789c2a3c93daa95f.jpg', '2023-09-26 19:43:54', '2023-10-07 18:12:06', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (127, 1232141425, 'itcast', '计算机网络', '网络，老少皆宜，大学生备考，实习面试，工作人员', '计算机网络', '1-14', '1-14-5', '204002', '200002', '计算机网络', '/mediafiles/2023/09/26/8eb7435d9a4af4652c084a39859a6b19.jpg', '2023-09-26 19:47:01', '2023-10-07 18:12:11', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (128, 1232141425, 'itcast', 'JavaSE', 'SE，老少皆宜，大学生备考，实习面试，工作人员，学Java', 'JavaSE', '1-3', '1-3-2', '204002', '200002', 'JavaSE', '/mediafiles/2023/10/04/b7519b537e20f62cf75548d3ef4d450c.jpg', '2023-09-26 19:49:50', '2023-10-07 18:12:17', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (129, 1232141425, 'itcast', 'Mysql', 'mysql，数据库，老少皆宜，大学生备考，实习面试，工作人员', 'Mysql', '1-4', '1-4-2', '204002', '200002', 'Mysql', '/mediafiles/2023/10/03/9ebc6496fb911fbeca23e0212aec37b0.jpg', '2023-09-26 20:14:11', '2023-10-07 18:12:22', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (130, 1232141425, 'itcast', 'Spring', 'spring，老少皆宜，大学生备考，实习面试，工作人员', 'Spring', '1-3', '1-3-2', '204002', '200002', 'Spring', '/mediafiles/2023/10/03/eed540ba18d53447a2f705b41544f8ce.jpg', '2023-09-26 20:16:32', '2023-10-07 18:12:28', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (131, 1232141425, 'itcast', 'SpringBoot', 'SpringBoot，老少皆宜，大学生备考，实习面试，工作人员', 'SpringBoot', '1-3', '1-3-2', '204002', '200002', 'SpringBoot', '/mediafiles/2023/09/28/2539389f1a8ffd55af8f9fe6a481b2f6.jpg', '2023-09-26 20:18:43', '2023-10-07 18:12:37', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (132, 1232141425, 'itcast', 'SpringCloud', 'SpringCloud，老少皆宜，大学生备考，实习面试，工作人员', 'SpringCloud', '1-3', '1-3-2', '204002', '200002', 'SpringCloud', '/mediafiles/2023/10/06/63d0d6d79dc7d91974c4ac1114935286.png', '2023-09-26 20:21:21', '2023-10-06 16:51:17', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (133, 1232141425, 'itcast', 'Nginx', '转发nginx，老少皆宜，大学生备考，实习面试，工作人员', 'Nginx', '1-11', '1-11-8', '204003', '200002', 'Nginx', '/mediafiles/2023/09/28/794bde323dab0af293fe01c2602ce8a6.png', '2023-09-26 20:23:40', '2023-10-07 18:12:44', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (134, 1232141425, 'itcast', 'Redis', 'redis缓存，老少皆宜，大学生备考，实习面试，工作人员', 'Redis', '1-11', '1-11-1', '204002', '200002', 'Redis', '/mediafiles/2023/09/28/95469b77ad682989100fb1425b29ad6a.png', '2023-09-26 20:26:40', '2023-10-07 18:12:50', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (135, 1232141425, 'itcast', 'rabbitMQ', 'rabbitmq，老少皆宜，大学生备考，实习面试，工作人员，消息中间件', 'rabbitMQ', '1-11', '1-11-3', '204002', '200002', 'rabbitMQ', '/mediafiles/2023/09/26/fc0a1d1df0972457fd4556ddda0d47bb.png', '2023-09-26 20:29:21', '2023-10-07 18:13:14', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (136, 1232141425, 'itcast', 'linux', '服务器，老少皆宜，大学生备考，实习面试，工作人员，liunx是服务器的主要类型', 'linux', '1-11', '1-11-3', '204002', '200002', 'linux', '/mediafiles/2023/09/28/da3344239af2f54a13af3fef34941c3a.jpg', '2023-09-26 20:32:34', '2023-10-07 18:13:27', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (137, 1232141425, 'itcast', 'Git', 'git，老少皆宜，大学生备考，实习面试，工作人员，版本管理', 'Git', '1-11', '1-11-10', '204001', '200002', 'Git', '/mediafiles/2023/09/28/7a4b1e25afe99150f89255a684c7c0be.jpg', '2023-09-26 20:41:21', '2023-10-07 18:13:34', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (138, 1232141425, 'itcast', 'Docker', 'Docker，部署运维工程师，大学生也可以学', 'Docker', '1-11', '1-11-5', '204002', '200002', 'Docker', '/mediafiles/2023/09/28/9fa35195246927cac813a1e4c2e2f4cd.jpg', '2023-09-26 20:44:03', '2023-10-07 18:13:43', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (139, 1232141425, 'itcast', 'K8S', 'K8S适合学过Docker的人或学生', 'K8S', '1-11', '1-11-3', '204003', '200002', 'K8S', '/mediafiles/2023/09/28/6dd38195627e39e43b22397bb964ce6b.jpg', '2023-09-26 20:46:02', '2023-10-07 18:13:50', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (140, 1232141425, 'itcast', 'Maven', 'MAVEN适合初学Java的人，知道什么是导包', 'MAVEN', '1-10', '1-10-2', '204002', '200002', 'MAVEN', '/mediafiles/2023/09/28/f40ba549ded7370a7eb712b2beadfafc.jpg', '2023-09-26 20:49:11', '2023-10-07 18:13:58', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (141, 1232141425, 'itcast', 'Mybatis+Plus', '学过JDBC的学生，简化mysql开发', 'Mybatis+Plus', '1-10', '1-10-3', '204002', '200002', 'Mybatis+Plus', '/mediafiles/2023/09/28/fc077f1a13e4ce9c1e7840e4d83b33ee.jpg', '2023-09-26 20:56:56', '2023-10-07 18:14:06', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (142, 1232141425, 'itcast', '收费课程Html', '适合前端，和后端htnl基础', 'Html', '1-1', '1-1-1', '204001', '200002', 'Html', '/mediafiles/2023/09/28/1af80735f50cd03e3f8ddba8c10f93a3.jpg', '2023-09-26 21:23:57', '2023-10-07 18:11:40', NULL, NULL, '202004', '203001');

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
INSERT INTO `course_market` VALUES (124, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (125, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (126, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (127, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (128, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (129, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (130, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (131, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (132, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (133, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (134, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (135, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (136, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (137, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (138, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (139, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (140, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (141, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (142, '201001', 1.00, 10.00, '123456789', '123456789', '123456789', 365);

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
INSERT INTO `course_publish` VALUES (124, 1232141425, 'itcast', '数据结构与算法', '在校大学生，前后端，工作人员都适合', '数据结构与算法', NULL, '1-3', '编程开发', '1-3-2', 'Java', '204001', '200002', '/mediafiles/2023/09/28/6bd0f3c52758b2a770e330816881f63e.png', '数据结构与算法', 'null', '[{\"courseId\":124,\"grade\":1,\"id\":301,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"第一章：数据结构\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":124,\"grade\":2,\"id\":303,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":301,\"pname\":\"1.1的数据结构\",\"status\":1,\"teachplanMedia\":{\"courseId\":124,\"id\":102,\"mediaFilename\":\"租界女友.mp4\",\"mediaId\":\"3d6db8efc173ff2996a590682e750a28\",\"teachplanId\":303}},{\"courseId\":124,\"grade\":2,\"id\":304,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":301,\"pname\":\"1.2的数据结构\",\"status\":1,\"teachplanMedia\":{\"courseId\":124,\"id\":63,\"mediaFilename\":\"老动漫痛.mp4\",\"mediaId\":\"0bddb723b8e66fe5de9e606df099ae93\",\"teachplanId\":304}}]},{\"courseId\":124,\"grade\":1,\"id\":302,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":0,\"pname\":\"第二章：算法\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":124,\"grade\":2,\"id\":305,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":302,\"pname\":\"2.1的算法\",\"status\":1,\"teachplanMedia\":{\"courseId\":124,\"id\":64,\"mediaFilename\":\"封印解除.mp4\",\"mediaId\":\"3ed9d0e0349c7fce14371dbc4d3bbc92\",\"teachplanId\":305}}]}]', '{\"courseId\":124,\"createDate\":\"2023-09-26T19:39:13\",\"id\":22,\"introduction\":\"长得帅，人好\",\"photograph\":\"/mediafiles/2023/09/26/8324f5241f6c8b4a501a11a8b3d8c257.png\",\"position\":\"大学老师\",\"teacherName\":\"李老师\"}', '2023-09-28 18:31:10', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (125, 1232141425, 'itcast', '操作系统', '老少皆宜，帅的丑的都可以学习', '操作系统', NULL, '1-11', '系统运维', '1-11-1', 'Linux', '204001', '200002', '/mediafiles/2023/09/26/066e6e4a07dd3b6cb051827d645d181a.jpg', '操作系统', 'null', '[{\"courseId\":125,\"grade\":1,\"id\":306,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"操作系统\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":125,\"grade\":2,\"id\":307,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":306,\"pname\":\"硬件基础知识\",\"status\":1,\"teachplanMedia\":{\"courseId\":125,\"id\":65,\"mediaFilename\":\"火影忍者1.mp4\",\"mediaId\":\"4769d6c34dd261dfcce98a96c288066d\",\"teachplanId\":307}},{\"courseId\":125,\"grade\":2,\"id\":308,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":306,\"pname\":\"软件操作系统\",\"status\":1,\"teachplanMedia\":{\"courseId\":125,\"id\":66,\"mediaFilename\":\"为什么要说活下去.mp4\",\"mediaId\":\"644a7b820eba347f984f3e26b78df672\",\"teachplanId\":308}}]}]', '{\"courseId\":125,\"createDate\":\"2023-09-26T19:42:23\",\"id\":23,\"introduction\":\"人好，人帅，讲课详细\",\"photograph\":\"/mediafiles/2023/09/26/cb97c56312f15354b07e00bb60e057f7.jpg\",\"position\":\"大学教授\",\"teacherName\":\"王老师\"}', '2023-10-04 16:25:22', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (126, 1232141425, 'itcast', '数据库', '学习计算机的学生，备考的大学生，工作的人', '数据库', NULL, '1-4', '数据库', '1-4-2', 'MySQL', '204002', '200002', '/mediafiles/2023/09/26/3a34c72c6c0702fa789c2a3c93daa95f.jpg', '数据库', 'null', '[{\"courseId\":126,\"grade\":1,\"id\":309,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"数据库\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":126,\"grade\":2,\"id\":310,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":309,\"pname\":\"数据库基础知识\",\"status\":1,\"teachplanMedia\":{\"courseId\":126,\"id\":67,\"mediaFilename\":\"火影忍者巨人.mp4\",\"mediaId\":\"66d9300a9c12b22a4ec9854bac83ee6f\",\"teachplanId\":310}},{\"courseId\":126,\"grade\":2,\"id\":311,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":309,\"pname\":\"SQL语言\",\"status\":1,\"teachplanMedia\":{\"courseId\":126,\"id\":122,\"mediaFilename\":\"老动漫痛.mp4\",\"mediaId\":\"0bddb723b8e66fe5de9e606df099ae93\",\"teachplanId\":311}}]}]', '{\"courseId\":126,\"createDate\":\"2023-09-26T19:45:46\",\"id\":24,\"introduction\":\"研究生导师的苏，科研成果大\",\"photograph\":\"/mediafiles/2023/09/26/bc0e82c56bfd93b46bb99c248ba347a8.png\",\"position\":\"研究生导师\",\"teacherName\":\"苏老师\"}', '2023-10-04 16:14:08', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (127, 1232141425, 'itcast', '计算机网络', '网络，老少皆宜，大学生备考，实习面试，工作人员', '计算机网络', NULL, '1-14', '信息安全', '1-14-5', '云安全', '204002', '200002', '/mediafiles/2023/09/26/8eb7435d9a4af4652c084a39859a6b19.jpg', '计算机网络', 'null', '[{\"courseId\":127,\"grade\":1,\"id\":312,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"计算机网络\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":127,\"grade\":2,\"id\":313,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":312,\"pname\":\"7层模型\",\"status\":1,\"teachplanMedia\":{\"courseId\":127,\"id\":69,\"mediaFilename\":\"登月巨人.mp4\",\"mediaId\":\"688175374846f1ec48d461ce17e67203\",\"teachplanId\":313}},{\"courseId\":127,\"grade\":2,\"id\":314,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":312,\"pname\":\"4层模型\",\"status\":1,\"teachplanMedia\":{\"courseId\":127,\"id\":70,\"mediaFilename\":\"赛博朋克1.mp4\",\"mediaId\":\"6f51d13788bbbb38822b75cb01121c5b\",\"teachplanId\":314}}]}]', '{\"courseId\":127,\"createDate\":\"2023-09-26T19:48:39\",\"id\":25,\"introduction\":\"大学老师的张，家庭富裕\",\"photograph\":\"/mediafiles/2023/09/26/9336d067305378bed0b572c8eef4c0cb.jpg\",\"position\":\"大学老师\",\"teacherName\":\"张老师\"}', '2023-10-01 11:54:48', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (128, 1232141425, 'itcast', 'JavaSE', 'SE，老少皆宜，大学生备考，实习面试，工作人员，学Java', 'JavaSE', NULL, '1-3', '编程开发', '1-3-2', 'Java', '204002', '200002', '/mediafiles/2023/10/04/b7519b537e20f62cf75548d3ef4d450c.jpg', 'JavaSE', 'null', '[{\"courseId\":128,\"grade\":1,\"id\":315,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"第一章：认识JavaSE\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":128,\"grade\":2,\"id\":320,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":315,\"pname\":\"第一节：Java是什么\",\"status\":1,\"teachplanMedia\":{\"courseId\":128,\"id\":73,\"mediaFilename\":\"爱情再见.mp4\",\"mediaId\":\"7cf946ac23b0d63c1dc912ad5b57bb76\",\"teachplanId\":320}}]},{\"courseId\":128,\"grade\":1,\"id\":318,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":0,\"pname\":\"第二章：实战JavaSE\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":128,\"grade\":2,\"id\":319,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":318,\"pname\":\"第一节：实战JavaSE\",\"status\":1,\"teachplanMedia\":{\"courseId\":128,\"id\":120,\"mediaFilename\":\"美丽的世界.mp4\",\"mediaId\":\"774f9ea6ba51730c166039eca6e5823c\",\"teachplanId\":319}}]}]', '{\"courseId\":128,\"createDate\":\"2023-09-26T19:52:56\",\"id\":26,\"introduction\":\"刘家的老师，性格温和\",\"photograph\":\"/mediafiles/2023/09/26/9a025bc5e91499a9108850340bab6bb1.jpg\",\"position\":\"大学讲师\",\"teacherName\":\"刘老师\"}', '2023-10-04 16:15:58', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (129, 1232141425, 'itcast', 'Mysql', 'mysql，数据库，老少皆宜，大学生备考，实习面试，工作人员', 'Mysql', NULL, '1-4', '数据库', '1-4-2', 'MySQL', '204002', '200002', '/mediafiles/2023/10/03/9ebc6496fb911fbeca23e0212aec37b0.jpg', 'Mysql', 'null', '[{\"courseId\":129,\"grade\":1,\"id\":321,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"MYSQL\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":129,\"grade\":2,\"id\":322,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":321,\"pname\":\"第一小节：MYSQL\",\"status\":1,\"teachplanMedia\":{\"courseId\":129,\"id\":112,\"mediaFilename\":\"火影忍者1.mp4\",\"mediaId\":\"4769d6c34dd261dfcce98a96c288066d\",\"teachplanId\":322}},{\"courseId\":129,\"grade\":2,\"id\":323,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":321,\"pname\":\"第二小节：MYSQL\",\"status\":1,\"teachplanMedia\":{\"courseId\":129,\"id\":113,\"mediaFilename\":\"封印解除.mp4\",\"mediaId\":\"3ed9d0e0349c7fce14371dbc4d3bbc92\",\"teachplanId\":323}}]}]', '{\"courseId\":129,\"createDate\":\"2023-09-26T20:15:35\",\"id\":27,\"introduction\":\"大学老师，淳朴，好人\",\"photograph\":\"/mediafiles/2023/09/26/c594139dc03414dabca8401f3e751ff8.png\",\"position\":\"大学老师\",\"teacherName\":\"顾老师\"}', '2023-10-03 13:41:25', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (130, 1232141425, 'itcast', 'Spring', 'spring，老少皆宜，大学生备考，实习面试，工作人员', 'Spring', NULL, '1-3', '编程开发', '1-3-2', 'Java', '204002', '200002', '/mediafiles/2023/10/03/eed540ba18d53447a2f705b41544f8ce.jpg', 'Spring', 'null', '[{\"courseId\":130,\"grade\":1,\"id\":324,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"IOC\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":130,\"grade\":2,\"id\":325,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":324,\"pname\":\"第一节：IOC\",\"status\":1,\"teachplanMedia\":{\"courseId\":130,\"id\":76,\"mediaFilename\":\"拔刀.mp4\",\"mediaId\":\"c601d1fa8838ccc9931b192e228dcd8a\",\"teachplanId\":325}}]},{\"courseId\":130,\"grade\":1,\"id\":326,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":0,\"pname\":\"AOP\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":130,\"grade\":2,\"id\":327,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":326,\"pname\":\"第一节：AOP\",\"status\":1,\"teachplanMedia\":{\"courseId\":130,\"id\":77,\"mediaFilename\":\"四大青年漫.mp4\",\"mediaId\":\"c801b39717c1704b624d4b502042f6cb\",\"teachplanId\":327}}]}]', '{\"courseId\":130,\"createDate\":\"2023-09-26T20:18:12\",\"id\":28,\"introduction\":\"人高马大，讲课细节\",\"photograph\":\"/mediafiles/2023/09/26/452f8ce731c586846600dfd3ac587f16.png\",\"position\":\"大学教授\",\"teacherName\":\"王老师\"}', '2023-10-03 13:33:22', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (131, 1232141425, 'itcast', 'SpringBoot', 'SpringBoot，老少皆宜，大学生备考，实习面试，工作人员', 'SpringBoot', NULL, '1-3', '编程开发', '1-3-2', 'Java', '204002', '200002', '/mediafiles/2023/09/28/2539389f1a8ffd55af8f9fe6a481b2f6.jpg', 'SpringBoot', 'null', '[{\"courseId\":131,\"grade\":1,\"id\":328,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"SpringBoot\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":131,\"grade\":2,\"id\":329,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":328,\"pname\":\"自动配置bean\",\"status\":1,\"teachplanMedia\":{\"courseId\":131,\"id\":114,\"mediaFilename\":\"反方向的钟.mp4\",\"mediaId\":\"31c175d8ce9f4c9daf9b687803af2f45\",\"teachplanId\":329}},{\"courseId\":131,\"grade\":2,\"id\":330,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":328,\"pname\":\"整合各种各样中间件和程序\",\"status\":1,\"teachplanMedia\":{\"courseId\":131,\"id\":79,\"mediaFilename\":\"火影忍者3.mp4\",\"mediaId\":\"e57355f60a75076e792f6b686d533e44\",\"teachplanId\":330}}]}]', '{\"courseId\":131,\"createDate\":\"2023-09-26T20:20:41\",\"id\":29,\"introduction\":\"研究生导师，德高望重\",\"photograph\":\"/mediafiles/2023/09/26/7d463af612843b80126ec7fa312d3bf9.png\",\"position\":\"研究生导师\",\"teacherName\":\"吴老师\"}', '2023-10-03 13:44:08', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (132, 1232141425, 'itcast', 'SpringCloud', 'SpringCloud，老少皆宜，大学生备考，实习面试，工作人员', 'SpringCloud', NULL, '1-3', '编程开发', '1-3-2', 'Java', '204002', '200002', '/mediafiles/2023/10/06/63d0d6d79dc7d91974c4ac1114935286.png', 'SpringCloud', 'null', '[{\"courseId\":132,\"grade\":1,\"id\":331,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"SpringCloud\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":132,\"grade\":2,\"id\":333,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":331,\"pname\":\"第一节：Cloud\",\"status\":1,\"teachplanMedia\":{\"courseId\":132,\"id\":80,\"mediaFilename\":\"火影忍者3.mp4\",\"mediaId\":\"e57355f60a75076e792f6b686d533e44\",\"teachplanId\":333}}]},{\"courseId\":132,\"grade\":1,\"id\":332,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":0,\"pname\":\"SpringCloudAlibaba\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":132,\"grade\":2,\"id\":334,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":332,\"pname\":\"第一节：CloudAlibaba\",\"status\":1,\"teachplanMedia\":{\"courseId\":132,\"id\":125,\"mediaFilename\":\"onelastkiss.mp4\",\"mediaId\":\"03d203e8026d8dcf300b40459cc00b69\",\"teachplanId\":334}}]}]', '{\"courseId\":132,\"createDate\":\"2023-09-26T20:22:53\",\"id\":30,\"introduction\":\"博士生导师，可爱，学问高\",\"photograph\":\"/mediafiles/2023/09/26/3071d7ae415d7032334173bd4e8a28e0.png\",\"position\":\"博士生导师\",\"teacherName\":\"可老师\"}', '2023-10-06 16:51:48', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (133, 1232141425, 'itcast', 'Nginx', '转发nginx，老少皆宜，大学生备考，实习面试，工作人员', 'Nginx', NULL, '1-11', '系统运维', '1-11-8', 'Ngnix', '204003', '200002', '/mediafiles/2023/09/28/794bde323dab0af293fe01c2602ce8a6.png', 'Nginx', 'null', '[{\"courseId\":133,\"grade\":1,\"id\":335,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"第一章：网络通信\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":133,\"grade\":2,\"id\":337,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":335,\"pname\":\"网络通信第一节\",\"status\":1,\"teachplanMedia\":{\"courseId\":133,\"id\":82,\"mediaFilename\":\"108部动漫.mp4\",\"mediaId\":\"f410c202315dc975056f11bfab529cec\",\"teachplanId\":337}}]},{\"courseId\":133,\"grade\":1,\"id\":336,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":0,\"pname\":\"第二章：nginx\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":133,\"grade\":2,\"id\":338,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":336,\"pname\":\"nginx实战\",\"status\":1,\"teachplanMedia\":{\"courseId\":133,\"id\":116,\"mediaFilename\":\"美丽的世界.mp4\",\"mediaId\":\"774f9ea6ba51730c166039eca6e5823c\",\"teachplanId\":338}}]}]', '{\"courseId\":133,\"createDate\":\"2023-09-26T20:25:39\",\"id\":31,\"introduction\":\"研究生导师，人好看，教学严谨\",\"photograph\":\"/mediafiles/2023/09/26/f33d8b7c92a7c8a174da9e62ffce1467.png\",\"position\":\"研究生导师\",\"teacherName\":\"凝老师\"}', '2023-10-03 13:48:55', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (134, 1232141425, 'itcast', 'Redis', 'redis缓存，老少皆宜，大学生备考，实习面试，工作人员', 'Redis', NULL, '1-11', '系统运维', '1-11-1', 'Linux', '204002', '200002', '/mediafiles/2023/09/28/95469b77ad682989100fb1425b29ad6a.png', 'Redis', 'null', '[{\"courseId\":134,\"grade\":1,\"id\":339,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"第一章初识redis\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":134,\"grade\":2,\"id\":340,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":339,\"pname\":\"redis是缓存中间件\",\"status\":1,\"teachplanMedia\":{\"courseId\":134,\"id\":126,\"mediaFilename\":\"dieforyou.mp4\",\"mediaId\":\"608ecdf90c41ffcc8bccc0188976c800\",\"teachplanId\":340}}]},{\"courseId\":134,\"grade\":1,\"id\":341,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":0,\"pname\":\"第二章实战redis\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":134,\"grade\":2,\"id\":342,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":341,\"pname\":\"springboot整合redis缓存\",\"status\":1,\"teachplanMedia\":{\"courseId\":134,\"id\":85,\"mediaFilename\":\"jojo.mp4\",\"mediaId\":\"07426fc0ea03d7c9c3af99df4b7527e1\",\"teachplanId\":342}}]}]', '{\"courseId\":134,\"createDate\":\"2023-09-26T20:28:37\",\"id\":32,\"introduction\":\"大学教授的魈，教学严格\",\"photograph\":\"/mediafiles/2023/09/26/58c5c25af3e5c10926a480358a8f2a6a.jpg\",\"position\":\"大学教授\",\"teacherName\":\"魈老师\"}', '2023-10-07 18:13:07', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (135, 1232141425, 'itcast', 'rabbitMQ', 'rabbitmq，老少皆宜，大学生备考，实习面试，工作人员，消息中间件', 'rabbitMQ', NULL, '1-11', '系统运维', '1-11-3', 'UNIX', '204002', '200002', '/mediafiles/2023/09/26/fc0a1d1df0972457fd4556ddda0d47bb.png', 'rabbitMQ', 'null', '[{\"courseId\":135,\"grade\":1,\"id\":343,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"消息中间件\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":135,\"grade\":2,\"id\":344,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":343,\"pname\":\"消息中间件有哪些\",\"status\":1,\"teachplanMedia\":{\"courseId\":135,\"id\":103,\"mediaFilename\":\"知识就是力量.mp4\",\"mediaId\":\"8dcbe59d5a5b5cd5b8596b417e86cb37\",\"teachplanId\":344}},{\"courseId\":135,\"grade\":2,\"id\":345,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":343,\"pname\":\"rabbitMQ\",\"status\":1,\"teachplanMedia\":{\"courseId\":135,\"id\":87,\"mediaFilename\":\"封印解除.mp4\",\"mediaId\":\"3ed9d0e0349c7fce14371dbc4d3bbc92\",\"teachplanId\":345}}]}]', '{\"courseId\":135,\"createDate\":\"2023-09-26T20:30:54\",\"id\":33,\"introduction\":\"研究生导师，喜欢和学生交流\",\"photograph\":\"/mediafiles/2023/09/26/a9fa22de59287b5f138743646dcdaa08.jpg\",\"position\":\"研究生导师\",\"teacherName\":\"英老师\"}', '2023-10-04 16:26:41', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (136, 1232141425, 'itcast', 'linux', '服务器，老少皆宜，大学生备考，实习面试，工作人员，liunx是服务器的主要类型', 'linux', NULL, '1-11', '系统运维', '1-11-3', 'UNIX', '204002', '200002', '/mediafiles/2023/09/28/da3344239af2f54a13af3fef34941c3a.jpg', 'linux', 'null', '[{\"courseId\":136,\"grade\":1,\"id\":346,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"linux\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":136,\"grade\":2,\"id\":347,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":346,\"pname\":\"liunx是操作系统\",\"status\":1,\"teachplanMedia\":{\"courseId\":136,\"id\":104,\"mediaFilename\":\"伤感.mp4\",\"mediaId\":\"b397791757db5048d0ef85a7f77a4624\",\"teachplanId\":347}},{\"courseId\":136,\"grade\":2,\"id\":348,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":346,\"pname\":\"liunx实战\",\"status\":1,\"teachplanMedia\":{\"courseId\":136,\"id\":89,\"mediaFilename\":\"为什么要说活下去.mp4\",\"mediaId\":\"644a7b820eba347f984f3e26b78df672\",\"teachplanId\":348}}]}]', '{\"courseId\":136,\"createDate\":\"2023-09-26T20:40:34\",\"id\":34,\"introduction\":\"博士生导师，喜欢打篮球\",\"photograph\":\"/mediafiles/2023/09/26/0c634a510c2a1d1bbb50137689394f06.png\",\"position\":\"博士生导师\",\"teacherName\":\"蔡老师\"}', '2023-09-28 18:38:44', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (137, 1232141425, 'itcast', 'Git', 'git，老少皆宜，大学生备考，实习面试，工作人员，版本管理', 'Git', NULL, '1-11', '系统运维', '1-11-10', '其它', '204001', '200002', '/mediafiles/2023/09/28/7a4b1e25afe99150f89255a684c7c0be.jpg', 'Git', 'null', '[{\"courseId\":137,\"grade\":1,\"id\":349,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"版本管理\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":137,\"grade\":2,\"id\":350,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":349,\"pname\":\"第一节：git是什么\",\"status\":1,\"teachplanMedia\":{\"courseId\":137,\"id\":105,\"mediaFilename\":\"你潮吗.mp4\",\"mediaId\":\"af834a1b1b5a6c60006dcab8f11d5a4a\",\"teachplanId\":350}},{\"courseId\":137,\"grade\":2,\"id\":351,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":349,\"pname\":\"第二节：github实战\",\"status\":1,\"teachplanMedia\":{\"courseId\":137,\"id\":121,\"mediaFilename\":\"美丽的世界.mp4\",\"mediaId\":\"774f9ea6ba51730c166039eca6e5823c\",\"teachplanId\":351}}]}]', '{\"courseId\":137,\"createDate\":\"2023-09-26T20:43:06\",\"id\":35,\"introduction\":\"高老师，各个方面都高\",\"photograph\":\"/mediafiles/2023/09/26/b491d2cd3c7170e54cd3798d4d7d4d6c.jpg\",\"position\":\"高老师\",\"teacherName\":\"高老师\"}', '2023-10-03 13:54:09', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (138, 1232141425, 'itcast', 'Docker', 'Docker，部署运维工程师，大学生也可以学', 'Docker', NULL, '1-11', '系统运维', '1-11-5', '网络技术', '204002', '200002', '/mediafiles/2023/09/28/9fa35195246927cac813a1e4c2e2f4cd.jpg', 'Docker', 'null', '[{\"courseId\":138,\"grade\":1,\"id\":352,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"Docker\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":138,\"grade\":2,\"id\":353,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":352,\"pname\":\"Docker是什么\",\"status\":1,\"teachplanMedia\":{\"courseId\":138,\"id\":106,\"mediaFilename\":\"媚宅.mp4\",\"mediaId\":\"6ed6665bfb130deb7ba2a0eacc72a5ae\",\"teachplanId\":353}},{\"courseId\":138,\"grade\":2,\"id\":354,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":352,\"pname\":\"如何用docker部署mysql\",\"status\":1,\"teachplanMedia\":{\"courseId\":138,\"id\":93,\"mediaFilename\":\"赛博朋克1.mp4\",\"mediaId\":\"6f51d13788bbbb38822b75cb01121c5b\",\"teachplanId\":354}}]}]', '{\"courseId\":138,\"createDate\":\"2023-09-26T20:45:07\",\"id\":36,\"introduction\":\"赛老师，为人正直\",\"photograph\":\"/mediafiles/2023/09/26/f57bf24393fa9cb6bdcd588ff6be014b.jpg\",\"position\":\"赛老师\",\"teacherName\":\"赛老师\"}', '2023-09-28 18:22:42', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (139, 1232141425, 'itcast', 'K8S', 'K8S适合学过Docker的人或学生', 'K8S', NULL, '1-11', '系统运维', '1-11-3', 'UNIX', '204003', '200002', '/mediafiles/2023/09/28/6dd38195627e39e43b22397bb964ce6b.jpg', 'K8S', 'null', '[{\"courseId\":139,\"grade\":1,\"id\":355,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"第一章：复习Docker\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":139,\"grade\":2,\"id\":356,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":355,\"pname\":\"docker命令复习\",\"status\":1,\"teachplanMedia\":{\"courseId\":139,\"id\":115,\"mediaFilename\":\"美丽的世界.mp4\",\"mediaId\":\"774f9ea6ba51730c166039eca6e5823c\",\"teachplanId\":356}}]},{\"courseId\":139,\"grade\":1,\"id\":357,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":0,\"pname\":\"第二章：K8S\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":139,\"grade\":2,\"id\":358,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":357,\"pname\":\"k8s是什么\",\"status\":1,\"teachplanMedia\":{\"courseId\":139,\"id\":94,\"mediaFilename\":\"爱情再见.mp4\",\"mediaId\":\"7cf946ac23b0d63c1dc912ad5b57bb76\",\"teachplanId\":358}},{\"courseId\":139,\"grade\":2,\"id\":359,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":357,\"pname\":\"ks实战\",\"status\":1,\"teachplanMedia\":{\"courseId\":139,\"id\":111,\"mediaFilename\":\"火影忍者巨人.mp4\",\"mediaId\":\"66d9300a9c12b22a4ec9854bac83ee6f\",\"teachplanId\":359}}]}]', '{\"courseId\":139,\"createDate\":\"2023-09-26T20:48:02\",\"id\":37,\"introduction\":\"朱老师，研究生导师，学术高\",\"photograph\":\"/mediafiles/2023/09/26/3336c77e5bad60dd20c50d6c84d6e065.jpg\",\"position\":\"研究生导师，学术高\",\"teacherName\":\"朱老师\"}', '2023-10-03 13:45:51', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (140, 1232141425, 'itcast', 'Maven', 'MAVEN适合初学Java的人，知道什么是导包', 'MAVEN', NULL, '1-10', '研发管理', '1-10-2', '软件设计', '204002', '200002', '/mediafiles/2023/09/28/f40ba549ded7370a7eb712b2beadfafc.jpg', 'MAVEN', 'null', '[{\"courseId\":140,\"grade\":1,\"id\":360,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"MAVEN\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":140,\"grade\":2,\"id\":361,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":360,\"pname\":\"MAVEN是什么\",\"status\":1,\"teachplanMedia\":{\"courseId\":140,\"id\":123,\"mediaFilename\":\"火影忍者3.mp4\",\"mediaId\":\"e57355f60a75076e792f6b686d533e44\",\"teachplanId\":361}},{\"courseId\":140,\"grade\":2,\"id\":362,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":360,\"pname\":\"MAVEN导包\",\"status\":1,\"teachplanMedia\":{\"courseId\":140,\"id\":124,\"mediaFilename\":\"爱情再见.mp4\",\"mediaId\":\"7cf946ac23b0d63c1dc912ad5b57bb76\",\"teachplanId\":362}}]}]', '{\"courseId\":140,\"createDate\":\"2023-09-26T20:50:53\",\"id\":38,\"introduction\":\"木老师，喜欢运动，教学气氛活跃\",\"photograph\":\"/mediafiles/2023/09/26/0b2ab0a547db4cc0bcc9cbefb35870b8.jpg\",\"position\":\"大学教师\",\"teacherName\":\"木老师\"}', '2023-10-04 16:20:16', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (141, 1232141425, 'itcast', 'Mybatis+Plus', '学过JDBC的学生，简化mysql开发', 'Mybatis+Plus', NULL, '1-10', '研发管理', '1-10-3', '软件测试', '204002', '200002', '/mediafiles/2023/09/28/fc077f1a13e4ce9c1e7840e4d83b33ee.jpg', 'Mybatis+Plus', 'null', '[{\"courseId\":141,\"grade\":1,\"id\":363,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"JDBC\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":141,\"grade\":2,\"id\":366,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":363,\"pname\":\"JDBC是连接数据库\",\"status\":1,\"teachplanMedia\":{\"courseId\":141,\"id\":109,\"mediaFilename\":\"孤独摇滚.mp4\",\"mediaId\":\"8253c004d5184fbdc544f3541c9bf4e7\",\"teachplanId\":366}}]},{\"courseId\":141,\"grade\":1,\"id\":364,\"isPreview\":\"0\",\"orderby\":2,\"parentid\":0,\"pname\":\"Mybatis\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":141,\"grade\":2,\"id\":367,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":364,\"pname\":\"mybatis简化开发\",\"status\":1,\"teachplanMedia\":{\"courseId\":141,\"id\":99,\"mediaFilename\":\"四大青年漫.mp4\",\"mediaId\":\"c801b39717c1704b624d4b502042f6cb\",\"teachplanId\":367}}]},{\"courseId\":141,\"grade\":1,\"id\":365,\"isPreview\":\"0\",\"orderby\":3,\"parentid\":0,\"pname\":\"MybatisPlus\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":141,\"grade\":2,\"id\":368,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":365,\"pname\":\"简化mybatis开发\",\"status\":1,\"teachplanMedia\":{\"courseId\":141,\"id\":100,\"mediaFilename\":\"和月亮说话.mp4\",\"mediaId\":\"f0d556ea888323f9e7e914c68c70b60b\",\"teachplanId\":368}}]}]', '{\"courseId\":141,\"createDate\":\"2023-09-26T21:18:30\",\"id\":40,\"introduction\":\"谢老师，是大学教授\",\"photograph\":\"/mediafiles/2023/09/26/728a7ea3a548fdbb06b5883a6770a56b.png\",\"position\":\"大学教授\",\"teacherName\":\"谢老师\"}', '2023-09-28 18:30:39', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (142, 1232141425, 'itcast', '收费课程Html', '适合前端，和后端htnl基础', 'Html', NULL, '1-1', '前端开发', '1-1-1', 'HTML/CSS', '204001', '200002', '/mediafiles/2023/09/28/1af80735f50cd03e3f8ddba8c10f93a3.jpg', 'Html', 'null', '[{\"courseId\":142,\"grade\":1,\"id\":369,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":0,\"pname\":\"收费的章节\",\"status\":1,\"teachPlanTreeNodes\":[{\"courseId\":142,\"grade\":2,\"id\":370,\"isPreview\":\"0\",\"orderby\":1,\"parentid\":369,\"pname\":\"收费的小节\",\"status\":1,\"teachplanMedia\":{\"courseId\":142,\"id\":101,\"mediaFilename\":\"狼狈的月.mp4\",\"mediaId\":\"fcf1a86835270adaab6e0c968470ba22\",\"teachplanId\":370}}]}]', '{\"courseId\":142,\"createDate\":\"2023-09-26T21:25:09\",\"id\":41,\"introduction\":\"派老师\",\"photograph\":\"/mediafiles/2023/09/26/9fd9279d7a59e209fc5f29426065ae02.jpg\",\"position\":\"博士生导师，厉害\",\"teacherName\":\"派老师\"}', '2023-10-04 16:10:30', NULL, NULL, '202004', NULL, '201001', 1.00, 10.00, 365);

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
INSERT INTO `course_teacher` VALUES (22, 124, '李老师', '大学老师', '长得帅，人好', '/mediafiles/2023/09/26/8324f5241f6c8b4a501a11a8b3d8c257.png', '2023-09-26 19:39:13');
INSERT INTO `course_teacher` VALUES (23, 125, '王老师', '大学教授', '人好，人帅，讲课详细', '/mediafiles/2023/09/26/cb97c56312f15354b07e00bb60e057f7.jpg', '2023-09-26 19:42:23');
INSERT INTO `course_teacher` VALUES (24, 126, '苏老师', '研究生导师', '研究生导师的苏，科研成果大', '/mediafiles/2023/09/26/bc0e82c56bfd93b46bb99c248ba347a8.png', '2023-09-26 19:45:46');
INSERT INTO `course_teacher` VALUES (25, 127, '张老师', '大学老师', '大学老师的张，家庭富裕', '/mediafiles/2023/09/26/9336d067305378bed0b572c8eef4c0cb.jpg', '2023-09-26 19:48:39');
INSERT INTO `course_teacher` VALUES (26, 128, '刘老师', '大学讲师', '刘家的老师，性格温和', '/mediafiles/2023/09/26/9a025bc5e91499a9108850340bab6bb1.jpg', '2023-09-26 19:52:56');
INSERT INTO `course_teacher` VALUES (27, 129, '顾老师', '大学老师', '大学老师，淳朴，好人', '/mediafiles/2023/09/26/c594139dc03414dabca8401f3e751ff8.png', '2023-09-26 20:15:35');
INSERT INTO `course_teacher` VALUES (28, 130, '王老师', '大学教授', '人高马大，讲课细节', '/mediafiles/2023/09/26/452f8ce731c586846600dfd3ac587f16.png', '2023-09-26 20:18:12');
INSERT INTO `course_teacher` VALUES (29, 131, '吴老师', '研究生导师', '研究生导师，德高望重', '/mediafiles/2023/09/26/7d463af612843b80126ec7fa312d3bf9.png', '2023-09-26 20:20:41');
INSERT INTO `course_teacher` VALUES (30, 132, '可老师', '博士生导师', '博士生导师，可爱，学问高', '/mediafiles/2023/09/26/3071d7ae415d7032334173bd4e8a28e0.png', '2023-09-26 20:22:53');
INSERT INTO `course_teacher` VALUES (31, 133, '凝老师', '研究生导师', '研究生导师，人好看，教学严谨', '/mediafiles/2023/09/26/f33d8b7c92a7c8a174da9e62ffce1467.png', '2023-09-26 20:25:39');
INSERT INTO `course_teacher` VALUES (32, 134, '魈老师', '大学教授', '大学教授的魈，教学严格', '/mediafiles/2023/09/26/58c5c25af3e5c10926a480358a8f2a6a.jpg', '2023-09-26 20:28:37');
INSERT INTO `course_teacher` VALUES (33, 135, '英老师', '研究生导师', '研究生导师，喜欢和学生交流', '/mediafiles/2023/09/26/a9fa22de59287b5f138743646dcdaa08.jpg', '2023-09-26 20:30:54');
INSERT INTO `course_teacher` VALUES (34, 136, '蔡老师', '博士生导师', '博士生导师，喜欢打篮球', '/mediafiles/2023/09/26/0c634a510c2a1d1bbb50137689394f06.png', '2023-09-26 20:40:34');
INSERT INTO `course_teacher` VALUES (35, 137, '高老师', '高老师', '高老师，各个方面都高', '/mediafiles/2023/09/26/b491d2cd3c7170e54cd3798d4d7d4d6c.jpg', '2023-09-26 20:43:06');
INSERT INTO `course_teacher` VALUES (36, 138, '赛老师', '赛老师', '赛老师，为人正直', '/mediafiles/2023/09/26/f57bf24393fa9cb6bdcd588ff6be014b.jpg', '2023-09-26 20:45:07');
INSERT INTO `course_teacher` VALUES (37, 139, '朱老师', '研究生导师，学术高', '朱老师，研究生导师，学术高', '/mediafiles/2023/09/26/3336c77e5bad60dd20c50d6c84d6e065.jpg', '2023-09-26 20:48:02');
INSERT INTO `course_teacher` VALUES (38, 140, '木老师', '大学教师', '木老师，喜欢运动，教学气氛活跃', '/mediafiles/2023/09/26/0b2ab0a547db4cc0bcc9cbefb35870b8.jpg', '2023-09-26 20:50:53');
INSERT INTO `course_teacher` VALUES (40, 141, '谢老师', '大学教授', '谢老师，是大学教授', '/mediafiles/2023/09/26/728a7ea3a548fdbb06b5883a6770a56b.png', '2023-09-26 21:18:30');
INSERT INTO `course_teacher` VALUES (41, 142, '派老师', '博士生导师，厉害', '派老师', '/mediafiles/2023/09/26/9fd9279d7a59e209fc5f29426065ae02.jpg', '2023-09-26 21:25:09');

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
INSERT INTO `teachplan` VALUES (301, '第一章：数据结构', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 124, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (302, '第二章：算法', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 124, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (303, '1.1的数据结构', 301, 2, NULL, NULL, NULL, NULL, NULL, 1, 124, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (304, '1.2的数据结构', 301, 2, NULL, NULL, NULL, NULL, NULL, 2, 124, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (305, '2.1的算法', 302, 2, NULL, NULL, NULL, NULL, NULL, 1, 124, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (306, '操作系统', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 125, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (307, '硬件基础知识', 306, 2, NULL, NULL, NULL, NULL, NULL, 1, 125, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (308, '软件操作系统', 306, 2, NULL, NULL, NULL, NULL, NULL, 2, 125, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (309, '数据库', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 126, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (310, '数据库基础知识', 309, 2, NULL, NULL, NULL, NULL, NULL, 1, 126, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (311, 'SQL语言', 309, 2, NULL, NULL, NULL, NULL, NULL, 2, 126, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (312, '计算机网络', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 127, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (313, '7层模型', 312, 2, NULL, NULL, NULL, NULL, NULL, 1, 127, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (314, '4层模型', 312, 2, NULL, NULL, NULL, NULL, NULL, 2, 127, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (315, '第一章：认识JavaSE', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 128, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (318, '第二章：实战JavaSE', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 128, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (319, '第一节：实战JavaSE', 318, 2, NULL, NULL, NULL, NULL, NULL, 1, 128, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (320, '第一节：Java是什么', 315, 2, NULL, NULL, NULL, NULL, NULL, 1, 128, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (321, 'MYSQL', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 129, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (322, '第一小节：MYSQL', 321, 2, NULL, NULL, NULL, NULL, NULL, 1, 129, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (323, '第二小节：MYSQL', 321, 2, NULL, NULL, NULL, NULL, NULL, 2, 129, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (324, 'IOC', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 130, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (325, '第一节：IOC', 324, 2, NULL, NULL, NULL, NULL, NULL, 1, 130, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (326, 'AOP', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 130, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (327, '第一节：AOP', 326, 2, NULL, NULL, NULL, NULL, NULL, 1, 130, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (328, 'SpringBoot', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 131, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (329, '自动配置bean', 328, 2, NULL, NULL, NULL, NULL, NULL, 1, 131, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (330, '整合各种各样中间件和程序', 328, 2, NULL, NULL, NULL, NULL, NULL, 2, 131, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (331, 'SpringCloud', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 132, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (332, 'SpringCloudAlibaba', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 132, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (333, '第一节：Cloud', 331, 2, NULL, NULL, NULL, NULL, NULL, 1, 132, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (334, '第一节：CloudAlibaba', 332, 2, NULL, NULL, NULL, NULL, NULL, 1, 132, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (335, '第一章：网络通信', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 133, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (336, '第二章：nginx', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 133, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (337, '网络通信第一节', 335, 2, NULL, NULL, NULL, NULL, NULL, 1, 133, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (338, 'nginx实战', 336, 2, NULL, NULL, NULL, NULL, NULL, 1, 133, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (339, '第一章初识redis', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 134, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (340, 'redis是缓存中间件', 339, 2, NULL, NULL, NULL, NULL, NULL, 1, 134, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (341, '第二章实战redis', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 134, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (342, 'springboot整合redis缓存', 341, 2, NULL, NULL, NULL, NULL, NULL, 1, 134, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (343, '消息中间件', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 135, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (344, '消息中间件有哪些', 343, 2, NULL, NULL, NULL, NULL, NULL, 1, 135, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (345, 'rabbitMQ', 343, 2, NULL, NULL, NULL, NULL, NULL, 2, 135, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (346, 'linux', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 136, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (347, 'liunx是操作系统', 346, 2, NULL, NULL, NULL, NULL, NULL, 1, 136, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (348, 'liunx实战', 346, 2, NULL, NULL, NULL, NULL, NULL, 2, 136, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (349, '版本管理', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 137, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (350, '第一节：git是什么', 349, 2, NULL, NULL, NULL, NULL, NULL, 1, 137, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (351, '第二节：github实战', 349, 2, NULL, NULL, NULL, NULL, NULL, 2, 137, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (352, 'Docker', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 138, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (353, 'Docker是什么', 352, 2, NULL, NULL, NULL, NULL, NULL, 1, 138, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (354, '如何用docker部署mysql', 352, 2, NULL, NULL, NULL, NULL, NULL, 2, 138, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (355, '第一章：复习Docker', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 139, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (356, 'docker命令复习', 355, 2, NULL, NULL, NULL, NULL, NULL, 1, 139, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (357, '第二章：K8S', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 139, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (358, 'k8s是什么', 357, 2, NULL, NULL, NULL, NULL, NULL, 1, 139, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (359, 'ks实战', 357, 2, NULL, NULL, NULL, NULL, NULL, 2, 139, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (360, 'MAVEN', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 140, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (361, 'MAVEN是什么', 360, 2, NULL, NULL, NULL, NULL, NULL, 1, 140, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (362, 'MAVEN导包', 360, 2, NULL, NULL, NULL, NULL, NULL, 2, 140, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (363, 'JDBC', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 141, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (364, 'Mybatis', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 141, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (365, 'MybatisPlus', 0, 1, NULL, NULL, NULL, NULL, NULL, 3, 141, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (366, 'JDBC是连接数据库', 363, 2, NULL, NULL, NULL, NULL, NULL, 1, 141, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (367, 'mybatis简化开发', 364, 2, NULL, NULL, NULL, NULL, NULL, 1, 141, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (368, '简化mybatis开发', 365, 2, NULL, NULL, NULL, NULL, NULL, 1, 141, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (369, '收费的章节', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 142, NULL, 1, '0', NULL, NULL);
INSERT INTO `teachplan` VALUES (370, '收费的小节', 369, 2, NULL, NULL, NULL, NULL, NULL, 1, 142, NULL, 1, '0', NULL, NULL);

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
INSERT INTO `teachplan_media` VALUES (63, '0bddb723b8e66fe5de9e606df099ae93', 304, 124, '老动漫痛.mp4', '2023-09-26 19:38:07', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (64, '3ed9d0e0349c7fce14371dbc4d3bbc92', 305, 124, '封印解除.mp4', '2023-09-26 19:38:28', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (65, '4769d6c34dd261dfcce98a96c288066d', 307, 125, '火影忍者1.mp4', '2023-09-26 19:41:06', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (66, '644a7b820eba347f984f3e26b78df672', 308, 125, '为什么要说活下去.mp4', '2023-09-26 19:41:33', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (67, '66d9300a9c12b22a4ec9854bac83ee6f', 310, 126, '火影忍者巨人.mp4', '2023-09-26 19:44:37', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (69, '688175374846f1ec48d461ce17e67203', 313, 127, '登月巨人.mp4', '2023-09-26 19:47:57', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (70, '6f51d13788bbbb38822b75cb01121c5b', 314, 127, '赛博朋克1.mp4', '2023-09-26 19:48:04', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (71, '7cf946ac23b0d63c1dc912ad5b57bb76', 316, 128, '爱情再见.mp4', '2023-09-26 19:50:49', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (73, '7cf946ac23b0d63c1dc912ad5b57bb76', 320, 128, '爱情再见.mp4', '2023-09-26 19:51:49', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (76, 'c601d1fa8838ccc9931b192e228dcd8a', 325, 130, '拔刀.mp4', '2023-09-26 20:17:20', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (77, 'c801b39717c1704b624d4b502042f6cb', 327, 130, '四大青年漫.mp4', '2023-09-26 20:17:29', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (79, 'e57355f60a75076e792f6b686d533e44', 330, 131, '火影忍者3.mp4', '2023-09-26 20:20:00', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (80, 'e57355f60a75076e792f6b686d533e44', 333, 132, '火影忍者3.mp4', '2023-09-26 20:22:14', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (82, 'f410c202315dc975056f11bfab529cec', 337, 133, '108部动漫.mp4', '2023-09-26 20:24:35', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (85, '07426fc0ea03d7c9c3af99df4b7527e1', 342, 134, 'jojo.mp4', '2023-09-26 20:27:58', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (87, '3ed9d0e0349c7fce14371dbc4d3bbc92', 345, 135, '封印解除.mp4', '2023-09-26 20:30:04', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (89, '644a7b820eba347f984f3e26b78df672', 348, 136, '为什么要说活下去.mp4', '2023-09-26 20:33:20', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (93, '6f51d13788bbbb38822b75cb01121c5b', 354, 138, '赛博朋克1.mp4', '2023-09-26 20:44:47', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (94, '7cf946ac23b0d63c1dc912ad5b57bb76', 358, 139, '爱情再见.mp4', '2023-09-26 20:47:14', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (99, 'c801b39717c1704b624d4b502042f6cb', 367, 141, '四大青年漫.mp4', '2023-09-26 21:17:28', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (100, 'f0d556ea888323f9e7e914c68c70b60b', 368, 141, '和月亮说话.mp4', '2023-09-26 21:17:51', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (101, 'fcf1a86835270adaab6e0c968470ba22', 370, 142, '狼狈的月.mp4', '2023-09-26 21:24:39', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (102, '3d6db8efc173ff2996a590682e750a28', 303, 124, '租界女友.mp4', '2023-09-27 10:21:12', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (103, '8dcbe59d5a5b5cd5b8596b417e86cb37', 344, 135, '知识就是力量.mp4', '2023-09-27 10:36:22', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (104, 'b397791757db5048d0ef85a7f77a4624', 347, 136, '伤感.mp4', '2023-09-27 10:36:43', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (105, 'af834a1b1b5a6c60006dcab8f11d5a4a', 350, 137, '你潮吗.mp4', '2023-09-27 11:04:56', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (106, '6ed6665bfb130deb7ba2a0eacc72a5ae', 353, 138, '媚宅.mp4', '2023-09-27 11:05:43', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (109, '8253c004d5184fbdc544f3541c9bf4e7', 366, 141, '孤独摇滚.mp4', '2023-09-27 11:07:27', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (111, '66d9300a9c12b22a4ec9854bac83ee6f', 359, 139, '火影忍者巨人.mp4', '2023-10-03 12:05:25', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (112, '4769d6c34dd261dfcce98a96c288066d', 322, 129, '火影忍者1.mp4', '2023-10-03 13:40:55', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (113, '3ed9d0e0349c7fce14371dbc4d3bbc92', 323, 129, '封印解除.mp4', '2023-10-03 13:41:16', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (114, '31c175d8ce9f4c9daf9b687803af2f45', 329, 131, '反方向的钟.mp4', '2023-10-03 13:43:47', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (115, '774f9ea6ba51730c166039eca6e5823c', 356, 139, '美丽的世界.mp4', '2023-10-03 13:45:31', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (116, '774f9ea6ba51730c166039eca6e5823c', 338, 133, '美丽的世界.mp4', '2023-10-03 13:48:46', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (120, '774f9ea6ba51730c166039eca6e5823c', 319, 128, '美丽的世界.mp4', '2023-10-03 13:52:51', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (121, '774f9ea6ba51730c166039eca6e5823c', 351, 137, '美丽的世界.mp4', '2023-10-03 13:53:51', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (122, '0bddb723b8e66fe5de9e606df099ae93', 311, 126, '老动漫痛.mp4', '2023-10-04 16:14:03', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (123, 'e57355f60a75076e792f6b686d533e44', 361, 140, '火影忍者3.mp4', '2023-10-04 16:20:02', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (124, '7cf946ac23b0d63c1dc912ad5b57bb76', 362, 140, '爱情再见.mp4', '2023-10-04 16:20:09', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (125, '03d203e8026d8dcf300b40459cc00b69', 334, 132, 'onelastkiss.mp4', '2023-10-06 16:51:42', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (126, '608ecdf90c41ffcc8bccc0188976c800', 340, 134, 'dieforyou.mp4', '2023-10-07 18:12:59', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
