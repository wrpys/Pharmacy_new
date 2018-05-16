/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : pharmacy_new

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2018-05-16 16:00:34
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
  `zhuangtai` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dingdanID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of dingdan
-- ----------------------------
INSERT INTO `dingdan` VALUES ('1', '1', '6', '1.00000000000', '10', '10.00000000000', '2', '2018-04-18 12:49:16', '1', '0', '1', '1');
INSERT INTO `dingdan` VALUES ('2', '1', '6', '1.00000000000', '5', '5.00000000000', '4', '2018-04-18 12:49:49', '0', '1', '1', '1');
INSERT INTO `dingdan` VALUES ('3', '2', '6', '2.00000000000', '2', '4.00000000000', '2', '2018-04-18 13:30:06', '1', '0', '1', '0');

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
INSERT INTO `gongyingshang` VALUES ('1', '富阳市百合医药零售有限公司', '张三', '13888888888');
INSERT INTO `gongyingshang` VALUES ('2', '同春堂医药零售有限公司', '李四', '15055555555');
INSERT INTO `gongyingshang` VALUES ('3', '华东医药供应有限公司', '王五', '15085426666');
INSERT INTO `gongyingshang` VALUES ('4', '百姓药品批发', '赵六', '18988888888');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kehu
-- ----------------------------
INSERT INTO `kehu` VALUES ('1', '赵刚', '18989471085', '745104248');
INSERT INTO `kehu` VALUES ('2', '钱卫国', '18067871727', '852392586');
INSERT INTO `kehu` VALUES ('3', '孙芳', '15088763595', '102354621');
INSERT INTO `kehu` VALUES ('4', '李萍', '13058341245', '658258364');
INSERT INTO `kehu` VALUES ('5', '周军', '15023235843', '236548956');
INSERT INTO `kehu` VALUES ('6', '吴县平', '13058085698', '365965423');
INSERT INTO `kehu` VALUES ('7', '郑新', '18989471056', '102123546');
INSERT INTO `kehu` VALUES ('8', '王飞', '18055343662', '586543284');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kucun
-- ----------------------------
INSERT INTO `kucun` VALUES ('1', '6', '1', '1', '5', '2018-04-18 12:49:54', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of rizhi
-- ----------------------------
INSERT INTO `rizhi` VALUES ('1', '1', '2018-04-18 12:24:48', 'ting登录');
INSERT INTO `rizhi` VALUES ('2', '1', '2018-04-18 13:25:54', 'ting登录');
INSERT INTO `rizhi` VALUES ('3', '1', '2018-04-18 14:08:47', 'ting登录');
INSERT INTO `rizhi` VALUES ('4', '1', '2018-04-19 23:28:29', 'ting登录');

-- ----------------------------
-- Table structure for yaoping
-- ----------------------------
DROP TABLE IF EXISTS `yaoping`;
CREATE TABLE `yaoping` (
  `yaopingID` int(111) NOT NULL AUTO_INCREMENT,
  `yaopingBianhao` varchar(255) COLLATE utf8_bin NOT NULL,
  `yaopingMingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  `yaopingDanwei` varchar(111) COLLATE utf8_bin NOT NULL,
  `guige` varchar(255) COLLATE utf8_bin NOT NULL,
  `jingjia` double(111,11) NOT NULL,
  `gongyingshangMingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  `yaoxiangID` int(11) NOT NULL,
  PRIMARY KEY (`yaopingID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of yaoping
-- ----------------------------
INSERT INTO `yaoping` VALUES ('6', '1001', '快克复方氨酚烷胺胶囊', '盒', '10s', '12.00000000000', '富阳市百合医药零售有限公司', '6');
INSERT INTO `yaoping` VALUES ('7', '1002', '白云山板蓝根颗粒', '盒', '10g*20s', '13.00000000000', '同春堂医药零售有限公司', '6');
INSERT INTO `yaoping` VALUES ('8', '1003', '阿莫西林胶囊', '盒', '0.25g', '12.00000000000', '华东医药供应有限公司', '7');
INSERT INTO `yaoping` VALUES ('9', '1004', '藿香正气水', '盒', '10ml', '13.00000000000', '富阳市百合医药零售有限公司', '6');
INSERT INTO `yaoping` VALUES ('10', '1005', '六味地黄丸', '盒', '1.44g', '57.00000000000', '百姓药品批发', '3');
INSERT INTO `yaoping` VALUES ('11', '1006', '云南白药气雾剂', '盒', '85g', '49.00000000000', '华东医药供应有限公司', '1');
INSERT INTO `yaoping` VALUES ('12', '1007', '江中健胃消食片', '盒', '0.8g', '48.00000000000', '百姓药品批发', '1');
INSERT INTO `yaoping` VALUES ('13', '1008', '云南白药创可贴', '盒', '1.5cm*2.3cm', '25.00000000000', '百姓药品批发', '1');
INSERT INTO `yaoping` VALUES ('14', '1009', '感冒灵颗粒', '盒', '10g*9s', '10.00000000000', '富阳市百合医药零售有限公司', '6');
INSERT INTO `yaoping` VALUES ('15', '1010', '非洛地平缓释片', '盒', '5mg', '11.00000000000', '同春堂医药零售有限公司', '1');
INSERT INTO `yaoping` VALUES ('16', '1011', '足光散', '盒', '40g', '15.00000000000', '富阳市百合医药零售有限公司', '7');
INSERT INTO `yaoping` VALUES ('17', '1012', '医用冷敷贴', '盒', '9cm*12cm', '89.00000000000', '富阳市百合医药零售有限公司', '1');

-- ----------------------------
-- Table structure for yaoxiang
-- ----------------------------
DROP TABLE IF EXISTS `yaoxiang`;
CREATE TABLE `yaoxiang` (
  `yaoxiangID` int(111) NOT NULL AUTO_INCREMENT,
  `yaoxiangMingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`yaoxiangID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of yaoxiang
-- ----------------------------
INSERT INTO `yaoxiang` VALUES ('1', '药箱(感冒类)');
INSERT INTO `yaoxiang` VALUES ('2', '药箱(消炎类)');
INSERT INTO `yaoxiang` VALUES ('3', '药箱(滋阴补肾类)');
INSERT INTO `yaoxiang` VALUES ('4', '药箱(跌打损伤类)');
INSERT INTO `yaoxiang` VALUES ('5', '药箱(补益安神类)');
INSERT INTO `yaoxiang` VALUES ('6', '药箱(消化不良类)');
INSERT INTO `yaoxiang` VALUES ('7', '药箱(高血压类)');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of yaoxiangshezi
-- ----------------------------
INSERT INTO `yaoxiangshezi` VALUES ('1', '1', '6', '15');

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu` (
  `yonghuID` int(111) NOT NULL AUTO_INCREMENT,
  `yonghuMingzi` varchar(111) COLLATE utf8_bin NOT NULL,
  `dengluMingzi` varchar(111) COLLATE utf8_bin DEFAULT NULL,
  `miMa` varchar(111) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`yonghuID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES ('1', 'ting', 'ting', 'ting');
INSERT INTO `yonghu` VALUES ('2', 'test1', 'test1', '123456');
INSERT INTO `yonghu` VALUES ('3', '1', '1', '1');
INSERT INTO `yonghu` VALUES ('4', 'c', 'c', 'c');
