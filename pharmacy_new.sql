/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : pharmacy

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2018-04-13 08:51:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cangku
-- ----------------------------
DROP TABLE IF EXISTS `cangku`;
CREATE TABLE `cangku` (
  `cangkuID` int(111) NOT NULL AUTO_INCREMENT,
  `cangkuMingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cangkuID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cangku
-- ----------------------------
INSERT INTO `cangku` VALUES ('1', '仓库1');
INSERT INTO `cangku` VALUES ('2', '仓库2');
INSERT INTO `cangku` VALUES ('3', '仓库3');
INSERT INTO `cangku` VALUES ('4', '仓库4');

-- ----------------------------
-- Table structure for cangkushezi
-- ----------------------------
DROP TABLE IF EXISTS `cangkushezi`;
CREATE TABLE `cangkushezi` (
  `id` int(111) NOT NULL AUTO_INCREMENT,
  `cangkuID` int(111) NOT NULL,
  `yaopingID` int(111) NOT NULL,
  `zuishaoshuliang` int(111) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cangkushezi
-- ----------------------------
INSERT INTO `cangkushezi` VALUES ('1', '1', '1', '10000000');

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
  `cangkuID` int(111) DEFAULT NULL,
  `complete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dingdanID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of dingdan
-- ----------------------------
INSERT INTO `dingdan` VALUES ('1', '1', '1', '1.00000000000', '10', '10.00000000000', '1', '2018-04-12 11:07:08', '1', '0', '1', '0');
INSERT INTO `dingdan` VALUES ('3', '1', '1', '1.00000000000', '10', '10.00000000000', '3', '2018-04-12 11:23:22', '0', '1', '1', '0');
INSERT INTO `dingdan` VALUES ('5', '1', '1', '1.00000000000', '10', '10.00000000000', '4', '2018-04-12 11:23:34', '0', '1', '1', '0');
INSERT INTO `dingdan` VALUES ('6', '1', '1', '1.00000000000', '10', '10.00000000000', '2', '2018-04-12 11:07:18', '1', '0', '1', '1');

-- ----------------------------
-- Table structure for fukuandan
-- ----------------------------
DROP TABLE IF EXISTS `fukuandan`;
CREATE TABLE `fukuandan` (
  `fukuandanID` int(111) NOT NULL AUTO_INCREMENT,
  `gongyingshangID` int(111) NOT NULL,
  `riqi` varchar(111) COLLATE utf8_bin NOT NULL,
  `caigoufahuoID` int(111) NOT NULL,
  `caigoudingdangID` int(111) NOT NULL,
  `qianshu` double(111,11) NOT NULL,
  `beizhi` varchar(111) COLLATE utf8_bin NOT NULL,
  `zhuangtai` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fukuandanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of fukuandan
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of gongyingshang
-- ----------------------------
INSERT INTO `gongyingshang` VALUES ('1', '供应商1', '33', '32');
INSERT INTO `gongyingshang` VALUES ('2', '供应商2', '2', '2');
INSERT INTO `gongyingshang` VALUES ('3', '供应商3', '33', '32');
INSERT INTO `gongyingshang` VALUES ('4', '供应商4', '2', '2');

-- ----------------------------
-- Table structure for kehu
-- ----------------------------
DROP TABLE IF EXISTS `kehu`;
CREATE TABLE `kehu` (
  `kehuID` int(111) NOT NULL AUTO_INCREMENT,
  `kehuMingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  `kehuShouji` varchar(111) COLLATE utf8_bin NOT NULL,
  `kehuQQ` varchar(111) COLLATE utf8_bin NOT NULL,
  `dingdanID` int(111) NOT NULL,
  PRIMARY KEY (`kehuID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kehu
-- ----------------------------
INSERT INTO `kehu` VALUES ('1', '客户1', '142', '142', '1');
INSERT INTO `kehu` VALUES ('2', '客户2', '15', '15', '2');
INSERT INTO `kehu` VALUES ('3', '客户3', '142', '142', '3');
INSERT INTO `kehu` VALUES ('4', '客户4', '15', '15', '4');

-- ----------------------------
-- Table structure for kucun
-- ----------------------------
DROP TABLE IF EXISTS `kucun`;
CREATE TABLE `kucun` (
  `kucunID` int(111) NOT NULL AUTO_INCREMENT COMMENT '0未操作，1已操作',
  `yaopingID` int(111) NOT NULL,
  `cangkuID` int(111) NOT NULL COMMENT '仓库Id',
  `dingdanID` int(111) NOT NULL,
  `shuliang` int(111) NOT NULL,
  `riqi` varchar(111) COLLATE utf8_bin NOT NULL,
  `zhuangtai` int(111) NOT NULL,
  PRIMARY KEY (`kucunID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kucun
-- ----------------------------
INSERT INTO `kucun` VALUES ('1', '1', '1', '1', '10000', '2018-04-01', '0');
INSERT INTO `kucun` VALUES ('2', '2', '2', '2', '10000', '2018-04-01', '0');
INSERT INTO `kucun` VALUES ('3', '3', '3', '3', '10000', '2018-04-01', '1');
INSERT INTO `kucun` VALUES ('4', '1', '1', '4', '9980', '2018-04-01', '1');
INSERT INTO `kucun` VALUES ('11', '1', '1', '1001', '10', '2018-04-01', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of rizhi
-- ----------------------------
INSERT INTO `rizhi` VALUES ('1', '1', '2018-04-12 10:59:59', 'ting登录');
INSERT INTO `rizhi` VALUES ('2', '0', '2018-04-12 11:18:00', 'null退出');
INSERT INTO `rizhi` VALUES ('3', '1', '2018-04-12 11:18:06', 'ting登录');

-- ----------------------------
-- Table structure for rukuandan
-- ----------------------------
DROP TABLE IF EXISTS `rukuandan`;
CREATE TABLE `rukuandan` (
  `rukuandanID` int(111) NOT NULL AUTO_INCREMENT,
  `kehuID` int(111) NOT NULL,
  `riqi` varchar(111) COLLATE utf8_bin NOT NULL,
  `xiaoshoudingdangID` int(111) NOT NULL,
  `qianshu` double(111,11) NOT NULL,
  `beizhi` varchar(111) COLLATE utf8_bin NOT NULL,
  `zhuantai` int(11) NOT NULL DEFAULT '0',
  `xiaoshoufahuoID` int(111) NOT NULL,
  PRIMARY KEY (`rukuandanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of rukuandan
-- ----------------------------

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
  `shuliang` int(111) NOT NULL,
  `cangkuID` int(11) NOT NULL,
  PRIMARY KEY (`yaopingID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of yaoping
-- ----------------------------
INSERT INTO `yaoping` VALUES ('1', '1001', 'ceshi1', '单位1', '11', '10.00000000000', '供应商1', '100', '1');
INSERT INTO `yaoping` VALUES ('2', '1002', 'ceshi4', '单位2', '1', '1.00000000000', '供应商2', '100', '2');
INSERT INTO `yaoping` VALUES ('3', '1003', 'ceshi2', '单位3', '1', '1.00000000000', '供应商3', '100', '3');
INSERT INTO `yaoping` VALUES ('4', '1004', 'ceshi3', '单位4', '1', '1.00000000000', '供应商4', '100', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES ('1', 'ting', 'ting', 'ting', '0', '13527774500');

-- ----------------------------
-- Table structure for zhanghu
-- ----------------------------
DROP TABLE IF EXISTS `zhanghu`;
CREATE TABLE `zhanghu` (
  `ID` int(111) NOT NULL AUTO_INCREMENT,
  `mingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  `qianshu` double(111,11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of zhanghu
-- ----------------------------
