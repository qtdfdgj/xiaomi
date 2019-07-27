/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : xiaomi

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2019-07-27 13:46:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `m_address`
-- ----------------------------
DROP TABLE IF EXISTS `m_address`;
CREATE TABLE `m_address` (
  `aid` varchar(32) NOT NULL COMMENT '收货地址id',
  `uid` varchar(32) NOT NULL COMMENT '用户id',
  `name` varchar(20) DEFAULT NULL COMMENT '收货人姓名',
  `address` varchar(50) DEFAULT NULL COMMENT '详细地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `tel` varchar(20) DEFAULT NULL COMMENT '固话',
  `tag` varchar(10) DEFAULT NULL COMMENT '地址类型',
  `is_default` int(1) DEFAULT NULL COMMENT '是否默认 0-非默认 1-默认',
  PRIMARY KEY (`aid`),
  KEY `fk_a_uid` (`uid`),
  CONSTRAINT `fk_a_uid` FOREIGN KEY (`uid`) REFERENCES `m_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_address
-- ----------------------------
INSERT INTO `m_address` VALUES ('410d87cb76224b1da32e7005841680a7', 'a3485ed4c9cc43d3a1970c3cc230f6ef', 'Hao An', '山西省太原市迎泽区文庙', '15202414705', null, '家', '1');
INSERT INTO `m_address` VALUES ('49fccf7ab87345a09d84f67ec5b65885', '8fc2c4a6bd2a4e8db4630fc3fc9bc052', 'Hao An', '陕西省西安市新城区长乐中路', '15202414705', null, '家', '0');
INSERT INTO `m_address` VALUES ('50c1c074d2c842cf99a5e0c1042725bc', '8fc2c4a6bd2a4e8db4630fc3fc9bc052', 'Hao', '云南省昆明市五华区华山', '15202414705', null, '家', '1');
INSERT INTO `m_address` VALUES ('61f792c6924a4142b30e581cf79812c6', '9297eac068274d2989bafac43cf59728', 'Hao', '云南省玉溪市江川区', '15202414705', null, '家', '1');
INSERT INTO `m_address` VALUES ('88f038fb5ac546a28abc3e965d371b5b', '6dd8c881268b40fb8d1e895a9dd7a574', '刀仔', '四川省泸州市叙永县马岭镇', '15918866666', null, '学校', '1');
INSERT INTO `m_address` VALUES ('c04768f8ffe1479995ebe31c9f9bbd4f', '8fc2c4a6bd2a4e8db4630fc3fc9bc052', 'Hao An', '陕西省铜川市王益区红旗', '15202414705', null, '家', '0');
INSERT INTO `m_address` VALUES ('d62aaf9315ac4474abb89da837c280c0', 'bdd2df1fd30943eb89872670c9980914', 'Hao An', '陕西省铜川市宜君县太安镇', '15202414705', null, '家', '1');
INSERT INTO `m_address` VALUES ('e92d85d5ac434be797c8496b1342d949', '10', null, 'jjj', null, null, null, '0');

-- ----------------------------
-- Table structure for `m_cart`
-- ----------------------------
DROP TABLE IF EXISTS `m_cart`;
CREATE TABLE `m_cart` (
  `cid` varchar(32) NOT NULL COMMENT 'id',
  `uid` varchar(32) NOT NULL COMMENT '用户id',
  `gid` varchar(32) NOT NULL COMMENT '具体版本商品id',
  `num` int(9) NOT NULL COMMENT '数量',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`cid`),
  KEY `fk_c_uid` (`uid`),
  KEY `fk_c_gid` (`gid`),
  CONSTRAINT `fk_c_gid` FOREIGN KEY (`gid`) REFERENCES `m_good_version` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_c_uid` FOREIGN KEY (`uid`) REFERENCES `m_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_cart
-- ----------------------------
INSERT INTO `m_cart` VALUES ('12', '10', '4', '2', null);
INSERT INTO `m_cart` VALUES ('51cf0ce8c3fe49188cdea45df6623d9a', '8fc2c4a6bd2a4e8db4630fc3fc9bc052', '11', '1', '2019-07-25 10:48:58');
INSERT INTO `m_cart` VALUES ('9c8f7a6f7452446c81da2d79f2c49283', '8fc2c4a6bd2a4e8db4630fc3fc9bc052', '1', '1', '2019-07-25 10:48:48');
INSERT INTO `m_cart` VALUES ('b6999109ffc44088bec1334ac67c163e', '6dd8c881268b40fb8d1e895a9dd7a574', '41', '1', '2019-07-26 09:06:45');
INSERT INTO `m_cart` VALUES ('c75dc46d11f545dbafb8533a63adec99', '8fc2c4a6bd2a4e8db4630fc3fc9bc052', '1', '1', '2019-07-25 10:48:46');
INSERT INTO `m_cart` VALUES ('ee0980f24cdb4783a7a2b21e7eecb0ad', '10', '3', '2', '2019-07-20 14:05:40');

-- ----------------------------
-- Table structure for `m_goods`
-- ----------------------------
DROP TABLE IF EXISTS `m_goods`;
CREATE TABLE `m_goods` (
  `id` varchar(32) NOT NULL COMMENT '商品id',
  `name` varchar(20) NOT NULL COMMENT '商品名称',
  `category_name` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `label` int(2) DEFAULT NULL COMMENT '标签0—普通，1-推荐,2-明星，3-配件',
  `sell_point` varchar(150) DEFAULT NULL COMMENT '商品卖点',
  `image` varchar(500) DEFAULT NULL COMMENT '图片路径',
  `status` int(1) DEFAULT '1' COMMENT '商品状态  1：上架   2：下架',
  `priority` int(3) DEFAULT NULL COMMENT '显示优先级',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `created_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modified_user` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_goods
-- ----------------------------
INSERT INTO `m_goods` VALUES ('1', '小米6', '手机', '2', '骁龙835 旗舰处理器，6GB内存，5.15护眼屏', 'image/liebiao_xiaomi6.jpg', '1', '10', null, null, null, null);
INSERT INTO `m_goods` VALUES ('10', '小虾米x', '笔记本', '2', '更好吃', 'image/liebiao_xiaomimix.jpg', '1', '3', null, null, null, null);
INSERT INTO `m_goods` VALUES ('11', '小米电视4A', '电视', '3', '4K HDR,语音搜片，超窄边、震撼性能', 'image/mi4A-65.jpg', '1', '8', null, null, null, null);
INSERT INTO `m_goods` VALUES ('12', '小米电视4C', '电视', '3', '人工智能，大内存，海量片源，钢琴烤漆', 'image/mi4C-55.jpg', '1', '8', null, null, null, null);
INSERT INTO `m_goods` VALUES ('13', '小米电视4X', '电视', '3', '4K HDR，杜比音效，大内存，钢琴烤漆，大内存', 'image/mi4X-43.jpg', '1', '8', null, null, null, null);
INSERT INTO `m_goods` VALUES ('14', '米家互连空调C1', '家电', '4', '立体送风，干净健康，静音设计', 'image/miRefridgeC1.jpg', '1', '5', null, null, null, null);
INSERT INTO `m_goods` VALUES ('15', '小米净水器', '家电', '4', '大流量，深度清洁，自动清洗', 'image/jingshuiqi.jpg', '1', '6', null, null, null, null);
INSERT INTO `m_goods` VALUES ('16', 'Redmi全自动波轮洗衣机1A', '家电', '4', '大容量，10种洗涤模式，耐腐蚀金属筒身', 'image/washingMechain.jpg', '1', '7', null, null, null, null);
INSERT INTO `m_goods` VALUES ('17', '米家扫地机器人', '家电', '4', '智能规划路径，自动充电，澎湃吸力', 'image/mirobot.jpg', '1', '6', null, null, null, null);
INSERT INTO `m_goods` VALUES ('18', '小米米家照片打印机', '打印机', '2', '即拍即印', 'image/print1.jpg', '1', '12', null, null, null, null);
INSERT INTO `m_goods` VALUES ('19', '小米蓝牙耳机', '耳机', '2', '雅致简约 触控操作', 'image/earphone1.jpg', '1', '12', null, null, null, null);
INSERT INTO `m_goods` VALUES ('2', '小米MIX', '手机', '2', '全面屏，更好用', 'image/liebiao_xiaomimix.jpg', '1', '9', null, null, null, null);
INSERT INTO `m_goods` VALUES ('20', '蓝牙项圈耳机', '耳机', '2', '磁吸式耳壳', 'image/chapletear.jpg', '1', '12', null, null, null, null);
INSERT INTO `m_goods` VALUES ('21', 'AMORE铁耳机', '耳机', '1', '格莱美奖音乐大师定调 ', 'image/amore.jpg', '1', '12', null, null, null, null);
INSERT INTO `m_goods` VALUES ('22', '米家小相机', '照相机', '2', '清晰捕捉美好瞬间', 'image/camera.jpg', '1', '12', null, null, null, null);
INSERT INTO `m_goods` VALUES ('23', '小米笔记本', '笔记本', '1', '轻薄全金属机身', 'image/notepc.jpg', '1', '8', null, null, null, null);
INSERT INTO `m_goods` VALUES ('24', '小米笔记本2', '笔记本', '1', '全面均衡的国民轻薄本', 'image/notepc2.jpg', '1', '11', null, null, null, null);
INSERT INTO `m_goods` VALUES ('25', 'RedMIbook', '笔记本', '2', '轻薄便携长续航 ', 'image/redmibook.jpg', '1', '5', null, null, null, null);
INSERT INTO `m_goods` VALUES ('26', '小米集显版', '笔记本', '2', '高速固态硬盘', 'image/notepc.jpg', '1', '12', null, null, null, null);
INSERT INTO `m_goods` VALUES ('3', '小米Note2', '手机', '2', '夜拍更美', 'image/liebiao_xiaomint2.jpg', '1', '8', null, null, null, null);
INSERT INTO `m_goods` VALUES ('4', '小米5', '手机', '1', '变焦双摄，拍人更美', 'image/liebiao_xiaomi5.jpg', '1', '10', null, null, null, null);
INSERT INTO `m_goods` VALUES ('5', '小米5C', '手机', '1', '小米 松果 澎湃S1CPU', 'image/liebiao_xiaomi5c.jpg', '1', '7', null, null, null, null);
INSERT INTO `m_goods` VALUES ('6', '小米5S', '手机', '1', '高通骁龙821 多项黑科技', 'image/liebiao_xiaomi5s.jpg', '1', '7', null, null, null, null);
INSERT INTO `m_goods` VALUES ('7', '红米Note4', '手机', '2', '2.5D弧面玻璃 金属机身', 'image/liebiao_hongmin42.jpg', '1', '8', null, null, null, null);
INSERT INTO `m_goods` VALUES ('8', '红米Note4X', '手机', '2', '伪基站识别 4G+全网通', 'image/liebiao_hongmin4x.jpg', '1', '8', null, null, null, null);
INSERT INTO `m_goods` VALUES ('9', '小虾米9', '笔记本', '1', '好吃', 'image/liebiao_xiaomi5.jpg', '1', '4', null, null, null, null);

-- ----------------------------
-- Table structure for `m_good_version`
-- ----------------------------
DROP TABLE IF EXISTS `m_good_version`;
CREATE TABLE `m_good_version` (
  `id` varchar(32) NOT NULL,
  `good_id` varchar(32) NOT NULL,
  `num` int(8) NOT NULL,
  `price` float(8,2) NOT NULL,
  `version` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_v_gid` (`good_id`),
  CONSTRAINT `fk_v_gid` FOREIGN KEY (`good_id`) REFERENCES `m_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_good_version
-- ----------------------------
INSERT INTO `m_good_version` VALUES ('1', '1', '90', '2699.00', '6GB+64GB 黑色');
INSERT INTO `m_good_version` VALUES ('10', '1', '99', '2088.00', '6GB+128GB（高配版）亮银黑');
INSERT INTO `m_good_version` VALUES ('11', '1', '100', '2088.00', '6GB+128GB（高配版）黑色');
INSERT INTO `m_good_version` VALUES ('12', '1', '100', '2088.00', '6GB+128GB（高配版）银色');
INSERT INTO `m_good_version` VALUES ('13', '3', '100', '2088.00', '6GB+128GB（高配版）绿色');
INSERT INTO `m_good_version` VALUES ('14', '3', '100', '2088.00', '6GB+128GB（高配版）紫色');
INSERT INTO `m_good_version` VALUES ('15', '3', '100', '2088.00', '6GB+128GB（高配版）粉红色');
INSERT INTO `m_good_version` VALUES ('16', '3', '100', '3029.00', '6GB+128GB（全球版）亮黑色');
INSERT INTO `m_good_version` VALUES ('17', '10', '100', '3029.00', '6GB+128GB（全球版）冰川银');
INSERT INTO `m_good_version` VALUES ('18', '2', '100', '3029.00', '6GB+128GB（全球版）亮银黑');
INSERT INTO `m_good_version` VALUES ('19', '4', '100', '1099.00', '3GB+64GB黑色');
INSERT INTO `m_good_version` VALUES ('2', '1', '100', '2699.00', '6GB+64GB蓝色');
INSERT INTO `m_good_version` VALUES ('20', '4', '100', '1099.00', '3GB+64GB白色');
INSERT INTO `m_good_version` VALUES ('21', '4', '100', '1099.00', '3GB+64GB金色');
INSERT INTO `m_good_version` VALUES ('22', '4', '100', '1099.00', '3GB+64GB淡紫色');
INSERT INTO `m_good_version` VALUES ('23', '5', '100', '699.00', '3GB+64GB玫瑰金');
INSERT INTO `m_good_version` VALUES ('24', '5', '100', '699.00', '3GB+64GB金色');
INSERT INTO `m_good_version` VALUES ('25', '5', '100', '699.00', '3GB+64GB黑色');
INSERT INTO `m_good_version` VALUES ('26', '6', '100', '1749.00', '3GB+64GB深灰色');
INSERT INTO `m_good_version` VALUES ('28', '10', '100', '1749.00', '3GB+64GB玫瑰金');
INSERT INTO `m_good_version` VALUES ('29', '10', '100', '1749.00', '3GB+64GB金色');
INSERT INTO `m_good_version` VALUES ('3', '10', '1', '2899.00', '6GB+128GB黑色');
INSERT INTO `m_good_version` VALUES ('30', '2', '100', '968.00', '4GB+32GB深灰色');
INSERT INTO `m_good_version` VALUES ('34', '6', '100', '1238.00', '4GB+128GB');
INSERT INTO `m_good_version` VALUES ('35', '8', '100', '1238.00', '4GB+128GB');
INSERT INTO `m_good_version` VALUES ('36', '6', '100', '1238.00', '4GB+128GB');
INSERT INTO `m_good_version` VALUES ('37', '6', '100', '1238.00', '4GB+128GB');
INSERT INTO `m_good_version` VALUES ('38', '7', '100', '999.00', '3GB+32GB');
INSERT INTO `m_good_version` VALUES ('39', '7', '100', '999.00', '3GB+32GB');
INSERT INTO `m_good_version` VALUES ('4', '2', '100', '2199.00', '4GB+128GB');
INSERT INTO `m_good_version` VALUES ('40', '7', '100', '1299.00', '3GB+64GB');
INSERT INTO `m_good_version` VALUES ('41', '7', '100', '1299.00', '3GB+64GB');
INSERT INTO `m_good_version` VALUES ('42', '8', '100', '738.00', '3GB+16GB');
INSERT INTO `m_good_version` VALUES ('43', '8', '100', '1108.00', '3GB+32GB');
INSERT INTO `m_good_version` VALUES ('44', '11', '30', '1599.00', '54寸');
INSERT INTO `m_good_version` VALUES ('45', '11', '30', '1999.00', '60寸');
INSERT INTO `m_good_version` VALUES ('46', '11', '30', '1299.00', '43寸');
INSERT INTO `m_good_version` VALUES ('47', '12', '30', '1999.00', '55寸');
INSERT INTO `m_good_version` VALUES ('48', '12', '30', '1699.00', '50寸');
INSERT INTO `m_good_version` VALUES ('49', '12', '30', '1399.00', '47寸');
INSERT INTO `m_good_version` VALUES ('5', '2', '100', '2199.00', '4GB+128GB');
INSERT INTO `m_good_version` VALUES ('50', '13', '30', '1499.00', '43寸');
INSERT INTO `m_good_version` VALUES ('51', '13', '30', '1699.00', '50寸');
INSERT INTO `m_good_version` VALUES ('52', '13', '30', '2099.00', '55寸');
INSERT INTO `m_good_version` VALUES ('53', '14', '20', '1999.00', '1匹');
INSERT INTO `m_good_version` VALUES ('54', '14', '30', '2299.00', '1.5匹');
INSERT INTO `m_good_version` VALUES ('55', '15', '30', '699.00', '10L容量');
INSERT INTO `m_good_version` VALUES ('56', '16', '30', '799.00', '双桶洗衣机');
INSERT INTO `m_good_version` VALUES ('57', '17', '99', '1399.00', '米家扫地机器人');
INSERT INTO `m_good_version` VALUES ('58', '18', '20', '489.00', '300*300dpi');
INSERT INTO `m_good_version` VALUES ('59', '19', '100', '179.00', '蓝牙5.0芯片');
INSERT INTO `m_good_version` VALUES ('6', '9', '100', '3199.00', '6GB+128GB');
INSERT INTO `m_good_version` VALUES ('60', '18', '30', '379.00', 'AAC高清音质');
INSERT INTO `m_good_version` VALUES ('61', '18', '40', '79.00', '4.5g轻盈/一键式多控');
INSERT INTO `m_good_version` VALUES ('62', '20', '40', '279.00', '205*175*39mm');
INSERT INTO `m_good_version` VALUES ('63', '21', '10', '599.00', '单动圈+双动铁');
INSERT INTO `m_good_version` VALUES ('64', '21', '20', '1299.00', '动铁三单元+动圈单元结构设计');
INSERT INTO `m_good_version` VALUES ('65', '22', '20', '699.00', '3840*2160分辨率');
INSERT INTO `m_good_version` VALUES ('66', '22', '20', '699.00', '76.5*71.0*258.0mm');
INSERT INTO `m_good_version` VALUES ('67', '23', '22', '4299.00', '4GB+256GB');
INSERT INTO `m_good_version` VALUES ('68', '24', '72', '3999.00', '128G+1TB+SSD(HDD)');
INSERT INTO `m_good_version` VALUES ('69', '24', '100', '4899.00', '16G+512G(独显)灰色');
INSERT INTO `m_good_version` VALUES ('7', '9', '100', '1699.00', '4GB+64GB（标配版）');
INSERT INTO `m_good_version` VALUES ('70', '24', '92', '3999.00', '8G+256G+SSD灰色');
INSERT INTO `m_good_version` VALUES ('71', '24', '30', '4899.00', '8G+512G+SSD灰色');
INSERT INTO `m_good_version` VALUES ('72', '25', '40', '3999.00', 'I5 8G+256G 集显');
INSERT INTO `m_good_version` VALUES ('73', '25', '40', '3199.00', 'I3 4G+256GB 集显 银色');
INSERT INTO `m_good_version` VALUES ('74', '26', '50', '2899.00', '4G+256G SSD白色');
INSERT INTO `m_good_version` VALUES ('75', '26', '60', '3099.00', '4G+128G SSD 灰色');
INSERT INTO `m_good_version` VALUES ('8', '9', '100', '1699.00', '4GB+64GB（标配版）');
INSERT INTO `m_good_version` VALUES ('9', '9', '100', '1699.00', '4GB+64GB（标配版）');

-- ----------------------------
-- Table structure for `m_order`
-- ----------------------------
DROP TABLE IF EXISTS `m_order`;
CREATE TABLE `m_order` (
  `oid` varchar(32) NOT NULL COMMENT '订单id',
  `uid` varchar(32) NOT NULL COMMENT '用户id',
  `gid` varchar(32) NOT NULL COMMENT '商品版本id',
  `title` varchar(100) DEFAULT NULL COMMENT '商品标题',
  `image` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `price` float(8,2) DEFAULT NULL COMMENT '商品价格',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `name` varchar(20) DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '收货电话',
  `address` varchar(100) DEFAULT NULL COMMENT '收货地址',
  `total_price` float(11,2) DEFAULT NULL COMMENT '总价',
  `state` int(1) DEFAULT NULL COMMENT '状态：0-未支付，1-已支付，2-已取消，3-已完成',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `modified_user` varchar(20) DEFAULT NULL COMMENT '最后修改人',
  `modified_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`oid`),
  KEY `fk_o_uid` (`uid`),
  KEY `fk_o_gid` (`gid`),
  CONSTRAINT `fk_o_gid` FOREIGN KEY (`gid`) REFERENCES `m_good_version` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_o_uid` FOREIGN KEY (`uid`) REFERENCES `m_user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_order
-- ----------------------------
INSERT INTO `m_order` VALUES ('03e16928567c4279a1fbe22b4b182f34', 'a3485ed4c9cc43d3a1970c3cc230f6ef', '41', '红米Note4', 'image/liebiao_hongmin42.jpg', '1299.00', '1', 'Hao An', '15202414705', '山西省太原市迎泽区文庙', '1299.00', '1', '2019-07-25 21:46:39', '2019-07-25 22:03:14', null, null, null, null);
INSERT INTO `m_order` VALUES ('0a52856924324fce8d975745aeee83ba', 'a3485ed4c9cc43d3a1970c3cc230f6ef', '34', '小米5S', 'image/liebiao_xiaomi5s.jpg', '1238.00', '1', 'Hao An', '15202414705', '山西省太原市迎泽区文庙', '1238.00', '1', '2019-07-25 22:01:11', '2019-07-25 22:03:14', null, null, null, null);
INSERT INTO `m_order` VALUES ('146d94ddcb4648bb80a3189d87d695aa', '6dd8c881268b40fb8d1e895a9dd7a574', '41', '红米Note4', 'image/liebiao_hongmin42.jpg', '1299.00', '1', '刀仔', '15918866666', '四川省泸州市叙永县马岭镇', '1299.00', '0', '2019-07-26 09:09:09', null, null, null, null, null);
INSERT INTO `m_order` VALUES ('148c0d382d7645e689a8c3a6188c36c2', '6dd8c881268b40fb8d1e895a9dd7a574', '2', '小米6', 'image/liebiao_xiaomi6.jpg', '2699.00', '1', '刀仔', '15918866666', '四川省泸州市叙永县马岭镇', '2699.00', '1', '2019-07-25 23:22:45', '2019-07-25 23:24:32', null, null, null, null);
INSERT INTO `m_order` VALUES ('1501830b1ff84fba99386aa9e32ebf34', 'a3485ed4c9cc43d3a1970c3cc230f6ef', '37', '小米5S', 'image/liebiao_xiaomi5s.jpg', '1238.00', '1', 'Hao An', '15202414705', '山西省太原市迎泽区文庙', '1238.00', '1', '2019-07-25 22:01:11', '2019-07-25 22:03:14', null, null, null, null);
INSERT INTO `m_order` VALUES ('203d199d50e241eb98237e1b6febd06a', '6dd8c881268b40fb8d1e895a9dd7a574', '30', '小米MIX', 'image/liebiao_xiaomimix.jpg', '968.00', '1', '刀仔', '15918866666', '四川省泸州市叙永县马岭镇', '968.00', '1', '2019-07-25 23:22:45', '2019-07-25 23:24:31', null, null, null, null);
INSERT INTO `m_order` VALUES ('423d571f5e21436faddefe598216cd3e', '6dd8c881268b40fb8d1e895a9dd7a574', '41', '红米Note4', 'image/liebiao_hongmin42.jpg', '1299.00', '1', '刀仔', '15918866666', '四川省泸州市叙永县马岭镇', '1299.00', '0', '2019-07-26 09:41:48', null, null, null, null, null);
INSERT INTO `m_order` VALUES ('559585f9c38d42f8ae8fd0ba8545cad9', '6dd8c881268b40fb8d1e895a9dd7a574', '41', '红米Note4', 'image/liebiao_hongmin42.jpg', '1299.00', '1', '刀仔', '15918866666', '四川省泸州市叙永县马岭镇', '1299.00', '0', '2019-07-26 09:42:51', null, null, null, null, null);
INSERT INTO `m_order` VALUES ('5b13e9fed9be4b7f8c5a1e5167fa7d3c', '6dd8c881268b40fb8d1e895a9dd7a574', '41', '红米Note4', 'image/liebiao_hongmin42.jpg', '1299.00', '1', '刀仔', '15918866666', '四川省泸州市叙永县马岭镇', '1299.00', '0', '2019-07-26 09:07:04', null, null, null, null, null);
INSERT INTO `m_order` VALUES ('7ab3eead007f4d7f9fae377d69f4484d', '6dd8c881268b40fb8d1e895a9dd7a574', '41', '红米Note4', 'image/liebiao_hongmin42.jpg', '1299.00', '1', '刀仔', '15918866666', '四川省泸州市叙永县马岭镇', '1299.00', '0', '2019-07-26 09:09:12', null, null, null, null, null);
INSERT INTO `m_order` VALUES ('825823b6749248c5844b6022fb84f46c', 'a3485ed4c9cc43d3a1970c3cc230f6ef', '2', '小米6', 'image/liebiao_xiaomi6.jpg', '2699.00', '1', 'Hao An', '15202414705', '山西省太原市迎泽区文庙', '2699.00', '1', '2019-07-25 21:39:05', '2019-07-25 22:03:14', null, null, null, null);
INSERT INTO `m_order` VALUES ('8bfc8617739e43b38e930c298f75d1f7', '6dd8c881268b40fb8d1e895a9dd7a574', '10', '小米6', 'image/liebiao_xiaomi6.jpg', '2088.00', '2', '刀仔', '15918866666', '四川省泸州市叙永县马岭镇', '4176.00', '1', '2019-07-25 23:22:45', '2019-07-25 23:24:32', null, null, null, null);
INSERT INTO `m_order` VALUES ('93b1f60cce784926a797b755e8d73ebf', '6dd8c881268b40fb8d1e895a9dd7a574', '41', '红米Note4', 'image/liebiao_hongmin42.jpg', '1299.00', '1', '刀仔', '15918866666', '四川省泸州市叙永县马岭镇', '1299.00', '0', '2019-07-26 09:07:04', null, null, null, null, null);
INSERT INTO `m_order` VALUES ('9548bd3383184126a28b82a17af6b77e', 'a3485ed4c9cc43d3a1970c3cc230f6ef', '52', '小米电视4X', 'image/mi4X-43.jpg', '2099.00', '1', 'Hao An', '15202414705', '山西省太原市迎泽区文庙', '2099.00', '0', '2019-07-25 22:47:40', null, null, null, null, null);
INSERT INTO `m_order` VALUES ('98d4b89b504c41579706dde1c01123f6', 'bdd2df1fd30943eb89872670c9980914', '1', '小米6', 'image/liebiao_xiaomi6.jpg', '2699.00', '1', 'Hao An', '15202414705', '陕西省铜川市宜君县太安镇', '2699.00', '0', '2019-07-25 23:03:33', null, null, null, null, null);
INSERT INTO `m_order` VALUES ('9fa2e331393d4287a70a3fac6addd966', '9297eac068274d2989bafac43cf59728', '22', '小米5', 'image/liebiao_xiaomi5.jpg', '1099.00', '1', 'Hao An', '15202414705', '陕西省宝鸡市渭滨区金陵', '1099.00', '0', '2019-07-26 10:06:29', null, null, null, null, null);
INSERT INTO `m_order` VALUES ('a9669070780346b3a842c30bf7d73f85', 'a3485ed4c9cc43d3a1970c3cc230f6ef', '2', '小米6', 'image/liebiao_xiaomi6.jpg', '2699.00', '4', 'Hao An', '15202414705', '山西省太原市迎泽区文庙', '10796.00', '0', '2019-07-25 22:48:46', null, null, null, null, null);
INSERT INTO `m_order` VALUES ('adf343537636484aacfc289eb7dde72d', '6dd8c881268b40fb8d1e895a9dd7a574', '41', '红米Note4', 'image/liebiao_hongmin42.jpg', '1299.00', '1', '刀仔', '15918866666', '四川省泸州市叙永县马岭镇', '1299.00', '0', '2019-07-26 09:39:58', null, null, null, null, null);
INSERT INTO `m_order` VALUES ('c44f0f487d9b49e98493ba4fd5980aa0', '9297eac068274d2989bafac43cf59728', '2', '小米6', 'image/liebiao_xiaomi6.jpg', '2699.00', '1', 'Hao An', '15202414705', '陕西省宝鸡市渭滨区金陵', '2699.00', '1', '2019-07-26 10:04:35', '2019-07-26 10:05:16', null, null, null, null);
INSERT INTO `m_order` VALUES ('fa3a888ec08247748ab09d094a657917', '6dd8c881268b40fb8d1e895a9dd7a574', '13', '小米Note2', 'image/liebiao_xiaomint2.jpg', '2088.00', '1', '刀仔', '15918866666', '四川省泸州市叙永县马岭镇', '2088.00', '0', '2019-07-25 23:35:23', null, null, null, null, null);
INSERT INTO `m_order` VALUES ('fff5143f1e7b4c999120f7e64439ae6f', '6dd8c881268b40fb8d1e895a9dd7a574', '41', '红米Note4', 'image/liebiao_hongmin42.jpg', '1299.00', '2', '刀仔', '15918866666', '四川省泸州市叙永县马岭镇', '2598.00', '0', '2019-07-26 09:39:58', null, null, null, null, null);

-- ----------------------------
-- Table structure for `m_user`
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user` (
  `uid` varchar(32) NOT NULL COMMENT '用户id',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` char(64) NOT NULL COMMENT '密码',
  `salt` char(36) DEFAULT NULL COMMENT '盐值',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `gender` int(1) DEFAULT NULL COMMENT '性别 0-女 1-男',
  `is_delete` int(1) DEFAULT NULL COMMENT '是否标记为删除',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `unique_name` (`username`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_user
-- ----------------------------
INSERT INTO `m_user` VALUES ('0e447e14e0f14929bade5cb0d96641da', 'hy', 'AF6C3C689062B16631A5602AED32A7C4311A59DC7CA0C1E4DCA80EFE', 'AF6C3C689062B16631A5602A', null, '0', null);
INSERT INTO `m_user` VALUES ('10', 'ltt', '84D8C3786128593569330743C3BB5D7A926422E862C2E20A4602FF45', '84D8C3786128593569330743', null, '0', '1');
INSERT INTO `m_user` VALUES ('12', 'lt2', 'bbb', 'bbb', '22222222222', '0', '1');
INSERT INTO `m_user` VALUES ('19', 'tl', 'aaa', 'aaa', '11111111111', '1', null);
INSERT INTO `m_user` VALUES ('21d11e9468914ae7ace2e4236e893a64', '123', '206ACCAAB95EC6BCC25FF042ADDEB957C63F2D26AAF4980C6510C47F', '206ACCAAB95EC6BCC25FF042', null, '0', null);
INSERT INTO `m_user` VALUES ('25e0e829f00c403286d0af82ee21f88a', 'litong', 'A9D40177556374E5D060E11220BBEC6985759419A6913E2503CDEA49', 'A9D40177556374E5D060E112', null, '0', null);
INSERT INTO `m_user` VALUES ('6dd8c881268b40fb8d1e895a9dd7a574', 'Timao', '901B4B4401392D3803CAB33DB05AC7106C68CB834C70C7AF26D5F76F', '901B4B4401392D3803CAB33D', '15918866666', '1', null);
INSERT INTO `m_user` VALUES ('8fc2c4a6bd2a4e8db4630fc3fc9bc052', 'tianjiabo', 'D797DE8A73DCCE5D385AF4A30CCFE9B1212CE07A9D1406AFC424A956', 'D797DE8A73DCCE5D385AF4A3', '13600000111', '1', null);
INSERT INTO `m_user` VALUES ('9297eac068274d2989bafac43cf59728', 'Timao1', '163ABAEDC7EAE1F11702B154B8D4BD0C4636A72A51D39989B5D205ED', '163ABAEDC7EAE1F11702B154', '13600000000', '1', null);
INSERT INTO `m_user` VALUES ('96861bec4e6b441b8f7771deb7f08883', 'litong4', '92F44BCDBAC013A6C685CAF47E046D76C735445400C0794800B2D0BE', '92F44BCDBAC013A6C685CAF4', '13600000000', '0', null);
INSERT INTO `m_user` VALUES ('a3485ed4c9cc43d3a1970c3cc230f6ef', 'litong2', 'B6E3BEDEC025A783F8956B97CD43EF60F24B992CCF635C3FF146CB9E', 'B6E3BEDEC025A783F8956B97', null, '0', null);
INSERT INTO `m_user` VALUES ('ac40ae6336444fcda0703a123731a9a0', 'kongbao', '197D740D9B17DE49BD21BAFAE8E4B4A4B684D5EA6E6007EC150FDBD2', '197D740D9B17DE49BD21BAFA', null, '0', null);
INSERT INTO `m_user` VALUES ('bdd2df1fd30943eb89872670c9980914', 'litong3', 'A714A6343A702EA992D61FC81AE3AFDF4AF31E83686984BC7FF2061D', 'A714A6343A702EA992D61FC8', null, '0', null);
