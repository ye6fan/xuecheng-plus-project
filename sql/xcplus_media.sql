/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : xcplus_media

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 10/10/2023 12:04:45
*/
create database xcplus_media;
use xcplus_media;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for media_files
-- ----------------------------
DROP TABLE IF EXISTS `media_files`;
CREATE TABLE `media_files`  (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件id,md5值',
  `company_id` bigint NULL DEFAULT NULL COMMENT '机构ID',
  `company_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `filename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件名称',
  `file_type` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件类型（图片、文档，视频）',
  `tags` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标签',
  `bucket` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '存储目录',
  `file_path` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `file_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件id',
  `url` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '媒资文件访问地址',
  `username` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '上传人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '上传时间',
  `change_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `status` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '状态,1:正常，0:不展示',
  `remark` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `audit_status` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  `audit_mind` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_fileid`(`file_id` ASC) USING BTREE COMMENT '文件id唯一索引 '
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '媒资信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_files
-- ----------------------------
INSERT INTO `media_files` VALUES ('03d203e8026d8dcf300b40459cc00b69', 1232141425, '教育机构', 'onelastkiss.mp4', '001002', '课程视频', 'video', '0/3/03d203e8026d8dcf300b40459cc00b69/03d203e8026d8dcf300b40459cc00b69.mp4', '03d203e8026d8dcf300b40459cc00b69', '/video/0/3/03d203e8026d8dcf300b40459cc00b69/03d203e8026d8dcf300b40459cc00b69.mp4', NULL, '2023-10-04 16:33:28', NULL, '1', '', '002003', NULL, 48990389);
INSERT INTO `media_files` VALUES ('0420268414382236b330db3d6a2ef6e4', 1232141425, '教育机构', 'course2187994136168174227.html', '001001', NULL, 'mediafiles', 'course/128.html', '0420268414382236b330db3d6a2ef6e4', '/mediafiles/course/128.html', NULL, '2023-09-28 18:38:30', NULL, '1', NULL, '002003', NULL, 11865);
INSERT INTO `media_files` VALUES ('066e6e4a07dd3b6cb051827d645d181a', 1232141425, '教育机构', 'wallhaven-3l2lpv.jpg', '001001', NULL, 'mediafiles', '2023/09/26/066e6e4a07dd3b6cb051827d645d181a.jpg', '066e6e4a07dd3b6cb051827d645d181a', '/mediafiles/2023/09/26/066e6e4a07dd3b6cb051827d645d181a.jpg', NULL, '2023-09-26 19:42:51', NULL, '1', NULL, '002003', NULL, 486275);
INSERT INTO `media_files` VALUES ('06e9ff83d2b4b8bc537f547f2968fa32', 1232141425, '教育机构', 'course7535477735025948211.html', '001001', NULL, 'mediafiles', 'course/134.html', '06e9ff83d2b4b8bc537f547f2968fa32', '/mediafiles/course/134.html', NULL, '2023-09-28 17:44:18', NULL, '1', NULL, '002003', NULL, 11855);
INSERT INTO `media_files` VALUES ('07426fc0ea03d7c9c3af99df4b7527e1', 1232141425, '教育机构', 'jojo.mp4', '001002', '课程视频', 'video', '0/7/07426fc0ea03d7c9c3af99df4b7527e1/07426fc0ea03d7c9c3af99df4b7527e1.mp4', '07426fc0ea03d7c9c3af99df4b7527e1', '/video/0/7/07426fc0ea03d7c9c3af99df4b7527e1/07426fc0ea03d7c9c3af99df4b7527e1.mp4', NULL, '2023-09-26 18:34:45', NULL, '1', '', '002003', NULL, 87976723);
INSERT INTO `media_files` VALUES ('0b2ab0a547db4cc0bcc9cbefb35870b8', 1232141425, '教育机构', 'v2-376d8efa298e0d725ff6e7838eee31e9_r.jpg', '001001', NULL, 'mediafiles', '2023/09/26/0b2ab0a547db4cc0bcc9cbefb35870b8.jpg', '0b2ab0a547db4cc0bcc9cbefb35870b8', '/mediafiles/2023/09/26/0b2ab0a547db4cc0bcc9cbefb35870b8.jpg', NULL, '2023-09-26 20:50:53', NULL, '1', NULL, '002003', NULL, 67633);
INSERT INTO `media_files` VALUES ('0bddb723b8e66fe5de9e606df099ae93', 1232141425, '教育机构', '老动漫痛.mp4', '001002', '课程视频', 'video', '0/b/0bddb723b8e66fe5de9e606df099ae93/0bddb723b8e66fe5de9e606df099ae93.mp4', '0bddb723b8e66fe5de9e606df099ae93', '/video/0/b/0bddb723b8e66fe5de9e606df099ae93/0bddb723b8e66fe5de9e606df099ae93.mp4', NULL, '2023-09-26 19:08:22', NULL, '1', '', '002003', NULL, 62105023);
INSERT INTO `media_files` VALUES ('0c634a510c2a1d1bbb50137689394f06', 1232141425, '教育机构', 'wallhaven-3l2kmd.png', '001001', NULL, 'mediafiles', '2023/09/26/0c634a510c2a1d1bbb50137689394f06.png', '0c634a510c2a1d1bbb50137689394f06', '/mediafiles/2023/09/26/0c634a510c2a1d1bbb50137689394f06.png', NULL, '2023-09-26 20:40:33', NULL, '1', NULL, '002003', NULL, 163436);
INSERT INTO `media_files` VALUES ('0d4f26e5f1dc8a77d16d3e296626f3ac', 1232141425, '教育机构', 'course5933498848004331894.html', '001001', NULL, 'mediafiles', 'course/136.html', '0d4f26e5f1dc8a77d16d3e296626f3ac', '/mediafiles/course/136.html', NULL, '2023-09-28 17:44:21', NULL, '1', NULL, '002003', NULL, 11331);
INSERT INTO `media_files` VALUES ('0e908e1ec7829290144b3e47837dbb0d', 1232141425, '教育机构', '赛博朋克phonk.mp4', '001002', '课程视频', 'video', '0/e/0e908e1ec7829290144b3e47837dbb0d/0e908e1ec7829290144b3e47837dbb0d.mp4', '0e908e1ec7829290144b3e47837dbb0d', '/video/0/e/0e908e1ec7829290144b3e47837dbb0d/0e908e1ec7829290144b3e47837dbb0d.mp4', NULL, '2023-09-27 11:01:15', NULL, '1', '', '002003', NULL, 16982495);
INSERT INTO `media_files` VALUES ('0f7a3999406ccb5ed45a97672cfa319f', 1232141425, '教育机构', 'course9016292435773734304.html', '001001', NULL, 'mediafiles', 'course/129.html', '0f7a3999406ccb5ed45a97672cfa319f', '/mediafiles/course/129.html', NULL, '2023-09-28 17:44:15', NULL, '1', NULL, '002003', NULL, 11308);
INSERT INTO `media_files` VALUES ('13ea2abbee42a6d41df6d5c0214cecef', 1232141425, '教育机构', 'course3294937488084823629.html', '001001', NULL, 'mediafiles', 'course/130.html', '13ea2abbee42a6d41df6d5c0214cecef', '/mediafiles/course/130.html', NULL, '2023-10-03 13:33:27', NULL, '1', NULL, '002003', NULL, 11795);
INSERT INTO `media_files` VALUES ('188d606e5ce7d02052dfe68d9855e44f', 1232141425, '教育机构', 'course9063641755890993309.html', '001001', NULL, 'mediafiles', 'course/137.html', '188d606e5ce7d02052dfe68d9855e44f', '/mediafiles/course/137.html', NULL, '2023-09-28 17:44:18', NULL, '1', NULL, '002003', NULL, 11316);
INSERT INTO `media_files` VALUES ('191b25aa54d6e0752a171c0373b3a994', 1232141425, '教育机构', 'course5444197372424855400.html', '001001', NULL, 'mediafiles', 'course/138.html', '191b25aa54d6e0752a171c0373b3a994', '/mediafiles/course/138.html', NULL, '2023-09-28 18:23:51', NULL, '1', NULL, '002003', NULL, 11294);
INSERT INTO `media_files` VALUES ('1a128b607db22b2a9e51cf9cc2e3cdfb', 1232141425, '教育机构', 'course6560804353660262523.html', '001001', NULL, 'mediafiles', 'course/128.html', '1a128b607db22b2a9e51cf9cc2e3cdfb', '/mediafiles/course/128.html', NULL, '2023-10-04 16:16:00', NULL, '1', NULL, '002003', NULL, 11690);
INSERT INTO `media_files` VALUES ('1af80735f50cd03e3f8ddba8c10f93a3', 1232141425, '教育机构', 'wallhaven-76x6pv.jpg', '001001', NULL, 'mediafiles', '2023/09/28/1af80735f50cd03e3f8ddba8c10f93a3.jpg', '1af80735f50cd03e3f8ddba8c10f93a3', '/mediafiles/2023/09/28/1af80735f50cd03e3f8ddba8c10f93a3.jpg', NULL, '2023-09-28 18:29:09', NULL, '1', NULL, '002003', NULL, 1040397);
INSERT INTO `media_files` VALUES ('1ceccd2dbe2f929db19cdeb3c11bf235', 1232141425, '教育机构', 'wallhaven-1kojg1.jpg', '001001', NULL, 'mediafiles', '2023/09/26/1ceccd2dbe2f929db19cdeb3c11bf235.jpg', '1ceccd2dbe2f929db19cdeb3c11bf235', '/mediafiles/2023/09/26/1ceccd2dbe2f929db19cdeb3c11bf235.jpg', NULL, '2023-09-26 20:49:07', NULL, '1', NULL, '002003', NULL, 868911);
INSERT INTO `media_files` VALUES ('1ef03925f255d27f5af6e76dad43dace', 1232141425, '教育机构', 'course139150304595519876.html', '001001', NULL, 'mediafiles', 'course/129.html', '1ef03925f255d27f5af6e76dad43dace', '/mediafiles/course/129.html', NULL, '2023-10-01 11:55:15', NULL, '1', NULL, '002003', NULL, 11308);
INSERT INTO `media_files` VALUES ('22e133bd8e99ab3899fb37740ccb77f0', 1232141425, '教育机构', 'course1799717779988338600.html', '001001', NULL, 'mediafiles', 'course/142.html', '22e133bd8e99ab3899fb37740ccb77f0', '/mediafiles/course/142.html', NULL, '2023-10-04 16:08:32', NULL, '1', NULL, '002003', NULL, 10917);
INSERT INTO `media_files` VALUES ('2539389f1a8ffd55af8f9fe6a481b2f6', 1232141425, '教育机构', 'wallhaven-nk1l1q.jpg', '001001', NULL, 'mediafiles', '2023/09/28/2539389f1a8ffd55af8f9fe6a481b2f6.jpg', '2539389f1a8ffd55af8f9fe6a481b2f6', '/mediafiles/2023/09/28/2539389f1a8ffd55af8f9fe6a481b2f6.jpg', NULL, '2023-09-28 18:36:58', NULL, '1', NULL, '002003', NULL, 875288);
INSERT INTO `media_files` VALUES ('2824ac67f9e4e5a5b662859c5d6a39cf', 1232141425, '教育机构', 'course3171319250535324131.html', '001001', NULL, 'mediafiles', 'course/131.html', '2824ac67f9e4e5a5b662859c5d6a39cf', '/mediafiles/course/131.html', NULL, '2023-09-28 17:44:15', NULL, '1', NULL, '002003', NULL, 11350);
INSERT INTO `media_files` VALUES ('28569e7636b108fe7dbf939e29ec0b19', 1232141425, '教育机构', 'wallhaven-e7xwkk.jpg', '001001', NULL, 'mediafiles', '2023/09/26/28569e7636b108fe7dbf939e29ec0b19.jpg', '28569e7636b108fe7dbf939e29ec0b19', '/mediafiles/2023/09/26/28569e7636b108fe7dbf939e29ec0b19.jpg', NULL, '2023-09-26 20:18:42', NULL, '1', NULL, '002003', NULL, 1017811);
INSERT INTO `media_files` VALUES ('2becbb334284214f26c085726bc73d6f', 1232141425, '教育机构', 'course9179556159129516637.html', '001001', NULL, 'mediafiles', 'course/138.html', '2becbb334284214f26c085726bc73d6f', '/mediafiles/course/138.html', NULL, '2023-09-28 17:44:21', NULL, '1', NULL, '002003', NULL, 11294);
INSERT INTO `media_files` VALUES ('2c762e3bbe6c3891d03af8d5af326e29', 1232141425, '教育机构', 'course3481088588075775669.html', '001001', NULL, 'mediafiles', 'course/140.html', '2c762e3bbe6c3891d03af8d5af326e29', '/mediafiles/course/140.html', NULL, '2023-09-28 17:44:21', NULL, '1', NULL, '002003', NULL, 11289);
INSERT INTO `media_files` VALUES ('2f082ab95cf4d3cf65ad17363b313be9', 1232141425, '教育机构', 'wallhaven-3zl2qy.jpg', '001001', NULL, 'mediafiles', '2023/09/26/2f082ab95cf4d3cf65ad17363b313be9.jpg', '2f082ab95cf4d3cf65ad17363b313be9', '/mediafiles/2023/09/26/2f082ab95cf4d3cf65ad17363b313be9.jpg', NULL, '2023-09-26 20:46:00', NULL, '1', NULL, '002003', NULL, 253055);
INSERT INTO `media_files` VALUES ('3071d7ae415d7032334173bd4e8a28e0', 1232141425, '教育机构', 'wallhaven-rdy3q7.png', '001001', NULL, 'mediafiles', '2023/09/26/3071d7ae415d7032334173bd4e8a28e0.png', '3071d7ae415d7032334173bd4e8a28e0', '/mediafiles/2023/09/26/3071d7ae415d7032334173bd4e8a28e0.png', NULL, '2023-09-26 20:22:53', NULL, '1', NULL, '002003', NULL, 698805);
INSERT INTO `media_files` VALUES ('3191df116b41d1c221e54f19fd255043', 1232141425, '教育机构', 'wallhaven-3zzd99.jpg', '001001', NULL, 'mediafiles', '2023/09/26/3191df116b41d1c221e54f19fd255043.jpg', '3191df116b41d1c221e54f19fd255043', '/mediafiles/2023/09/26/3191df116b41d1c221e54f19fd255043.jpg', NULL, '2023-09-26 20:31:37', NULL, '1', NULL, '002003', NULL, 690936);
INSERT INTO `media_files` VALUES ('31c175d8ce9f4c9daf9b687803af2f45', 1232141425, '教育机构', '反方向的钟.mp4', '001002', '课程视频', 'video', '3/1/31c175d8ce9f4c9daf9b687803af2f45/31c175d8ce9f4c9daf9b687803af2f45.mp4', '31c175d8ce9f4c9daf9b687803af2f45', '/video/3/1/31c175d8ce9f4c9daf9b687803af2f45/31c175d8ce9f4c9daf9b687803af2f45.mp4', NULL, '2023-10-03 12:31:58', NULL, '1', '', '002003', NULL, 18739454);
INSERT INTO `media_files` VALUES ('3336c77e5bad60dd20c50d6c84d6e065', 1232141425, '教育机构', '20200413233514_mlveq.jpg', '001001', NULL, 'mediafiles', '2023/09/26/3336c77e5bad60dd20c50d6c84d6e065.jpg', '3336c77e5bad60dd20c50d6c84d6e065', '/mediafiles/2023/09/26/3336c77e5bad60dd20c50d6c84d6e065.jpg', NULL, '2023-09-26 20:48:01', NULL, '1', NULL, '002003', NULL, 64766);
INSERT INTO `media_files` VALUES ('36572432c49ceb2d4e517ae68c3b8f2a', 1232141425, '教育机构', 'wallhaven-9m31kx.png', '001001', NULL, 'mediafiles', '2023/09/26/36572432c49ceb2d4e517ae68c3b8f2a.png', '36572432c49ceb2d4e517ae68c3b8f2a', '/mediafiles/2023/09/26/36572432c49ceb2d4e517ae68c3b8f2a.png', NULL, '2023-09-26 20:44:01', NULL, '1', NULL, '002003', NULL, 273899);
INSERT INTO `media_files` VALUES ('3a34c72c6c0702fa789c2a3c93daa95f', 1232141425, '教育机构', 'wallhaven-5g3pl8.jpg', '001001', NULL, 'mediafiles', '2023/09/26/3a34c72c6c0702fa789c2a3c93daa95f.jpg', '3a34c72c6c0702fa789c2a3c93daa95f', '/mediafiles/2023/09/26/3a34c72c6c0702fa789c2a3c93daa95f.jpg', NULL, '2023-09-26 19:43:50', NULL, '1', NULL, '002003', NULL, 920566);
INSERT INTO `media_files` VALUES ('3ac81fa9934558b4424ff51776369885', 1232141425, '教育机构', 'wallhaven-5716e1.jpg', '001001', NULL, 'mediafiles', '2023/09/26/3ac81fa9934558b4424ff51776369885.jpg', '3ac81fa9934558b4424ff51776369885', '/mediafiles/2023/09/26/3ac81fa9934558b4424ff51776369885.jpg', NULL, '2023-09-26 20:41:18', NULL, '1', NULL, '002003', NULL, 2037370);
INSERT INTO `media_files` VALUES ('3d6db8efc173ff2996a590682e750a28', 1232141425, '教育机构', '租界女友.mp4', '001002', '课程视频', 'video', '3/d/3d6db8efc173ff2996a590682e750a28/3d6db8efc173ff2996a590682e750a28.mp4', '3d6db8efc173ff2996a590682e750a28', '/video/3/d/3d6db8efc173ff2996a590682e750a28/3d6db8efc173ff2996a590682e750a28.mp4', NULL, '2023-09-27 10:10:16', NULL, '1', '', '002003', NULL, 49622321);
INSERT INTO `media_files` VALUES ('3ed9d0e0349c7fce14371dbc4d3bbc92', 1232141425, '教育机构', '封印解除.mp4', '001002', '课程视频', 'video', '3/e/3ed9d0e0349c7fce14371dbc4d3bbc92/3ed9d0e0349c7fce14371dbc4d3bbc92.mp4', '3ed9d0e0349c7fce14371dbc4d3bbc92', '/video/3/e/3ed9d0e0349c7fce14371dbc4d3bbc92/3ed9d0e0349c7fce14371dbc4d3bbc92.mp4', NULL, '2023-09-26 18:47:29', NULL, '1', '', '002003', NULL, 25266642);
INSERT INTO `media_files` VALUES ('40846c4dfcd2d454d7dc0efd423e5836', 1232141425, '教育机构', 'wallhaven-x6lllz.jpg', '001001', NULL, 'mediafiles', '2023/09/28/40846c4dfcd2d454d7dc0efd423e5836.jpg', '40846c4dfcd2d454d7dc0efd423e5836', '/mediafiles/2023/09/28/40846c4dfcd2d454d7dc0efd423e5836.jpg', NULL, '2023-09-28 18:14:21', NULL, '1', NULL, '002003', NULL, 1117746);
INSERT INTO `media_files` VALUES ('452f8ce731c586846600dfd3ac587f16', 1232141425, '教育机构', 'wallhaven-q25med.png', '001001', NULL, 'mediafiles', '2023/09/26/452f8ce731c586846600dfd3ac587f16.png', '452f8ce731c586846600dfd3ac587f16', '/mediafiles/2023/09/26/452f8ce731c586846600dfd3ac587f16.png', NULL, '2023-09-26 20:18:12', NULL, '1', NULL, '002003', NULL, 1186075);
INSERT INTO `media_files` VALUES ('4769d6c34dd261dfcce98a96c288066d', 1232141425, '教育机构', '火影忍者1.mp4', '001002', '课程视频', 'video', '4/7/4769d6c34dd261dfcce98a96c288066d/4769d6c34dd261dfcce98a96c288066d.mp4', '4769d6c34dd261dfcce98a96c288066d', '/video/4/7/4769d6c34dd261dfcce98a96c288066d/4769d6c34dd261dfcce98a96c288066d.mp4', NULL, '2023-09-26 18:50:50', NULL, '1', '', '002003', NULL, 27378785);
INSERT INTO `media_files` VALUES ('47e8a9a5b1520fc8cf481d79b3047307', 1232141425, '教育机构', 'wallhaven-8oekzo.jpg', '001001', NULL, 'mediafiles', '2023/09/26/47e8a9a5b1520fc8cf481d79b3047307.jpg', '47e8a9a5b1520fc8cf481d79b3047307', '/mediafiles/2023/09/26/47e8a9a5b1520fc8cf481d79b3047307.jpg', NULL, '2023-09-26 20:21:20', NULL, '1', NULL, '002003', NULL, 1390812);
INSERT INTO `media_files` VALUES ('491edf5544575df08966e47e11c1f342', 1232141425, '教育机构', 'course6437862984451457636.html', '001001', NULL, 'mediafiles', 'course/127.html', '491edf5544575df08966e47e11c1f342', '/mediafiles/course/127.html', NULL, '2023-10-01 11:54:53', NULL, '1', NULL, '002003', NULL, 11357);
INSERT INTO `media_files` VALUES ('4cee50f0e1bc826ffc94592df5bee59a', 1232141425, '教育机构', 'course1036460146609988862.html', '001001', NULL, 'mediafiles', 'course/133.html', '4cee50f0e1bc826ffc94592df5bee59a', '/mediafiles/course/133.html', NULL, '2023-09-28 17:44:18', NULL, '1', NULL, '002003', NULL, 11847);
INSERT INTO `media_files` VALUES ('4cfedb6b187448a8231b48ae8c7b672e', 1232141425, '教育机构', 'course2804043595558770004.html', '001001', NULL, 'mediafiles', 'course/134.html', '4cfedb6b187448a8231b48ae8c7b672e', '/mediafiles/course/134.html', NULL, '2023-10-07 18:13:11', NULL, '1', NULL, '002003', NULL, 11680);
INSERT INTO `media_files` VALUES ('501d0011183d989099abcc5e18f93925', 1232141425, '教育机构', 'course566592076129346039.html', '001001', NULL, 'mediafiles', 'course/136.html', '501d0011183d989099abcc5e18f93925', '/mediafiles/course/136.html', NULL, '2023-09-28 18:38:51', NULL, '1', NULL, '002003', NULL, 11331);
INSERT INTO `media_files` VALUES ('51dc59873eb8a49b80cccab753035b16', 1232141425, '教育机构', 'course3906016387709389017.html', '001001', NULL, 'mediafiles', 'course/141.html', '51dc59873eb8a49b80cccab753035b16', '/mediafiles/course/141.html', NULL, '2023-09-28 17:44:24', NULL, '1', NULL, '002003', NULL, 12623);
INSERT INTO `media_files` VALUES ('528a3c0ad76496f2e7c3fb023d245596', 1232141425, '教育机构', 'wallhaven-dg5do.jpg', '001001', NULL, 'mediafiles', '2023/09/28/528a3c0ad76496f2e7c3fb023d245596.jpg', '528a3c0ad76496f2e7c3fb023d245596', '/mediafiles/2023/09/28/528a3c0ad76496f2e7c3fb023d245596.jpg', NULL, '2023-09-28 18:14:56', NULL, '1', NULL, '002003', NULL, 521036);
INSERT INTO `media_files` VALUES ('55803cf43aa49fd41b389987993d5e8d', 1232141425, '教育机构', 'course1727241558551618502.html', '001001', NULL, 'mediafiles', 'course/142.html', '55803cf43aa49fd41b389987993d5e8d', '/mediafiles/course/142.html', NULL, '2023-09-28 18:29:24', NULL, '1', NULL, '002003', NULL, 11097);
INSERT INTO `media_files` VALUES ('57af17e96df44b43ff9ee332b679f414', 1232141425, '教育机构', 'course3799250696679332509.html', '001001', NULL, 'mediafiles', 'course/135.html', '57af17e96df44b43ff9ee332b679f414', '/mediafiles/course/135.html', NULL, '2023-10-04 16:26:45', NULL, '1', NULL, '002003', NULL, 11173);
INSERT INTO `media_files` VALUES ('58c5c25af3e5c10926a480358a8f2a6a', 1232141425, '教育机构', 'wallhaven-6oylzx.jpg', '001001', NULL, 'mediafiles', '2023/09/26/58c5c25af3e5c10926a480358a8f2a6a.jpg', '58c5c25af3e5c10926a480358a8f2a6a', '/mediafiles/2023/09/26/58c5c25af3e5c10926a480358a8f2a6a.jpg', NULL, '2023-09-26 20:28:36', NULL, '1', NULL, '002003', NULL, 327223);
INSERT INTO `media_files` VALUES ('58d63fe3e306b1db9301b831dcd2928a', 1232141425, '教育机构', 'wallhaven-dg5d8o.jpg', '001001', NULL, 'mediafiles', '2023/09/28/58d63fe3e306b1db9301b831dcd2928a.jpg', '58d63fe3e306b1db9301b831dcd2928a', '/mediafiles/2023/09/28/58d63fe3e306b1db9301b831dcd2928a.jpg', NULL, '2023-09-28 18:26:46', NULL, '1', NULL, '002003', NULL, 467589);
INSERT INTO `media_files` VALUES ('5d43fd90d14582ef8fb76bbce9da6e2e', 1232141425, '教育机构', 'course5011751907643777511.html', '001001', NULL, 'mediafiles', 'course/139.html', '5d43fd90d14582ef8fb76bbce9da6e2e', '/mediafiles/course/139.html', NULL, '2023-09-28 17:44:21', NULL, '1', NULL, '002003', NULL, 12063);
INSERT INTO `media_files` VALUES ('5e09ef6df8a2ac0c6de4f6ba6d166c86', 1232141425, '教育机构', 'course227189826526670016.html', '001001', NULL, 'mediafiles', 'course/126.html', '5e09ef6df8a2ac0c6de4f6ba6d166c86', '/mediafiles/course/126.html', NULL, '2023-10-04 16:14:12', NULL, '1', NULL, '002003', NULL, 11140);
INSERT INTO `media_files` VALUES ('5e6fa7563be7c1fef23f028d92d87790', 1232141425, '教育机构', 'course1524144574457236799.html', '001001', NULL, 'mediafiles', 'course/132.html', '5e6fa7563be7c1fef23f028d92d87790', '/mediafiles/course/132.html', NULL, '2023-10-06 18:03:54', NULL, '1', NULL, '002003', NULL, 11698);
INSERT INTO `media_files` VALUES ('608ecdf90c41ffcc8bccc0188976c800', 1232141425, '教育机构', 'dieforyou.mp4', '001002', '课程视频', 'video', '6/0/608ecdf90c41ffcc8bccc0188976c800/608ecdf90c41ffcc8bccc0188976c800.mp4', '608ecdf90c41ffcc8bccc0188976c800', '/video/6/0/608ecdf90c41ffcc8bccc0188976c800/608ecdf90c41ffcc8bccc0188976c800.mp4', NULL, '2023-10-04 16:32:25', NULL, '1', '', '002003', NULL, 16657975);
INSERT INTO `media_files` VALUES ('638ff450734a59487c8f53eb216febad', 1232141425, '教育机构', 'course698208808930659834.html', '001001', NULL, 'mediafiles', 'course/140.html', '638ff450734a59487c8f53eb216febad', '/mediafiles/course/140.html', NULL, '2023-09-28 18:23:54', NULL, '1', NULL, '002003', NULL, 11289);
INSERT INTO `media_files` VALUES ('63d0d6d79dc7d91974c4ac1114935286', 1232141425, '教育机构', 'wallhaven-dppm83.png', '001001', NULL, 'mediafiles', '2023/10/06/63d0d6d79dc7d91974c4ac1114935286.png', '63d0d6d79dc7d91974c4ac1114935286', '/mediafiles/2023/10/06/63d0d6d79dc7d91974c4ac1114935286.png', NULL, '2023-10-06 16:51:14', NULL, '1', NULL, '002003', NULL, 1967904);
INSERT INTO `media_files` VALUES ('644a7b820eba347f984f3e26b78df672', 1232141425, '教育机构', '为什么要说活下去.mp4', '001002', '课程视频', 'video', '6/4/644a7b820eba347f984f3e26b78df672/644a7b820eba347f984f3e26b78df672.mp4', '644a7b820eba347f984f3e26b78df672', '/video/6/4/644a7b820eba347f984f3e26b78df672/644a7b820eba347f984f3e26b78df672.mp4', NULL, '2023-09-26 19:19:57', NULL, '1', '', '002003', NULL, 49658594);
INSERT INTO `media_files` VALUES ('648412da6baf19e7e80f70546bec54c3', 1232141425, '教育机构', 'wallhaven-wq2787.jpg', '001001', NULL, 'mediafiles', '2023/09/26/648412da6baf19e7e80f70546bec54c3.jpg', '648412da6baf19e7e80f70546bec54c3', '/mediafiles/2023/09/26/648412da6baf19e7e80f70546bec54c3.jpg', NULL, '2023-09-26 20:16:30', NULL, '1', NULL, '002003', NULL, 1020854);
INSERT INTO `media_files` VALUES ('66d9300a9c12b22a4ec9854bac83ee6f', 1232141425, '教育机构', '火影忍者巨人.mp4', '001002', '课程视频', 'video', '6/6/66d9300a9c12b22a4ec9854bac83ee6f/66d9300a9c12b22a4ec9854bac83ee6f.mp4', '66d9300a9c12b22a4ec9854bac83ee6f', '/video/6/6/66d9300a9c12b22a4ec9854bac83ee6f/66d9300a9c12b22a4ec9854bac83ee6f.mp4', NULL, '2023-09-26 18:59:59', NULL, '1', '', '002003', NULL, 56613004);
INSERT INTO `media_files` VALUES ('671b1dcefadb06de270db923f50646b0', 1232141425, '教育机构', '溯.mp4', '001002', '课程视频', 'video', '6/7/671b1dcefadb06de270db923f50646b0/671b1dcefadb06de270db923f50646b0.mp4', '671b1dcefadb06de270db923f50646b0', '/video/6/7/671b1dcefadb06de270db923f50646b0/671b1dcefadb06de270db923f50646b0.mp4', NULL, '2023-09-26 19:15:17', NULL, '1', '', '002003', NULL, 30974227);
INSERT INTO `media_files` VALUES ('688175374846f1ec48d461ce17e67203', 1232141425, '教育机构', '登月巨人.mp4', '001002', '课程视频', 'video', '6/8/688175374846f1ec48d461ce17e67203/688175374846f1ec48d461ce17e67203.mp4', '688175374846f1ec48d461ce17e67203', '/video/6/8/688175374846f1ec48d461ce17e67203/688175374846f1ec48d461ce17e67203.mp4', NULL, '2023-09-26 18:46:02', NULL, '1', '', '002003', NULL, 74774021);
INSERT INTO `media_files` VALUES ('6bd0f3c52758b2a770e330816881f63e', 1232141425, '教育机构', 'wallhaven-0j1jqw.png', '001001', NULL, 'mediafiles', '2023/09/28/6bd0f3c52758b2a770e330816881f63e.png', '6bd0f3c52758b2a770e330816881f63e', '/mediafiles/2023/09/28/6bd0f3c52758b2a770e330816881f63e.png', NULL, '2023-09-28 18:27:21', NULL, '1', NULL, '002003', NULL, 1005772);
INSERT INTO `media_files` VALUES ('6dd38195627e39e43b22397bb964ce6b', 1232141425, '教育机构', 'wallhaven-8xvmry.jpg', '001001', NULL, 'mediafiles', '2023/09/28/6dd38195627e39e43b22397bb964ce6b.jpg', '6dd38195627e39e43b22397bb964ce6b', '/mediafiles/2023/09/28/6dd38195627e39e43b22397bb964ce6b.jpg', NULL, '2023-09-28 18:15:17', NULL, '1', NULL, '002003', NULL, 352716);
INSERT INTO `media_files` VALUES ('6ed6665bfb130deb7ba2a0eacc72a5ae', 1232141425, '教育机构', '媚宅.mp4', '001002', '课程视频', 'video', '6/e/6ed6665bfb130deb7ba2a0eacc72a5ae/6ed6665bfb130deb7ba2a0eacc72a5ae.mp4', '6ed6665bfb130deb7ba2a0eacc72a5ae', '/video/6/e/6ed6665bfb130deb7ba2a0eacc72a5ae/6ed6665bfb130deb7ba2a0eacc72a5ae.mp4', NULL, '2023-09-27 10:56:51', NULL, '1', '', '002003', NULL, 27317776);
INSERT INTO `media_files` VALUES ('6f51d13788bbbb38822b75cb01121c5b', 1232141425, '教育机构', '赛博朋克1.mp4', '001002', '课程视频', 'video', '6/f/6f51d13788bbbb38822b75cb01121c5b/6f51d13788bbbb38822b75cb01121c5b.mp4', '6f51d13788bbbb38822b75cb01121c5b', '/video/6/f/6f51d13788bbbb38822b75cb01121c5b/6f51d13788bbbb38822b75cb01121c5b.mp4', NULL, '2023-09-26 19:09:56', NULL, '1', '', '002003', NULL, 35218663);
INSERT INTO `media_files` VALUES ('728a7ea3a548fdbb06b5883a6770a56b', 1232141425, '教育机构', 'wallhaven-eydpgw.png', '001001', NULL, 'mediafiles', '2023/09/26/728a7ea3a548fdbb06b5883a6770a56b.png', '728a7ea3a548fdbb06b5883a6770a56b', '/mediafiles/2023/09/26/728a7ea3a548fdbb06b5883a6770a56b.png', NULL, '2023-09-26 21:18:28', NULL, '1', NULL, '002003', NULL, 649639);
INSERT INTO `media_files` VALUES ('76731708bf052d7fbb8a2ad74ded7e8c', 1232141425, '教育机构', 'course422600939312362187.html', '001001', NULL, 'mediafiles', 'course/141.html', '76731708bf052d7fbb8a2ad74ded7e8c', '/mediafiles/course/141.html', NULL, '2023-09-28 18:30:48', NULL, '1', NULL, '002003', NULL, 12623);
INSERT INTO `media_files` VALUES ('774f9ea6ba51730c166039eca6e5823c', 1232141425, '教育机构', '美丽的世界.mp4', '001002', '课程视频', 'video', '7/7/774f9ea6ba51730c166039eca6e5823c/774f9ea6ba51730c166039eca6e5823c.mp4', '774f9ea6ba51730c166039eca6e5823c', '/video/7/7/774f9ea6ba51730c166039eca6e5823c/774f9ea6ba51730c166039eca6e5823c.mp4', NULL, '2023-10-03 12:30:32', NULL, '1', '', '002003', NULL, 43615098);
INSERT INTO `media_files` VALUES ('794bde323dab0af293fe01c2602ce8a6', 1232141425, '教育机构', 'wallhaven-j37zv5.png', '001001', NULL, 'mediafiles', '2023/09/28/794bde323dab0af293fe01c2602ce8a6.png', '794bde323dab0af293fe01c2602ce8a6', '/mediafiles/2023/09/28/794bde323dab0af293fe01c2602ce8a6.png', NULL, '2023-09-28 18:13:22', NULL, '1', NULL, '002003', NULL, 1275290);
INSERT INTO `media_files` VALUES ('7a4b1e25afe99150f89255a684c7c0be', 1232141425, '教育机构', 'wallhaven-1jgd19.jpg', '001001', NULL, 'mediafiles', '2023/09/28/7a4b1e25afe99150f89255a684c7c0be.jpg', '7a4b1e25afe99150f89255a684c7c0be', '/mediafiles/2023/09/28/7a4b1e25afe99150f89255a684c7c0be.jpg', NULL, '2023-09-28 18:39:20', NULL, '1', NULL, '002003', NULL, 916251);
INSERT INTO `media_files` VALUES ('7bc1255e76cfa97e79be484d3a917b9c', 1232141425, '教育机构', '124.html', '001001', NULL, 'mediafiles', 'course/124.html', '7bc1255e76cfa97e79be484d3a917b9c', '/mediafiles/course/124.html', NULL, '2023-09-28 10:41:02', NULL, '1', NULL, '002003', NULL, 12178);
INSERT INTO `media_files` VALUES ('7cf946ac23b0d63c1dc912ad5b57bb76', 1232141425, '教育机构', '爱情再见.mp4', '001002', '课程视频', 'video', '7/c/7cf946ac23b0d63c1dc912ad5b57bb76/7cf946ac23b0d63c1dc912ad5b57bb76.mp4', '7cf946ac23b0d63c1dc912ad5b57bb76', '/video/7/c/7cf946ac23b0d63c1dc912ad5b57bb76/7cf946ac23b0d63c1dc912ad5b57bb76.mp4', NULL, '2023-09-26 18:36:14', NULL, '1', '', '002003', NULL, 28207034);
INSERT INTO `media_files` VALUES ('7d463af612843b80126ec7fa312d3bf9', 1232141425, '教育机构', 'wallhaven-1kdr81.png', '001001', NULL, 'mediafiles', '2023/09/26/7d463af612843b80126ec7fa312d3bf9.png', '7d463af612843b80126ec7fa312d3bf9', '/mediafiles/2023/09/26/7d463af612843b80126ec7fa312d3bf9.png', NULL, '2023-09-26 20:20:41', NULL, '1', NULL, '002003', NULL, 978790);
INSERT INTO `media_files` VALUES ('8253c004d5184fbdc544f3541c9bf4e7', 1232141425, '教育机构', '孤独摇滚.mp4', '001002', '课程视频', 'video', '8/2/8253c004d5184fbdc544f3541c9bf4e7/8253c004d5184fbdc544f3541c9bf4e7.mp4', '8253c004d5184fbdc544f3541c9bf4e7', '/video/8/2/8253c004d5184fbdc544f3541c9bf4e7/8253c004d5184fbdc544f3541c9bf4e7.mp4', NULL, '2023-09-27 11:04:50', NULL, '1', '', '002003', NULL, 44267701);
INSERT INTO `media_files` VALUES ('82ef72aab06d899a018cbc8a2cd4b904', 1232141425, '教育机构', 'course8725883275628452864.html', '001001', NULL, 'mediafiles', 'course/134.html', '82ef72aab06d899a018cbc8a2cd4b904', '/mediafiles/course/134.html', NULL, '2023-09-28 18:37:21', NULL, '1', NULL, '002003', NULL, 11855);
INSERT INTO `media_files` VALUES ('8324f5241f6c8b4a501a11a8b3d8c257', 1232141425, '教育机构', 'wallhaven-vqeg9m.png', '001001', NULL, 'mediafiles', '2023/09/26/8324f5241f6c8b4a501a11a8b3d8c257.png', '8324f5241f6c8b4a501a11a8b3d8c257', '/mediafiles/2023/09/26/8324f5241f6c8b4a501a11a8b3d8c257.png', NULL, '2023-09-26 19:39:10', NULL, '1', NULL, '002003', NULL, 1050543);
INSERT INTO `media_files` VALUES ('8884b74dd86ee6011347200ae93c0da9', 1232141425, '教育机构', 'wallhaven-dplgkm.jpg', '001001', NULL, 'mediafiles', '2023/09/28/8884b74dd86ee6011347200ae93c0da9.jpg', '8884b74dd86ee6011347200ae93c0da9', '/mediafiles/2023/09/28/8884b74dd86ee6011347200ae93c0da9.jpg', NULL, '2023-09-28 18:12:39', NULL, '1', NULL, '002003', NULL, 1695557);
INSERT INTO `media_files` VALUES ('888b858f1cd5c9741dae7833b2f2466a', 1232141425, '教育机构', 'course2415047526120260787.html', '001001', NULL, 'mediafiles', 'course/140.html', '888b858f1cd5c9741dae7833b2f2466a', '/mediafiles/course/140.html', NULL, '2023-10-04 16:20:21', NULL, '1', NULL, '002003', NULL, 11114);
INSERT INTO `media_files` VALUES ('8c3bc25410d8e74a58df1adc9d2aaf43', 1232141425, '教育机构', 'course1681547942291425085.html', '001001', NULL, 'mediafiles', 'course/139.html', '8c3bc25410d8e74a58df1adc9d2aaf43', '/mediafiles/course/139.html', NULL, '2023-09-28 18:29:15', NULL, '1', NULL, '002003', NULL, 12063);
INSERT INTO `media_files` VALUES ('8c55720283cba115e02dc57e41205de0', 1232141425, '教育机构', 'EVA最后一次吻.mp4', '001002', '课程视频', 'video', '8/c/8c55720283cba115e02dc57e41205de0/8c55720283cba115e02dc57e41205de0.mp4', '8c55720283cba115e02dc57e41205de0', '/video/8/c/8c55720283cba115e02dc57e41205de0/8c55720283cba115e02dc57e41205de0.mp4', NULL, '2023-09-26 18:30:45', NULL, '1', '', '002003', NULL, 14791185);
INSERT INTO `media_files` VALUES ('8dcbe59d5a5b5cd5b8596b417e86cb37', 1232141425, '教育机构', '知识就是力量.mp4', '001002', '课程视频', 'video', '8/d/8dcbe59d5a5b5cd5b8596b417e86cb37/8dcbe59d5a5b5cd5b8596b417e86cb37.mp4', '8dcbe59d5a5b5cd5b8596b417e86cb37', '/video/8/d/8dcbe59d5a5b5cd5b8596b417e86cb37/8dcbe59d5a5b5cd5b8596b417e86cb37.mp4', NULL, '2023-09-27 10:25:28', NULL, '1', '', '002003', NULL, 133198988);
INSERT INTO `media_files` VALUES ('8e722b863bb1c35cce997aa9f2c9f1ac', 1232141425, '教育机构', 'wallhaven-rd2x5w.jpg', '001001', NULL, 'mediafiles', '2023/09/28/8e722b863bb1c35cce997aa9f2c9f1ac.jpg', '8e722b863bb1c35cce997aa9f2c9f1ac', '/mediafiles/2023/09/28/8e722b863bb1c35cce997aa9f2c9f1ac.jpg', NULL, '2023-09-28 18:13:56', NULL, '1', NULL, '002003', NULL, 1798872);
INSERT INTO `media_files` VALUES ('8eb7435d9a4af4652c084a39859a6b19', 1232141425, '教育机构', 'wallhaven-o31p97.jpg', '001001', NULL, 'mediafiles', '2023/09/26/8eb7435d9a4af4652c084a39859a6b19.jpg', '8eb7435d9a4af4652c084a39859a6b19', '/mediafiles/2023/09/26/8eb7435d9a4af4652c084a39859a6b19.jpg', NULL, '2023-09-26 19:46:58', NULL, '1', NULL, '002003', NULL, 821757);
INSERT INTO `media_files` VALUES ('9336d067305378bed0b572c8eef4c0cb', 1232141425, '教育机构', 'wallhaven-9d9pv1.jpg', '001001', NULL, 'mediafiles', '2023/09/26/9336d067305378bed0b572c8eef4c0cb.jpg', '9336d067305378bed0b572c8eef4c0cb', '/mediafiles/2023/09/26/9336d067305378bed0b572c8eef4c0cb.jpg', NULL, '2023-09-26 19:48:37', NULL, '1', NULL, '002003', NULL, 1159641);
INSERT INTO `media_files` VALUES ('95469b77ad682989100fb1425b29ad6a', 1232141425, '教育机构', 'wallhaven-3k2k7v.png', '001001', NULL, 'mediafiles', '2023/09/28/95469b77ad682989100fb1425b29ad6a.png', '95469b77ad682989100fb1425b29ad6a', '/mediafiles/2023/09/28/95469b77ad682989100fb1425b29ad6a.png', NULL, '2023-09-28 18:36:24', NULL, '1', NULL, '002003', NULL, 1137773);
INSERT INTO `media_files` VALUES ('981baea10a66bf77ca4f711138c2d39f', 1232141425, '教育机构', 'course3932521406917868383.html', '001001', NULL, 'mediafiles', 'course/132.html', '981baea10a66bf77ca4f711138c2d39f', '/mediafiles/course/132.html', NULL, '2023-10-04 16:22:27', NULL, '1', NULL, '002003', NULL, 11698);
INSERT INTO `media_files` VALUES ('994f595b558d2db47604e7c63d9b92a3', 1232141425, '教育机构', 'course5924965732432031282.html', '001001', NULL, 'mediafiles', 'course/128.html', '994f595b558d2db47604e7c63d9b92a3', '/mediafiles/course/128.html', NULL, '2023-09-28 17:44:13', NULL, '1', NULL, '002003', NULL, 11865);
INSERT INTO `media_files` VALUES ('9a025bc5e91499a9108850340bab6bb1', 1232141425, '教育机构', 'O1IP-C.jpg', '001001', NULL, 'mediafiles', '2023/09/26/9a025bc5e91499a9108850340bab6bb1.jpg', '9a025bc5e91499a9108850340bab6bb1', '/mediafiles/2023/09/26/9a025bc5e91499a9108850340bab6bb1.jpg', NULL, '2023-09-26 19:52:46', NULL, '1', NULL, '002003', NULL, 26324);
INSERT INTO `media_files` VALUES ('9b21899a2c45d1a3ddf0ef3c6be0696a', 1232141425, '教育机构', 'wallhaven-8oj63k.jpg', '001001', NULL, 'mediafiles', '2023/09/26/9b21899a2c45d1a3ddf0ef3c6be0696a.jpg', '9b21899a2c45d1a3ddf0ef3c6be0696a', '/mediafiles/2023/09/26/9b21899a2c45d1a3ddf0ef3c6be0696a.jpg', NULL, '2023-09-26 20:26:39', NULL, '1', NULL, '002003', NULL, 614189);
INSERT INTO `media_files` VALUES ('9ebc6496fb911fbeca23e0212aec37b0', 1232141425, '教育机构', 'wallhaven-958w9w.jpg', '001001', NULL, 'mediafiles', '2023/10/03/9ebc6496fb911fbeca23e0212aec37b0.jpg', '9ebc6496fb911fbeca23e0212aec37b0', '/mediafiles/2023/10/03/9ebc6496fb911fbeca23e0212aec37b0.jpg', NULL, '2023-10-03 13:40:16', NULL, '1', NULL, '002003', NULL, 883823);
INSERT INTO `media_files` VALUES ('9f56d7302c17018c8d8fd6eeada26522', 1232141425, '教育机构', 'course8147577222163551498.html', '001001', NULL, 'mediafiles', 'course/131.html', '9f56d7302c17018c8d8fd6eeada26522', '/mediafiles/course/131.html', NULL, '2023-09-28 18:37:09', NULL, '1', NULL, '002003', NULL, 11350);
INSERT INTO `media_files` VALUES ('9fa35195246927cac813a1e4c2e2f4cd', 1232141425, '教育机构', 'wallhaven-j53955.jpg', '001001', NULL, 'mediafiles', '2023/09/28/9fa35195246927cac813a1e4c2e2f4cd.jpg', '9fa35195246927cac813a1e4c2e2f4cd', '/mediafiles/2023/09/28/9fa35195246927cac813a1e4c2e2f4cd.jpg', NULL, '2023-09-28 18:17:23', NULL, '1', NULL, '002003', NULL, 389275);
INSERT INTO `media_files` VALUES ('9fd9279d7a59e209fc5f29426065ae02', 1232141425, '教育机构', 'v2-f52b97df1feb665477aa8016fbe510ab_r.jpg', '001001', NULL, 'mediafiles', '2023/09/26/9fd9279d7a59e209fc5f29426065ae02.jpg', '9fd9279d7a59e209fc5f29426065ae02', '/mediafiles/2023/09/26/9fd9279d7a59e209fc5f29426065ae02.jpg', NULL, '2023-09-26 21:25:55', NULL, '1', NULL, '002003', NULL, 170042);
INSERT INTO `media_files` VALUES ('a03589c920662b6955a783ca5914eab0', 1232141425, '教育机构', 'course4203671219854550807.html', '001001', NULL, 'mediafiles', 'course/126.html', 'a03589c920662b6955a783ca5914eab0', '/mediafiles/course/126.html', NULL, '2023-09-28 17:44:13', NULL, '1', NULL, '002003', NULL, 11315);
INSERT INTO `media_files` VALUES ('a8886863c01cb5d36a3e194a40bd0091', 1232141425, '教育机构', 'java.png', '001001', NULL, 'mediafiles', '2023/09/26/a8886863c01cb5d36a3e194a40bd0091.png', 'a8886863c01cb5d36a3e194a40bd0091', '/mediafiles/2023/09/26/a8886863c01cb5d36a3e194a40bd0091.png', NULL, '2023-09-26 19:49:48', NULL, '1', NULL, '002003', NULL, 106922);
INSERT INTO `media_files` VALUES ('a985020b2305d1a76e6bbbc25a24e517', 1232141425, '教育机构', 'wallhaven-6o83w7.jpg', '001001', NULL, 'mediafiles', '2023/09/26/a985020b2305d1a76e6bbbc25a24e517.jpg', 'a985020b2305d1a76e6bbbc25a24e517', '/mediafiles/2023/09/26/a985020b2305d1a76e6bbbc25a24e517.jpg', NULL, '2023-09-26 21:23:54', NULL, '1', NULL, '002003', NULL, 928131);
INSERT INTO `media_files` VALUES ('a9fa22de59287b5f138743646dcdaa08', 1232141425, '教育机构', 'wallhaven-we1z7.jpg', '001001', NULL, 'mediafiles', '2023/09/26/a9fa22de59287b5f138743646dcdaa08.jpg', 'a9fa22de59287b5f138743646dcdaa08', '/mediafiles/2023/09/26/a9fa22de59287b5f138743646dcdaa08.jpg', NULL, '2023-09-26 20:30:52', NULL, '1', NULL, '002003', NULL, 421289);
INSERT INTO `media_files` VALUES ('ad213175155c9193c5a027e6de5126fa', 1232141425, '教育机构', '火影忍者2.mp4', '001002', '课程视频', 'video', 'a/d/ad213175155c9193c5a027e6de5126fa/ad213175155c9193c5a027e6de5126fa.mp4', 'ad213175155c9193c5a027e6de5126fa', '/video/a/d/ad213175155c9193c5a027e6de5126fa/ad213175155c9193c5a027e6de5126fa.mp4', NULL, '2023-09-26 18:53:40', NULL, '1', '', '002003', NULL, 51065696);
INSERT INTO `media_files` VALUES ('aea392ea2bf72c6f074548c92e30faf8', 1232141425, '教育机构', 'course8824720804330563609.html', '001001', NULL, 'mediafiles', 'course/130.html', 'aea392ea2bf72c6f074548c92e30faf8', '/mediafiles/course/130.html', NULL, '2023-09-28 17:44:15', NULL, '1', NULL, '002003', NULL, 11795);
INSERT INTO `media_files` VALUES ('aeb5b3d956d283908bd7bdf88a4dae6a', 1232141425, '教育机构', 'course8942160468687029062.html', '001001', NULL, 'mediafiles', 'course/125.html', 'aeb5b3d956d283908bd7bdf88a4dae6a', '/mediafiles/course/125.html', NULL, '2023-09-28 17:44:13', NULL, '1', NULL, '002003', NULL, 11318);
INSERT INTO `media_files` VALUES ('af834a1b1b5a6c60006dcab8f11d5a4a', 1232141425, '教育机构', '你潮吗.mp4', '001002', '课程视频', 'video', 'a/f/af834a1b1b5a6c60006dcab8f11d5a4a/af834a1b1b5a6c60006dcab8f11d5a4a.mp4', 'af834a1b1b5a6c60006dcab8f11d5a4a', '/video/a/f/af834a1b1b5a6c60006dcab8f11d5a4a/af834a1b1b5a6c60006dcab8f11d5a4a.mp4', NULL, '2023-09-27 10:58:33', NULL, '1', '', '002003', NULL, 65938038);
INSERT INTO `media_files` VALUES ('b2c45f723df2c2f0e990c11b3d2d47b9', 1232141425, '教育机构', 'wallhaven-exykj8.png', '001001', NULL, 'mediafiles', '2023/09/26/b2c45f723df2c2f0e990c11b3d2d47b9.png', 'b2c45f723df2c2f0e990c11b3d2d47b9', '/mediafiles/2023/09/26/b2c45f723df2c2f0e990c11b3d2d47b9.png', NULL, '2023-09-26 20:52:33', NULL, '1', NULL, '002003', NULL, 1462426);
INSERT INTO `media_files` VALUES ('b397791757db5048d0ef85a7f77a4624', 1232141425, '教育机构', '伤感.mp4', '001002', '课程视频', 'video', 'b/3/b397791757db5048d0ef85a7f77a4624/b397791757db5048d0ef85a7f77a4624.mp4', 'b397791757db5048d0ef85a7f77a4624', '/video/b/3/b397791757db5048d0ef85a7f77a4624/b397791757db5048d0ef85a7f77a4624.mp4', NULL, '2023-09-27 10:28:06', NULL, '1', '', '002003', NULL, 102221692);
INSERT INTO `media_files` VALUES ('b4223aeb23c0af0f203a5e1327fea82d', 1232141425, '教育机构', 'course3369971765502681420.html', '001001', NULL, 'mediafiles', 'course/142.html', 'b4223aeb23c0af0f203a5e1327fea82d', '/mediafiles/course/142.html', NULL, '2023-10-04 16:10:45', NULL, '1', NULL, '002003', NULL, 10922);
INSERT INTO `media_files` VALUES ('b4875a8ea2b574f6433797a6e68633d1', 1232141425, '教育机构', 'course1101981399700402883.html', '001001', NULL, 'mediafiles', 'course/132.html', 'b4875a8ea2b574f6433797a6e68633d1', '/mediafiles/course/132.html', NULL, '2023-09-28 17:44:15', NULL, '1', NULL, '002003', NULL, 11873);
INSERT INTO `media_files` VALUES ('b491d2cd3c7170e54cd3798d4d7d4d6c', 1232141425, '教育机构', 'v2-3a47638bf9ddabba1782369b7440e296_r.jpg', '001001', NULL, 'mediafiles', '2023/09/26/b491d2cd3c7170e54cd3798d4d7d4d6c.jpg', 'b491d2cd3c7170e54cd3798d4d7d4d6c', '/mediafiles/2023/09/26/b491d2cd3c7170e54cd3798d4d7d4d6c.jpg', NULL, '2023-09-26 20:43:05', NULL, '1', NULL, '002003', NULL, 76768);
INSERT INTO `media_files` VALUES ('b510913a0504859d1c477d1ccc50838a', 1232141425, '教育机构', '带好耳机.mp4', '001002', '课程视频', 'video', 'b/5/b510913a0504859d1c477d1ccc50838a/b510913a0504859d1c477d1ccc50838a.mp4', 'b510913a0504859d1c477d1ccc50838a', '/video/b/5/b510913a0504859d1c477d1ccc50838a/b510913a0504859d1c477d1ccc50838a.mp4', NULL, '2023-09-26 18:42:41', NULL, '1', '', '002003', NULL, 30853536);
INSERT INTO `media_files` VALUES ('b673c00da8ca54dd5eb3cb7092f7c860', 1232141425, '教育机构', 'course6150303160712881681.html', '001001', NULL, 'mediafiles', 'course/127.html', 'b673c00da8ca54dd5eb3cb7092f7c860', '/mediafiles/course/127.html', NULL, '2023-09-28 17:44:13', NULL, '1', NULL, '002003', NULL, 11357);
INSERT INTO `media_files` VALUES ('b7519b537e20f62cf75548d3ef4d450c', 1232141425, '教育机构', 'wallhaven-42x6vx.jpg', '001001', NULL, 'mediafiles', '2023/10/04/b7519b537e20f62cf75548d3ef4d450c.jpg', 'b7519b537e20f62cf75548d3ef4d450c', '/mediafiles/2023/10/04/b7519b537e20f62cf75548d3ef4d450c.jpg', NULL, '2023-10-04 16:15:49', NULL, '1', NULL, '002003', NULL, 152229);
INSERT INTO `media_files` VALUES ('ba618aca95f4b9b855150ff1ddcf747c', 1232141425, '教育机构', 'wallhaven-x83g5l.jpg', '001001', NULL, 'mediafiles', '2023/09/26/ba618aca95f4b9b855150ff1ddcf747c.jpg', 'ba618aca95f4b9b855150ff1ddcf747c', '/mediafiles/2023/09/26/ba618aca95f4b9b855150ff1ddcf747c.jpg', NULL, '2023-09-26 20:56:52', NULL, '1', NULL, '002003', NULL, 1862218);
INSERT INTO `media_files` VALUES ('bc0e82c56bfd93b46bb99c248ba347a8', 1232141425, '教育机构', 'wallhaven-pk8qme.png', '001001', NULL, 'mediafiles', '2023/09/26/bc0e82c56bfd93b46bb99c248ba347a8.png', 'bc0e82c56bfd93b46bb99c248ba347a8', '/mediafiles/2023/09/26/bc0e82c56bfd93b46bb99c248ba347a8.png', NULL, '2023-09-26 19:40:17', NULL, '1', NULL, '002003', NULL, 1825947);
INSERT INTO `media_files` VALUES ('bfac55b4e8c51d5a62788a190e877a6a', 1232141425, '教育机构', '388702270_nb3-1-16.mp4', '001002', '课程视频', 'video', 'b/f/bfac55b4e8c51d5a62788a190e877a6a/bfac55b4e8c51d5a62788a190e877a6a.mp4', 'bfac55b4e8c51d5a62788a190e877a6a', '/video/b/f/bfac55b4e8c51d5a62788a190e877a6a/bfac55b4e8c51d5a62788a190e877a6a.mp4', NULL, '2023-10-03 12:24:28', NULL, '1', '', '002003', NULL, 10194885);
INSERT INTO `media_files` VALUES ('c14691b690424da54a18669f88740696', 1232141425, '教育机构', 'wallhaven-vqmo1m.jpg', '001001', NULL, 'mediafiles', '2023/09/26/c14691b690424da54a18669f88740696.jpg', 'c14691b690424da54a18669f88740696', '/mediafiles/2023/09/26/c14691b690424da54a18669f88740696.jpg', NULL, '2023-09-26 19:32:26', NULL, '1', NULL, '002003', NULL, 2048644);
INSERT INTO `media_files` VALUES ('c594139dc03414dabca8401f3e751ff8', 1232141425, '教育机构', 'wallhaven-vqeqop.png', '001001', NULL, 'mediafiles', '2023/09/26/c594139dc03414dabca8401f3e751ff8.png', 'c594139dc03414dabca8401f3e751ff8', '/mediafiles/2023/09/26/c594139dc03414dabca8401f3e751ff8.png', NULL, '2023-09-26 20:15:34', NULL, '1', NULL, '002003', NULL, 518795);
INSERT INTO `media_files` VALUES ('c601d1fa8838ccc9931b192e228dcd8a', 1232141425, '教育机构', '拔刀.mp4', '001002', '课程视频', 'video', 'c/6/c601d1fa8838ccc9931b192e228dcd8a/c601d1fa8838ccc9931b192e228dcd8a.mp4', 'c601d1fa8838ccc9931b192e228dcd8a', '/video/c/6/c601d1fa8838ccc9931b192e228dcd8a/c601d1fa8838ccc9931b192e228dcd8a.mp4', NULL, '2023-09-26 18:41:15', NULL, '1', '', '002003', NULL, 36951552);
INSERT INTO `media_files` VALUES ('c801b39717c1704b624d4b502042f6cb', 1232141425, '教育机构', '四大青年漫.mp4', '001002', '课程视频', 'video', 'c/8/c801b39717c1704b624d4b502042f6cb/c801b39717c1704b624d4b502042f6cb.mp4', 'c801b39717c1704b624d4b502042f6cb', '/video/c/8/c801b39717c1704b624d4b502042f6cb/c801b39717c1704b624d4b502042f6cb.mp4', NULL, '2023-09-26 19:12:44', NULL, '1', '', '002003', NULL, 63981707);
INSERT INTO `media_files` VALUES ('cb97c56312f15354b07e00bb60e057f7', 1232141425, '教育机构', 'wallhaven-pkjpre.jpg', '001001', NULL, 'mediafiles', '2023/09/26/cb97c56312f15354b07e00bb60e057f7.jpg', 'cb97c56312f15354b07e00bb60e057f7', '/mediafiles/2023/09/26/cb97c56312f15354b07e00bb60e057f7.jpg', NULL, '2023-09-26 19:42:20', NULL, '1', NULL, '002003', NULL, 863930);
INSERT INTO `media_files` VALUES ('d4081a5f0d5e0b7b155106eee1de3e0e', 1232141425, '教育机构', 'course6182811163392022911.html', '001001', NULL, 'mediafiles', 'course/142.html', 'd4081a5f0d5e0b7b155106eee1de3e0e', '/mediafiles/course/142.html', NULL, '2023-09-28 17:44:24', NULL, '1', NULL, '002003', NULL, 11097);
INSERT INTO `media_files` VALUES ('d6aeec5528a77080ae2a5e0a0efca89c', 1232141425, '教育机构', 'course6298758671682539729.html', '001001', NULL, 'mediafiles', 'course/137.html', 'd6aeec5528a77080ae2a5e0a0efca89c', '/mediafiles/course/137.html', NULL, '2023-09-28 18:41:27', NULL, '1', NULL, '002003', NULL, 11316);
INSERT INTO `media_files` VALUES ('d7148bb61d136ecfe2bb86f80f64f336', 1232141425, '教育机构', '我不可以爱你.mp4', '001002', '课程视频', 'video', 'd/7/d7148bb61d136ecfe2bb86f80f64f336/d7148bb61d136ecfe2bb86f80f64f336.mp4', 'd7148bb61d136ecfe2bb86f80f64f336', '/video/d/7/d7148bb61d136ecfe2bb86f80f64f336/d7148bb61d136ecfe2bb86f80f64f336.mp4', NULL, '2023-09-26 19:30:19', NULL, '1', '', '002003', NULL, 43627230);
INSERT INTO `media_files` VALUES ('da3344239af2f54a13af3fef34941c3a', 1232141425, '教育机构', 'wallhaven-48gz3y.jpg', '001001', NULL, 'mediafiles', '2023/09/28/da3344239af2f54a13af3fef34941c3a.jpg', 'da3344239af2f54a13af3fef34941c3a', '/mediafiles/2023/09/28/da3344239af2f54a13af3fef34941c3a.jpg', NULL, '2023-09-28 18:28:13', NULL, '1', NULL, '002003', NULL, 325590);
INSERT INTO `media_files` VALUES ('ddb7da6c45bd94f9e687f3f54b4df432', 1232141425, '教育机构', 'wallhaven-x69lwl.png', '001001', NULL, 'mediafiles', '2023/09/26/ddb7da6c45bd94f9e687f3f54b4df432.png', 'ddb7da6c45bd94f9e687f3f54b4df432', '/mediafiles/2023/09/26/ddb7da6c45bd94f9e687f3f54b4df432.png', NULL, '2023-09-26 20:11:03', NULL, '1', NULL, '002003', NULL, 1829318);
INSERT INTO `media_files` VALUES ('e1b5550807b20c8c46be551a8adf95f1', 1232141425, '教育机构', 'wallhaven-ode8mm.jpg', '001001', NULL, 'mediafiles', '2023/10/03/e1b5550807b20c8c46be551a8adf95f1.jpg', 'e1b5550807b20c8c46be551a8adf95f1', '/mediafiles/2023/10/03/e1b5550807b20c8c46be551a8adf95f1.jpg', NULL, '2023-10-03 12:11:18', NULL, '1', NULL, '002003', NULL, 200863);
INSERT INTO `media_files` VALUES ('e3597987ceae930d6bf89a14e9f39058', 1232141425, '教育机构', 'course7513211871853377402.html', '001001', NULL, 'mediafiles', 'course/135.html', 'e3597987ceae930d6bf89a14e9f39058', '/mediafiles/course/135.html', NULL, '2023-09-28 17:44:18', NULL, '1', NULL, '002003', NULL, 11348);
INSERT INTO `media_files` VALUES ('e57355f60a75076e792f6b686d533e44', 1232141425, '教育机构', '火影忍者3.mp4', '001002', '课程视频', 'video', 'e/5/e57355f60a75076e792f6b686d533e44/e57355f60a75076e792f6b686d533e44.mp4', 'e57355f60a75076e792f6b686d533e44', '/video/e/5/e57355f60a75076e792f6b686d533e44/e57355f60a75076e792f6b686d533e44.mp4', NULL, '2023-09-26 18:57:31', NULL, '1', '', '002003', NULL, 86651143);
INSERT INTO `media_files` VALUES ('e630713cca1a70457238cb7e66b07aa2', 1232141425, '教育机构', 'course9027909384161634204.html', '001001', NULL, 'mediafiles', 'course/124.html', 'e630713cca1a70457238cb7e66b07aa2', '/mediafiles/course/124.html', NULL, '2023-09-28 18:31:15', NULL, '1', NULL, '002003', NULL, 12178);
INSERT INTO `media_files` VALUES ('e6b3acb456362b4215e49c285722784b', 1232141425, '教育机构', 'wallhaven-pkyy7m.jpg', '001001', NULL, 'mediafiles', '2023/09/26/e6b3acb456362b4215e49c285722784b.jpg', 'e6b3acb456362b4215e49c285722784b', '/mediafiles/2023/09/26/e6b3acb456362b4215e49c285722784b.jpg', NULL, '2023-09-26 20:23:40', NULL, '1', NULL, '002003', NULL, 1527356);
INSERT INTO `media_files` VALUES ('e708b8ab2f4d333fbf1d7182da36706c', 1232141425, '教育机构', 'course6012246268980059837.html', '001001', NULL, 'mediafiles', 'course/133.html', 'e708b8ab2f4d333fbf1d7182da36706c', '/mediafiles/course/133.html', NULL, '2023-09-28 18:23:54', NULL, '1', NULL, '002003', NULL, 11847);
INSERT INTO `media_files` VALUES ('ece51aaf447ebb71e8928df5aa5be3c9', 1232141425, '教育机构', 'course1437319635035018119.html', '001001', NULL, 'mediafiles', 'course/125.html', 'ece51aaf447ebb71e8928df5aa5be3c9', '/mediafiles/course/125.html', NULL, '2023-10-04 16:25:24', NULL, '1', NULL, '002003', NULL, 11143);
INSERT INTO `media_files` VALUES ('eed540ba18d53447a2f705b41544f8ce', 1232141425, '教育机构', 'wallhaven-95v7xw.jpg', '001001', NULL, 'mediafiles', '2023/10/03/eed540ba18d53447a2f705b41544f8ce.jpg', 'eed540ba18d53447a2f705b41544f8ce', '/mediafiles/2023/10/03/eed540ba18d53447a2f705b41544f8ce.jpg', NULL, '2023-10-03 13:33:10', NULL, '1', NULL, '002003', NULL, 262329);
INSERT INTO `media_files` VALUES ('f0d556ea888323f9e7e914c68c70b60b', 1232141425, '教育机构', '和月亮说话.mp4', '001002', '课程视频', 'video', 'f/0/f0d556ea888323f9e7e914c68c70b60b/f0d556ea888323f9e7e914c68c70b60b.mp4', 'f0d556ea888323f9e7e914c68c70b60b', '/video/f/0/f0d556ea888323f9e7e914c68c70b60b/f0d556ea888323f9e7e914c68c70b60b.mp4', NULL, '2023-09-26 18:49:24', NULL, '1', '', '002003', NULL, 13132737);
INSERT INTO `media_files` VALUES ('f33d8b7c92a7c8a174da9e62ffce1467', 1232141425, '教育机构', 'wallhaven-6olgpq.png', '001001', NULL, 'mediafiles', '2023/09/26/f33d8b7c92a7c8a174da9e62ffce1467.png', 'f33d8b7c92a7c8a174da9e62ffce1467', '/mediafiles/2023/09/26/f33d8b7c92a7c8a174da9e62ffce1467.png', NULL, '2023-09-26 20:25:40', NULL, '1', NULL, '002003', NULL, 1606985);
INSERT INTO `media_files` VALUES ('f40ba549ded7370a7eb712b2beadfafc', 1232141425, '教育机构', 'wallhaven-x1ogpo.jpg', '001001', NULL, 'mediafiles', '2023/09/28/f40ba549ded7370a7eb712b2beadfafc.jpg', 'f40ba549ded7370a7eb712b2beadfafc', '/mediafiles/2023/09/28/f40ba549ded7370a7eb712b2beadfafc.jpg', NULL, '2023-09-28 18:16:19', NULL, '1', NULL, '002003', NULL, 348880);
INSERT INTO `media_files` VALUES ('f410c202315dc975056f11bfab529cec', 1232141425, '教育机构', '108部动漫.mp4', '001002', '课程视频', 'video', 'f/4/f410c202315dc975056f11bfab529cec/f410c202315dc975056f11bfab529cec.mp4', 'f410c202315dc975056f11bfab529cec', '/video/f/4/f410c202315dc975056f11bfab529cec/f410c202315dc975056f11bfab529cec.mp4', NULL, '2023-09-26 18:28:22', NULL, '1', '', '002003', NULL, 89870259);
INSERT INTO `media_files` VALUES ('f46c8404c3b662f60da26dd1d468f4d4', 1232141425, '教育机构', 'course3924845305098352898.html', '001001', NULL, 'mediafiles', 'course/129.html', 'f46c8404c3b662f60da26dd1d468f4d4', '/mediafiles/course/129.html', NULL, '2023-10-03 13:41:30', NULL, '1', NULL, '002003', NULL, 11308);
INSERT INTO `media_files` VALUES ('f57bf24393fa9cb6bdcd588ff6be014b', 1232141425, '教育机构', 'v2-88f5d76a9997ee04e9e438eaf440fe95_r.jpg', '001001', NULL, 'mediafiles', '2023/09/26/f57bf24393fa9cb6bdcd588ff6be014b.jpg', 'f57bf24393fa9cb6bdcd588ff6be014b', '/mediafiles/2023/09/26/f57bf24393fa9cb6bdcd588ff6be014b.jpg', NULL, '2023-09-26 20:45:06', NULL, '1', NULL, '002003', NULL, 138212);
INSERT INTO `media_files` VALUES ('f8fed7171f25900a242919e7dd0b734c', 1232141425, '教育机构', '感人短片.mp4', '001002', '课程视频', 'video', 'f/8/f8fed7171f25900a242919e7dd0b734c/f8fed7171f25900a242919e7dd0b734c.mp4', 'f8fed7171f25900a242919e7dd0b734c', '/video/f/8/f8fed7171f25900a242919e7dd0b734c/f8fed7171f25900a242919e7dd0b734c.mp4', NULL, '2023-09-26 18:24:16', NULL, '1', '', '002003', NULL, 7184310);
INSERT INTO `media_files` VALUES ('facf214b7a5637e386f31c39b71b4c37', 1232141425, '教育机构', 'wallhaven-42x6vx.jpg', '001001', NULL, 'mediafiles', '2023/09/28/facf214b7a5637e386f31c39b71b4c37.jpg', 'facf214b7a5637e386f31c39b71b4c37', '/mediafiles/2023/09/28/facf214b7a5637e386f31c39b71b4c37.jpg', NULL, '2023-09-28 18:38:09', NULL, '1', NULL, '002003', NULL, 157052);
INSERT INTO `media_files` VALUES ('fc077f1a13e4ce9c1e7840e4d83b33ee', 1232141425, '教育机构', 'wallhaven-g8ogpq.jpg', '001001', NULL, 'mediafiles', '2023/09/28/fc077f1a13e4ce9c1e7840e4d83b33ee.jpg', 'fc077f1a13e4ce9c1e7840e4d83b33ee', '/mediafiles/2023/09/28/fc077f1a13e4ce9c1e7840e4d83b33ee.jpg', NULL, '2023-09-28 18:30:22', NULL, '1', NULL, '002003', NULL, 292385);
INSERT INTO `media_files` VALUES ('fc0a1d1df0972457fd4556ddda0d47bb', 1232141425, '教育机构', 'wallhaven-v9wo18.png', '001001', NULL, 'mediafiles', '2023/09/26/fc0a1d1df0972457fd4556ddda0d47bb.png', 'fc0a1d1df0972457fd4556ddda0d47bb', '/mediafiles/2023/09/26/fc0a1d1df0972457fd4556ddda0d47bb.png', NULL, '2023-09-26 20:29:19', NULL, '1', NULL, '002003', NULL, 1182128);
INSERT INTO `media_files` VALUES ('fcf1a86835270adaab6e0c968470ba22', 1232141425, '教育机构', '狼狈的月.mp4', '001002', '课程视频', 'video', 'f/c/fcf1a86835270adaab6e0c968470ba22/fcf1a86835270adaab6e0c968470ba22.mp4', 'fcf1a86835270adaab6e0c968470ba22', '/video/f/c/fcf1a86835270adaab6e0c968470ba22/fcf1a86835270adaab6e0c968470ba22.mp4', NULL, '2023-09-26 19:05:05', NULL, '1', '', '002003', NULL, 86360101);
INSERT INTO `media_files` VALUES ('ff405608a1ee6ee16264f3c5f9b6c274', 1232141425, '教育机构', '1144947643_nb3-1-16.mp4', '001002', '课程视频', 'video', 'f/f/ff405608a1ee6ee16264f3c5f9b6c274/ff405608a1ee6ee16264f3c5f9b6c274.mp4', 'ff405608a1ee6ee16264f3c5f9b6c274', '/video/f/f/ff405608a1ee6ee16264f3c5f9b6c274/ff405608a1ee6ee16264f3c5f9b6c274.mp4', NULL, '2023-10-03 12:23:51', NULL, '1', '', '002003', NULL, 6042844);

-- ----------------------------
-- Table structure for media_process
-- ----------------------------
DROP TABLE IF EXISTS `media_process`;
CREATE TABLE `media_process`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_id` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件标识',
  `filename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件名称',
  `bucket` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '存储桶',
  `file_path` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `status` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态,1:未处理，2：处理成功  3处理失败',
  `create_date` datetime NOT NULL COMMENT '上传时间',
  `finish_date` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `url` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '媒资文件访问地址',
  `errormsg` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `fail_count` int NULL DEFAULT 0 COMMENT '失败次数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_fileid`(`file_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_process
-- ----------------------------
INSERT INTO `media_process` VALUES (1, '1', 'adw', 'video', '/1/2/seffsefsef', '1', '2023-10-08 15:18:37', '2023-10-08 15:18:39', '/video/1/2/adewfsrgrg/dawd.mp4', 'dwada', 1);

-- ----------------------------
-- Table structure for media_process_history
-- ----------------------------
DROP TABLE IF EXISTS `media_process_history`;
CREATE TABLE `media_process_history`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_id` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件标识',
  `filename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '文件名称',
  `bucket` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '存储源',
  `status` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态,1:未处理，2：处理成功  3处理失败',
  `create_date` datetime NOT NULL COMMENT '上传时间',
  `finish_date` datetime NOT NULL COMMENT '完成时间',
  `url` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '媒资文件访问地址',
  `file_path` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `errormsg` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `fail_count` int NULL DEFAULT 0 COMMENT '失败次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_process_history
-- ----------------------------

-- ----------------------------
-- Table structure for mq_message
-- ----------------------------
DROP TABLE IF EXISTS `mq_message`;
CREATE TABLE `mq_message`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息类型代码',
  `business_key1` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `mq_host` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息队列主机',
  `mq_port` int NOT NULL COMMENT '消息队列端口',
  `mq_virtualhost` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息队列虚拟主机',
  `mq_queue` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '队列名称',
  `inform_num` int UNSIGNED NOT NULL COMMENT '通知次数',
  `state` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '处理状态，0:初始，1:成功',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `inform_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '阶段1处理状态, 0:初始，1:成功',
  `stage_state2` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '阶段2处理状态, 0:初始，1:成功',
  `stage_state3` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '阶段3处理状态, 0:初始，1:成功',
  `stage_state4` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '阶段4处理状态, 0:初始，1:成功',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message
-- ----------------------------

-- ----------------------------
-- Table structure for mq_message_history
-- ----------------------------
DROP TABLE IF EXISTS `mq_message_history`;
CREATE TABLE `mq_message_history`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息类型代码',
  `business_key1` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `mq_host` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息队列主机',
  `mq_port` int NOT NULL COMMENT '消息队列端口',
  `mq_virtualhost` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息队列虚拟主机',
  `mq_queue` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '队列名称',
  `inform_num` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '通知次数',
  `state` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '处理状态，0:初始，1:成功，2:失败',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `inform_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stage_state2` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stage_state3` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stage_state4` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message_history
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
