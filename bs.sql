/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : bs

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-17 16:53:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `EquipmentId` int(100) NOT NULL AUTO_INCREMENT,
  `EquipmentClassId` int(100) DEFAULT NULL,
  `SupplierBrandId` int(100) DEFAULT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EquipmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('1', '2', '4', 'DES-1050G', '友讯DES-1050G交换机', '百兆48口');
INSERT INTO `equipment` VALUES ('2', '4', '5', 'DL388Gen9 E5-2603V4 8GB P440ar 827009-AA1', 'HP/惠普服务器DL388Gen9 E5-2603V4 8GB P440ar 827009-AA1', '机架式服务器');
INSERT INTO `equipment` VALUES ('3', '4', '5', 'ML10V2 志强E3-12', 'HP惠普塔式服务器ML10V2 志强E3-12', '塔式服务器');
INSERT INTO `equipment` VALUES ('4', '4', '6', '6850K/TITAN', '栖息地6850K/TITAN', '人工智能机单路图形工作站服务器');
INSERT INTO `equipment` VALUES ('5', '2', '7', 'S1700-8G-AC', '华为S1700-8G-AC', '华为8口千兆交换机');
INSERT INTO `equipment` VALUES ('6', '2', '7', 'S1700-24GR-AC', '华为 S1700-24GR-AC', '24口全千兆企业级网络/监控无网管网络交换机');
INSERT INTO `equipment` VALUES ('7', '5', '7', 'AP5030DN-S-DC', '华为AP5030DN-S-DC', '一体双频千兆无线AP');
INSERT INTO `equipment` VALUES ('8', '5', '7', 'AC6005-8-8AP', '华为AC6005-8-8AP', '含8AP授权AC控制器');
INSERT INTO `equipment` VALUES ('9', '6', '10', 'i5-7400', '戴尔(DELL)灵越3668台式电脑i5-7400', '8G 1T 2G独显');
INSERT INTO `equipment` VALUES ('10', '6', '11', 'i3-7100', '惠普i3-7100', '8G 1TB 集显');
INSERT INTO `equipment` VALUES ('11', '11', '7', 'S1700-8G-AC', '华为企业交换机分流器网线分线器 S1700-8G-AC 8口千兆塑料壳', '8口千兆塑料壳');

-- ----------------------------
-- Table structure for equipmentclass
-- ----------------------------
DROP TABLE IF EXISTS `equipmentclass`;
CREATE TABLE `equipmentclass` (
  `EquipmentClassId` int(100) NOT NULL AUTO_INCREMENT,
  `EquipmentRootId` int(100) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EquipmentClassId`),
  KEY `Class_RootId` (`EquipmentRootId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equipmentclass
-- ----------------------------
INSERT INTO `equipmentclass` VALUES ('1', '1', '理线架', '理线架');
INSERT INTO `equipmentclass` VALUES ('2', '2', '交换机', '交换机');
INSERT INTO `equipmentclass` VALUES ('3', '2', '路由器', '路由器');
INSERT INTO `equipmentclass` VALUES ('4', '3', '服务器', '服务器');
INSERT INTO `equipmentclass` VALUES ('5', '3', 'AP', 'AP');
INSERT INTO `equipmentclass` VALUES ('6', '3', 'PC', 'PC');
INSERT INTO `equipmentclass` VALUES ('7', '3', '打印机', '打印机');
INSERT INTO `equipmentclass` VALUES ('8', '1', '机柜', '机柜');
INSERT INTO `equipmentclass` VALUES ('9', '1', '空调', '空调');
INSERT INTO `equipmentclass` VALUES ('10', '2', '中继器', '中继器');
INSERT INTO `equipmentclass` VALUES ('11', '2', '集线器', '集线器');

-- ----------------------------
-- Table structure for equipmentroot
-- ----------------------------
DROP TABLE IF EXISTS `equipmentroot`;
CREATE TABLE `equipmentroot` (
  `EquipmentRootId` int(100) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EquipmentRootId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equipmentroot
-- ----------------------------
INSERT INTO `equipmentroot` VALUES ('1', '网络基础设施', '网络组网中基础设备，不具有网络管理功能。');
INSERT INTO `equipmentroot` VALUES ('2', '网络互联设备', '网络交换机、防火墙、路由器等；主要是在物理或者逻辑层级具有上、下行线路连接的设备。');
INSERT INTO `equipmentroot` VALUES ('3', '网络终端设备', '没有下行线路连接， 配有IP或者信号线，依托网络发挥作用的设备。');

-- ----------------------------
-- Table structure for projectfundsource
-- ----------------------------
DROP TABLE IF EXISTS `projectfundsource`;
CREATE TABLE `projectfundsource` (
  `ProjectFundSourceId` int(100) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `HowMuch` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `ProjectId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProjectFundSourceId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projectfundsource
-- ----------------------------
INSERT INTO `projectfundsource` VALUES ('1', '树人大学财务处', '150000', '校财务处资金支持', '2018040901');
INSERT INTO `projectfundsource` VALUES ('2', '财务处', '200000', '.', '20180511');
INSERT INTO `projectfundsource` VALUES ('3', '董事会支持', '100000', '董事会支持', '2018041502');
INSERT INTO `projectfundsource` VALUES ('4', '校财务处', '100000', '校财务处', '2018041502');
INSERT INTO `projectfundsource` VALUES ('5', '校财务处', '200000', '123', '2018051301');

-- ----------------------------
-- Table structure for projectinfo
-- ----------------------------
DROP TABLE IF EXISTS `projectinfo`;
CREATE TABLE `projectinfo` (
  `ProjectId` varchar(100) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Overview` varchar(255) DEFAULT NULL,
  `PurchaseNumber` varchar(255) DEFAULT NULL,
  `UserId` int(100) DEFAULT NULL,
  `Performer` varchar(255) DEFAULT NULL,
  `ContractCode` varchar(255) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `CompleteDate` datetime DEFAULT NULL,
  `State` int(100) DEFAULT NULL,
  PRIMARY KEY (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projectinfo
-- ----------------------------
INSERT INTO `projectinfo` VALUES ('2018040901', '2018040901网络设备采购计划', '采购服务器5台，路由器10台，AP若干', 'PR180510', '2', '李海', 'PC0510', '2018-05-10 21:01:56', '2018-05-11 20:29:32', '1');
INSERT INTO `projectinfo` VALUES ('2018041502', '2018041502机房采购', '采购交换机、路由器若干', 'PR0513', '3', '王凤', 'PC0513', '2018-05-12 23:41:53', '2018-05-13 08:55:25', '1');
INSERT INTO `projectinfo` VALUES ('20180511', '0511设备采购', '服务器10台', 'PR05121', '2', '李海', 'PC0512 1', '2018-05-12 16:13:22', null, '0');
INSERT INTO `projectinfo` VALUES ('2018051301', '2018051301答辩', '答辩', '123', '3', '王凤', '123', '2018-05-13 08:58:37', null, '0');

-- ----------------------------
-- Table structure for projectreply
-- ----------------------------
DROP TABLE IF EXISTS `projectreply`;
CREATE TABLE `projectreply` (
  `ProjectReplyId` varchar(100) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Overview` varchar(255) DEFAULT NULL,
  `UserId` int(100) DEFAULT NULL,
  `Performer` varchar(255) DEFAULT NULL,
  `HowMuch` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `State` int(100) DEFAULT NULL,
  `Approver1` varchar(255) DEFAULT NULL,
  `Approver2` varchar(255) DEFAULT NULL,
  `SubmitDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ProjectReplyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projectreply
-- ----------------------------
INSERT INTO `projectreply` VALUES ('2018030501', '2018030501机房采购', '采购PC50台，打印机若干', '3', '王凤', '30000', '完成机房B2-605建设', '4', '李四', '张三', '2018-03-05 19:14:38');
INSERT INTO `projectreply` VALUES ('2018040901', '2018040901网络设备采购计划', '采购服务器5台，路由器10台，AP若干', '2', '李海', '150000', '网络设备采购。', '3', '李四', '张三', '2018-04-09 19:11:14');
INSERT INTO `projectreply` VALUES ('2018041501', '2018041501机房采购', '采购交换机、路由器若干', '3', '王凤', '10000', '替换机房损坏网络设备。', '2', '李四', null, '2018-04-15 19:18:55');
INSERT INTO `projectreply` VALUES ('2018041502', '2018041502机房采购', '采购交换机、路由器若干', '3', '王凤', '10000', '替换机房损坏网络设备。', '3', '李四', '张三', '2018-04-15 19:19:13');
INSERT INTO `projectreply` VALUES ('2018050701', '2018050701机房维护采购', '采购PC50台，打印机若干，路由器若干', '2', '李海', '30000', '替换机房损坏网络设备。', '2', '李四', null, '2018-05-07 19:21:34');
INSERT INTO `projectreply` VALUES ('2018050702', '2018050702机房维护采购', '采购PC50台，打印机若干，路由器若干', '2', '李海', '30000', '替换机房损坏网络设备。', '4', '李四', '张三', '2018-05-07 19:21:41');
INSERT INTO `projectreply` VALUES ('2018050703', '2018050703机房维护采购', '采购PC50台，打印机若干，路由器若干', '2', '李海', '30000', '替换机房损坏网络设备。', '4', '李四', '张三', '2018-05-07 19:21:52');
INSERT INTO `projectreply` VALUES ('2018050704', '2018050704机房维护采购', '采购PC50台，打印机若干，路由器若干', '2', '李海', '30000', '替换机房损坏网络设备。', '3', '李四', '张三', '2018-05-07 19:21:59');
INSERT INTO `projectreply` VALUES ('2018051001', '2018051001网络设备采购计划', '采购服务器5台，交换机10台', '2', '李海', '100000', '采购网络设备，完成机房建设。', '3', '李四', '张三', '2018-05-10 18:41:09');
INSERT INTO `projectreply` VALUES ('20180511', '0511设备采购', '服务器10台', '2', '李海', '500000', '服务器10台', '3', '李四', '张三', '2018-05-11 19:04:31');
INSERT INTO `projectreply` VALUES ('2018051301', '2018051301答辩', '答辩', '3', '王凤', '200000', '1122', '3', '李四', '张三', '2018-05-13 08:56:40');

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `PurchaseId` int(100) NOT NULL AUTO_INCREMENT,
  `PurchaseNumber` varchar(100) DEFAULT NULL,
  `EquipmentId` int(100) DEFAULT NULL,
  `Num` int(100) DEFAULT NULL,
  `Price` float(50,2) DEFAULT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `SupplierId` int(100) DEFAULT NULL,
  PRIMARY KEY (`PurchaseId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase
-- ----------------------------
INSERT INTO `purchase` VALUES ('1', 'PR180510', '5', '10', '2000.00', '2', '3');
INSERT INTO `purchase` VALUES ('2', 'PR180510', '3', '5', '10000.00', '2', '2');
INSERT INTO `purchase` VALUES ('3', 'PR180510', '7', '20', '2000.00', '2', '3');
INSERT INTO `purchase` VALUES ('4', 'PR0513', '2', '10', '20000.00', '3', '2');
INSERT INTO `purchase` VALUES ('5', '123', '2', '20', '1000.00', '3', '2');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `ScheduleId` int(100) NOT NULL AUTO_INCREMENT,
  `ProjectId` varchar(255) DEFAULT NULL,
  `Overview` varchar(255) DEFAULT NULL,
  `PlanDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `RealDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `State` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ScheduleId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('1', '2018040901', '项目启动', '2018-05-10 21:19:33', '2018-04-09 00:00:00', '0');
INSERT INTO `schedule` VALUES ('2', '2018040901', '供应商的选择和询报价', '2018-05-10 21:19:42', '2018-04-12 00:00:00', '0');
INSERT INTO `schedule` VALUES ('3', '2018040901', '确定供应商和价格', '2018-05-10 21:19:52', '2018-05-14 00:00:00', '0');
INSERT INTO `schedule` VALUES ('4', '2018040901', '合同签订', '2018-05-10 21:20:10', '2018-04-16 00:00:00', '0');
INSERT INTO `schedule` VALUES ('5', '2018040901', '合同执行', '2018-05-10 21:20:20', '2018-04-18 00:00:00', '0');
INSERT INTO `schedule` VALUES ('6', '2018040901', '价款结算', '2018-05-10 21:20:26', '2018-05-20 00:00:00', '0');
INSERT INTO `schedule` VALUES ('7', '2018040901', '项目完成', '2018-05-10 21:21:46', '2018-04-21 00:00:00', '0');
INSERT INTO `schedule` VALUES ('8', '2018041502', '项目启动', '2018-05-12 00:00:00', null, null);
INSERT INTO `schedule` VALUES ('9', '2018041502', '项目结束', '2018-05-15 00:00:00', null, null);
INSERT INTO `schedule` VALUES ('10', '2018051301', '项目启动', '2018-05-13 08:59:37', '2018-05-14 00:00:00', '1');

-- ----------------------------
-- Table structure for summary
-- ----------------------------
DROP TABLE IF EXISTS `summary`;
CREATE TABLE `summary` (
  `SummaryId` int(100) NOT NULL AUTO_INCREMENT,
  `ProjectId` varchar(255) DEFAULT NULL,
  `SummaryContent` varchar(255) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `Submitter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SummaryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of summary
-- ----------------------------

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `SupplierId` int(100) NOT NULL AUTO_INCREMENT,
  `SupplierTypeId` int(100) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Tel` varchar(255) DEFAULT NULL,
  `ManagementContent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupplierId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '2', '广州五洋信息有限公司', '广州市天河区', '18922463033', '交换机销售');
INSERT INTO `supplier` VALUES ('2', '2', '深圳市天源腾创科技有限公司', '深圳市福田区', '13554950489', '服务器销售');
INSERT INTO `supplier` VALUES ('3', '3', '翔数数码专营店', '杭州滨江区', '18268546157', '网络设备销售');
INSERT INTO `supplier` VALUES ('4', '3', '企鸣数码专营店', '杭州萧山区', '18269874568', '网络设备销售');

-- ----------------------------
-- Table structure for supplierbrand
-- ----------------------------
DROP TABLE IF EXISTS `supplierbrand`;
CREATE TABLE `supplierbrand` (
  `SupplierBrandId` int(100) NOT NULL AUTO_INCREMENT,
  `SupplierId` int(100) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupplierBrandId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplierbrand
-- ----------------------------
INSERT INTO `supplierbrand` VALUES ('2', '1', 'Cisco/思科');
INSERT INTO `supplierbrand` VALUES ('3', '1', 'Tenda/腾达');
INSERT INTO `supplierbrand` VALUES ('4', '1', 'D-Link/友讯');
INSERT INTO `supplierbrand` VALUES ('5', '2', 'HP/惠普');
INSERT INTO `supplierbrand` VALUES ('6', '2', 'MSI/微星');
INSERT INTO `supplierbrand` VALUES ('7', '3', 'Huawei/华为');
INSERT INTO `supplierbrand` VALUES ('8', '3', 'Dell/戴尔');
INSERT INTO `supplierbrand` VALUES ('9', '3', 'Intel/英特尔');
INSERT INTO `supplierbrand` VALUES ('10', '4', 'Dell/戴尔');
INSERT INTO `supplierbrand` VALUES ('11', '4', 'HP/惠普');
INSERT INTO `supplierbrand` VALUES ('12', '4', 'Lenovo/联想');

-- ----------------------------
-- Table structure for supplierstaff
-- ----------------------------
DROP TABLE IF EXISTS `supplierstaff`;
CREATE TABLE `supplierstaff` (
  `SupplierStaffId` int(100) NOT NULL AUTO_INCREMENT,
  `SupplierId` int(100) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Num` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Tel` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupplierStaffId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplierstaff
-- ----------------------------
INSERT INTO `supplierstaff` VALUES ('1', '1', '方笑', '201405019311', 'fangxiao@163.com', '18647789641', '销售联系人');
INSERT INTO `supplierstaff` VALUES ('2', '1', '张晓', '201405019312', 'zhangxiao@163.com', '16457851359', '后勤维修联系人');
INSERT INTO `supplierstaff` VALUES ('3', '2', '李明', '201207028511', 'liming@163.com', '16847789564', '销售联系人');
INSERT INTO `supplierstaff` VALUES ('4', '2', '季方', '201305019321', 'jifang@qq.com', '18156647851', '后勤维修联系人');
INSERT INTO `supplierstaff` VALUES ('5', '3', '萧离', '201105019306', 'xiaoli@163.com', '14578896561', '后勤维修联系人');
INSERT INTO `supplierstaff` VALUES ('6', '3', '张丹', '201105069321', 'zhangdan@163.com', '1655448998', '销售联系人');
INSERT INTO `supplierstaff` VALUES ('7', '4', '刘星', '201405069871', 'liuxing@163.com', '18456759981', '销售联系人');
INSERT INTO `supplierstaff` VALUES ('8', '4', '杨业', '201505019302', 'yangye@163.com', '18546788514', '后勤维修联系人');

-- ----------------------------
-- Table structure for suppliertype
-- ----------------------------
DROP TABLE IF EXISTS `suppliertype`;
CREATE TABLE `suppliertype` (
  `SupplierTypeId` int(100) NOT NULL AUTO_INCREMENT,
  `SupplierTypeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupplierTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suppliertype
-- ----------------------------
INSERT INTO `suppliertype` VALUES ('1', '厂家');
INSERT INTO `suppliertype` VALUES ('2', '集成商');
INSERT INTO `suppliertype` VALUES ('3', '用户单位');

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `TeamId` int(100) NOT NULL AUTO_INCREMENT,
  `ProjectId` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Tel` varchar(255) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TeamId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('1', '2018040901', '黄易', '18654479581', '供应商询价人员');
INSERT INTO `team` VALUES ('2', '2018040901', '吴峰', '18654785164', '收货人员');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `UserId` int(100) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Sex` int(100) DEFAULT NULL,
  `Age` int(100) DEFAULT NULL,
  `Tel` varchar(255) DEFAULT NULL,
  `Power` int(100) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'admin', '123', '管理员', '1', '30', '18268825506', '0');
INSERT INTO `userinfo` VALUES ('2', 'sy123', '123', '李海', '1', '22', '18268825505', '1');
INSERT INTO `userinfo` VALUES ('3', 'qwe123', '123', '王凤', '0', '30', '18268545459', '1');
INSERT INTO `userinfo` VALUES ('4', 'asd123', '123', '张三', '1', '33', '18268825614', '3');
INSERT INTO `userinfo` VALUES ('5', 'zxc123', '123', '李四', '1', '28', '18658749871', '2');
