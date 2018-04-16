/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : pharmacy_new

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2018-04-14 22:00:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dingdan
-- ----------------------------
DROP TABLE IF EXISTS `dingdan`;
CREATE TABLE `dingdan` (
  `dingdanID` int(111) NOT NULL AUTO_INCREMENT,
  `dingdanBianhao` varchar(255) COLLATE utf8_bin NOT NULL,
  `yaopingID` int(111) NOT NULL,
  `danjia` double(111,11) NOT NULL,
  `shuliang` int(11) NOT NULL,
  `zongjia` double(111,11) NOT NULL,
  `dingdanleixing` int(11) NOT NULL,
  `riqi` varchar(111) COLLATE utf8_bin NOT NULL,
  `gongyingshangID` int(111) NOT NULL,
  `kehuID` int(11) DEFAULT NULL,
  `yaoxiangID` int(111) DEFAULT NULL,
  `complete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dingdanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of dingdan
-- ----------------------------

-- ----------------------------
-- Table structure for gongyingshang
-- ----------------------------
DROP TABLE IF EXISTS `gongyingshang`;
CREATE TABLE `gongyingshang` (
  `gongyingshangID` int(111) NOT NULL AUTO_INCREMENT,
  `gongyingshangMingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  `mingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  `dianhua` varchar(111) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`gongyingshangID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of gongyingshang
-- ----------------------------
INSERT INTO `gongyingshang` VALUES ('1', '供应商1', '33', '32');
INSERT INTO `gongyingshang` VALUES ('2', '供应商2', '2', '2');
INSERT INTO `gongyingshang` VALUES ('3', '供应商3', '33', '32');
INSERT INTO `gongyingshang` VALUES ('4', '供应商4', '2', '2');
INSERT INTO `gongyingshang` VALUES ('5', '板蓝根', '2', '2');

-- ----------------------------
-- Table structure for kehu
-- ----------------------------
DROP TABLE IF EXISTS `kehu`;
CREATE TABLE `kehu` (
  `kehuID` int(111) NOT NULL AUTO_INCREMENT,
  `kehuMingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  `kehuShouji` varchar(111) COLLATE utf8_bin NOT NULL,
  `kehuQQ` varchar(111) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`kehuID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kehu
-- ----------------------------
INSERT INTO `kehu` VALUES ('1', '客户1', '142', '142');
INSERT INTO `kehu` VALUES ('2', '客户2', '15', '15');
INSERT INTO `kehu` VALUES ('3', '客户3', '142', '142');
INSERT INTO `kehu` VALUES ('4', '客户4', '15', '15');

-- ----------------------------
-- Table structure for kucun
-- ----------------------------
DROP TABLE IF EXISTS `kucun`;
CREATE TABLE `kucun` (
  `kucunID` int(111) NOT NULL AUTO_INCREMENT COMMENT '0未操作，1已操作',
  `yaopingID` int(111) NOT NULL,
  `yaoxiangID` int(111) NOT NULL COMMENT '仓库Id',
  `dingdanID` int(111) NOT NULL,
  `shuliang` int(111) NOT NULL,
  `riqi` varchar(111) COLLATE utf8_bin NOT NULL,
  `zhuangtai` int(111) NOT NULL,
  PRIMARY KEY (`kucunID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kucun
-- ----------------------------

-- ----------------------------
-- Table structure for rizhi
-- ----------------------------
DROP TABLE IF EXISTS `rizhi`;
CREATE TABLE `rizhi` (
  `rizhiID` int(111) NOT NULL AUTO_INCREMENT,
  `yonghuID` int(111) NOT NULL,
  `riqi` varchar(111) COLLATE utf8_bin NOT NULL,
  `neirong` varchar(111) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`rizhiID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of rizhi
-- ----------------------------
INSERT INTO `rizhi` VALUES ('1', '1', '2018-04-12 10:59:59', 'ting登录');
INSERT INTO `rizhi` VALUES ('2', '0', '2018-04-12 11:18:00', 'null退出');
INSERT INTO `rizhi` VALUES ('3', '1', '2018-04-12 11:18:06', 'ting登录');
INSERT INTO `rizhi` VALUES ('4', '0', '2018-04-14 13:40:36', 'null退出');
INSERT INTO `rizhi` VALUES ('5', '1', '2018-04-14 13:40:42', 'ting登录');
INSERT INTO `rizhi` VALUES ('6', '1', '2018-04-14 13:40:44', 'ting退出');
INSERT INTO `rizhi` VALUES ('7', '1', '2018-04-14 13:40:59', 'ting登录');
INSERT INTO `rizhi` VALUES ('8', '1', '2018-04-14 13:56:33', 'ting退出');
INSERT INTO `rizhi` VALUES ('9', '1', '2018-04-14 13:56:34', 'ting登录');
INSERT INTO `rizhi` VALUES ('10', '1', '2018-04-14 14:17:25', 'ting退出');
INSERT INTO `rizhi` VALUES ('11', '1', '2018-04-14 14:17:27', 'ting登录');
INSERT INTO `rizhi` VALUES ('12', '0', '2018-04-14 14:35:44', 'null退出');
INSERT INTO `rizhi` VALUES ('13', '1', '2018-04-14 14:35:45', 'ting登录');
INSERT INTO `rizhi` VALUES ('14', '1', '2018-04-14 14:42:18', 'ting退出');
INSERT INTO `rizhi` VALUES ('15', '1', '2018-04-14 14:42:19', 'ting登录');
INSERT INTO `rizhi` VALUES ('16', '1', '2018-04-14 14:47:54', 'ting登录');
INSERT INTO `rizhi` VALUES ('17', '1', '2018-04-14 19:49:06', 'ting登录');
INSERT INTO `rizhi` VALUES ('18', '1', '2018-04-14 20:43:33', 'ting登录');

-- ----------------------------
-- Table structure for yaoping
-- ----------------------------
DROP TABLE IF EXISTS `yaoping`;
CREATE TABLE `yaoping` (
  `yaopingID` int(111) NOT NULL AUTO_INCREMENT,
  `yaopingBianhao` varchar(255) COLLATE utf8_bin NOT NULL,
  `yaopingMingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  `yaopingDanwei` varchar(111) COLLATE utf8_bin NOT NULL,
  `youxiaoqi` int(111) NOT NULL,
  `jingjia` double(111,11) NOT NULL,
  `gongyingshangMingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  `yaoxiangID` int(11) NOT NULL,
  PRIMARY KEY (`yaopingID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of yaoping
-- ----------------------------
INSERT INTO `yaoping` VALUES ('1', '1001', 'ceshi1', '单位1', '11', '10.00000000000', '供应商1', '1');
INSERT INTO `yaoping` VALUES ('2', '1002', 'ceshi4', '单位2', '1', '1.00000000000', '供应商2', '2');
INSERT INTO `yaoping` VALUES ('3', '1003', 'ceshi2', '单位3', '1', '1.00000000000', '供应商3', '3');
INSERT INTO `yaoping` VALUES ('4', '1004', 'ceshi3', '单位4', '1', '1.00000000000', '供应商4', '1');
INSERT INTO `yaoping` VALUES ('5', '1005', '头孢', '1盒', '1000', '1.00000000000', '供应商1', '1');

-- ----------------------------
-- Table structure for yaoxiang
-- ----------------------------
DROP TABLE IF EXISTS `yaoxiang`;
CREATE TABLE `yaoxiang` (
  `yaoxiangID` int(111) NOT NULL AUTO_INCREMENT,
  `yaoxiangMingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`yaoxiangID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of yaoxiang
-- ----------------------------
INSERT INTO `yaoxiang` VALUES ('1', '药箱1');
INSERT INTO `yaoxiang` VALUES ('2', '药箱2');
INSERT INTO `yaoxiang` VALUES ('3', '药箱3');
INSERT INTO `yaoxiang` VALUES ('4', '药箱3');

-- ----------------------------
-- Table structure for yaoxiangshezi
-- ----------------------------
DROP TABLE IF EXISTS `yaoxiangshezi`;
CREATE TABLE `yaoxiangshezi` (
  `id` int(111) NOT NULL AUTO_INCREMENT,
  `yaoxiangID` int(111) NOT NULL,
  `yaopingID` int(111) NOT NULL,
  `zuishaoshuliang` int(111) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of yaoxiangshezi
-- ----------------------------
INSERT INTO `yaoxiangshezi` VALUES ('1', '1', '5', '10000000');
INSERT INTO `yaoxiangshezi` VALUES ('2', '1', '4', '100');

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu` (
  `yonghuID` int(111) NOT NULL AUTO_INCREMENT,
  `yonghuMingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  `dengluMingzi` varchar(111) COLLATE utf8_bin DEFAULT NULL,
  `miMa` varchar(111) COLLATE utf8_bin DEFAULT NULL,
  `zhiwu` int(111) NOT NULL,
  `shouji` varchar(111) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`yonghuID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES ('1', 'ting', 'ting', 'ting', '0', '13527774500');
INSERT INTO `yonghu` VALUES ('2', 'test1', 'test1', '123456', '0', '13505050523');

ALTER TABLE `yaoping`
CHANGE COLUMN `youxiaoqi` `guige`  varchar(255) NOT NULL AFTER `yaopingDanwei`;

ALTER TABLE `yonghu`
MODIFY COLUMN `zhiwu`  int(111) NULL AFTER `miMa`,
MODIFY COLUMN `shouji`  varchar(111) CHARACTER SET utf8 COLLATE utf8_bin NULL AFTER `zhiwu`;


