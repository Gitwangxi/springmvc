/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50096
Source Host           : 127.0.0.1:3306
Source Database       : lima

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2017-06-16 23:28:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `last_update_date` datetime default NULL,
  `code` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------

-- ----------------------------
-- Table structure for classes_list
-- ----------------------------
DROP TABLE IF EXISTS `classes_list`;
CREATE TABLE `classes_list` (
  `classes` bigint(20) NOT NULL,
  `list` bigint(20) NOT NULL,
  UNIQUE KEY `UK_j2tg22jtoqiyjr0usgjl4o8e8` (`list`),
  KEY `FK_eb27w4yinuufshte1qxab160e` (`classes`),
  KEY `FK47675917647D30A5` (`list`),
  CONSTRAINT `FK47675917647D30A5` FOREIGN KEY (`list`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_eb27w4yinuufshte1qxab160e` FOREIGN KEY (`classes`) REFERENCES `classes` (`id`),
  CONSTRAINT `FK_j2tg22jtoqiyjr0usgjl4o8e8` FOREIGN KEY (`list`) REFERENCES `jcn_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes_list
-- ----------------------------

-- ----------------------------
-- Table structure for jcn_chat
-- ----------------------------
DROP TABLE IF EXISTS `jcn_chat`;
CREATE TABLE `jcn_chat` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `last_update_date` datetime default NULL,
  `chat_type` varchar(255) default NULL,
  `content` varchar(300) default NULL,
  `read_flag` varchar(1) default NULL,
  `receive_id` bigint(20) default NULL,
  `send_date` datetime default NULL,
  `send_id` bigint(20) default NULL,
  `send_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jcn_chat
-- ----------------------------
INSERT INTO `jcn_chat` VALUES ('134', '2017-06-15 17:59:57', '2017-06-15 17:59:57', 'allTOall', '11111', 'Y', '0', '2017-06-15 17:59:57', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('135', '2017-06-15 18:00:04', '2017-06-15 18:00:04', 'allTOall', '熟读', 'Y', '0', '2017-06-15 18:00:04', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('136', '2017-06-15 18:00:06', '2017-06-15 18:00:06', 'allTOall', '545645', 'Y', '0', '2017-06-15 18:00:06', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('137', '2017-06-15 18:00:09', '2017-06-15 18:00:09', 'allTOall', '非机动', 'Y', '0', '2017-06-15 18:00:09', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('138', '2017-06-15 18:00:09', '2017-06-15 18:00:09', 'allTOall', '3123123', 'Y', '0', '2017-06-15 18:00:09', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('139', '2017-06-15 18:00:10', '2017-06-15 18:00:10', 'allTOall', '1', 'Y', '0', '2017-06-15 18:00:10', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('140', '2017-06-15 18:00:11', '2017-06-15 18:00:11', 'allTOall', 'asdf ', 'Y', '0', '2017-06-15 18:00:11', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('141', '2017-06-15 18:00:11', '2017-06-15 18:00:11', 'allTOall', '2', 'Y', '0', '2017-06-15 18:00:11', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('142', '2017-06-15 18:00:12', '2017-06-15 18:00:12', 'allTOall', '阿斯顿发', 'Y', '0', '2017-06-15 18:00:12', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('143', '2017-06-15 18:00:12', '2017-06-15 18:00:12', 'allTOall', '3', 'Y', '0', '2017-06-15 18:00:12', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('144', '2017-06-15 18:00:13', '2017-06-15 18:00:13', 'allTOall', '4', 'Y', '0', '2017-06-15 18:00:13', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('145', '2017-06-15 18:00:13', '2017-06-15 18:00:13', 'allTOall', '5', 'Y', '0', '2017-06-15 18:00:13', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('146', '2017-06-15 18:00:14', '2017-06-15 18:00:14', 'allTOall', '6', 'Y', '0', '2017-06-15 18:00:14', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('147', '2017-06-15 18:00:14', '2017-06-15 18:00:14', 'allTOall', 'adfadf', 'Y', '0', '2017-06-15 18:00:14', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('148', '2017-06-15 18:00:15', '2017-06-15 18:00:15', 'allTOall', 'adsf', 'Y', '0', '2017-06-15 18:00:15', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('149', '2017-06-15 18:00:16', '2017-06-15 18:00:16', 'allTOall', '7', 'Y', '0', '2017-06-15 18:00:16', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('150', '2017-06-15 18:01:03', '2017-06-15 18:01:03', 'allTOall', '1', 'Y', '0', '2017-06-15 18:01:03', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('151', '2017-06-15 18:01:04', '2017-06-15 18:01:04', 'allTOall', '2', 'Y', '0', '2017-06-15 18:01:04', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('152', '2017-06-15 18:01:04', '2017-06-15 18:01:04', 'allTOall', '2', 'Y', '0', '2017-06-15 18:01:04', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('153', '2017-06-15 18:01:05', '2017-06-15 18:01:05', 'allTOall', '2', 'Y', '0', '2017-06-15 18:01:05', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('154', '2017-06-15 18:01:05', '2017-06-15 18:01:05', 'allTOall', '2', 'Y', '0', '2017-06-15 18:01:05', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('155', '2017-06-15 18:01:06', '2017-06-15 18:01:06', 'allTOall', '2', 'Y', '0', '2017-06-15 18:01:06', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('156', '2017-06-15 18:01:06', '2017-06-15 18:01:06', 'allTOall', '2', 'Y', '0', '2017-06-15 18:01:06', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('157', '2017-06-15 18:01:07', '2017-06-15 18:01:07', 'allTOall', '2', 'Y', '0', '2017-06-15 18:01:07', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('158', '2017-06-15 18:01:07', '2017-06-15 18:01:07', 'allTOall', '2', 'Y', '0', '2017-06-15 18:01:07', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('159', '2017-06-15 18:01:08', '2017-06-15 18:01:08', 'allTOall', '2', 'Y', '0', '2017-06-15 18:01:08', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('160', '2017-06-15 18:01:25', '2017-06-15 18:01:25', 'allTOall', '111', 'Y', '0', '2017-06-15 18:01:25', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('161', '2017-06-15 18:01:28', '2017-06-15 18:01:28', 'allTOall', '3', 'Y', '0', '2017-06-15 18:01:28', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('162', '2017-06-15 18:01:29', '2017-06-15 18:01:29', 'allTOall', '3', 'Y', '0', '2017-06-15 18:01:29', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('163', '2017-06-15 18:01:29', '2017-06-15 18:01:29', 'allTOall', '3', 'Y', '0', '2017-06-15 18:01:29', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('164', '2017-06-15 18:01:30', '2017-06-15 18:01:30', 'allTOall', '5', 'Y', '0', '2017-06-15 18:01:30', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('165', '2017-06-15 18:01:30', '2017-06-15 18:01:30', 'allTOall', '5', 'Y', '0', '2017-06-15 18:01:30', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('166', '2017-06-15 18:01:37', '2017-06-15 18:01:37', 'allTOall', '51', 'Y', '0', '2017-06-15 18:01:37', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('167', '2017-06-15 18:01:38', '2017-06-15 18:01:38', 'allTOall', '1', 'Y', '0', '2017-06-15 18:01:38', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('168', '2017-06-15 18:01:38', '2017-06-15 18:01:38', 'allTOall', '1', 'Y', '0', '2017-06-15 18:01:38', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('169', '2017-06-15 18:01:38', '2017-06-15 18:01:38', 'allTOall', '1', 'Y', '0', '2017-06-15 18:01:38', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('170', '2017-06-15 18:01:38', '2017-06-15 18:01:38', 'allTOall', '1', 'Y', '0', '2017-06-15 18:01:38', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('171', '2017-06-15 18:01:39', '2017-06-15 18:01:39', 'allTOall', '1', 'Y', '0', '2017-06-15 18:01:39', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('172', '2017-06-15 18:01:39', '2017-06-15 18:01:39', 'allTOall', '1', 'Y', '0', '2017-06-15 18:01:39', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('173', '2017-06-15 18:01:39', '2017-06-15 18:01:39', 'allTOall', '1', 'Y', '0', '2017-06-15 18:01:39', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('174', '2017-06-15 18:01:40', '2017-06-15 18:01:40', 'allTOall', '1', 'Y', '0', '2017-06-15 18:01:40', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('175', '2017-06-15 18:01:40', '2017-06-15 18:01:40', 'allTOall', '11', 'Y', '0', '2017-06-15 18:01:40', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('176', '2017-06-15 18:03:08', '2017-06-15 18:03:08', 'allTOall', '1', 'Y', '0', '2017-06-15 18:03:08', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('177', '2017-06-15 18:03:08', '2017-06-15 18:03:08', 'allTOall', '1', 'Y', '0', '2017-06-15 18:03:08', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('178', '2017-06-15 18:03:10', '2017-06-15 18:03:10', 'allTOall', '8', 'Y', '0', '2017-06-15 18:03:10', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('179', '2017-06-15 18:03:10', '2017-06-15 18:03:10', 'allTOall', '8', 'Y', '0', '2017-06-15 18:03:10', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('180', '2017-06-15 18:03:11', '2017-06-15 18:03:11', 'allTOall', '8', 'Y', '0', '2017-06-15 18:03:11', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('181', '2017-06-15 18:03:11', '2017-06-15 18:03:11', 'allTOall', '8', 'Y', '0', '2017-06-15 18:03:11', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('182', '2017-06-15 18:03:11', '2017-06-15 18:03:11', 'allTOall', '8', 'Y', '0', '2017-06-15 18:03:11', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('183', '2017-06-15 18:03:12', '2017-06-15 18:03:12', 'allTOall', '8', 'Y', '0', '2017-06-15 18:03:12', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('184', '2017-06-15 18:03:29', '2017-06-15 18:03:29', 'allTOall', '9', 'Y', '0', '2017-06-15 18:03:29', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('185', '2017-06-15 18:03:30', '2017-06-15 18:03:30', 'allTOall', '9', 'Y', '0', '2017-06-15 18:03:30', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('186', '2017-06-15 18:03:30', '2017-06-15 18:03:30', 'allTOall', '9', 'Y', '0', '2017-06-15 18:03:30', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('187', '2017-06-15 18:03:30', '2017-06-15 18:03:30', 'allTOall', '9', 'Y', '0', '2017-06-15 18:03:30', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('188', '2017-06-15 18:03:30', '2017-06-15 18:03:30', 'allTOall', '9', 'Y', '0', '2017-06-15 18:03:30', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('189', '2017-06-15 18:03:31', '2017-06-15 18:03:31', 'allTOall', '9', 'Y', '0', '2017-06-15 18:03:31', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('190', '2017-06-15 18:04:38', '2017-06-15 18:04:38', 'allTOall', '测试发消息', 'Y', '0', '2017-06-15 18:04:38', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('191', '2017-06-15 18:04:38', '2017-06-15 18:04:38', 'allTOall', '6', 'Y', '0', '2017-06-15 18:04:38', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('192', '2017-06-15 18:04:39', '2017-06-15 18:04:39', 'allTOall', '6', 'Y', '0', '2017-06-15 18:04:39', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('193', '2017-06-15 18:04:39', '2017-06-15 18:04:39', 'allTOall', '6', 'Y', '0', '2017-06-15 18:04:39', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('194', '2017-06-15 18:04:39', '2017-06-15 18:04:39', 'allTOall', '6', 'Y', '0', '2017-06-15 18:04:39', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('195', '2017-06-15 18:04:40', '2017-06-15 18:04:40', 'allTOall', '6', 'Y', '0', '2017-06-15 18:04:40', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('196', '2017-06-15 18:04:40', '2017-06-15 18:04:40', 'allTOall', '6', 'Y', '0', '2017-06-15 18:04:40', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('197', '2017-06-15 18:05:06', '2017-06-15 18:05:06', 'allTOall', '7', 'Y', '0', '2017-06-15 18:05:06', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('198', '2017-06-15 18:05:06', '2017-06-15 18:05:06', 'allTOall', '7', 'Y', '0', '2017-06-15 18:05:06', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('199', '2017-06-15 18:05:06', '2017-06-15 18:05:06', 'allTOall', '7', 'Y', '0', '2017-06-15 18:05:06', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('200', '2017-06-15 18:05:07', '2017-06-15 18:05:07', 'allTOall', '7', 'Y', '0', '2017-06-15 18:05:07', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('201', '2017-06-15 18:05:07', '2017-06-15 18:05:07', 'allTOall', '7', 'Y', '0', '2017-06-15 18:05:07', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('202', '2017-06-15 18:05:07', '2017-06-15 18:05:07', 'allTOall', '7', 'Y', '0', '2017-06-15 18:05:07', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('203', '2017-06-15 18:05:19', '2017-06-15 18:05:19', 'allTOall', '5', 'Y', '0', '2017-06-15 18:05:19', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('204', '2017-06-15 18:05:19', '2017-06-15 18:05:19', 'allTOall', '5', 'Y', '0', '2017-06-15 18:05:19', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('205', '2017-06-15 18:05:19', '2017-06-15 18:05:19', 'allTOall', '5', 'Y', '0', '2017-06-15 18:05:19', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('206', '2017-06-15 18:05:20', '2017-06-15 18:05:20', 'allTOall', '5', 'Y', '0', '2017-06-15 18:05:20', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('207', '2017-06-15 18:05:20', '2017-06-15 18:05:20', 'allTOall', '5', 'Y', '0', '2017-06-15 18:05:20', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('208', '2017-06-15 18:05:20', '2017-06-15 18:05:20', 'allTOall', '5', 'Y', '0', '2017-06-15 18:05:20', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('209', '2017-06-15 18:05:20', '2017-06-15 18:05:20', 'allTOall', '5', 'Y', '0', '2017-06-15 18:05:20', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('210', '2017-06-15 18:05:55', '2017-06-15 18:05:55', 'allTOall', '111', 'Y', '0', '2017-06-15 18:05:55', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('211', '2017-06-15 18:05:57', '2017-06-15 18:05:57', 'allTOall', '22', 'Y', '0', '2017-06-15 18:05:57', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('212', '2017-06-15 18:06:12', '2017-06-15 18:06:12', 'allTOall', '231', 'Y', '0', '2017-06-15 18:06:12', '2', '刘勇奇');
INSERT INTO `jcn_chat` VALUES ('213', '2017-06-15 18:08:01', '2017-06-15 18:08:01', 'allTOall', '1', 'Y', '0', '2017-06-15 18:08:01', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('214', '2017-06-15 18:08:01', '2017-06-15 18:08:01', 'allTOall', '2', 'Y', '0', '2017-06-15 18:08:01', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('215', '2017-06-15 18:08:02', '2017-06-15 18:08:02', 'allTOall', '3', 'Y', '0', '2017-06-15 18:08:02', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('216', '2017-06-15 18:08:02', '2017-06-15 18:08:02', 'allTOall', '4', 'Y', '0', '2017-06-15 18:08:02', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('217', '2017-06-15 18:08:03', '2017-06-15 18:08:03', 'allTOall', '5', 'Y', '0', '2017-06-15 18:08:03', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('218', '2017-06-15 18:08:03', '2017-06-15 18:08:03', 'allTOall', '6', 'Y', '0', '2017-06-15 18:08:03', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('219', '2017-06-15 18:08:18', '2017-06-15 18:08:18', 'allTOall', 'q', 'Y', '0', '2017-06-15 18:08:18', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('220', '2017-06-15 18:08:20', '2017-06-15 18:08:20', 'allTOall', 'we', 'Y', '0', '2017-06-15 18:08:20', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('221', '2017-06-15 18:08:22', '2017-06-15 18:08:22', 'allTOall', 'rtty', 'Y', '0', '2017-06-15 18:08:22', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('222', '2017-06-15 18:08:23', '2017-06-15 18:08:23', 'allTOall', 'rtty', 'Y', '0', '2017-06-15 18:08:23', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('223', '2017-06-15 18:08:23', '2017-06-15 18:08:23', 'allTOall', 'rtty', 'Y', '0', '2017-06-15 18:08:23', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('224', '2017-06-15 18:08:24', '2017-06-15 18:08:24', 'allTOall', 'rtty', 'Y', '0', '2017-06-15 18:08:24', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('225', '2017-06-15 18:10:12', '2017-06-15 18:10:12', 'allTOall', '1', 'Y', '0', '2017-06-15 18:10:12', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('226', '2017-06-15 18:10:16', '2017-06-15 18:10:16', 'allTOall', '2', 'Y', '0', '2017-06-15 18:10:16', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('227', '2017-06-15 18:10:23', '2017-06-15 18:10:23', 'allTOall', '3', 'Y', '0', '2017-06-15 18:10:23', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('228', '2017-06-15 18:10:24', '2017-06-15 18:10:24', 'allTOall', '5', 'Y', '0', '2017-06-15 18:10:24', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('229', '2017-06-15 18:10:24', '2017-06-15 18:10:24', 'allTOall', '6', 'Y', '0', '2017-06-15 18:10:24', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('230', '2017-06-15 18:10:24', '2017-06-15 18:10:24', 'allTOall', '7', 'Y', '0', '2017-06-15 18:10:24', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('231', '2017-06-15 18:10:25', '2017-06-15 18:10:25', 'allTOall', '8', 'Y', '0', '2017-06-15 18:10:25', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('232', '2017-06-15 18:10:25', '2017-06-15 18:10:25', 'allTOall', '89', 'Y', '0', '2017-06-15 18:10:25', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('233', '2017-06-15 18:10:27', '2017-06-15 18:10:27', 'allTOall', 't6', 'Y', '0', '2017-06-15 18:10:27', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('234', '2017-06-15 18:10:59', '2017-06-15 18:10:59', 'allTOall', '4', 'Y', '0', '2017-06-15 18:10:59', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('235', '2017-06-15 18:11:13', '2017-06-15 18:11:13', 'allTOall', '1', 'Y', '0', '2017-06-15 18:11:13', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('236', '2017-06-15 18:11:53', '2017-06-15 18:11:53', 'allTOall', '1', 'Y', '0', '2017-06-15 18:11:53', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('237', '2017-06-15 18:11:59', '2017-06-15 18:11:59', 'allTOall', '2', 'Y', '0', '2017-06-15 18:11:59', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('238', '2017-06-15 18:42:33', '2017-06-15 18:42:33', 'allTOall', '1111', 'Y', '0', '2017-06-15 18:42:33', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('239', '2017-06-15 18:43:43', '2017-06-15 18:43:43', 'allTOall', '4444', 'Y', '0', '2017-06-15 18:43:43', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('240', '2017-06-15 18:45:51', '2017-06-15 18:45:51', 'allTOall', '1111', 'Y', '0', '2017-06-15 18:45:51', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('241', '2017-06-15 18:45:55', '2017-06-15 18:45:55', 'allTOall', '3333', 'Y', '0', '2017-06-15 18:45:55', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('242', '2017-06-15 18:45:59', '2017-06-15 18:45:59', 'allTOall', '3333', 'Y', '0', '2017-06-15 18:45:59', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('243', '2017-06-15 18:46:02', '2017-06-15 18:46:02', 'allTOall', '11321', 'Y', '0', '2017-06-15 18:46:02', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('244', '2017-06-15 18:46:06', '2017-06-15 18:46:06', 'allTOall', '新消息', 'Y', '0', '2017-06-15 18:46:06', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('245', '2017-06-15 18:46:10', '2017-06-15 18:46:10', 'allTOall', 'fdf ', 'Y', '0', '2017-06-15 18:46:10', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('246', '2017-06-15 18:46:13', '2017-06-15 18:46:13', 'allTOall', '12323', 'Y', '0', '2017-06-15 18:46:13', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('247', '2017-06-16 09:53:52', '2017-06-16 09:53:52', 'allTOall', '1111', 'Y', '0', '2017-06-16 09:53:52', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('248', '2017-06-16 09:53:56', '2017-06-16 09:53:56', 'allTOall', '3333', 'Y', '0', '2017-06-16 09:53:56', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('249', '2017-06-16 09:55:37', '2017-06-16 09:55:37', 'allTOall', '1111', 'Y', '0', '2017-06-16 09:55:37', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('250', '2017-06-16 12:30:41', '2017-06-16 12:30:41', 'allTOall', '11111', 'Y', '0', '2017-06-16 12:30:41', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('251', '2017-06-16 12:30:48', '2017-06-16 12:30:48', 'allTOall', 'vvv', 'Y', '0', '2017-06-16 12:30:48', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('252', '2017-06-16 12:30:51', '2017-06-16 12:30:51', 'allTOall', '反季节', 'Y', '0', '2017-06-16 12:30:51', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('253', '2017-06-16 12:31:00', '2017-06-16 12:31:00', 'allTOall', '什么玩意', 'Y', '0', '2017-06-16 12:31:00', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('254', '2017-06-16 12:47:42', '2017-06-16 12:47:42', 'allTOall', 'qqq', 'Y', '0', '2017-06-16 12:47:42', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('255', '2017-06-16 12:56:53', '2017-06-16 12:56:53', 'allTOall', '2222', 'Y', '0', '2017-06-16 12:56:53', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('256', '2017-06-16 12:56:59', '2017-06-16 12:56:59', 'allTOall', '新消息', 'Y', '0', '2017-06-16 12:56:59', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('257', '2017-06-16 12:57:05', '2017-06-16 12:57:05', 'allTOall', 'sm wanyi ', 'Y', '0', '2017-06-16 12:57:05', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('258', '2017-06-16 12:57:11', '2017-06-16 12:57:11', 'allTOall', '法 ', 'Y', '0', '2017-06-16 12:57:11', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('259', '2017-06-16 12:57:16', '2017-06-16 12:57:16', 'allTOall', '大方 ', 'Y', '0', '2017-06-16 12:57:16', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('260', '2017-06-16 12:57:23', '2017-06-16 12:57:23', 'allTOall', '请二位群二无', 'Y', '0', '2017-06-16 12:57:23', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('261', '2017-06-16 12:58:48', '2017-06-16 12:58:48', 'allTOall', '1111', 'Y', '0', '2017-06-16 12:58:48', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('262', '2017-06-16 12:59:00', '2017-06-16 12:59:00', 'allTOall', 'qqqq', 'Y', '0', '2017-06-16 12:59:00', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('263', '2017-06-16 12:59:25', '2017-06-16 12:59:25', 'allTOall', 'qert', 'Y', '0', '2017-06-16 12:59:25', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('264', '2017-06-16 12:59:30', '2017-06-16 12:59:30', 'allTOall', '驱蚊器无', 'Y', '0', '2017-06-16 12:59:30', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('265', '2017-06-16 13:02:31', '2017-06-16 13:02:31', 'allTOall', ' 订单', 'Y', '0', '2017-06-16 13:02:31', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('266', '2017-06-16 13:02:39', '2017-06-16 13:02:39', 'allTOall', ' fdf ', 'Y', '0', '2017-06-16 13:02:39', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('267', '2017-06-16 13:02:45', '2017-06-16 13:02:45', 'allTOall', '去问问', 'Y', '0', '2017-06-16 13:02:45', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('268', '2017-06-16 13:03:00', '2017-06-16 13:03:00', 'allTOall', '11', 'Y', '0', '2017-06-16 13:03:00', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('269', '2017-06-16 13:03:07', '2017-06-16 13:03:07', 'allTOall', 'dsad', 'Y', '0', '2017-06-16 13:03:07', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('270', '2017-06-16 13:03:13', '2017-06-16 13:03:13', 'allTOall', '大幅度飞', 'Y', '0', '2017-06-16 13:03:13', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('271', '2017-06-16 13:07:35', '2017-06-16 13:07:35', 'allTOall', 'qwewq', 'Y', '0', '2017-06-16 13:07:35', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('272', '2017-06-16 13:07:44', '2017-06-16 13:07:44', 'allTOall', '费大幅度', 'Y', '0', '2017-06-16 13:07:44', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('273', '2017-06-16 13:07:45', '2017-06-16 13:07:45', 'allTOall', '方法', 'Y', '0', '2017-06-16 13:07:45', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('274', '2017-06-16 13:07:48', '2017-06-16 13:07:48', 'allTOall', '恩恩', 'Y', '0', '2017-06-16 13:07:48', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('275', '2017-06-16 13:14:07', '2017-06-16 13:14:07', 'allTOall', '就开了', 'Y', '0', '2017-06-16 13:14:07', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('276', '2017-06-16 13:15:30', '2017-06-16 13:15:30', 'allTOall', 'yy', 'Y', '0', '2017-06-16 13:15:30', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('277', '2017-06-16 13:15:46', '2017-06-16 13:15:46', 'allTOall', 'yy', 'Y', '0', '2017-06-16 13:15:46', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('278', '2017-06-16 13:18:05', '2017-06-16 13:18:05', 'allTOall', 'qqq', 'Y', '0', '2017-06-16 13:18:05', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('279', '2017-06-16 13:18:11', '2017-06-16 13:18:11', 'allTOall', '呜呜呜呜', 'Y', '0', '2017-06-16 13:18:11', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('280', '2017-06-16 13:18:17', '2017-06-16 13:18:17', 'allTOall', 'www', 'Y', '0', '2017-06-16 13:18:17', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('281', '2017-06-16 13:18:20', '2017-06-16 13:18:20', 'allTOall', 'qqqq', 'Y', '0', '2017-06-16 13:18:20', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('282', '2017-06-16 13:18:21', '2017-06-16 13:18:21', 'allTOall', '1111', 'Y', '0', '2017-06-16 13:18:21', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('283', '2017-06-16 13:18:23', '2017-06-16 13:18:23', 'allTOall', '4444', 'Y', '0', '2017-06-16 13:18:23', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('284', '2017-06-16 13:32:37', '2017-06-16 13:32:37', 'allTOall', '1111', 'Y', '0', '2017-06-16 13:32:37', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('285', '2017-06-16 13:32:46', '2017-06-16 13:32:46', 'allTOall', '点对点', 'Y', '0', '2017-06-16 13:32:46', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('286', '2017-06-16 13:33:15', '2017-06-16 13:33:15', 'allTOall', 'qqqq', 'Y', '0', '2017-06-16 13:33:15', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('287', '2017-06-16 13:33:21', '2017-06-16 13:33:21', 'allTOall', '我问问', 'Y', '0', '2017-06-16 13:33:21', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('288', '2017-06-16 13:35:36', '2017-06-16 13:35:36', 'allTOall', '申达股份', 'Y', '0', '2017-06-16 13:35:36', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('289', '2017-06-16 13:35:41', '2017-06-16 13:35:41', 'allTOall', 'qwew', 'Y', '0', '2017-06-16 13:35:41', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('290', '2017-06-16 13:36:12', '2017-06-16 13:36:12', 'allTOall', '其味无穷', 'Y', '0', '2017-06-16 13:36:12', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('291', '2017-06-16 13:36:17', '2017-06-16 13:36:17', 'allTOall', 'rtj', 'Y', '0', '2017-06-16 13:36:17', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('292', '2017-06-16 13:40:07', '2017-06-16 13:40:07', 'allTOall', '啊无法收到', 'Y', '0', '2017-06-16 13:40:07', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('293', '2017-06-16 13:40:12', '2017-06-16 13:40:12', 'allTOall', 'fsd ', 'Y', '0', '2017-06-16 13:40:12', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('294', '2017-06-16 13:50:05', '2017-06-16 13:50:05', 'allTOall', '122321', 'Y', '0', '2017-06-16 13:50:05', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('295', '2017-06-16 13:50:10', '2017-06-16 13:50:10', 'allTOall', '费大幅度', 'Y', '0', '2017-06-16 13:50:10', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('296', '2017-06-16 13:53:59', '2017-06-16 13:53:59', 'allTOall', '热热', 'Y', '0', '2017-06-16 13:53:59', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('297', '2017-06-16 13:54:07', '2017-06-16 13:54:07', 'allTOall', 'ffdfd', 'Y', '0', '2017-06-16 13:54:07', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('298', '2017-06-16 13:54:10', '2017-06-16 13:54:10', 'allTOall', '1111', 'Y', '0', '2017-06-16 13:54:10', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('299', '2017-06-16 23:02:23', '2017-06-16 23:02:23', 'allTOall', '213213', 'Y', '0', '2017-06-16 23:02:23', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('300', '2017-06-16 23:02:34', '2017-06-16 23:02:34', 'allTOall', '12321312', 'Y', '0', '2017-06-16 23:02:34', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('301', '2017-06-16 23:03:39', '2017-06-16 23:03:39', 'allTOall', '1111', 'Y', '0', '2017-06-16 23:03:39', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('302', '2017-06-16 23:03:45', '2017-06-16 23:03:45', 'allTOall', '22222', 'Y', '0', '2017-06-16 23:03:45', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('303', '2017-06-16 23:04:48', '2017-06-16 23:04:48', 'allTOall', '343233', 'Y', '0', '2017-06-16 23:04:48', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('304', '2017-06-16 23:04:53', '2017-06-16 23:04:53', 'allTOall', '232323', 'Y', '0', '2017-06-16 23:04:53', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('305', '2017-06-16 23:06:10', '2017-06-16 23:06:10', 'allTOall', '66', 'Y', '0', '2017-06-16 23:06:10', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('306', '2017-06-16 23:06:15', '2017-06-16 23:06:15', 'allTOall', '法规及了', 'Y', '0', '2017-06-16 23:06:15', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('307', '2017-06-16 23:07:54', '2017-06-16 23:07:54', 'allTOall', 'ASDAFAS', 'Y', '0', '2017-06-16 23:07:54', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('308', '2017-06-16 23:10:24', '2017-06-16 23:10:24', 'allTOall', 'qqqqq', 'Y', '0', '2017-06-16 23:10:24', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('309', '2017-06-16 23:10:34', '2017-06-16 23:10:34', 'allTOall', '吞吞吐吐', 'Y', '0', '2017-06-16 23:10:34', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('310', '2017-06-16 23:11:20', '2017-06-16 23:11:20', 'allTOall', '撒旦所', 'Y', '0', '2017-06-16 23:11:20', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('311', '2017-06-16 23:11:29', '2017-06-16 23:11:29', 'allTOall', '学习学习', 'Y', '0', '2017-06-16 23:11:29', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('312', '2017-06-16 23:11:40', '2017-06-16 23:11:40', 'allTOall', 'ffffff', 'Y', '0', '2017-06-16 23:11:40', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('313', '2017-06-16 23:14:08', '2017-06-16 23:14:08', 'allTOall', '我日 看不到啊', 'Y', '0', '2017-06-16 23:14:08', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('314', '2017-06-16 23:14:18', '2017-06-16 23:14:18', 'allTOall', '谁说看不到', 'Y', '0', '2017-06-16 23:14:18', '4', '陈志平');
INSERT INTO `jcn_chat` VALUES ('315', '2017-06-16 23:14:24', '2017-06-16 23:14:24', 'allTOall', '完美啊', 'Y', '0', '2017-06-16 23:14:24', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('316', '2017-06-16 23:14:31', '2017-06-16 23:14:32', 'allTOall', '1', 'Y', '0', '2017-06-16 23:14:31', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('317', '2017-06-16 23:14:31', '2017-06-16 23:14:32', 'allTOall', '1', 'Y', '0', '2017-06-16 23:14:31', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('318', '2017-06-16 23:14:32', '2017-06-16 23:14:32', 'allTOall', '1', 'Y', '0', '2017-06-16 23:14:32', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('319', '2017-06-16 23:14:32', '2017-06-16 23:14:32', 'allTOall', '1', 'Y', '0', '2017-06-16 23:14:32', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('320', '2017-06-16 23:14:33', '2017-06-16 23:14:33', 'allTOall', '5', 'Y', '0', '2017-06-16 23:14:33', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('321', '2017-06-16 23:14:33', '2017-06-16 23:14:33', 'allTOall', '5', 'Y', '0', '2017-06-16 23:14:33', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('322', '2017-06-16 23:14:34', '2017-06-16 23:14:34', 'allTOall', '2', 'Y', '0', '2017-06-16 23:14:34', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('323', '2017-06-16 23:14:34', '2017-06-16 23:14:34', 'allTOall', '25', 'Y', '0', '2017-06-16 23:14:34', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('324', '2017-06-16 23:14:35', '2017-06-16 23:14:35', 'allTOall', '5', 'Y', '0', '2017-06-16 23:14:35', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('325', '2017-06-16 23:14:35', '2017-06-16 23:14:35', 'allTOall', '5', 'Y', '0', '2017-06-16 23:14:35', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('326', '2017-06-16 23:14:35', '2017-06-16 23:14:35', 'allTOall', '6', 'Y', '0', '2017-06-16 23:14:35', '3', '郑宏伟');
INSERT INTO `jcn_chat` VALUES ('327', '2017-06-16 23:14:36', '2017-06-16 23:14:36', 'allTOall', '2', 'Y', '0', '2017-06-16 23:14:36', '3', '郑宏伟');

-- ----------------------------
-- Table structure for jcn_task
-- ----------------------------
DROP TABLE IF EXISTS `jcn_task`;
CREATE TABLE `jcn_task` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `last_update_date` datetime default NULL,
  `dep` varchar(255) default NULL,
  `descript` varchar(200) default NULL,
  `progress` int(11) default NULL,
  `task_name` varchar(100) default NULL,
  `user_id` bigint(20) default NULL,
  `jcn_user_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_8jtkwaw0xm0daegr7rxw3qpd3` (`task_name`),
  KEY `FK_q8nr51kbfcktd5dtelk1uvqsh` (`user_id`),
  KEY `FK_1i15t1sw9tgwta4sshfte8f4p` (`jcn_user_id`),
  CONSTRAINT `FK_1i15t1sw9tgwta4sshfte8f4p` FOREIGN KEY (`jcn_user_id`) REFERENCES `jcn_user` (`id`),
  CONSTRAINT `FK_q8nr51kbfcktd5dtelk1uvqsh` FOREIGN KEY (`user_id`) REFERENCES `jcn_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jcn_task
-- ----------------------------

-- ----------------------------
-- Table structure for jcn_user
-- ----------------------------
DROP TABLE IF EXISTS `jcn_user`;
CREATE TABLE `jcn_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `password` varchar(200) default NULL,
  `name` varchar(200) default NULL,
  `create_date` datetime default NULL,
  `last_update_date` datetime default NULL,
  `email` varchar(100) default NULL,
  `classes_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_lqle1t9rc262sleo12033xnqp` (`email`),
  KEY `FK_sunp12snr47aja0ogkh9x4412` (`classes_id`),
  CONSTRAINT `FK_sunp12snr47aja0ogkh9x4412` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jcn_user
-- ----------------------------
INSERT INTO `jcn_user` VALUES ('1', '0123', '刘勇奇', null, null, '0999-2343', null);
INSERT INTO `jcn_user` VALUES ('2', '456', '陈志平', null, null, null, null);
INSERT INTO `jcn_user` VALUES ('3', '0789', '郑宏伟', null, null, null, null);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) default NULL,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerFactoryBean', 'jobTrigger', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) default NULL,
  `JOB_GROUP` varchar(200) default NULL,
  `IS_NONCONCURRENT` varchar(1) default NULL,
  `REQUESTS_RECOVERY` varchar(1) default NULL,
  PRIMARY KEY  (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) default NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY  (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('schedulerFactoryBean', 'jobDetail', 'DEFAULT', null, 'com.kingnod.task.QuartzExtendsTest', '1', '0', '0', '1', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000F770800000010000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('schedulerFactoryBean', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('schedulerFactoryBean', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('schedulerFactoryBean', 'JCN-PC1497625660760', '1497626142016', '30000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) default NULL,
  `STR_PROP_2` varchar(512) default NULL,
  `STR_PROP_3` varchar(512) default NULL,
  `INT_PROP_1` int(11) default NULL,
  `INT_PROP_2` int(11) default NULL,
  `LONG_PROP_1` bigint(20) default NULL,
  `LONG_PROP_2` bigint(20) default NULL,
  `DEC_PROP_1` decimal(13,4) default NULL,
  `DEC_PROP_2` decimal(13,4) default NULL,
  `BOOL_PROP_1` varchar(1) default NULL,
  `BOOL_PROP_2` varchar(1) default NULL,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) default NULL,
  `NEXT_FIRE_TIME` bigint(13) default NULL,
  `PREV_FIRE_TIME` bigint(13) default NULL,
  `PRIORITY` int(11) default NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) default NULL,
  `CALENDAR_NAME` varchar(200) default NULL,
  `MISFIRE_INSTR` smallint(2) default NULL,
  `JOB_DATA` blob,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('schedulerFactoryBean', 'jobTrigger', 'DEFAULT', 'jobDetail', 'DEFAULT', null, '1497626220000', '1497626160000', '0', 'WAITING', 'CRON', '1488078648000', '0', null, '0', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `last_update_date` datetime default NULL,
  `code` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `last_update_date` datetime default NULL,
  `email` varchar(255) default NULL,
  `login_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) default NULL,
  `salt` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '2016-07-15 14:26:55', '2016-07-15 14:26:57', null, 'admin', '管理员', '691b14d79bf0fa2215f155235df5e670b64394cc', '7efbd59d9741d34f', 'Y');
INSERT INTO `sys_user` VALUES ('2', '2016-07-15 15:51:07', '2016-07-15 15:51:09', null, 'liuyongqi', '刘勇奇', '691b14d79bf0fa2215f155235df5e670b64394cc', '7efbd59d9741d34f', 'Y');
INSERT INTO `sys_user` VALUES ('3', '2016-07-15 15:51:57', '2016-07-15 15:51:59', null, 'zhenghongwei', '郑宏伟', '691b14d79bf0fa2215f155235df5e670b64394cc', '7efbd59d9741d34f', 'Y');
INSERT INTO `sys_user` VALUES ('4', '2016-07-15 15:52:32', '2016-07-15 15:52:35', null, 'chenzhiping', '陈志平', '691b14d79bf0fa2215f155235df5e670b64394cc', '7efbd59d9741d34f', 'Y');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FK_fxu3td9m5o7qov1kbdvmn0g0x` (`role_id`),
  KEY `FK_fethvr269t6stivlddbo5pxry` (`user_id`),
  CONSTRAINT `FK_fethvr269t6stivlddbo5pxry` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FK_fxu3td9m5o7qov1kbdvmn0g0x` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for temp_car
-- ----------------------------
DROP TABLE IF EXISTS `temp_car`;
CREATE TABLE `temp_car` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `category` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temp_car
-- ----------------------------
INSERT INTO `temp_car` VALUES ('5', '粤A5C123', '4座车');
INSERT INTO `temp_car` VALUES ('6', '粤ANZ860', '4座车');
INSERT INTO `temp_car` VALUES ('7', '粤A5C002', '5座车');
INSERT INTO `temp_car` VALUES ('8', '粤ANZ347', '7座车');
INSERT INTO `temp_car` VALUES ('9', '粤ANZ866', '4座车');
INSERT INTO `temp_car` VALUES ('10', '粤ANZ818', '5座车');
INSERT INTO `temp_car` VALUES ('11', '粤A529C2', '4座车');
INSERT INTO `temp_car` VALUES ('12', '粤A526C8', '7座车');
INSERT INTO `temp_car` VALUES ('13', '粤A514C9', '4座车');
INSERT INTO `temp_car` VALUES ('14', '粤AH0J33', '4座车');
INSERT INTO `temp_car` VALUES ('15', '粤AY6C52', '5座车');
INSERT INTO `temp_car` VALUES ('16', '粤A272C6', '9座车');
INSERT INTO `temp_car` VALUES ('17', '粤A595BU', '9座车');
INSERT INTO `temp_car` VALUES ('18', '粤A516C9', '5座车');
INSERT INTO `temp_car` VALUES ('19', '粤AH0J38', '9座车');

-- ----------------------------
-- Table structure for temp_user
-- ----------------------------
DROP TABLE IF EXISTS `temp_user`;
CREATE TABLE `temp_user` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temp_user
-- ----------------------------
INSERT INTO `temp_user` VALUES ('1', 'a');
INSERT INTO `temp_user` VALUES ('2', 'b');
INSERT INTO `temp_user` VALUES ('3', 'c');
INSERT INTO `temp_user` VALUES ('4', 'd');
INSERT INTO `temp_user` VALUES ('5', 'e');
INSERT INTO `temp_user` VALUES ('6', 'f');
INSERT INTO `temp_user` VALUES ('7', 'g');
INSERT INTO `temp_user` VALUES ('8', 'h');
INSERT INTO `temp_user` VALUES ('9', 'i');
INSERT INTO `temp_user` VALUES ('10', 'j');
INSERT INTO `temp_user` VALUES ('11', 'k');
INSERT INTO `temp_user` VALUES ('12', 'l');
INSERT INTO `temp_user` VALUES ('13', 'm');
INSERT INTO `temp_user` VALUES ('14', 'n');
INSERT INTO `temp_user` VALUES ('15', 'o');
INSERT INTO `temp_user` VALUES ('16', 'p');
INSERT INTO `temp_user` VALUES ('17', 'q');
INSERT INTO `temp_user` VALUES ('18', 'r');
INSERT INTO `temp_user` VALUES ('19', 's');
INSERT INTO `temp_user` VALUES ('20', 't');
INSERT INTO `temp_user` VALUES ('21', 'u');
INSERT INTO `temp_user` VALUES ('22', 'v');
INSERT INTO `temp_user` VALUES ('23', 'w');
INSERT INTO `temp_user` VALUES ('24', 'x');
INSERT INTO `temp_user` VALUES ('25', 'y');
INSERT INTO `temp_user` VALUES ('26', 'z');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` date default NULL,
  `last_update_date` datetime default NULL,
  `password` varchar(255) default NULL,
  `user_name` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
