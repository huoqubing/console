-- --------------------------------------------------------
-- 主机:                           121.40.129.218
-- 服务器版本:                        5.5.36-MariaDB - MariaDB Server
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 yxsz 的数据库结构
CREATE DATABASE IF NOT EXISTS `console` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `console`;

-- 导出  表 yxsz.menu 结构
CREATE TABLE IF NOT EXISTS `menu` (
  `menuId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menuName` varchar(15) NOT NULL COMMENT '菜单名',
  `url` varchar(64) DEFAULT NULL COMMENT '链接',
  `parent` int(10) NOT NULL COMMENT '父菜单ID',
  `privilegeId` char(32) DEFAULT NULL COMMENT '权限ID',
  `order` int(10) DEFAULT NULL COMMENT '顺序',
  `createtime` timestamp NOT NULL DEFAULT '2014-01-01 00:00:00' COMMENT '创建时间',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `version` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`menuId`),
  UNIQUE KEY `menuName` (`menuName`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- 正在导出表  yxsz.menu 的数据：~21 rows (大约)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`menuId`, `menuName`, `url`, `parent`, `privilegeId`, `order`, `createtime`, `updatetime`, `version`) VALUES
	(1, '系统管理', '/sysmgr', -1, '', 1, '2014-01-03 08:23:56', '2014-01-05 12:08:44', 0),
	(2, '登录管理', '/loginUser/list', 1, 'p_login_user', 1, '2014-01-03 08:23:56', NULL, 0),
	(3, '应用管理', '/app', -1, '', 2, '2014-01-03 08:23:56', '2014-01-05 12:08:44', 0),
	(4, '应用版本', '/appVersion/list', 3, 'p_app_version', 1, '2014-01-03 08:23:56', NULL, 0),
	(5, '角色管理', '/role/list', 1, 'p_role', 2, '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1),
	(6, '内容管理', '/content', -1, NULL, 3, '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1),
	(7, '随拍', '/capture/list', 6, 'p_capture', 1, '2014-01-03 08:23:56', '2014-01-09 20:32:38', 1),
	(8, '个人收藏', '/favorite/list', 6, 'p_favorite', 2, '2014-01-03 08:23:56', '2014-01-09 20:38:46', 1),
	(9, '用户反馈', '/feedback/list', 6, 'p_feedback', 3, '2014-01-03 08:23:56', '2014-01-09 20:38:46', 1),
	(10, '初始界面', '/splash/list', 6, 'p_splash', 4, '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1),
	(11, '酒店', '/hotel/list', 6, 'p_hotel', 5, '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1),
	(12, '餐馆', '/restaurant/list', 6, 'p_restaurant', 6, '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1),
	(13, '景点', '/scape/list', 6, 'p_scape', 7, '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1),
	(14, '首页广告', '/commercial/list', 6, 'p_commercial', 8, '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1),
	(15, '手机用户', '/mobileUser/list', 6, 'p_mobileUser', 9, '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1),
	(16, '游记', '/travelNote/list', 6, 'p_travelNote', 10, '2014-01-03 08:23:56', '2014-02-10 21:07:58', 1),
	(17, '短信记录', '/smsRecord/list', 6, 'p_smsRecord', 11, '2014-01-03 08:23:56', '2014-02-10 21:07:58', 1),
	(18, '推送', '/pushRecord/list', 6, 'p_pushRecord', 12, '2014-01-03 08:23:56', '2014-02-11 21:56:23', 0),
	(19, '推送TAG', '/pushTag/list', 6, 'p_pushTag', 13, '2014-01-03 08:23:56', '2014-01-03 08:23:56', 0),
	(20, '酒店类型', '/hotelType/list', 6, 'p_hotelType', 14, '2014-01-01 00:00:00', '2014-03-09 18:50:23', 0),
	(21, '用户评价', '/comment/list', 6, 'p_comment', 15, '2014-01-01 00:00:00', '2014-03-10 21:29:05', 0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- 导出  表 yxsz.mobile_user 结构
CREATE TABLE IF NOT EXISTS `mobile_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loginname` varchar(15) NOT NULL COMMENT '登陆名',
  `realname` varchar(15) DEFAULT NULL COMMENT '真实姓名',
  `password` char(32) NOT NULL COMMENT '密码',
  `phone` char(11) NOT NULL COMMENT '手机号码',
  `gender` char(1) DEFAULT NULL COMMENT '性别:男1 女0',
  `avatar` varchar(128) DEFAULT NULL COMMENT '头像的url',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `createtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `version` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginname` (`loginname`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='手机用户';


-- 导出  表 yxsz.privilege 结构
CREATE TABLE IF NOT EXISTS `privilege` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `privilegeId` varchar(32) NOT NULL COMMENT '权限标识',
  `privilegeName` char(32) NOT NULL COMMENT '权限名称',
  `createtime` timestamp NOT NULL DEFAULT '2014-01-01 00:00:00' COMMENT '创建时间',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `version` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `privilegeId` (`privilegeId`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='权限';

-- 正在导出表  yxsz.privilege 的数据：~64 rows (大约)
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` (`id`, `privilegeId`, `privilegeName`, `createtime`, `updatetime`, `version`) VALUES
	(2, 'p_login_user', '登录管理', '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1),
	(3, 'p_app_version', '应用版本', '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1),
	(4, 'p_role', '角色管理', '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1),
	(5, 'p_login_user_add', '增加登录用户', '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1),
	(6, 'p_login_user_edit', '修改登录用户', '2014-01-01 00:00:00', '2014-01-05 20:00:27', 0),
	(7, 'p_app_version_add', '增加应用版本', '2014-01-01 00:00:00', '2014-01-05 20:00:28', 0),
	(8, 'p_app_version_edit', '修改应用版本', '2014-01-01 00:00:00', '2014-01-05 20:00:28', 0),
	(9, 'p_add_version_del', '删除应用版本', '2014-01-01 00:00:00', '2014-01-05 20:00:28', 0),
	(10, 'p_role_add', '增加角色', '2014-01-01 00:00:00', '2014-01-05 20:00:28', 0),
	(11, 'p_role_edit', '修改角色', '2014-01-01 00:00:00', '2014-01-05 20:00:28', 0),
	(12, 'p_role_del', '删除角色', '2014-01-01 00:00:00', '2014-01-05 20:00:28', 0),
	(13, 'p_capture', '随拍内容', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(14, 'p_capture_del', '删除随拍', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(15, 'p_capture_display', '查看随拍', '2014-01-01 00:00:00', '2014-01-07 23:00:54', 0),
	(16, 'p_favorite', '个人收藏', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(17, 'p_favorite_del', '删除个人收藏', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(18, 'p_favorite_display', '查看个人收藏', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(19, 'p_feedback', '用户反馈', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(20, 'p_feedback_del', '删除用户反馈', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(21, 'p_feedback_display', '查看用户反馈', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(22, 'p_splash', '初始化界面', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 1),
	(23, 'p_splash_add', '增加初始化界面', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 1),
	(24, 'p_splash_edit', '修改初始化界面', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 1),
	(25, 'p_splash_del', '删除初始化界面', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 1),
	(26, 'p_hotel', '酒店', '2014-01-01 00:00:00', '2014-01-20 21:45:38', 0),
	(27, 'p_hotel_add', '增加酒店', '2014-01-01 00:00:00', '2014-01-20 21:45:38', 0),
	(28, 'p_hotel_edit', '修改酒店', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(29, 'p_hotel_del', '删除酒店', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(30, 'p_restaurant', '餐馆', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(31, 'p_restaurant_add', '增加餐馆', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(32, 'p_restaurant_edit', '修改餐馆', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(33, 'p_restaurant_del', '删除餐馆', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(34, 'p_scape', '景点', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(35, 'p_scape_add', '增加景点', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(36, 'p_scape_edit', '修改景点', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(37, 'p_scape_del', '删除景点', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(38, 'p_commercial', '首页广告', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(39, 'p_commercial_add', '增加首页广告', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(40, 'p_commercial_edit', '修改首页广告', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(41, 'p_commercial_del', '删除首页广告', '2014-01-01 00:00:00', '2014-01-20 21:45:39', 0),
	(42, 'p_mobileUser', '手机用户', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(43, 'p_mobileUser_edit', '编辑手机用户', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(44, 'p_mobileUser_del', '删除手机用户', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(45, 'p_travelNote', '游记', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(46, 'p_travelNote_add', '增加游记', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(47, 'p_travelNote_edit', '编辑游记', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(48, 'p_travelNote_del', '删除游记', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(49, 'p_smsRecord', '短信记录', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(50, 'p_pushRecord', '推送记录', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(51, 'p_pushRecord_add', '增加推送', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(52, 'p_pushTag', '推送TAG', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(53, 'p_pushTag_add', '增加推送TAG', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(54, 'p_pushTag_edit', '编辑推送TAG', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(55, 'p_pushTag_del', '删除推送TAG', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(56, 'p_pushRecord_del', '删除推送记录', '2014-01-01 00:00:00', '2014-03-04 00:37:45', 0),
	(57, 'p_smsRecord_del', '删除短信记录', '2014-01-01 00:00:00', '2014-03-04 00:38:32', 0),
	(58, 'p_login_user_del', '删除登陆用户', '2014-01-01 00:00:00', '2014-03-09 15:37:23', 0),
	(59, 'p_hotelType', '酒店类型', '2014-01-01 00:00:00', '2014-03-09 18:47:51', 0),
	(60, 'p_hotelType_add', '增加酒店类型', '2014-01-01 00:00:00', '2014-03-09 18:48:09', 0),
	(61, 'p_hotelType_edit', '编辑酒店类型', '2014-01-01 00:00:00', '2014-03-09 18:48:40', 0),
	(62, 'p_hotelType_del', '删除酒店类型', '2014-01-01 00:00:00', '2014-03-09 18:48:59', 0),
	(63, 'p_comment', '评价管理', '2014-01-01 00:00:00', '2014-03-10 21:26:51', 0),
	(64, 'p_comment_del', '删除评价', '2014-01-01 00:00:00', '2014-03-10 21:27:18', 0),
	(65, 'p_comment_display', '显示评价', '2014-01-01 00:00:00', '2014-03-10 21:27:33', 0);
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;


-- 导出  表 yxsz.pushrecord 结构
CREATE TABLE IF NOT EXISTS `pushrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sendno` int(11) NOT NULL COMMENT '发送编号',
  `receivertype` varchar(8) NOT NULL COMMENT '接收者类型\n2、指定的 tag。\n3、指定的 alias。\n4、广播：对 app_key 下的所有用户推送消息。',
  `receivervalue` varchar(4096) DEFAULT NULL COMMENT '发送范围值，与 receiver_type 相对应。\n2、tag 支持多达 10 个，使用 "," 间隔\n3、alias 支持多达 1000 个，使用 "," 间隔\n4、不需要填',
  `type` varchar(8) NOT NULL COMMENT '发送消息的类型：\n1、通知\n2、自定义消息（只有 Android 支持）',
  `content` varchar(256) NOT NULL COMMENT '内容',
  `description` varchar(128) DEFAULT NULL COMMENT '描述',
  `title` varchar(64) DEFAULT NULL COMMENT '标题\n只有 Android支持这个参考',
  `extras` varchar(1024) DEFAULT NULL COMMENT '额外参数\n客户端可获取',
  `status` varchar(64) DEFAULT NULL COMMENT '状态',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statuscode` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='push记录';

-- 导出  表 yxsz.push_tag 结构
CREATE TABLE IF NOT EXISTS `push_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL COMMENT '内容标题',
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_UNIQUE` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='push 消息对应的TAG';


-- 导出  表 yxsz.role 结构
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleId` varchar(32) NOT NULL COMMENT '角色标识',
  `roleName` char(32) NOT NULL COMMENT '角色名称',
  `createtime` timestamp NOT NULL DEFAULT '2014-01-01 00:00:00' COMMENT '创建时间',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `version` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleId` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='角色';

-- 正在导出表  yxsz.role 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `roleId`, `roleName`, `createtime`, `updatetime`, `version`) VALUES
	(12, 'admin_role', '管理员权限', '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- 导出  表 yxsz.role_privilege 结构
CREATE TABLE IF NOT EXISTS `role_privilege` (
  `roleId` int(10) NOT NULL,
  `privilegeId` int(10) NOT NULL,
  PRIMARY KEY (`roleId`,`privilegeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限';

-- 正在导出表  yxsz.role_privilege 的数据：~79 rows (大约)
/*!40000 ALTER TABLE `role_privilege` DISABLE KEYS */;
INSERT INTO `role_privilege` (`roleId`, `privilegeId`) VALUES
	(12, 2),
	(12, 3),
	(12, 4),
	(12, 5),
	(12, 6),
	(12, 7),
	(12, 8),
	(12, 9),
	(12, 10),
	(12, 11),
	(12, 12),
	(12, 13),
	(12, 14),
	(12, 15),
	(12, 16),
	(12, 17),
	(12, 18),
	(12, 19),
	(12, 20),
	(12, 21),
	(12, 22),
	(12, 23),
	(12, 24),
	(12, 25),
	(12, 26),
	(12, 27),
	(12, 28),
	(12, 29),
	(12, 30),
	(12, 31),
	(12, 32),
	(12, 33),
	(12, 34),
	(12, 35),
	(12, 36),
	(12, 37),
	(12, 38),
	(12, 39),
	(12, 40),
	(12, 41),
	(12, 42),
	(12, 43),
	(12, 44),
	(12, 45),
	(12, 46),
	(12, 47),
	(12, 48),
	(12, 49),
	(12, 50),
	(12, 51),
	(12, 52),
	(12, 53),
	(12, 54),
	(12, 55),
	(12, 56),
	(12, 57),
	(12, 58),
	(12, 59),
	(12, 60),
	(12, 61),
	(12, 62),
	(12, 63),
	(12, 64),
	(12, 65);
/*!40000 ALTER TABLE `role_privilege` ENABLE KEYS */


-- 导出  表 yxsz.smsrecord 结构
CREATE TABLE IF NOT EXISTS `smsrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` char(11) NOT NULL DEFAULT '0' COMMENT '电话号码',
  `code` char(6) NOT NULL DEFAULT '0' COMMENT '验证码',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='短信发送记录';


-- 导出  表 yxsz.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loginname` varchar(15) NOT NULL COMMENT '登陆名',
  `password` char(32) NOT NULL COMMENT '密码',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `avatar` varchar(50) DEFAULT NULL COMMENT '头像的url',
  `email` varchar(50) NOT NULL COMMENT '电子邮件',
  `createtime` timestamp NOT NULL DEFAULT '2014-01-01 00:00:00' COMMENT '创建时间',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `version` int(10) unsigned DEFAULT '0',
  `status` varchar(8) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='平台用户';

-- 正在导出表  yxsz.user 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `loginname`, `password`, `phone`, `avatar`, `email`, `createtime`, `updatetime`, `version`, `status`) VALUES
	(12, 'admin', '96e79218965eb72c92a549dd5a330112', '15618297613', 'http://yxsz.u.qiniudn.com/avatar/default.jpg', 'abc@szyx.com', '2013-12-15 13:57:22', '2014-01-02 22:50:37', 3, '1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- 导出  表 yxsz.user_role 结构
CREATE TABLE IF NOT EXISTS `user_role` (
  `userId` int(10) NOT NULL,
  `roleId` int(10) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户菜单';

-- 正在导出表  yxsz.user_role 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`userId`, `roleId`) VALUES
	(12, 12);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
