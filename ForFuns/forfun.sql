/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : forfun

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2015-12-30 13:04:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ad_address
-- ----------------------------
DROP TABLE IF EXISTS `ad_address`;
CREATE TABLE `ad_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(25) DEFAULT NULL,
  `receiver` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_91e4fevv0mvjenxivqj0jf218` (`telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ad_address
-- ----------------------------
INSERT INTO `ad_address` VALUES ('19', '2313', '142431', '214');
INSERT INTO `ad_address` VALUES ('25', 'fdasfs', '123213', 'sdfgsa');
INSERT INTO `ad_address` VALUES ('26', '孔昊', '12144', '孔昊');
INSERT INTO `ad_address` VALUES ('27', '234', '12313123', '342');
INSERT INTO `ad_address` VALUES ('29', '24534674', '1346', 'Adg');
INSERT INTO `ad_address` VALUES ('30', 'weqwe', '123123', 'eqwe');
INSERT INTO `ad_address` VALUES ('31', '324', '23', '34');
INSERT INTO `ad_address` VALUES ('33', 'Ghhg', '13666095970', 'Khh');
INSERT INTO `ad_address` VALUES ('34', 'Vhjh', '1366695970', 'Bjj');

-- ----------------------------
-- Table structure for ai_artistinfo
-- ----------------------------
DROP TABLE IF EXISTS `ai_artistinfo`;
CREATE TABLE `ai_artistinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aritstid` int(11) DEFAULT NULL,
  `paymode` varchar(255) DEFAULT NULL,
  `goodat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aritstid` (`aritstid`),
  CONSTRAINT `ARTIST` FOREIGN KEY (`aritstid`) REFERENCES `c_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ai_artistinfo
-- ----------------------------
INSERT INTO `ai_artistinfo` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for a_advert
-- ----------------------------
DROP TABLE IF EXISTS `a_advert`;
CREATE TABLE `a_advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `content` text,
  `money` int(50) DEFAULT NULL,
  `position` int(10) DEFAULT NULL,
  `timestart` date DEFAULT NULL,
  `timeout` date DEFAULT NULL,
  `situation` int(11) DEFAULT NULL,
  `isonline` int(11) DEFAULT NULL,
  `suggestion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ADVERUSERID` (`userid`),
  CONSTRAINT `ADVERUSERID` FOREIGN KEY (`userid`) REFERENCES `u_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of a_advert
-- ----------------------------
INSERT INTO `a_advert` VALUES ('1', '1', '绿松石', '绿松石：四大名玉中唯一以“石”命名的玉', 'kh', '/forfun/advertupload/1451303453703.jpg', '<span style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">藏族同胞认为绿松石是神的化身，</span><br />\r\n<span style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">是权力地位的象征，被用于第一个藏王的王冠。</span><br />\r\n<span style=\"color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">身佩绿松石不仅对身体好，且代表胜利与成功，有“成功之石”的美誉。</span><br />\r\n<br />\r\n<br />\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"499\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=d62721203d12b31bc76ccd21b6193674/59afa386c9177f3ec2a3416a74cf3bc79e3d56ad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"500\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=0fddb145b71bb0518f24b320067bda77/2fe1cd177f3e67096f97f8983fc79f3df9dc55ad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"492\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=9eb83b4cb451f819f1250342eab54a76/41707b3e6709c93dd765b3909b3df8dcd00054ad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"497\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=1bb13806fc1986184147ef8c7aec2e69/f7596309c93d70cf936d176afcdcd100bba12bad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"492\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=19fb704e8218367aad897fd51e728b68/ef6ecd3d70cf3bc73697708bd500baa1cc112aad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"495\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=52b30e4f327adab43dd01b4bbbd5b36b/415a74cf3bc79f3d52765957bea1cd11738b29ad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"495\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=2db2be2ddeb44aed594ebeec831d876a/f8a83fc79f3df8dc7aaa32f6c911728b461028ad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"491\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=9ad052e34eed2e73fce98624b700a16d/b3a09b3df8dcd100160b4546768b4710b8122fad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"494\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=771ec2ba2a738bd4c421b239918a876c/175afcdcd100baa160bbfadc4310b912c9fc2ead.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"495\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=e447a6248fd4b31cf03c94b3b7d7276f/70bbd500baa1cd11dc21cf47bd12c8fcc2ce2dad.jpg\" /><span class=\"apc_src_wrapper\" style=\"color:#999999;font-size:12px;line-height:14px;font-family:Arial, SimSun;background:url(&quot;\">图片来自：<a href=\"http://jump.bdimg.com/safecheck/index?url=x+Z5mMbGPAs6STQlwEA0OC941mwgc1i+hganh2xZUhgMoS+dNxst5v7THYeoCy+JPgl8wqttOvpGbGuJ/R7UWAfuqZVy54wZ8TFwCst5uPSxe/EosSplWvl+WOKUyIjzN9w5vKSS1w80ewa2uv0htgcgskCVC1U9rqXMsPcBlJ3uBj+MoYvIxK99QG8GnfdwROf4dUtLSiTE1bky/JbWUI+xr2D1LqsJm5DJ7YwbhtYwPGbuJnYGNA==\" target=\"_blank\">aw1518152q的百度相册</a></span>\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"494\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=81d90383b71c8701d6b6b2ee177e9e6e/5967bea1cd11728be8ba3145ccfcc3cec2fd2cad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"495\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=3b7e3b4b8301a18bf0eb1247ae2e0761/32c6c911728b471009b840abc7cec3fdfd0323ad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"500\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=02b60f56a58b87d65042ab1737092860/4576768b4710b91279564b99c7fdfc03934522ad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"500\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=35ab29dc83d6277fe912323018391f63/faec4310b912c8fc71644baaf8039245d78821ad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"500\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=12210f81237f9e2f70351d002f31e962/cf77bd12c8fcc3ce705774549645d688d53f20ad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"500\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=337caf289a2f07085f052a08d925b865/3175ccfcc3cec3fd48a91a12d288d43f869427ad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"500\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=92d5167803082838680ddc1c8898a964/409bc7cec3fdfc0327ef5edfd03f8794a5c226ad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"500\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=0333215648086e066aa83f4332097b5a/5c588394a4c27d1e69b186a31fd5ad6edcc438ad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"500\" height=\"666\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=15abc45f6a061d957d4637304bf50a5d/0ff3a0c27d1ed21bb25e9382a96eddc450da3fad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</div>\r\n<br />\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"413\" height=\"548\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=a23f822c06087bf47dec57e1c2d2575e/5a7c0af41bd5ad6e626ed98d85cb39dbb7fd3cad.jpg\" />\r\n</div>\r\n<div class=\"pic_src_wrapper\" style=\"margin:0px;padding:0px;color:#333333;font-family:\'Helvetica Neue\', Helvetica, Arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img class=\"BDE_Image\" width=\"416\" height=\"546\" src=\"http://imgsrc.baidu.com/forum/w%3D580/sign=cad18a5f7ff40ad115e4c7eb672d1151/86931fd5ad6eddc49170099c3ddbb6fd536633ad.jpg\" />\r\n</div>', '1222', '0', '2015-12-28', '2015-12-31', '1', '1', '');
INSERT INTO `a_advert` VALUES ('2', '1', '推荐一组用铅笔做的艺术品', '推荐一组用铅笔做的艺术品', '123', '/forfun/advertupload/1451303818482.jpg', '<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img src=\"http://www.my7475.com/wp-content/uploads/2008/05/my747508051201.jpg\" alt=\"铅笔艺术品,刺雕塑\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	这是一位女性艺术家Maestre的刺雕塑作品，她把彩色铅笔用胶水粘在一起，组成的各种有趣的艺术品，它们当中有些行星是动物和植物，也有象埃及面具这样的东西，但艺术家更注重的不是形似，而是神似。下面大家可以猜猜这些艺术品分别表示的是什么？\r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img src=\"http://www.my7475.com/wp-content/uploads/2008/05/my747508051202.jpg\" alt=\"铅笔艺术品,刺雕塑\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img src=\"http://www.my7475.com/wp-content/uploads/2008/05/my747508051203.jpg\" alt=\"铅笔艺术品,刺雕塑\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img src=\"http://www.my7475.com/wp-content/uploads/2008/05/my747508051204.jpg\" alt=\"铅笔艺术品,刺雕塑\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img src=\"http://www.my7475.com/wp-content/uploads/2008/05/my747508051205.jpg\" alt=\"铅笔艺术品,刺雕塑\" style=\"height:auto;\" /> \r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img src=\"http://www.my7475.com/wp-content/uploads/2008/05/my747508051206.jpg\" alt=\"铅笔艺术品,刺雕塑\" style=\"height:auto;\" /> \r\n</p>', '2600', '0', '2015-12-28', '2015-12-28', '1', '0', '');
INSERT INTO `a_advert` VALUES ('3', '1', '艺术家Jeffro Uitto 的木雕艺术作品欣赏', '艺术家Jeffro Uitto 的木雕艺术作品欣赏', 'kh', '/forfun/advertupload/1451303807305.jpg', '<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img class=\"alignnone size-full wp-image-27170\" title=\"艺术家Jeffro Uitto 的木雕艺术作品欣赏\" src=\"http://www.my7475.com/wp-content/uploads/2013/07/my747513070501.jpg\" alt=\"Jeffro Uitto,木雕,艺术\" width=\"550\" height=\"477\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	年轻的艺术家Jeffro Uitto 利用在华盛顿海岸边捡拾的漂流木、树枝和树根打造出一系列震撼人心的木雕艺术作品。\r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img class=\"alignnone size-full wp-image-27170\" title=\"艺术家Jeffro Uitto 的木雕艺术作品欣赏\" src=\"http://www.my7475.com/wp-content/uploads/2013/07/my747513070502.jpg\" alt=\"Jeffro Uitto,木雕,艺术\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img class=\"alignnone size-full wp-image-27170\" title=\"艺术家Jeffro Uitto 的木雕艺术作品欣赏\" src=\"http://www.my7475.com/wp-content/uploads/2013/07/my747513070503.jpg\" alt=\"Jeffro Uitto,木雕,艺术\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img class=\"alignnone size-full wp-image-27170\" title=\"艺术家Jeffro Uitto 的木雕艺术作品欣赏\" src=\"http://www.my7475.com/wp-content/uploads/2013/07/my747513070504.jpg\" alt=\"Jeffro Uitto,木雕,艺术\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img class=\"alignnone size-full wp-image-27170\" title=\"艺术家Jeffro Uitto 的木雕艺术作品欣赏\" src=\"http://www.my7475.com/wp-content/uploads/2013/07/my747513070505.jpg\" alt=\"Jeffro Uitto,木雕,艺术\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img class=\"alignnone size-full wp-image-27170\" title=\"艺术家Jeffro Uitto 的木雕艺术作品欣赏\" src=\"http://www.my7475.com/wp-content/uploads/2013/07/my747513070506.jpg\" alt=\"Jeffro Uitto,木雕,艺术\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img class=\"alignnone size-full wp-image-27170\" title=\"艺术家Jeffro Uitto 的木雕艺术作品欣赏\" src=\"http://www.my7475.com/wp-content/uploads/2013/07/my747513070507.jpg\" alt=\"Jeffro Uitto,木雕,艺术\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img class=\"alignnone size-full wp-image-27170\" title=\"艺术家Jeffro Uitto 的木雕艺术作品欣赏\" src=\"http://www.my7475.com/wp-content/uploads/2013/07/my747513070508.jpg\" alt=\"Jeffro Uitto,木雕,艺术\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;vertical-align:baseline;color:#444444;font-family:\'Open Sans\';background-color:#FFFFFF;\">\r\n	<img class=\"alignnone size-full wp-image-27170\" title=\"艺术家Jeffro Uitto 的木雕艺术作品欣赏\" src=\"http://www.my7475.com/wp-content/uploads/2013/07/my747513070509.jpg\" alt=\"Jeffro Uitto,木雕,艺术\" style=\"height:auto;\" />\r\n</p>', '999', '0', '2015-12-28', '2015-12-31', '1', '1', '');
INSERT INTO `a_advert` VALUES ('4', '1', '中国艺术品推荐名家：曹大瑞', '中国艺术品推荐名家：曹大瑞', 'kh', '/forfun/advertupload/1451303999398.jpg', '<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<strong><span style=\"font-size:20px;line-height:30px;font-family:黑体;\">曹大瑞简介</span></strong>\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	曹大瑞又名曹溥原，号老溥。1969年生，祖籍山东曹县。现为国家一级美术师，民革中央画院理事，中国国画家协会常务理事。现居北京。\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	20世纪80年代初承母亲的教诲学习书法、篆刻、诗文，并得到朱子兴先生亲炙。1996年始主攻花鸟画，曾访学于中国美术家协会中国画高研班、天津美术学院、中国国家画院、中国艺术研究院高研班等，得孙克、陈绶祥、梅墨生等先生指导。喜作水墨大写意荷花，兼作玉兰、鸡冠花、牡丹、梅花、芭蕉、藤蔓及各类杂卉、鸟虫。\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<img src=\"file://C:/Users/Christy/Desktop/%E4%B8%AD%E5%9B%BD%E8%89%BA%E6%9C%AF%E5%93%81%E6%8E%A8%E8%8D%90%E5%90%8D%E5%AE%B6%EF%BC%9A%E6%9B%B9%E5%A4%A7%E7%91%9E_files/58624202_3\" />\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	作品多次参加全国各类大型展览、全国历届中国画展，曾获首届电视中国画大赛获铜奖。2004年应邀为澳门特别行政区回归祖国五周年创作巨幅水墨《盛世莲花》。代表作品有《百荷图卷》《爱莲说》《悠然南山》《一花一世界》等系列。主编有大型画集《当代画坛》（河南美术出版社，1997年）、《三人行——全国巡回画展》（担任展览学术主持，2007年）。出版有《〈中国书画〉推荐书画名家专辑·曹大瑞卷》《曹大瑞花鸟画》《曹大瑞画集》《曹大瑞书画篆刻作品集》等专集六种、合集数种。事迹编入多部辞书典籍，多次举办个人画展。作品被国家机关、专业艺术机构和海内外人士广泛收藏，被CCTV-10以及各大专业媒体推介报道。\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<img src=\"file://C:/Users/Christy/Desktop/%E4%B8%AD%E5%9B%BD%E8%89%BA%E6%9C%AF%E5%93%81%E6%8E%A8%E8%8D%90%E5%90%8D%E5%AE%B6%EF%BC%9A%E6%9B%B9%E5%A4%A7%E7%91%9E_files/58624202_4\" />\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<img src=\"file://C:/Users/Christy/Desktop/%E4%B8%AD%E5%9B%BD%E8%89%BA%E6%9C%AF%E5%93%81%E6%8E%A8%E8%8D%90%E5%90%8D%E5%AE%B6%EF%BC%9A%E6%9B%B9%E5%A4%A7%E7%91%9E_files/58624202_5\" />\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<img src=\"file://C:/Users/Christy/Desktop/%E4%B8%AD%E5%9B%BD%E8%89%BA%E6%9C%AF%E5%93%81%E6%8E%A8%E8%8D%90%E5%90%8D%E5%AE%B6%EF%BC%9A%E6%9B%B9%E5%A4%A7%E7%91%9E_files/58624202_6\" />\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<img src=\"file://C:/Users/Christy/Desktop/%E4%B8%AD%E5%9B%BD%E8%89%BA%E6%9C%AF%E5%93%81%E6%8E%A8%E8%8D%90%E5%90%8D%E5%AE%B6%EF%BC%9A%E6%9B%B9%E5%A4%A7%E7%91%9E_files/58624202_7\" />\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<img src=\"file://C:/Users/Christy/Desktop/%E4%B8%AD%E5%9B%BD%E8%89%BA%E6%9C%AF%E5%93%81%E6%8E%A8%E8%8D%90%E5%90%8D%E5%AE%B6%EF%BC%9A%E6%9B%B9%E5%A4%A7%E7%91%9E_files/58624202_8\" />\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;font-weight:bold;\">艺术评语：</span>\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;font-weight:bold;\">空濛离幻之美</span>\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;\">王仲</span>\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;\">与青年画家曹大瑞的接触小有几次，他不太讲话也不积极于活动，作品我见的实不为多。直到不久前他示的一系列近作于我，始觉得他于画于禅确实有些研究。水墨一批，荷花居多，实在有些创意。</span>\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;\">中国艺术是建立在传统哲学观和意识形态下的文化现象，本身是开放的，是“仁者见仁，智者见智”的，是虚实论、是有无论、是对立而统一的矛盾论、是道生一而生万物论。好的美术作品看着要舒服，要自然，要有人情味儿，优劣的标准来自于欣赏者自身的趣味,历来没有那么唯一和绝对性。禅宗的老境、无等等境也成为最为体现人之审美情感的丰富性、自我和真率性的一种科学。在其画中我稍微读到了一点这样的思想。</span>\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;\">曹大瑞谈及他的画是由书法、篆刻而后转入自学绘画的，是禅外副业。白石老人也没有受过专门美育教育，也能画好画儿。现在求得一种平静的心境已属不易了，我们想将艺术是一个什么样的味儿一探究竟，看来还需要多观多悟，增加学养。“画事须有高尚之品德，宏远之抱负，超然之卓识，厚重渊博之学问，广阔深入之生活，然后能登峰造极”，这是潘天寿先生谈到的心得，要“有至刚、至大、至中、至正之气蕴蓄于胸中”，都是讲的学养，没有这些是难以进入堂奥的。</span>\r\n</p>\r\n<p style=\"color:#444444;font-family:Arial, Helvetica, sans-serif;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;\">宗白华所谓视之不见，听之不闻，搏之不得的“道”，在一花一鸟、一木一石上都负荷着无限的深意，无边的深情。曹大瑞的作品可以给你水月空花般的空濛离幻之美，他构造的这些富有真意的灵性画幅可令人顿入一种空灵、幽静、清寂、淡远的和平通禅之境。但那离幻时远时近，有如我脑海中的古人—陶元亮、王维、刘禹锡、柳宗元、董其昌或八大、石涛给你的诗意，其质清也、其美丽也、其意寒也、其景新也、其境远也。他清凉的内心深处有一轮空幽的明月朗照着，相信他的艺术坚持一定是对头的，他在自己的田园中会生活的惬意而陶醉……</span>\r\n</p>\r\n<br />', '999', '2', '2015-12-28', '2015-12-31', '1', '1', '');
INSERT INTO `a_advert` VALUES ('5', '1', '艺术家介绍：王书杰', '艺术家介绍：王书杰', 'kh', '/forfun/advertupload/1451304231545.jpg', '<div class=\"jx\" style=\"padding:0px;margin:0px;font-size:16px;font-weight:bold;color:#292929;font-family:Simsun;background-color:#FFFFFF;\">\r\n	王书杰\r\n</div>\r\n<p style=\"font-size:14px;color:#292929;font-family:Simsun;background-color:#FFFFFF;\">\r\n	王书杰 男 1957年11月25日生于北京， 1988年毕业于北京广播电视大学中文系，1998年中央美术学院中国画系助教研究生班结业 中央美术学院继续教育学院院长 中央美术学院燕郊分院院长 中国美术家协会会员 中国美术家协会综合绘画与美术作品保存修复艺委会秘书长 中国建筑学会会员 北京大学贾又福研究会副会长\r\n</p>\r\n<p style=\"font-size:14px;color:#292929;font-family:Simsun;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;color:#292929;font-family:Simsun;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.ljlhk.com/uploadfile/201473153150965.jpg\" alt=\"春风\" />\r\n</p>\r\n<p style=\"font-size:14px;color:#292929;font-family:Simsun;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.ljlhk.com/uploadfile/201473153035848.jpg\" alt=\"烟江叠嶂图\" />\r\n</p>', '999', '2', '2015-12-28', '2015-12-31', '1', '1', '');
INSERT INTO `a_advert` VALUES ('6', '1', '艺术家介绍： 姜宝林', '艺术家介绍： 姜宝林', 'kh', '/forfun/advertupload/1451304288713.jpg', '<div class=\"jx\" style=\"padding:0px;margin:0px;font-size:16px;font-weight:bold;color:#292929;font-family:Simsun;background-color:#FFFFFF;\">\r\n	姜宝林\r\n</div>\r\n<p style=\"font-size:14px;color:#292929;font-family:Simsun;background-color:#FFFFFF;\">\r\n	姜宝林 山东平度人，1942年出生于蓬莱。 1967年毕业于浙江美术学院。师从顾坤伯、陆俨少、陆维钊。 1979年考入中央美术学院山水研究班，是李可染的研究生。 姜宝林现为浙江画院艺委会委员，国家一级美术师；清华大学美术学院特聘博士生指导教授；中央美术学院各座教授；李可染艺术基金会艺委会委员；中国美协会员；享受国务院政府特殊津贴。 专山水、擅花卉大写，原创白描现代山水。\r\n</p>\r\n<p style=\"font-size:14px;color:#292929;font-family:Simsun;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"font-size:14px;color:#292929;font-family:Simsun;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.ljlhk.com/uploadfile/201475133449215.jpg\" alt=\"高秋\" />\r\n</p>\r\n<p style=\"font-size:14px;color:#292929;font-family:Simsun;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.ljlhk.com/uploadfile/201475132615670.jpg\" alt=\"秋风又向小园吹\" />\r\n</p>', '666', '2', '2015-12-23', '2015-12-31', '1', '1', '');

-- ----------------------------
-- Table structure for ca_customeraddress
-- ----------------------------
DROP TABLE IF EXISTS `ca_customeraddress`;
CREATE TABLE `ca_customeraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `addressid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h0pmehbqpyo6xx8502pxp5dtt` (`addressid`),
  KEY `FK_br5o5lrnj7lipy82cqw31q4iy` (`customerid`),
  CONSTRAINT `FK_br5o5lrnj7lipy82cqw31q4iy` FOREIGN KEY (`customerid`) REFERENCES `c_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_h0pmehbqpyo6xx8502pxp5dtt` FOREIGN KEY (`addressid`) REFERENCES `ad_address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ca_customeraddress
-- ----------------------------
INSERT INTO `ca_customeraddress` VALUES ('19', '1', '19');
INSERT INTO `ca_customeraddress` VALUES ('25', '8', '25');
INSERT INTO `ca_customeraddress` VALUES ('26', '8', '26');
INSERT INTO `ca_customeraddress` VALUES ('27', '8', '27');
INSERT INTO `ca_customeraddress` VALUES ('29', '13', '29');
INSERT INTO `ca_customeraddress` VALUES ('30', '12', '30');
INSERT INTO `ca_customeraddress` VALUES ('31', '12', '31');
INSERT INTO `ca_customeraddress` VALUES ('33', '6', '33');
INSERT INTO `ca_customeraddress` VALUES ('34', '14', '34');

-- ----------------------------
-- Table structure for c_customer
-- ----------------------------
DROP TABLE IF EXISTS `c_customer`;
CREATE TABLE `c_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) CHARACTER SET utf8 NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 NOT NULL,
  `personnumber` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `telphone` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `realname` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `avator` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `isartist` int(11) DEFAULT NULL,
  `balance` double(255,0) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of c_customer
-- ----------------------------
INSERT INTO `c_customer` VALUES ('1', 'gy', 'christy', '123456', '3506811111111', '11111', 'gy', '/forfun/avatorupload/1450781848430.jpg', '1', '12453');
INSERT INTO `c_customer` VALUES ('2', '2', '1233', '123456', '12', '12', '12', '/forfun/avatorupload/1450781848430.jpg', '1', '246');
INSERT INTO `c_customer` VALUES ('3', '12212', '12', '213', '213', '13', '131', '/forfun/avatorupload/1450781848430.jpg', '1', '1');
INSERT INTO `c_customer` VALUES ('4', 'admin', 'admin', 'admin', '350681199401061088', '110', '系统管理员', '/forfun/image/293.jpg', '0', '423');
INSERT INTO `c_customer` VALUES ('5', 'mhzx20', 'kh', '6550996', '32108819951117001X', '13666095971', 'kh', '/forfun/avatorupload/1451318350758.jpeg', '1', '99999');
INSERT INTO `c_customer` VALUES ('6', 'slig', '孔锄地', '121', '354444444444444444', '11144447777', '你大爷', '/forfun/avatorupload/1451218628588.jpg', '1', '30000000000112223000000');
INSERT INTO `c_customer` VALUES ('7', 'gy121', '12', '234', '350681199401061066', '123456789', '12', '/forfun/image/293.jpg', '1', '0');
INSERT INTO `c_customer` VALUES ('8', 'tt', 'tttqq', '123', '350681199401061066', '123456789', 'tt', '/forfun/avatorupload/1451231781495.jpg', '1', '2667');
INSERT INTO `c_customer` VALUES ('9', 'aaa12123', '222', '123', '123123122222222232', '12323231234', '122', '/forfun/image/293.jpg', '0', '0');
INSERT INTO `c_customer` VALUES ('10', 'aawe', 'a22', '123', '123123123123231231', '12312331222', '31dd', '/forfun/image/293.jpg', '0', '0');
INSERT INTO `c_customer` VALUES ('11', 'aaa', 'a', 'aaa', '123123122222222232', '12312331222', 'ww', '/forfun/image/293.jpg', '0', '0');
INSERT INTO `c_customer` VALUES ('12', 'xiangning', 'lxn', '123', '123123234523231234', '12345674567', 'lxnlll', '/forfun/image/293.jpg', '1', '0');
INSERT INTO `c_customer` VALUES ('13', 'Xnnnn', '你猜', '123', '232243255218587458', '12356457885', '美少女', '/forfun/avatorupload/1451294409600.jpg', '1', '100');
INSERT INTO `c_customer` VALUES ('14', 'mhzx10', 'Kh', '123456', '32108819951117001X', '12666095970', 'Kh', '/forfun/image/293.jpg', '1', '999099');

-- ----------------------------
-- Table structure for ea_examineartist
-- ----------------------------
DROP TABLE IF EXISTS `ea_examineartist`;
CREATE TABLE `ea_examineartist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `telphone` varchar(30) DEFAULT NULL,
  `personnumber` varchar(50) DEFAULT NULL,
  `paymode` varchar(255) DEFAULT NULL,
  `goodat` varchar(255) DEFAULT NULL,
  `suggestion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EXUSERID` (`userid`),
  CONSTRAINT `EXUSERID` FOREIGN KEY (`userid`) REFERENCES `c_customer` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ea_examineartist
-- ----------------------------
INSERT INTO `ea_examineartist` VALUES ('1', 'gy', '1', '1', '1', '1', '1', '1');
INSERT INTO `ea_examineartist` VALUES ('2', '2', '12', '11111111111', '111111111111111111', 'adsfds', 'asdf', '1');
INSERT INTO `ea_examineartist` VALUES ('3', 'tt', 'tt', '123456789', '350681199401061066', '464646546', '12313', '1');
INSERT INTO `ea_examineartist` VALUES ('4', 'xiangning', 'lxnlll', '12345674567', '123123234523231234', '12312331233', '232', '1');
INSERT INTO `ea_examineartist` VALUES ('5', 'Xnnnn', '美少女', '12356457885', '232243255218587458', '12464436654', '记笔记了', '1');
INSERT INTO `ea_examineartist` VALUES ('6', 'mhzx10', 'Kh', '12666095970', '32108819951117001X', 'Fjhffjjv', 'Hiatus', '1');

-- ----------------------------
-- Table structure for f_function
-- ----------------------------
DROP TABLE IF EXISTS `f_function`;
CREATE TABLE `f_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(50) DEFAULT NULL,
  `functionlink` varchar(100) DEFAULT NULL,
  `istopmenu` int(11) DEFAULT NULL,
  `topmenu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of f_function
-- ----------------------------
INSERT INTO `f_function` VALUES ('1', '系统管理', null, '1', null);
INSERT INTO `f_function` VALUES ('2', '用户管理', './ManageUser.jsp', '0', '1');
INSERT INTO `f_function` VALUES ('3', '角色管理', './ManageRole.jsp', '0', '1');
INSERT INTO `f_function` VALUES ('4', '用户角色管理', './ManageUserRole.jsp', '0', '1');
INSERT INTO `f_function` VALUES ('5', '菜单管理', './ManageFunction.jsp', '0', '1');
INSERT INTO `f_function` VALUES ('6', '权限管理', './ManagePower.jsp', '0', '1');
INSERT INTO `f_function` VALUES ('7', '客户管理', null, '1', null);
INSERT INTO `f_function` VALUES ('8', '客户管理', './ManageCustomer.jsp', '0', '7');
INSERT INTO `f_function` VALUES ('9', '客户地址管理', './ManageAddress.jsp', '0', '7');
INSERT INTO `f_function` VALUES ('10', '艺术家管理', './ManageArtist.jsp', '0', '7');
INSERT INTO `f_function` VALUES ('11', '艺术家审核', './ManageExamineArtist.jsp', '0', '7');
INSERT INTO `f_function` VALUES ('12', '资讯发布', null, '1', null);
INSERT INTO `f_function` VALUES ('13', '发布资讯', './AddNews.jsp', '0', '12');
INSERT INTO `f_function` VALUES ('14', '查看资讯', './WatchNews.jsp', '0', '12');
INSERT INTO `f_function` VALUES ('15', '资讯管理', null, '1', null);
INSERT INTO `f_function` VALUES ('16', '审核资讯', './ManageNews.jsp', '0', '15');
INSERT INTO `f_function` VALUES ('17', '广告发布', null, '1', null);
INSERT INTO `f_function` VALUES ('18', '发布广告', './AddAdvert.jsp', '0', '17');
INSERT INTO `f_function` VALUES ('19', '查看广告', './WatchAdvert.jsp', '0', '17');
INSERT INTO `f_function` VALUES ('20', '广告管理', './ManageAdvert.jsp', '1', null);
INSERT INTO `f_function` VALUES ('21', '审核广告', '\"./ManageAdvert.jsp\"', '0', '20');
INSERT INTO `f_function` VALUES ('22', '商品管理', null, '1', null);
INSERT INTO `f_function` VALUES ('23', '商品管理', './ManageProduct.jsp', '0', '22');
INSERT INTO `f_function` VALUES ('24', '商品类别管理', './ManageProductType.jsp', '0', '22');
INSERT INTO `f_function` VALUES ('25', '订单管理', './ManageOrder.jsp', '0', '22');

-- ----------------------------
-- Table structure for m_message
-- ----------------------------
DROP TABLE IF EXISTS `m_message`;
CREATE TABLE `m_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromid` int(11) DEFAULT NULL,
  `toid` int(11) DEFAULT NULL,
  `message` text,
  `current` datetime DEFAULT NULL,
  `isread` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fdblrv579vjxw47ivyxi57orl` (`fromid`),
  KEY `FK_e355tkrguo7feiycq7xognthk` (`toid`),
  CONSTRAINT `FK_e355tkrguo7feiycq7xognthk` FOREIGN KEY (`toid`) REFERENCES `c_customer` (`id`),
  CONSTRAINT `FK_fdblrv579vjxw47ivyxi57orl` FOREIGN KEY (`fromid`) REFERENCES `c_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_message
-- ----------------------------
INSERT INTO `m_message` VALUES ('1', '1', '8', '哈哈哈', '2015-12-27 23:30:18', '1');
INSERT INTO `m_message` VALUES ('2', '1', '8', '66666666', '2015-12-27 23:31:09', '1');
INSERT INTO `m_message` VALUES ('3', '2', '8', 'qqqq', '2015-12-27 23:31:32', '1');
INSERT INTO `m_message` VALUES ('4', '3', '8', 'qwweeq', '2015-12-27 23:32:39', '1');
INSERT INTO `m_message` VALUES ('25', '2', '1', '<img src=\"/forfun/newsupload/1450447015339.jpg\" alt=\"\" />哈哈哈', '2015-12-18 21:04:47', '1');
INSERT INTO `m_message` VALUES ('26', '3', '1', 'ggg', '2015-12-18 21:52:53', '1');
INSERT INTO `m_message` VALUES ('27', '1', '3', 'jhhh', '2015-12-18 21:53:31', '0');
INSERT INTO `m_message` VALUES ('28', '1', '3', '<img src=\"/forfun/newsupload/1450447015339.jpg\" alt=\"\" />哈哈哈', '2015-12-18 21:56:59', '0');
INSERT INTO `m_message` VALUES ('29', '1', '2', 'asd', '2015-12-22 21:25:02', '1');
INSERT INTO `m_message` VALUES ('30', '1', '2', '护手霜', '2015-12-24 22:02:47', '1');
INSERT INTO `m_message` VALUES ('35', '8', '1', 'fasdad', '2015-12-28 05:51:21', '0');
INSERT INTO `m_message` VALUES ('36', '8', '1', 'sdada', '2015-12-28 05:51:25', '0');
INSERT INTO `m_message` VALUES ('37', '4', '12', '尊敬的lxn，您好，非常感谢您申请成为本站的艺术家，您的申请信息非常具有竞争力，我站决定录用您成为本站的艺术合作伙伴，请尽快完善您的艺术家主页，以便向客户展示您的作品并获得收益。再次感谢您对我公司的信任，祝您未来一切顺利！', '2015-12-28 07:50:46', '1');
INSERT INTO `m_message` VALUES ('38', '12', '1', '十大', '2015-12-28 16:35:16', '1');
INSERT INTO `m_message` VALUES ('39', '12', '1', '打死打死', '2015-12-28 16:35:18', '1');
INSERT INTO `m_message` VALUES ('40', '12', '1', '123123', '2015-12-28 16:38:09', '1');
INSERT INTO `m_message` VALUES ('41', '12', '1', '嗯嗯嗯<img src=\"http://localhost:8080/forfun/kindeditor/plugins/emoticons/images/31.gif\" border=\"0\" alt=\"\" />', '2015-12-28 16:38:14', '1');
INSERT INTO `m_message` VALUES ('42', '1', '12', '哈哈哈哈哈', '2015-12-28 16:42:09', '1');
INSERT INTO `m_message` VALUES ('43', '1', '12', '<img src=\"http://59.77.13.250:8080/forfun/kindeditor/plugins/emoticons/images/11.gif\" border=\"0\" alt=\"\" />', '2015-12-28 16:42:39', '1');
INSERT INTO `m_message` VALUES ('44', '12', '1', '<img src=\"http://localhost:8080/forfun/kindeditor/plugins/emoticons/images/43.gif\" border=\"0\" alt=\"\" />', '2015-12-28 16:42:42', '1');
INSERT INTO `m_message` VALUES ('45', '1', '12', '<p>\n	hhhh\n</p>\n<p>\n	<br />\n</p>', '2015-12-28 16:43:57', '1');
INSERT INTO `m_message` VALUES ('46', '12', '1', '<img src=\"http://localhost:8080/forfun/kindeditor/plugins/emoticons/images/39.gif\" border=\"0\" alt=\"\" />', '2015-12-28 16:44:01', '1');
INSERT INTO `m_message` VALUES ('47', '1', '12', '<img src=\"http://59.77.13.250:8080/forfun/kindeditor/plugins/emoticons/images/18.gif\" border=\"0\" alt=\"\" />', '2015-12-28 16:44:14', '1');
INSERT INTO `m_message` VALUES ('48', '1', '12', '你好', '2015-12-28 16:44:41', '1');
INSERT INTO `m_message` VALUES ('49', '4', '13', '尊敬的你猜，您好，非常感谢您申请成为本站的艺术家，您的申请信息非常具有竞争力，我站决定录用您成为本站的艺术合作伙伴，请尽快完善您的艺术家主页，以便向客户展示您的作品并获得收益。再次感谢您对我公司的信任，祝您未来一切顺利！', '2015-12-28 17:26:33', '1');
INSERT INTO `m_message` VALUES ('50', '5', '13', '<img src=\"http://59.77.13.250:8080/forfun/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />', '2015-12-28 17:53:22', '1');
INSERT INTO `m_message` VALUES ('51', '13', '5', '<img src=\"http://59.77.13.250:8080/forfun/kindeditor/plugins/emoticons/images/39.gif\" border=\"0\" alt=\"\" />', '2015-12-28 17:53:42', '1');
INSERT INTO `m_message` VALUES ('149', '4', '14', '尊敬的Kh，您好，非常感谢您申请成为本站的艺术家，您的申请信息非常具有竞争力，我站决定录用您成为本站的艺术合作伙伴，请尽快完善您的艺术家主页，以便向客户展示您的作品并获得收益。再次感谢您对我公司的信任，祝您未来一切顺利！', '2015-12-29 00:01:35', '1');
INSERT INTO `m_message` VALUES ('150', '14', '5', 'Hhhhjjj', '2015-12-29 00:03:11', '1');
INSERT INTO `m_message` VALUES ('151', '14', '5', '', '2015-12-29 00:03:12', '1');
INSERT INTO `m_message` VALUES ('152', '14', '5', 'Hjjjjjj', '2015-12-29 00:03:19', '1');
INSERT INTO `m_message` VALUES ('153', '5', '14', 'Hdhdh', '2015-12-29 00:03:25', '1');
INSERT INTO `m_message` VALUES ('154', '8', '14', '也一样', '2015-12-29 00:03:50', '1');
INSERT INTO `m_message` VALUES ('155', '14', '8', 'Hhhhhuh', '2015-12-29 00:04:03', '1');
INSERT INTO `m_message` VALUES ('156', '8', '14', '哈哈哈', '2015-12-29 00:04:20', '1');
INSERT INTO `m_message` VALUES ('157', '14', '8', 'Hhhjjjjj', '2015-12-29 00:04:22', '1');

-- ----------------------------
-- Table structure for n_news
-- ----------------------------
DROP TABLE IF EXISTS `n_news`;
CREATE TABLE `n_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `content` text,
  `money` int(50) DEFAULT NULL,
  `ishot` int(10) DEFAULT '0',
  `timestart` date DEFAULT NULL,
  `timeout` date DEFAULT NULL,
  `situation` int(11) DEFAULT '0',
  `suggestion` text,
  `isonline` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `NUSERID` (`userid`),
  KEY `FK_i1gms26iheicj5aollprcpag0` (`id`),
  CONSTRAINT `NUSERID` FOREIGN KEY (`userid`) REFERENCES `u_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of n_news
-- ----------------------------
INSERT INTO `n_news` VALUES ('11', '1', '佳士得的香港艺术拍卖展感受到了中国经济寒意', '持续放缓的中国经济，政府的反腐措施以及投机者的撤离令艺术品拍卖市场遇冷。', '23', '/forfun/newsupload/1451303025837.jpg', '<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/transform/20151201/AVym-fxmaznc5814147.jpg\" alt=\"佳士得拍卖会现场。图片来源：网络\" style=\"border:1px solid #000000;\" /> \r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">佳士得拍卖会现场。图片来源：网络</span> \r\n</p>\r\n<p class=\"p1\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	持续放缓的中国经济，政府的反腐措施以及投机者的撤离令艺术品拍卖市场遇冷。11月28日，香港佳士得举办“亚洲二十世纪及当代艺术”夜场拍卖，但销售业绩不尽理想。\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	在“亚洲二十世纪及当代艺术”拍卖会上，佳士得一共售出了价值5.08亿港币（约合 4.19亿元人民币）的藏品，与以往的成交额相比，这个数字显得十分苍白。一年前的香港秋拍，佳士得卖出了价值6.36亿港币（约合5.24亿元人民币） 的艺术品，而在两年前，秋拍的总成交额甚至能够达到9.35亿港币（约合7.71亿元人民币）。在为期六天的香港秋拍马拉松中，周六的销售一向被视为是整 场拍卖会的“重头戏”。\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/crawl/20151201/Uuvc-fxmaznc5814078.jpg\" alt=\"\" style=\"border:1px solid #E7E7E7;\" /> \r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">佳士得今年的香港秋拍业绩不佳。图片来源：网络</span> \r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	对此，香港弗米利恩艺术咨询公司（Vermillion Art Collections）的总监朱沛宗（Jehan Chu）表示：“本季秋拍的业绩有所下降，这是肯定的。艺术品的拍卖具有很大的不确定性，而中国的经济和社会发展前景已经令人们感到忧心忡忡。”\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	经济放缓也反映出了购买模式的转换，富有的中国买家们越来越对西方艺术品“情有独钟”， 纽约和欧洲的拍卖会现场都出现了他们豪掷千金的身影。举例来说，在11月10日的纽约佳士得拍卖会上，来自中国的亿万富翁刘益谦以1.7亿美元（约合 10.8亿元人民币）的价格拍得莫迪利亚尼的名画《斜卧的裸女》，这一数字是香港秋拍总成交额的三倍。\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/crawl/20151201/7ZS6-fxmcnkr7713384.jpg\" alt=\"\" style=\"border:1px solid #E7E7E7;\" /> \r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">意大利画家莫迪利亚尼的名画《斜卧的裸女》被拍出10.8亿人民币的“天价”。图片来源：网络</span> \r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	用美国运通百夫长卡（俗称黑卡）买下该艺术品的刘益谦，获得了能在全世界飞来飞去的免费 里程。据刘的女儿Betty透露，在专为VIP客户而设的香港拍卖会预展上，刘益谦也曾到场观赏，但是否要“出手”还尚未确定。佳士得香港秋拍于11月 27日正式启动，当天所拍卖的物品以高档红酒为主，拍卖会将于12月2日落下帷幕，届时中国艺术品及各式瓷器也将参与拍卖。整个拍卖会将售出包括亚洲艺术 品、当代水墨艺术品、珠宝首饰、钟表、酒、家具和女式手提包在内的诸多藏品。\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/crawl/20151201/PujG-fxmcnkr7713386.jpg\" alt=\"\" style=\"border:1px solid #E7E7E7;\" /> \r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">亿万富翁刘益谦近来在艺术品拍卖市场上动作频频。图片来源：网络</span> \r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	佳士得亚太地区主席高逸龙（François Curiel）表示，尽管中国经济增长放缓，但本月的日内瓦珠宝销售和纽约的现代艺术品销售还是彰显出了中国购买力的强势“回归”。佳士得香港秋拍马拉松 启动之前，高逸龙向媒体透露：“在纽约和日内瓦的艺术市场上，31.8%的销售额来自于亚洲，而其中又有一大部分都来自于中国。”\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	欧美市场的销售数字如此喜人，和这两桩生意的达成不无关联：11月11日，香港富豪刘銮 雄以4860万瑞士法郎（约合3.08亿元人民币）的价格在苏富比拍下了一颗稀世蓝钻，创下了全球珠宝拍卖的价格新高。而仅仅在一天前，他刚刚在佳士得拍 下了一颗价值2870万瑞士法郎（约合1.82亿元人民币）的粉钻。\r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/crawl/20151201/e-2N-fxmcnkr7713388.jpg\" alt=\"\" style=\"border:1px solid #E7E7E7;\" /> \r\n</p>\r\n<p style=\"text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">香港富豪刘銮雄。图片来源：网络</span> \r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	本次佳士得夜场拍卖的亮点是一幅20世纪的绘画作品，法籍华裔画家常玉的《黄桌上的菊花瓶》以4604万港币（约合3797万元人民币）的价格被出售给了一位电话竞拍者，这个价格比佳士得当初所估计的1500万港币高出了三倍。\r\n</p>\r\n<p class=\"p2\" style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	在11月27日和28日两天，佳士得还售出了价值7100万港币（约合5850万元人民币）的珍稀佳酿，其中的“标王”是一个“名酒12件套”，它包含了1988年的罗曼尼·康帝和勃艮第夜丘的特级葡萄酒。该“12件套”的售出价格为104万港币（约合86万元人民币）。\r\n</p>', '23', '1', '2015-12-02', '2015-12-31', '1', '', '1');
INSERT INTO `n_news` VALUES ('13', '1', '北京经纬艺术馆举办张兴国中国画展', '北京经纬艺术馆举办张兴国中国画展', '231', '/forfun/newsupload/1451303051702.jpg', '<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2015年11月21日北京经纬艺术馆开馆庆典暨“崖壁上的意象”张兴国中国画作品展开展仪式在北京市朝阳区鸿华家园举行。国家画院常务副院长卢禹舜先生，山东艺术学院院长、山东美协主席张志民先生，以及著名画家富中奇先生、郭正英先生、王光明先生等出席了开幕式。出席本次活动的领导和嘉宾有：中央信访总局常务副局长赵晓光先生、定西市人大常务委员会主任马虎成先生、中央办公厅毛泽东纪念堂管理局党组书记宋重冰先生、文化部中数集团董事长、中国音像出版总社社长刘杰先生、卫生部原全国计划生育委员会理事长苗霞先生和甘肃华威集团董事长何维彪先生、甘肃省临洮铝业有限责任公司董事长宋效农先生、临洮新兴集团董事长张存平先生、甘肃省方圆房地产开发有限责任公司董事长张耀林先生以及本次活动的主办方负责人：甘肃经纬实业集团有限责任公司董事长苟永胜先生、经纬艺术机构总经理刘凯宁先生、经纬艺术机构副总经理辛学强先生和本次主展画家张兴国老师。\r\n</p>\r\n<div class=\"img_wrapper\" style=\"margin:20px auto;padding:0px;text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/transform/20151202/fbWt-fxmifzc0750131.JPG\" alt=\"卢禹舜院长题词\" style=\"border:1px solid #E7E7E7;\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">卢禹舜院长题词</span> \r\n</div>\r\n<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	卢禹舜在开幕式中致辞，对经纬艺术的发展给予了很大的肯定，并寄予厚望。\r\n</p>\r\n<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	经纬艺术机构是一所以弘扬中国书画艺术，以提供专业的书画收藏、投资、顾问咨询服务为核心的艺术机构。业务涵盖当代书画家的发掘与推广；近现代、古代中国书画名作的投资、收藏、研究、交流、拍卖等。并擅长专业的展览及拍卖活动的策划与实施。艺术馆隶属于甘肃经纬文化实业发展有限公司，北京经纬正源文化有限公司。\r\n</p>\r\n<div class=\"img_wrapper\" style=\"margin:20px auto;padding:0px;text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/transform/20151202/xXVY-fxmcnkr7777343.JPG\" alt=\"现场嘉宾交流\" style=\"border:1px solid #E7E7E7;\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">现场嘉宾交流</span> \r\n</div>\r\n<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	艺术馆首展隆重推出了“崖壁上的意象”张兴国中国画作品展，展览作品共50余幅。如何运用现代的创新意识又能在传统模式中走出一条适合自己的图式，也是张兴国多年来一直在苦苦探索的课题。经过多年实践，张兴国认真地汲取多方面的滋养，一边致力于形式语言的拓展延伸，一边从其他姊妹艺术里找寻灵感，力求二者兼容的可行性，这样更凸显了他写意水墨人物画的形式特征和独具力度的笔墨语言。把纯情与至美化作诗情画意，把圣洁与崇高凝成艺术形象，以亦真亦幻的造型手法，求作品的深度、力度和厚度；奇险多变又极为严谨，强劲有力而颇具结构美，旗帜鲜明地表现出了画家的个性特征和审美理想。尤其将敦煌艺术的场面宏大复杂、内容丰富细致表现得淋漓尽致。\r\n</p>\r\n<div class=\"img_wrapper\" style=\"margin:20px auto;padding:0px;text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/transform/20151202/kZHj-fxmifzc0750129.JPG\" alt=\"经纬集团董事长苟永胜接受中央数字电视书画频道的采访\" style=\"border:1px solid #E7E7E7;\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">经纬集团董事长苟永胜接受采访</span> \r\n</div>\r\n<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	张兴国笑说艺术这东西越是太靠近越是虚无缥缈，有时候分明近在咫尺，却触手不及，就像人世间的有些事是需要用心去做、去体悟的。\r\n</p>\r\n<div class=\"img_wrapper\" style=\"margin:20px auto;padding:0px;text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/transform/20151202/sRL--fxmifze7527072.JPG\" alt=\"展览现场\" style=\"border:1px solid #E7E7E7;\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">展览现场</span> \r\n</div>\r\n<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	开馆当日，艺术馆还邀请了身着汉服的高级茶艺师以及中国音乐学院的古琴、古筝演奏家助兴。一指空灵，琴声悠扬；一花一叶，暗香浮动；一袭汉服，清新飘逸；一杯香茗，茶韵怡人。\r\n</p>\r\n<div class=\"img_wrapper\" style=\"margin:20px auto;padding:0px;text-align:center;color:#333333;font-family:Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://n.sinaimg.cn/collect/transform/20151202/E16J-fxmcnkr7777345.jpg\" alt=\"张兴国 敦煌系列 48cmX68cm\" style=\"border:1px solid #E7E7E7;\" /><span class=\"img_descr\" style=\"line-height:20px;color:#666666;font-size:12px;\">张兴国 敦煌系列 48cmX68cm</span> \r\n</div>\r\n<p style=\"font-size:14px;color:#333333;font-family:Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	聆听古筝悠扬之音，饱览茶道之精彩绝伦，如此惬意的氛围之中，品一壶清香茗茶，赏一幅水墨佳作，佐以正统中西式茶点，悠享城市中难得的静谧慢生活。\r\n</p>', '123', '1', '2015-12-01', '2015-12-31', '1', '', '1');
INSERT INTO `n_news` VALUES ('31', '1', '测试视频', '撒大大', 'gy', '/forfun/newsupload/1451306124286.gif', '<div style=\"text-align:center;\">\r\n	<embed src=\"/forfun/newsupload/1451306100327.mp4\" type=\"video/x-ms-asf-plugin\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" />\r\n</div>', '12431', '0', '2015-12-21', '2015-12-31', '1', '', '1');
INSERT INTO `n_news` VALUES ('33', '1', 'test', 'hhhhh', 'gy', '/forfun/newsupload/1451307625752.jpg', 'hhhhhh', '50', '1', '2015-12-27', '2015-12-31', '1', '', '1');
INSERT INTO `n_news` VALUES ('34', '1', 'ttt', 'ttt', 'ttt', '/forfun/newsupload/1451307724430.jpg', '<p style=\"text-align:center;\">\r\n	<img src=\"/forfun/newsupload/1451307700093.jpg\" alt=\"\" width=\"800\" height=\"500\" title=\"\" align=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '75', '1', '2015-12-27', '2015-12-31', '1', '', '1');

-- ----------------------------
-- Table structure for oa_orderaddress
-- ----------------------------
DROP TABLE IF EXISTS `oa_orderaddress`;
CREATE TABLE `oa_orderaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `addressid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1bsx742l1k7a1qernbjlpvmpj` (`addressid`),
  KEY `FK_tl65kv2538dp3i5h8ehjmrm1w` (`orderid`),
  CONSTRAINT `FK_1bsx742l1k7a1qernbjlpvmpj` FOREIGN KEY (`addressid`) REFERENCES `ad_address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tl65kv2538dp3i5h8ehjmrm1w` FOREIGN KEY (`orderid`) REFERENCES `o_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_orderaddress
-- ----------------------------
INSERT INTO `oa_orderaddress` VALUES ('6', '512', '33');

-- ----------------------------
-- Table structure for o_order
-- ----------------------------
DROP TABLE IF EXISTS `o_order`;
CREATE TABLE `o_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `current` timestamp NULL DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `ispay` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6k0uxsm9w1hjnp1muvkrkfef9` (`customerid`),
  KEY `FK_t89xec3n0adjmtyfww6eow4wc` (`productid`),
  CONSTRAINT `FK_6k0uxsm9w1hjnp1muvkrkfef9` FOREIGN KEY (`customerid`) REFERENCES `c_customer` (`id`),
  CONSTRAINT `FK_t89xec3n0adjmtyfww6eow4wc` FOREIGN KEY (`productid`) REFERENCES `p_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=514 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of o_order
-- ----------------------------
INSERT INTO `o_order` VALUES ('512', '18', '6', '2015-12-28 21:09:04', '66', '1');
INSERT INTO `o_order` VALUES ('513', '20', '14', '2015-12-29 00:00:01', '900', '1');

-- ----------------------------
-- Table structure for pm_productmoney
-- ----------------------------
DROP TABLE IF EXISTS `pm_productmoney`;
CREATE TABLE `pm_productmoney` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `currenttime` datetime DEFAULT NULL,
  `flag` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_medowh6ptfyd3ag6j59viq9np` (`customerid`),
  KEY `FK_ner8fgw1gx6osl7b6i6fxvxei` (`productid`),
  CONSTRAINT `FK_medowh6ptfyd3ag6j59viq9np` FOREIGN KEY (`customerid`) REFERENCES `c_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ner8fgw1gx6osl7b6i6fxvxei` FOREIGN KEY (`productid`) REFERENCES `p_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pm_productmoney
-- ----------------------------
INSERT INTO `pm_productmoney` VALUES ('11', '20', '14', '0', '2015-12-28 21:13:50', '1');
INSERT INTO `pm_productmoney` VALUES ('12', '20', '14', '648', '2015-12-28 23:57:04', '1');
INSERT INTO `pm_productmoney` VALUES ('13', '20', '8', '800', '2015-12-28 23:57:37', '1');
INSERT INTO `pm_productmoney` VALUES ('14', '20', '14', '900', '2015-12-28 23:58:41', '1');

-- ----------------------------
-- Table structure for ps_productsell
-- ----------------------------
DROP TABLE IF EXISTS `ps_productsell`;
CREATE TABLE `ps_productsell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `sellmethodid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_b767vrittw9fd943i9hig7yij` (`sellmethodid`),
  KEY `FK_em1wxfqchkn2yluip1xc4krfb` (`productid`),
  CONSTRAINT `FK_b767vrittw9fd943i9hig7yij` FOREIGN KEY (`sellmethodid`) REFERENCES `sm_sellmethod` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_em1wxfqchkn2yluip1xc4krfb` FOREIGN KEY (`productid`) REFERENCES `p_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_productsell
-- ----------------------------
INSERT INTO `ps_productsell` VALUES ('20', '18', '1');
INSERT INTO `ps_productsell` VALUES ('21', '19', '1');
INSERT INTO `ps_productsell` VALUES ('22', '20', '2');
INSERT INTO `ps_productsell` VALUES ('23', '21', '2');

-- ----------------------------
-- Table structure for pt_producttype
-- ----------------------------
DROP TABLE IF EXISTS `pt_producttype`;
CREATE TABLE `pt_producttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pt_producttype
-- ----------------------------
INSERT INTO `pt_producttype` VALUES ('1', '字画');
INSERT INTO `pt_producttype` VALUES ('2', '古董');

-- ----------------------------
-- Table structure for p_product
-- ----------------------------
DROP TABLE IF EXISTS `p_product`;
CREATE TABLE `p_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `artistid` int(11) NOT NULL,
  `money` double(25,0) DEFAULT NULL,
  `timestart` date DEFAULT NULL,
  `timeout` date DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `content` text,
  `imgone` varchar(255) DEFAULT NULL,
  `imgtwo` varchar(255) DEFAULT NULL,
  `imgthree` varchar(255) DEFAULT NULL,
  `situation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3a2286hejr4r95bofseli5r42` (`artistid`),
  KEY `FK_b3oo9oqhednel04ew5ix08gxa` (`typeid`),
  CONSTRAINT `FK_3a2286hejr4r95bofseli5r42` FOREIGN KEY (`artistid`) REFERENCES `c_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_b3oo9oqhednel04ew5ix08gxa` FOREIGN KEY (`typeid`) REFERENCES `pt_producttype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_product
-- ----------------------------
INSERT INTO `p_product` VALUES ('18', 'Lx', '/forfun/avatorupload/1451307969743.jpg', '5', '66', '2015-12-27', '2015-12-29', '1', 'Computer&nbsp;', '/forfun/avatorupload/1451307969745.jpg', '/forfun/avatorupload/1451307969746.jpg', '/forfun/avatorupload/1451307969777.jpg', '3');
INSERT INTO `p_product` VALUES ('19', 'Xn1', '/forfun/avatorupload/1451308078724.jpg', '5', '100', '2015-12-27', '2015-12-30', '1', '<img src=\"http://192.168.199.163:8080/forfun/kindeditor/plugins/emoticons/images/23.gif\" border=\"0\" alt=\"\" /><img src=\"http://192.168.199.163:8080/forfun/kindeditor/plugins/emoticons/images/34.gif\" border=\"0\" alt=\"\" />', '/forfun/avatorupload/1451308078726.jpg', '/forfun/avatorupload/1451308078727.jpg', '/forfun/avatorupload/1451308078728.jpg', '1');
INSERT INTO `p_product` VALUES ('20', 'Sfh', '/forfun/avatorupload/1451308162104.jpg', '5', '900', '2015-12-27', '2015-12-29', '2', 'Fgh', '/forfun/avatorupload/1451308162105.jpg', '/forfun/avatorupload/1451308162106.jpg', '/forfun/avatorupload/1451308162108.jpg', '3');
INSERT INTO `p_product` VALUES ('21', 'Fgh', '/forfun/avatorupload/1451308344865.jpg', '5', '21', '2015-12-27', '2015-12-29', '2', 'Fff', '/forfun/avatorupload/1451308344866.jpeg', '/forfun/avatorupload/1451308344867.jpeg', '/forfun/avatorupload/1451308344868.jpeg', '2');

-- ----------------------------
-- Table structure for rf_rolefunction
-- ----------------------------
DROP TABLE IF EXISTS `rf_rolefunction`;
CREATE TABLE `rf_rolefunction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fcte0m778hpeai9fj8ej6elp3` (`functionid`),
  KEY `FK_p9xah9wl9em3wwf71owqbho0l` (`roleid`),
  CONSTRAINT `FK_fcte0m778hpeai9fj8ej6elp3` FOREIGN KEY (`functionid`) REFERENCES `f_function` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_p9xah9wl9em3wwf71owqbho0l` FOREIGN KEY (`roleid`) REFERENCES `r_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rf_rolefunction
-- ----------------------------
INSERT INTO `rf_rolefunction` VALUES ('1', '2', '1');
INSERT INTO `rf_rolefunction` VALUES ('2', '3', '1');
INSERT INTO `rf_rolefunction` VALUES ('3', '3', '1');
INSERT INTO `rf_rolefunction` VALUES ('4', '4', '1');
INSERT INTO `rf_rolefunction` VALUES ('5', '5', '1');
INSERT INTO `rf_rolefunction` VALUES ('6', '6', '1');
INSERT INTO `rf_rolefunction` VALUES ('7', '8', '1');
INSERT INTO `rf_rolefunction` VALUES ('8', '9', '1');
INSERT INTO `rf_rolefunction` VALUES ('9', '10', '1');
INSERT INTO `rf_rolefunction` VALUES ('10', '11', '1');
INSERT INTO `rf_rolefunction` VALUES ('11', '13', '1');
INSERT INTO `rf_rolefunction` VALUES ('12', '14', '1');
INSERT INTO `rf_rolefunction` VALUES ('13', '16', '1');
INSERT INTO `rf_rolefunction` VALUES ('14', '18', '1');
INSERT INTO `rf_rolefunction` VALUES ('15', '19', '1');
INSERT INTO `rf_rolefunction` VALUES ('16', '21', '1');
INSERT INTO `rf_rolefunction` VALUES ('17', '23', '1');
INSERT INTO `rf_rolefunction` VALUES ('18', '24', '1');
INSERT INTO `rf_rolefunction` VALUES ('19', '25', '1');
INSERT INTO `rf_rolefunction` VALUES ('20', '13', '3');
INSERT INTO `rf_rolefunction` VALUES ('21', '14', '3');
INSERT INTO `rf_rolefunction` VALUES ('22', '16', '4');
INSERT INTO `rf_rolefunction` VALUES ('23', '18', '5');
INSERT INTO `rf_rolefunction` VALUES ('24', '19', '5');
INSERT INTO `rf_rolefunction` VALUES ('25', '21', '6');

-- ----------------------------
-- Table structure for r_role
-- ----------------------------
DROP TABLE IF EXISTS `r_role`;
CREATE TABLE `r_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_role
-- ----------------------------
INSERT INTO `r_role` VALUES ('1', 'admin');
INSERT INTO `r_role` VALUES ('2', 'Christy');
INSERT INTO `r_role` VALUES ('3', 'editor');
INSERT INTO `r_role` VALUES ('4', 'chiefeditor');
INSERT INTO `r_role` VALUES ('5', 'adeditor');
INSERT INTO `r_role` VALUES ('6', 'adchiefeditor');

-- ----------------------------
-- Table structure for sm_sellmethod
-- ----------------------------
DROP TABLE IF EXISTS `sm_sellmethod`;
CREATE TABLE `sm_sellmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_sellmethod
-- ----------------------------
INSERT INTO `sm_sellmethod` VALUES ('1', '一口价');
INSERT INTO `sm_sellmethod` VALUES ('2', '拍卖');

-- ----------------------------
-- Table structure for ur_userrole
-- ----------------------------
DROP TABLE IF EXISTS `ur_userrole`;
CREATE TABLE `ur_userrole` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) DEFAULT NULL,
  `roleid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `USERID` (`userid`),
  KEY `ROLEID` (`roleid`),
  CONSTRAINT `ROLEID` FOREIGN KEY (`roleid`) REFERENCES `r_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `USERID` FOREIGN KEY (`userid`) REFERENCES `u_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ur_userrole
-- ----------------------------
INSERT INTO `ur_userrole` VALUES ('3', '1', '1');
INSERT INTO `ur_userrole` VALUES ('4', '57', '3');
INSERT INTO `ur_userrole` VALUES ('5', '58', '4');
INSERT INTO `ur_userrole` VALUES ('6', '59', '5');
INSERT INTO `ur_userrole` VALUES ('7', '60', '6');

-- ----------------------------
-- Table structure for u_user
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES ('1', 'admin', 'admin');
INSERT INTO `u_user` VALUES ('57', 'editor', 'editor');
INSERT INTO `u_user` VALUES ('58', 'chiefeditor', 'chiefeditor');
INSERT INTO `u_user` VALUES ('59', 'adeditor', 'adeditor');
INSERT INTO `u_user` VALUES ('60', 'adchiefeditor', 'adchiefeditor');

-- ----------------------------
-- Procedure structure for TimeOut
-- ----------------------------
DROP PROCEDURE IF EXISTS `TimeOut`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TimeOut`()
BEGIN
	update n_news set n_news.isonline = 0 where CURDATE() > n_news.timeout or CURDATE() < n_news.timestart;
	update n_news set n_news.isonline = 1 where CURDATE() < n_news.timeout and CURDATE() >= n_news.timestart;
  update a_advert set a_advert.isonline = 0 where CURDATE() > a_advert.timeout or CURDATE() < a_advert.timestart;
	update a_advert set a_advert.isonline = 1 where CURDATE() < a_advert.timeout and CURDATE() >= a_advert.timestart;
	update p_product set p_product.situation = 2 where CURDATE() > p_product.timeout and p_product.situation = 1;
	update p_product set p_product.situation = 1 where CURDATE() < p_product.timeout and CURDATE() >= p_product.timestart and p_product.situation = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for UpdateAuction
-- ----------------------------
DROP PROCEDURE IF EXISTS `UpdateAuction`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateAuction`()
BEGIN
	DECLARE temp0 INT(11);
	DECLARE temp1 INT(11);
	DECLARE temp2 INT(11);
	DECLARE temp3 INT(11);
	
	declare done int default -1;  -- 用于控制循环是否结束  
	DECLARE cur CURSOR FOR select pm_productmoney.id,pm_productmoney.productid,customerid,pm_productmoney.money from pm_productmoney,(SELECT pm_productmoney.productid, max(money) as money from pm_productmoney where flag=0 and  pm_productmoney.productid in(SELECT p_product.id FROM p_product  where p_product.timeout < NOW() )   GROUP BY productid )tmp WHERE pm_productmoney.productid = tmp.productid  and pm_productmoney.money = tmp.money ;
	declare continue handler for not found set done=1;  

	/* 打开游标 */    
  open cur;
	/* 循环开始 */    
  myLoop: LOOP 
		/* 移动游标并赋值 */    
     fetch cur into temp0,temp1,temp2,temp3 ;
		-- 游标到达尾部,退出循环  
        if done = 1 then     
        leave myLoop;    
        end if;    
				INSERT INTO o_order 

(productid,customerid,money,current,ispay)VALUES

(temp1,temp2,temp3,NOW(),0);
				update pm_productmoney pm set 

pm.flag = 1 where pm.productid = temp1;
				delete from o_order  where 

temp1 = o_order.productid and o_order.money < temp3;
update p_product set p_product.money = temp3 where id = temp1;

	end loop myLoop; 
	/* 关闭游标 */    
 
  close cur;    
	
				
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for TimeOutEvent
-- ----------------------------
DROP EVENT IF EXISTS `TimeOutEvent`;
DELIMITER ;;
CREATE EVENT `TimeOutEvent` ON SCHEDULE EVERY 1 SECOND STARTS '2015-11-27 21:43:51' ON COMPLETION NOT PRESERVE ENABLE DO CALL TimeOut
;
;;
DELIMITER ;

-- ----------------------------
-- Event structure for UpdateAuction
-- ----------------------------
DROP EVENT IF EXISTS `UpdateAuction`;
DELIMITER ;;
CREATE EVENT `UpdateAuction` ON SCHEDULE EVERY 1 SECOND STARTS '2015-12-28 03:22:29' ON COMPLETION NOT PRESERVE ENABLE DO call UpdateAuction
;
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ALERTSTUATION`;
DELIMITER ;;
CREATE TRIGGER `ALERTSTUATION` AFTER INSERT ON `o_order` FOR EACH ROW begin
update p_product pp set situation=3 where pp.id = new.productid;

end
;;
DELIMITER ;
