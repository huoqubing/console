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

-- 导出  表 yxsz.appversion 结构
CREATE TABLE IF NOT EXISTS `appversion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL COMMENT 'app类别 0:android 1: ios',
  `version` varchar(10) NOT NULL,
  `downloadurl` varchar(128) NOT NULL,
  `content` varchar(128) NOT NULL COMMENT '更新内容',
  `createtime` timestamp NOT NULL DEFAULT '2014-01-01 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='移动app版本';

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
	(15, '手机用户', '/mobileUser/list', 6, 'p_mobileUser', 9, '2014-01-03 08:23:56', '2014-01-03 08:23:56', 1),
	(17, '短信记录', '/smsRecord/list', 6, 'p_smsRecord', 11, '2014-01-03 08:23:56', '2014-02-10 21:07:58', 1),
	(18, '推送', '/pushRecord/list', 6, 'p_pushRecord', 12, '2014-01-03 08:23:56', '2014-02-11 21:56:23', 0),
	(19, '推送TAG', '/pushTag/list', 6, 'p_pushTag', 13, '2014-01-03 08:23:56', '2014-01-03 08:23:56', 0);
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
	(42, 'p_mobileUser', '手机用户', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(43, 'p_mobileUser_edit', '编辑手机用户', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(44, 'p_mobileUser_del', '删除手机用户', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(49, 'p_smsRecord', '短信记录', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(50, 'p_pushRecord', '推送记录', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(51, 'p_pushRecord_add', '增加推送', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(52, 'p_pushTag', '推送TAG', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(53, 'p_pushTag_add', '增加推送TAG', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(54, 'p_pushTag_edit', '编辑推送TAG', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(55, 'p_pushTag_del', '删除推送TAG', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 0),
	(56, 'p_pushRecord_del', '删除推送记录', '2014-01-01 00:00:00', '2014-03-04 00:37:45', 0),
	(57, 'p_smsRecord_del', '删除短信记录', '2014-01-01 00:00:00', '2014-03-04 00:38:32', 0),
	(58, 'p_login_user_del', '删除登陆用户', '2014-01-01 00:00:00', '2014-03-09 15:37:23', 0);
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
	(12, 42),
	(12, 43),
	(12, 44),
	(12, 49),
	(12, 50),
	(12, 51),
	(12, 52),
	(12, 53),
	(12, 54),
	(12, 55),
	(12, 56),
	(12, 57),
	(12, 58);
/*!40000 ALTER TABLE `role_privilege` ENABLE KEYS */;


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
