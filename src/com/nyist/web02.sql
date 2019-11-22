/*
Navicat MySQL Data Transfer

Source Server         : Test
Source Server Version : 50551
Source Host           : localhost:3306
Source Database       : web02

Target Server Type    : MYSQL
Target Server Version : 50551
File Encoding         : 65001

Date: 2019-11-21 08:48:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `order_id` varchar(100) NOT NULL DEFAULT '',
  `product_id` varchar(100) NOT NULL DEFAULT '',
  `buynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('57de29b9fc5f403fac86aa529bb1f5db', '10', '1');
INSERT INTO `orderitem` VALUES ('57de29b9fc5f403fac86aa529bb1f5db', '9', '1');
INSERT INTO `orderitem` VALUES ('5d839547359d47dcb7ddb8b5f7756b8f', '12', '4');
INSERT INTO `orderitem` VALUES ('8560dbcb7ff44d73a74fc8579f1526b2', '11', '1');
INSERT INTO `orderitem` VALUES ('8560dbcb7ff44d73a74fc8579f1526b2', '35', '2');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `money` double DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverName` varchar(20) DEFAULT NULL,
  `receiverPhone` varchar(20) DEFAULT NULL,
  `paystate` int(11) DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('57de29b9fc5f403fac86aa529bb1f5db', '129.6', 'bilibili', 'asd', '1839329749', '0', '2019-11-20 20:30:19', '8');
INSERT INTO `orders` VALUES ('5d839547359d47dcb7ddb8b5f7756b8f', '266.4', 'asd', 'asd', '1839329749', '0', '2019-11-20 22:34:23', '8');
INSERT INTO `orders` VALUES ('8560dbcb7ff44d73a74fc8579f1526b2', '256.7', 'asd', 'asd', '1839329749', '0', '2019-11-20 21:25:06', '8');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'java从入门到精通升级版', '89.9', '计算机', '20', '', 'java入坟精选');
INSERT INTO `products` VALUES ('10', '数据结构', '45', '计算机', '10', null, 'goodbook');
INSERT INTO `products` VALUES ('11', '老人与海', '78.7', '文学', '9', null, 'verygood');
INSERT INTO `products` VALUES ('12', '假如给我三天光明', '66.6', '文学', '6', null, 'verygood');
INSERT INTO `products` VALUES ('13', '三体', '68.9', '科技', '10', '', 'verygood');
INSERT INTO `products` VALUES ('14', '龙族', '87', '文学', '10', null, 'verygood');
INSERT INTO `products` VALUES ('15', '鲁冰逊漂流记', '56', '计算机', '10', null, 'verygood');
INSERT INTO `products` VALUES ('16', '白夜行', '86', '文学', '10', null, 'verygood');
INSERT INTO `products` VALUES ('17', '红高粱', '99', '文学', '10', null, 'verygood');
INSERT INTO `products` VALUES ('18', '水浒传', '87', '文学', '10', null, 'verygood');
INSERT INTO `products` VALUES ('19', '三国演义', '72', '文学', '10', '11 (10).jpg', '三国志123');
INSERT INTO `products` VALUES ('2', 'HTML从入门到精通', '78.9', '计算机', '10', null, 'good book');
INSERT INTO `products` VALUES ('20', '平凡的世界', '90', '文学', '10', null, 'verygood');
INSERT INTO `products` VALUES ('21', '新概念英语', '78', '外语', '10', null, 'good');
INSERT INTO `products` VALUES ('22', '百年孤独', '88', '外语', '10', null, 'good');
INSERT INTO `products` VALUES ('23', '科技英语2', '34', '外语', '20', '', 'English');
INSERT INTO `products` VALUES ('24', '综合教程', '55', '外语', '10', null, 'good');
INSERT INTO `products` VALUES ('26', '肖申克的救赎', '44', '励志', '10', null, 'classic');
INSERT INTO `products` VALUES ('27', '海上钢琴师', '80', '励志', '10', null, 'classic');
INSERT INTO `products` VALUES ('28', '当心福来敲门', '89', '励志', '10', null, 'classic');
INSERT INTO `products` VALUES ('29', '阿根正传', '99', '励志', '10', null, 'classic');
INSERT INTO `products` VALUES ('3', 'mysql实战', '99', '计算机', '10', null, 'good book');
INSERT INTO `products` VALUES ('30', '怦然心动', '76', '生活', '10', null, 'classic');
INSERT INTO `products` VALUES ('31', '老友记', '66', '生活', '10', null, 'classic');
INSERT INTO `products` VALUES ('33', '中华英雄', '46', '生活', '10', null, 'happiness');
INSERT INTO `products` VALUES ('34', '黑客帝国', '88', '科技', '10', null, 'science');
INSERT INTO `products` VALUES ('35', '人工智能', '89', '科技', '8', null, 'science');
INSERT INTO `products` VALUES ('36', '我机器人', '78', '科技', '10', null, 'science');
INSERT INTO `products` VALUES ('38', '饿狼传说', '54', '科技', '10', null, 'science');
INSERT INTO `products` VALUES ('39', '钢铁侠2', '89', '科技', '20', '11 (11).jpg', '科技引领未来');
INSERT INTO `products` VALUES ('4', 'oracle企业级开发', '69', '计算机', '10', '11 (5).jpg', 'goodbook');
INSERT INTO `products` VALUES ('40', '追风筝的人', '78.9', '文学', '10', null, 'goodbook');
INSERT INTO `products` VALUES ('41', '简爱', '81', '文学', '10', null, 'goodbook');
INSERT INTO `products` VALUES ('42', 'headfirst设计模式', '99', '计算机', '10', null, 'codebook');
INSERT INTO `products` VALUES ('43', '图解HTTP', '86', '计算机', '10', null, 'codebook');
INSERT INTO `products` VALUES ('44', '明朝那些事', '87', '文学', '10', null, 'classic');
INSERT INTO `products` VALUES ('5', 'spring实战', '89', '计算机', '10', null, 'good book');
INSERT INTO `products` VALUES ('50', '剑指offer', '99', '计算机', '20', ' ', '面试黄金书');
INSERT INTO `products` VALUES ('51', '剑指offer2', '199', '计算机', '20', ' ', '面试黄金书2');
INSERT INTO `products` VALUES ('56', '李贝2号', '48', '计算机', '10', '', '李贝憨憨');
INSERT INTO `products` VALUES ('6', '计算机组成原理', '78', '计算机', '10', null, 'goodbook');
INSERT INTO `products` VALUES ('65', '深入理解java虚拟机2', '90', '计算机', '20', '/images', 'java神树啊');
INSERT INTO `products` VALUES ('7', 'Python爬虫', '120', '计算机', '10', null, 'goodbook');
INSERT INTO `products` VALUES ('8', 'java编程思想', '99.9', '计算机', '10', null, 'goodbook');
INSERT INTO `products` VALUES ('9', '算法导论', '84.6', '计算机', '10', null, 'goodbook');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `activeCode` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `role` varchar(10) DEFAULT '普通用户',
  `registTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '张三', '123', '男', '9111@qq.com', '123', '12313', 'cd7b950642e5442f994cc1d6f777bae3', '0', '普通用户', '2019-11-15 00:04:58');
INSERT INTO `user` VALUES ('5', '赵六', 'abc', '男', '9111@qq.com', '1839329749', '123', '9d419b279e80468b9003210e75455fdb', '0', '普通用户', '2019-11-15 08:46:42');
INSERT INTO `user` VALUES ('6', 'test1', 'abc123', '男', '911168435@qq.com', '1839329749', '123', '23f13175c9064455b2e508dedaf01bd8', '0', '普通用户', '2019-11-15 09:24:36');
INSERT INTO `user` VALUES ('7', 'qwe', 'qwe', '男', '911168435@qq.com', '2144234', 'asd', '9f66f49259c24c27a4128a76b5de5ef5', '1', '管理员', '2019-11-15 15:39:14');
INSERT INTO `user` VALUES ('8', 'asd', '123', '男', '911168435@qq.com', '1839329749', '4534657', 'bb15d55a9b95474cb9fc014d7f91ad52', '1', '普通用户', '2019-11-15 17:33:41');
