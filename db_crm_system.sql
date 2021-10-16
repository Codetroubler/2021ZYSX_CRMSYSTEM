/*
 Navicat MySQL Data Transfer

 Source Server         : MyLocalhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : db_crm_system

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 13/10/2021 20:38:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for crm_contact
-- ----------------------------
DROP TABLE IF EXISTS `crm_contact`;
CREATE TABLE `crm_contact`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '联系人主键ID',
  `c_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `c_sex` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '先生' COMMENT '性别',
  `c_department` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `c_position` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `c_birthday` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `c_tel` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `c_email` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `c_mob` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `c_qq` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `c_address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `c_hobby` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `c_remarks` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `c_customerid` int(8) NULL DEFAULT NULL COMMENT 'FK客户ID FK',
  `c_createid` int(8) NULL DEFAULT NULL COMMENT '创建人ID FK',
  `c_createdate` date NULL DEFAULT NULL COMMENT '创建日期',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_crm_contact`(`c_customerid`) USING BTREE,
  INDEX `c_createid`(`c_createid`) USING BTREE,
  CONSTRAINT `crm_contact_ibfk_1` FOREIGN KEY (`c_customerid`) REFERENCES `crm_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contact_ibfk_2` FOREIGN KEY (`c_createid`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_contact
-- ----------------------------
INSERT INTO `crm_contact` VALUES (1, '阳芷', '女士', '总经办', '总裁', '1999-05-10', '0917-8311612', 'stnc@163.com', '18710671549', '24464636', '甘肃省', '吃喝玩  haha ', '京东', 3, 4, '2014-09-13', 1, NULL);
INSERT INTO `crm_contact` VALUES (2, '阳漂亮', '女士', '二蛋', '公务员', '1999-05-09', '0917-8224692', 'wwww@163.com', '18700765273', '189984562', '威海', '吃喝玩dsadadasd', '淘宝', 3, 4, '2014-09-13', 1, NULL);
INSERT INTO `crm_contact` VALUES (3, '任逸航', '先生', '片王', '员工', '1995-06-15', '0917-8213872', 'dsaad@163.com', '18791770451', '24464636', '山东', '吃喝玩佛挡杀佛第三方', '货拉拉', 3, 4, '2014-09-13', 1, NULL);
INSERT INTO `crm_contact` VALUES (4, '阳美丽', '女士', '三哥', '员工', '1990-05-09', '0917-6462582', '54fsdafa@163.com', '18791385356', '56484516565', '新疆', '吃喝玩DSAFSDAF', '豌豆公主', 3, 4, '2014-09-13', 1, NULL);
INSERT INTO `crm_contact` VALUES (5, '陈洪海', '先生', '新东方', 'CEO', '1980-01-15', '029-81109822', 'yuminghun@.163.com', '18710722981', '231543543', '北京----------', 'hobby 讲课', '毒', 6, NULL, '2015-01-09', 1, NULL);
INSERT INTO `crm_contact` VALUES (6, '熊浩民', '先生', '总经办', 'CTO', '2015-01-09', '029-89745614', '146546@qq.com', '19465812357', '1234567890', '西安', '唱歌 跳舞', '拼多多', 4, NULL, '2015-01-09', 1, NULL);
INSERT INTO `crm_contact` VALUES (7, '阳帅帅', '先生', '财务部', '总经理', '2018-09-04', '021-8787878', '111@QQ.com', '13333333333', '168782656', '地中海', '佛挡杀佛', '德玛西亚', 7, NULL, '2018-09-26', 1, NULL);
INSERT INTO `crm_contact` VALUES (8, '阳阳', '先生', '董事会', '董事局主席', '1960-03-03', '010-1100021', 'llqqxf@163.com', '13661616161', '666', '杭州', '吹牛', '阿里巴巴', 8, NULL, '2018-10-09', 1, NULL);

-- ----------------------------
-- Table structure for crm_contract
-- ----------------------------
DROP TABLE IF EXISTS `crm_contract`;
CREATE TABLE `crm_contract`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '合同主键PK ID',
  `contract_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同名称',
  `serialnumber` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `customer_id` int(8) NULL DEFAULT NULL COMMENT '客户ID Fk',
  `c_depid` int(8) NULL DEFAULT NULL COMMENT '促进部门ID Fk',
  `c_empid` int(8) NULL DEFAULT NULL COMMENT '促进人ID FK',
  `contract_amount` double NULL DEFAULT NULL COMMENT '合同金额',
  `pay_cycle` int(8) NULL DEFAULT NULL COMMENT '付款期数',
  `start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `sign_date` date NULL DEFAULT NULL COMMENT '签定日期',
  `customer_contractor` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户定约人',
  `our_contractor_depid` int(8) NULL DEFAULT NULL COMMENT '我们签定负责部门ID Fk',
  `our_contractor_id` int(8) NULL DEFAULT NULL COMMENT '我们签订负责人ID FK',
  `creater_id` int(8) NULL DEFAULT NULL COMMENT '创建人ID  Fk',
  `create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `main_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '合同主体条款',
  `remarks` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注内容',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  INDEX `c_depid`(`c_depid`) USING BTREE,
  INDEX `c_empid`(`c_empid`) USING BTREE,
  INDEX `our_contractor_depid`(`our_contractor_depid`) USING BTREE,
  INDEX `our_contractor_id`(`our_contractor_id`) USING BTREE,
  INDEX `creater_id`(`creater_id`) USING BTREE,
  CONSTRAINT `crm_contract_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `crm_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contract_ibfk_2` FOREIGN KEY (`c_depid`) REFERENCES `hr_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contract_ibfk_3` FOREIGN KEY (`c_empid`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contract_ibfk_4` FOREIGN KEY (`our_contractor_depid`) REFERENCES `hr_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contract_ibfk_5` FOREIGN KEY (`our_contractor_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_contract_ibfk_6` FOREIGN KEY (`creater_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_contract
-- ----------------------------
INSERT INTO `crm_contract` VALUES (1, '租房12132', '121222', 1, 1, 1, 22110.22, 12, '2019-12-07', '2020-12-06', '2020-12-08', 'dfdf2dasdad', 2, 2, 1, NULL, '的撒发送到范德萨发大水发的是范德萨是的@', '阿打发的手法十分同意后符合规范化@', 1, NULL);
INSERT INTO `crm_contract` VALUES (2, '租房2', '121', 1, 2, 2, 1, 1, '2020-12-04', '2021-01-05', '2020-12-02', 'dfdf', 2, 2, 1, '2014-12-12', '的撒发送到范德萨发大水发的是范德萨是的', '阿打发的手法十分同意后符合规范化', 0, '2018-10-09');
INSERT INTO `crm_contract` VALUES (3, '租房3', '121', 1, 2, 2, 1, 1, '2020-12-04', '2021-02-05', '2020-12-02', 'dfdf', 4, 4, 1, '2014-12-12', '的撒发送到范德萨发大水发的是范德萨是的', '阿打发的手法十分同意后符合规范化', 1, NULL);
INSERT INTO `crm_contract` VALUES (4, 'namecontract', '1212313', 1, 2, 2, 111111, 22, '2020-01-05', '2021-03-07', '2020-01-08', 'KKKKF', 1, 1, NULL, '2015-01-07', 'pppppppppppppppppppppppppppppp', 'wwwwwwwwwwwwwwwwwwwwwww', 1, NULL);
INSERT INTO `crm_contract` VALUES (5, 'ccccccc', '12132131', 1, 4, 4, 22, 11, '2020-01-01', '2021-04-02', '2020-01-03', 'QQQQ', 1, 1, NULL, '2015-01-07', 'DDDDDDDDDDDDD', 'AAAAAAAAAAAAAAAAAAAAA', 1, NULL);
INSERT INTO `crm_contract` VALUES (6, '测试合同', '021212121212', 2, 4, 4, 125666, 2, '2020-10-09', '2021-06-10', '2018-10-09', '李四', 4, 4, NULL, '2018-10-09', '哈哈哈', '备注', 1, NULL);

-- ----------------------------
-- Table structure for crm_customer
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer`;
CREATE TABLE `crm_customer`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '客户表主键 PK',
  `serialnumber` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户序列号',
  `customer` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `tel` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司电话',
  `site` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司网止',
  `provinces_id` int(8) NULL DEFAULT NULL COMMENT '公司省份ID Fk',
  `city_id` int(8) NULL DEFAULT NULL COMMENT '公司城市ID FK',
  `customerindustry_id` int(8) NULL DEFAULT NULL COMMENT '所属行业外键 FK',
  `customertype_id` int(8) NULL DEFAULT NULL COMMENT '公司客户类型ID FK',
  `customerlevel_id` int(8) NULL DEFAULT NULL COMMENT '公司客户等级ID Fk',
  `customersource_id` int(8) NULL DEFAULT NULL COMMENT '公司客户来源渠道　Fk',
  `descripe` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户描述',
  `remarks` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备  注',
  `department_id` int(8) NULL DEFAULT NULL COMMENT '负责部门ID FK',
  `employee_id` int(8) NULL DEFAULT NULL COMMENT '负责员工ID　FK',
  `privatecustomer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司客户状态值有（公客／私客）',
  `lastfollow` date NULL DEFAULT NULL COMMENT '最后一次跟进时间',
  `create_id` int(8) NULL DEFAULT NULL COMMENT '创建人id　FK',
  `create_date` date NULL DEFAULT NULL COMMENT '创建时间',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_crm_customer_customer`(`customer`) USING BTREE,
  INDEX `ix_crm_customer_lastfollow`(`lastfollow`) USING BTREE,
  INDEX `ix_crm_customer_private`(`privatecustomer`) USING BTREE,
  INDEX `ix_crm_customer_tel`(`tel`) USING BTREE,
  INDEX `provinces_id`(`provinces_id`) USING BTREE,
  INDEX `city_id`(`city_id`) USING BTREE,
  INDEX `customertype_id`(`customertype_id`) USING BTREE,
  INDEX `customerlevel_id`(`customerlevel_id`) USING BTREE,
  INDEX `customersource_id`(`customersource_id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  INDEX `employee_id`(`employee_id`) USING BTREE,
  INDEX `create_id`(`create_id`) USING BTREE,
  INDEX `customerindustry_id`(`customerindustry_id`) USING BTREE,
  CONSTRAINT `crm_customer_ibfk_1` FOREIGN KEY (`provinces_id`) REFERENCES `param_city` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_customer_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `param_city` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_customer_ibfk_3` FOREIGN KEY (`customertype_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_customer_ibfk_4` FOREIGN KEY (`customerlevel_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_customer_ibfk_5` FOREIGN KEY (`customersource_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_customer_ibfk_6` FOREIGN KEY (`department_id`) REFERENCES `hr_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_customer_ibfk_7` FOREIGN KEY (`employee_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_customer_ibfk_8` FOREIGN KEY (`create_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_customer_ibfk_9` FOREIGN KEY (`customerindustry_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_customer
-- ----------------------------
INSERT INTO `crm_customer` VALUES (1, '1', '西安交大', '西安市长安路', '029-93110141', 'wwww.jindie.com', 12, 201, 33, 2, 4, 7, '阿斯顿发大发大的撒大大大苏打', '阿斯顿发的撒倒萨哒哒哒1321312', 1, 1, '公客', '2014-12-02', 1, '2014-12-01', 1, NULL);
INSERT INTO `crm_customer` VALUES (2, '2', '西安肉夹馍', '西安市', '029-89123112', 'wwww.sdads.com', 17, 293, 34, 1, 6, 8, '阿3213斯顿发大发大222222222', '阿3213斯顿发的撒123', 4, 4, '私客', '2014-12-02', 1, '2014-12-01', 1, NULL);
INSERT INTO `crm_customer` VALUES (3, '3', '西安欧畅', '西安', '029-89432282', 'wwww.ouchang.com', 3, 73, 41, 1, 5, 10, '阿斯1222222222222顿发大发大', '阿斯顿2222222222222222发的撒', 2, 2, '私客', '2014-12-02', 1, '2014-12-01', 1, NULL);
INSERT INTO `crm_customer` VALUES (4, '4', '辉辉制药', '黑龙江', '029-89444112', 'wwww.huihui.com', 5, 107, 38, 3, 4, 9, '阿斯23eqw21发大发大dsad', '阿斯WAFDA顿fsadfasf发的撒', 4, 4, '公客', '2014-12-02', 1, '2014-12-01', 1, NULL);
INSERT INTO `crm_customer` VALUES (6, '5', '新东方', '西安西郊', '029-89425112', 'www.xindf.com', 13, 217, 39, 2, 5, 8, '的撒旦看看对方；联发科；打开；高考房', '带来可观的发那个肯定是女生看见内需政策', 4, 4, '公客', NULL, NULL, '2015-01-09', 1, NULL);
INSERT INTO `crm_customer` VALUES (7, '6', '软银科技', '佛挡杀佛', '110110110', '东方大厦', 17, 306, 42, 2, 5, 8, '佛挡杀佛但是', '对方的身份', 4, 4, '公客', NULL, NULL, '2018-09-26', 1, NULL);
INSERT INTO `crm_customer` VALUES (8, '7', '阿里巴巴', '杭州西溪湿地', '010-12124545', 'http://taobao.com', 22, 391, 40, 2, 4, 7, '很牛逼的', '阿里巴巴你不知道么', 1, 1, '私客', NULL, NULL, '2018-10-09', 1, NULL);

-- ----------------------------
-- Table structure for crm_follow
-- ----------------------------
DROP TABLE IF EXISTS `crm_follow`;
CREATE TABLE `crm_follow`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '客户跟进主键PK',
  `customer_id` int(8) NOT NULL COMMENT '跟进客户ID FK',
  `follow` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跟进内容',
  `follow_date` date NULL DEFAULT NULL COMMENT '跟进日期',
  `follow_type_id` int(8) NULL DEFAULT NULL COMMENT '跟进方式ID FK',
  `department_id` int(8) NULL DEFAULT NULL COMMENT '部门ID FK',
  `employee_id` int(8) NULL DEFAULT NULL COMMENT '负责员工ID FK',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  INDEX `follow_type_id`(`follow_type_id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  INDEX `employee_id`(`employee_id`) USING BTREE,
  CONSTRAINT `crm_follow_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `crm_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_follow_ibfk_2` FOREIGN KEY (`follow_type_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_follow_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `hr_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_follow_ibfk_4` FOREIGN KEY (`employee_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_follow
-- ----------------------------
INSERT INTO `crm_follow` VALUES (1, 1, '广泛大使馆反对高富帅公司的风格', '2021-02-12', 12, 2, 2, 1, NULL);
INSERT INTO `crm_follow` VALUES (2, 1, '幅度萨芬开裆裤啦附近的价格嘀咕嘀咕嘀咕嘀咕分公司大概多少个', '2021-02-13', 13, 2, 2, 1, NULL);
INSERT INTO `crm_follow` VALUES (5, 1, '看佛经撒都放假哦阿娇发动机风骚非机动', '2021-11-06', 11, 2, 2, 1, NULL);
INSERT INTO `crm_follow` VALUES (6, 1, '佛挡杀佛各个分公司的风格根深蒂固的时光广东省分公司的灌水灌水的广东省分公司分管', '2021-01-09', 12, 1, 1, 1, NULL);
INSERT INTO `crm_follow` VALUES (7, 1, 'fdslkajgkd努力克服克拉的发生你付款了女生开房你受苦了', '2021-01-10', 14, 1, 1, 1, '2020-02-07');
INSERT INTO `crm_follow` VALUES (8, 1, '放到沙发上发呆顺丰萨芬大声说道刚刚发的的法国法国法国大使馆', '2021-01-09', 16, 1, 1, 1, NULL);
INSERT INTO `crm_follow` VALUES (9, 1, '的撒感到翻跟斗', '2021-01-09', 12, 1, 1, 1, '2020-02-07');
INSERT INTO `crm_follow` VALUES (10, 1, '的撒法嘎多个大概嘎嘎大概', '2021-01-14', 13, 1, 1, 1, '2020-02-07');
INSERT INTO `crm_follow` VALUES (11, 1, '大师傅大使馆和规范化的恢复鬼画符的规划', '2021-01-28', 13, 1, 1, 1, '2020-02-07');
INSERT INTO `crm_follow` VALUES (12, 2, '大概多少公分的恢复的好地方共和国的回复和改进改进和国家法规巨化股份', '2021-01-15', 13, 1, 1, 1, NULL);
INSERT INTO `crm_follow` VALUES (13, 2, '发大水发发规范化广泛的好地方规划的风格多发发地方撒发顺丰', '2021-01-16', 14, 1, 1, 1, NULL);
INSERT INTO `crm_follow` VALUES (14, 2, '法大师傅撒旦刚刚发的鬼斧神工第三方工具广东省分公司的公司法规定是高帅富广告费', '2021-01-10', 15, 1, 1, 1, NULL);
INSERT INTO `crm_follow` VALUES (15, 4, '的撒发生发射点发生fda沙发沙发纷纷大幅大使馆反对广泛的高管反倒是', '2021-01-22', 12, 1, 1, 1, NULL);
INSERT INTO `crm_follow` VALUES (16, 1, '犯得上反对广泛大锅饭电话费都很高复古时尚动感3233', '2021-02-28', 16, 1, 1, 1, '2020-02-07');
INSERT INTO `crm_follow` VALUES (17, 7, '同意', '2021-09-28', 12, 1, 1, 0, '2020-09-26');
INSERT INTO `crm_follow` VALUES (18, 6, '打电话问候', '2021-10-09', 13, 1, 1, 1, NULL);
INSERT INTO `crm_follow` VALUES (19, 3, 'ss', '2021-10-10', 12, 1, 1, 1, NULL);
INSERT INTO `crm_follow` VALUES (20, 8, '==', '2021-10-09', 11, 1, 1, 1, NULL);

-- ----------------------------
-- Table structure for crm_invoice
-- ----------------------------
DROP TABLE IF EXISTS `crm_invoice`;
CREATE TABLE `crm_invoice`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '开发表记录表主键 PK',
  `customer_id` int(8) NULL DEFAULT NULL COMMENT '客户公司ID Fk',
  `invoice_num` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票号码',
  `invoice_type_id` int(8) NULL DEFAULT NULL COMMENT '发票类型ID FK',
  `invoice_amount` double NULL DEFAULT NULL COMMENT '发票金额',
  `invoice_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发票内容',
  `invoice_date` date NULL DEFAULT NULL COMMENT '发票日期',
  `c_depid` int(8) NULL DEFAULT NULL COMMENT '负责部门ID FK',
  `c_empid` int(8) NULL DEFAULT NULL COMMENT '负责人ID Fk',
  `create_id` int(8) NULL DEFAULT NULL COMMENT '创建人ID FK',
  `create_date` date NULL DEFAULT NULL COMMENT '创建日期',
  `order_id` int(8) NULL DEFAULT NULL COMMENT '订单ID FK',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  INDEX `invoice_type_id`(`invoice_type_id`) USING BTREE,
  INDEX `c_depid`(`c_depid`) USING BTREE,
  INDEX `c_empid`(`c_empid`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `create_id`(`create_id`) USING BTREE,
  CONSTRAINT `crm_invoice_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `crm_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_invoice_ibfk_2` FOREIGN KEY (`invoice_type_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_invoice_ibfk_3` FOREIGN KEY (`c_depid`) REFERENCES `hr_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_invoice_ibfk_4` FOREIGN KEY (`c_empid`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_invoice_ibfk_5` FOREIGN KEY (`order_id`) REFERENCES `crm_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_invoice_ibfk_6` FOREIGN KEY (`create_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_invoice
-- ----------------------------
INSERT INTO `crm_invoice` VALUES (1, 1, '1145', 22, 4654, '和合法的广泛地地方方的观点施工', '2020-10-10', 4, 4, 2, '2020-11-07', 3, 1, NULL);
INSERT INTO `crm_invoice` VALUES (2, 1, '2145', 22, 4654, '和合法的广泛地地方方的观点施工', '2020-10-08', 2, 1, 2, '2020-11-07', 3, 1, NULL);
INSERT INTO `crm_invoice` VALUES (3, 1, '21452', 21, 4254, '和合法的广泛地地方方的观点施工2', '2020-10-10', 4, 4, 2, '2020-11-07', 3, 1, NULL);
INSERT INTO `crm_invoice` VALUES (4, 1, '11452', 21, 4654, '和合法的广泛地地方方的观点施工1', '2020-10-09', 2, 2, 2, '2020-11-07', 3, 1, NULL);
INSERT INTO `crm_invoice` VALUES (5, 1, '1145', 22, 4654, '和合法的广泛地地方方的观点施工', '2020-10-10', 2, 1, 2, '2020-11-07', 3, 1, NULL);
INSERT INTO `crm_invoice` VALUES (6, 1, '2222222211', 22, 200, '阿巴巴巴b', '2020-01-14', 1, 1, 1, NULL, 3, 1, NULL);
INSERT INTO `crm_invoice` VALUES (7, 6, '234444', 21, 1000, '2水水水水水水水水水水水水水水水水水水水', '2020-01-13', 1, 1, 1, '2020-01-13', 7, 1, NULL);
INSERT INTO `crm_invoice` VALUES (8, 3, '2000', 22, 2000, 'ssssssssss', '2020-01-14', 2, 2, 1, '2020-01-13', 4, 1, NULL);
INSERT INTO `crm_invoice` VALUES (9, 6, '342432523', 21, 112, '大幅度的说法更广泛大概', '2020-02-04', 5, 6, 1, '2020-02-07', 7, 1, NULL);

-- ----------------------------
-- Table structure for crm_order
-- ----------------------------
DROP TABLE IF EXISTS `crm_order`;
CREATE TABLE `crm_order`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '客户订单表主键 Pk',
  `serialnumber` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单序列号',
  `customer_id` int(8) NULL DEFAULT NULL COMMENT '客户公司ID Fk',
  `order_date` date NULL DEFAULT NULL COMMENT '订单日期时间',
  `pay_type_id` int(8) NULL DEFAULT NULL COMMENT '付款方式ID FK',
  `order_details` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '订单详细',
  `order_status_id` int(8) NULL DEFAULT NULL COMMENT '订单状态ID FK',
  `order_amount` double NULL DEFAULT NULL COMMENT '订单金额',
  `create_id` int(8) NULL DEFAULT NULL COMMENT '创建人ID FK',
  `create_date` date NULL DEFAULT NULL COMMENT '创建日期时间',
  `c_dep_id` int(8) NULL DEFAULT NULL COMMENT '促成部门FK',
  `c_emp_id` int(8) NULL DEFAULT NULL COMMENT '促成人员 FK',
  `f_dep_id` int(8) NULL DEFAULT NULL COMMENT '负责部门 FK',
  `f_emp_id` int(8) NULL DEFAULT NULL COMMENT '负责员工 FK',
  `receive_money` double NULL DEFAULT NULL COMMENT '实收金额',
  `arrears_money` double NULL DEFAULT NULL COMMENT '未收金额',
  `invoice_money` double NULL DEFAULT NULL COMMENT '已开票额',
  `arrears_invoice` double NULL DEFAULT NULL COMMENT '未开票额',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  INDEX `pay_type_id`(`pay_type_id`) USING BTREE,
  INDEX `order_status_id`(`order_status_id`) USING BTREE,
  INDEX `c_dep_id`(`c_dep_id`) USING BTREE,
  INDEX `c_emp_id`(`c_emp_id`) USING BTREE,
  INDEX `f_dep_id`(`f_dep_id`) USING BTREE,
  INDEX `f_emp_id`(`f_emp_id`) USING BTREE,
  INDEX `create_id`(`create_id`) USING BTREE,
  CONSTRAINT `crm_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `crm_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_order_ibfk_2` FOREIGN KEY (`pay_type_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_order_ibfk_3` FOREIGN KEY (`order_status_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_order_ibfk_4` FOREIGN KEY (`c_dep_id`) REFERENCES `hr_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_order_ibfk_5` FOREIGN KEY (`c_emp_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_order_ibfk_6` FOREIGN KEY (`f_dep_id`) REFERENCES `hr_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_order_ibfk_7` FOREIGN KEY (`f_emp_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_order_ibfk_8` FOREIGN KEY (`create_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_order
-- ----------------------------
INSERT INTO `crm_order` VALUES (1, '1342', 3, '2021-11-08', 17, '手速21', 23, 1225, 4, '2014-11-23', 2, 4, 1, 1, 222, 1003, 544, 222, 1, NULL);
INSERT INTO `crm_order` VALUES (2, '1342', 4, '2021-11-11', 18, '手速', 20, 1225, 4, '2014-11-23', 2, 4, 2, 2, 400, 825, 544, 222, 1, NULL);
INSERT INTO `crm_order` VALUES (3, '1342', 1, '2021-01-01', 18, '手速', 20, 2835, 4, '2014-11-23', 2, 4, 2, 2, 1111, 1724, 744, 2091, 1, NULL);
INSERT INTO `crm_order` VALUES (4, '23123123', 3, '2021-01-09', 17, '恶法随风倒十分十分士大夫', 23, 42722, 4, '2015-01-08', 2, 2, 4, 4, 12000, 20122, 2000, 30122, 1, '2015-01-12');
INSERT INTO `crm_order` VALUES (5, '23123123', 4, '2021-01-13', 17, '倒萨倒萨多大功夫和对方回复光滑的风格和2222222222', 23, 29150, 4, '2015-01-12', 2, 2, 1, 1, 0, 0, 0, 0, 1, '2015-01-12');
INSERT INTO `crm_order` VALUES (7, '23123123', 6, '2021-01-14', 17, 'fda公司股份公司的分公司分公司鬼斧神工个', 24, 8592, NULL, '2015-01-12', 4, 4, 4, 4, 8529, 63, 1112, 3970, 1, NULL);
INSERT INTO `crm_order` VALUES (8, '', 1, '2021-10-09', 17, '测试订单', 20, 1272, NULL, '2018-10-09', 2, 2, 2, 2, 1272, 0, 0, 0, 1, NULL);

-- ----------------------------
-- Table structure for crm_order_details
-- ----------------------------
DROP TABLE IF EXISTS `crm_order_details`;
CREATE TABLE `crm_order_details`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键 PK',
  `order_id` int(8) NULL DEFAULT NULL COMMENT '对应订单ID Fk',
  `product_id` int(8) NULL DEFAULT NULL COMMENT '对应产品ID Fk',
  `price` double NULL DEFAULT NULL COMMENT '价格',
  `quantity` int(8) NULL DEFAULT NULL COMMENT '数量',
  `unit` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `amount` double NULL DEFAULT NULL COMMENT '合计',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  CONSTRAINT `crm_order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `crm_product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `crm_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_order_details
-- ----------------------------
INSERT INTO `crm_order_details` VALUES (4, 1, 3, 21232, 5, '第三方的说法', 52);
INSERT INTO `crm_order_details` VALUES (6, 1, 10, 231, 22, '倒萨', 5082);
INSERT INTO `crm_order_details` VALUES (7, 1, 9, 231, 31, '山地', 7161);
INSERT INTO `crm_order_details` VALUES (9, 1, 7, 135, 21, '反倒是', 2835);
INSERT INTO `crm_order_details` VALUES (10, 1, 17, 231.11, 11, '科', 2542.21);
INSERT INTO `crm_order_details` VALUES (11, 2, 7, 135, 11, '反倒是', 1485);
INSERT INTO `crm_order_details` VALUES (12, 5, 7, 135, 231, '反倒是', 31185);
INSERT INTO `crm_order_details` VALUES (13, 5, 9, 231, 122, '山地', 28182);
INSERT INTO `crm_order_details` VALUES (14, 5, 17, 231.11, 21, '科', 4853.31);
INSERT INTO `crm_order_details` VALUES (15, 5, 5, 135, 22, '反倒是', 2970);
INSERT INTO `crm_order_details` VALUES (16, 5, 5, 135, 22, '反倒是', 2970);
INSERT INTO `crm_order_details` VALUES (17, 5, 3, 1325, 22, '反倒是3', 29150);
INSERT INTO `crm_order_details` VALUES (18, 7, 10, 231, 22, '倒萨', 5082);
INSERT INTO `crm_order_details` VALUES (19, 3, 5, 135, 21, '反倒是', 2835);
INSERT INTO `crm_order_details` VALUES (20, 7, 7, 135, 21, '反倒是', 2835);
INSERT INTO `crm_order_details` VALUES (21, 7, 5, 135, 5, '反倒是', 675);
INSERT INTO `crm_order_details` VALUES (22, 4, 3, 1325, 8, '反倒是3', 10600);
INSERT INTO `crm_order_details` VALUES (23, 8, 7, 135, 6, '反倒是', 810);
INSERT INTO `crm_order_details` VALUES (24, 8, 9, 231, 2, '山地', 462);

-- ----------------------------
-- Table structure for crm_product
-- ----------------------------
DROP TABLE IF EXISTS `crm_product`;
CREATE TABLE `crm_product`  (
  `product_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '产品ID PK',
  `category_id` int(8) NULL DEFAULT NULL COMMENT '产品分类ID FK',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `specifications` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格说明',
  `status` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `unit` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `remarks` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注解释',
  `price` double NULL DEFAULT NULL COMMENT '价格',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `crm_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `crm_product_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_product
-- ----------------------------
INSERT INTO `crm_product` VALUES (2, 17, '产品1a', '改革法规法规a', '合格', '反倒是a', '二二一样a', 1235, 1, NULL);
INSERT INTO `crm_product` VALUES (3, 12, '产品2', '改革法规法规1a', '合格', '反倒是3', '二二一样gf', 1325, 1, NULL);
INSERT INTO `crm_product` VALUES (4, 8, '产品3', '改革法规法规', '合格', '反倒是', '二二一样', 135, 1, NULL);
INSERT INTO `crm_product` VALUES (5, 11, '产品4', '改革法规法规', '合格', '反倒是', '二二一样', 135, 1, NULL);
INSERT INTO `crm_product` VALUES (6, 8, '产品5', '改革法规法规', '合格', '反倒是', '二二一样', 135, 1, NULL);
INSERT INTO `crm_product` VALUES (7, 9, '产品6', '改革法规法规', '合格', '反倒是', '二二一样', 135, 1, NULL);
INSERT INTO `crm_product` VALUES (8, 10, '产品7', '改革法规法规vcxz', '合格', '反倒是23v', '二二一样vz', 13115, 1, NULL);
INSERT INTO `crm_product` VALUES (9, 10, '产品8', '的萨芬到了沙发上', '合格', '山地', '犯得上发射点发射点', 231, 1, NULL);
INSERT INTO `crm_product` VALUES (10, 10, '产品9', '贵你妹啊  狗比东西', '合格', '倒萨', '擦  擦  擦  擦', 231, 1, NULL);
INSERT INTO `crm_product` VALUES (11, 9, '产品10', '好多个', '合格', '个', '嗯对', 321434, 1, NULL);
INSERT INTO `crm_product` VALUES (12, 9, '产品11', '论斤', '合格', '斤', '21332市场操作下成长', 212, 1, NULL);
INSERT INTO `crm_product` VALUES (13, 9, '产品12', '规格', '合格', '袋', '这个产品部错 ', 123, 1, NULL);
INSERT INTO `crm_product` VALUES (16, 9, '拉拉产品1', '个', NULL, '个', '地洒落的马路', 22.111, 1, NULL);
INSERT INTO `crm_product` VALUES (17, 10, '凤恺', '大士大夫士大夫立刻撒法艰苦拉萨', NULL, '科', '得利卡开始电话卡的vs减肥吧事件发生卡掉了', 231.11, 1, NULL);

-- ----------------------------
-- Table structure for crm_product_category
-- ----------------------------
DROP TABLE IF EXISTS `crm_product_category`;
CREATE TABLE `crm_product_category`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '产品类别ID pk',
  `product_category` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品分类名称',
  `parentid` int(8) NULL DEFAULT NULL COMMENT '父类别ID',
  `product_icon` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父类别产品ICon图标',
  `isdelete` int(8) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  `delete_id` int(1) NULL DEFAULT NULL COMMENT '删除人ID FK',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `delete_id`(`delete_id`) USING BTREE,
  CONSTRAINT `crm_product_category_ibfk_1` FOREIGN KEY (`delete_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_product_category
-- ----------------------------
INSERT INTO `crm_product_category` VALUES (1, 'A类', 0, 'icon-table', 1, NULL, '2015-01-06');
INSERT INTO `crm_product_category` VALUES (2, 'B类', 0, 'icon-table', 1, NULL, '2015-01-05');
INSERT INTO `crm_product_category` VALUES (3, 'C类', 0, 'icon-table', 1, NULL, '2015-01-05');
INSERT INTO `crm_product_category` VALUES (4, 'D类', 0, 'icon-table', 1, NULL, '2015-01-05');
INSERT INTO `crm_product_category` VALUES (5, 'E类', 0, 'icon-table', 1, NULL, '2015-01-05');
INSERT INTO `crm_product_category` VALUES (6, 'F类', 0, 'icon-table', 1, NULL, '2015-01-06');
INSERT INTO `crm_product_category` VALUES (7, 'G类', 0, 'icon-table', 1, NULL, '2015-01-06');
INSERT INTO `crm_product_category` VALUES (8, 'H类', 0, 'icon-table', 1, NULL, '2015-01-06');
INSERT INTO `crm_product_category` VALUES (9, 'I类', 2, 'icon-table', 1, NULL, '2015-01-01');
INSERT INTO `crm_product_category` VALUES (10, 'J类', 4, 'icon-table', 1, NULL, '2015-01-01');
INSERT INTO `crm_product_category` VALUES (11, 'K类', 3, 'icon-table', 1, NULL, '2015-01-01');
INSERT INTO `crm_product_category` VALUES (12, 'L类', 3, 'icon-table', 1, NULL, '2015-01-06');
INSERT INTO `crm_product_category` VALUES (13, '倒萨', 6, 'icon-table', 1, NULL, '2015-01-01');
INSERT INTO `crm_product_category` VALUES (14, 'H类子类', 8, 'icon-table', 1, NULL, '2015-01-05');
INSERT INTO `crm_product_category` VALUES (15, '高房价', 1, 'icon-table', 1, NULL, '2015-01-05');
INSERT INTO `crm_product_category` VALUES (16, '网上', 1, 'icon-table', 1, NULL, '2015-01-06');
INSERT INTO `crm_product_category` VALUES (17, '风扇', 3, 'icon-table', 1, NULL, '2015-01-01');
INSERT INTO `crm_product_category` VALUES (18, '花花', 5, 'icon-table', 1, NULL, '2015-01-05');
INSERT INTO `crm_product_category` VALUES (19, '更换', 1, 'icon-table', 1, NULL, '2015-01-05');
INSERT INTO `crm_product_category` VALUES (20, '额外', 9, 'icon-table', 1, NULL, '2015-01-05');
INSERT INTO `crm_product_category` VALUES (21, '突然', 7, 'icon-table', 1, NULL, '2015-01-05');
INSERT INTO `crm_product_category` VALUES (22, '托运人', 8, 'icon-table', 1, NULL, '2015-01-05');
INSERT INTO `crm_product_category` VALUES (23, '发生', 6, 'icon-table', 1, NULL, '2015-01-05');
INSERT INTO `crm_product_category` VALUES (24, '发射点', 1, 'icon-table', 1, NULL, '2015-01-06');
INSERT INTO `crm_product_category` VALUES (25, '发大水', 9, 'icon-table', 1, NULL, '2015-01-06');
INSERT INTO `crm_product_category` VALUES (26, '飞洒地方', 9, 'icon-table', 1, NULL, '2015-01-06');
INSERT INTO `crm_product_category` VALUES (27, '无法', 8, 'icon-table', 1, NULL, '2015-01-06');
INSERT INTO `crm_product_category` VALUES (28, '官方', 6, 'icon-table', 1, NULL, '2015-01-06');
INSERT INTO `crm_product_category` VALUES (29, '华国锋', 6, 'icon-table', 1, NULL, '2015-01-06');
INSERT INTO `crm_product_category` VALUES (30, '歌单2', 8, 'icon-table', 1, NULL, '2015-01-06');
INSERT INTO `crm_product_category` VALUES (31, 'Q2231@!', 1, 'icon-table', 0, 1, '2018-10-10');

-- ----------------------------
-- Table structure for crm_receive
-- ----------------------------
DROP TABLE IF EXISTS `crm_receive`;
CREATE TABLE `crm_receive`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '收款表ID PK',
  `receive_num` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款号',
  `receive_amount` double NULL DEFAULT NULL COMMENT '收款金额',
  `receive_date` date NULL DEFAULT NULL COMMENT '收款日期',
  `create_date` date NULL DEFAULT NULL COMMENT '创建时间',
  `create_id` int(8) NULL DEFAULT NULL COMMENT '创建人ID FK',
  `order_id` int(8) NULL DEFAULT NULL COMMENT '订单ID FK',
  `receive_direction_id` int(8) NULL DEFAULT NULL COMMENT '收款类别ID FK',
  `receive_type_id` int(8) NULL DEFAULT NULL COMMENT '收款方式ID FK',
  `customer_id` int(8) NULL DEFAULT NULL COMMENT '公司客户ID  FK',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  `c_empid` int(8) NULL DEFAULT NULL COMMENT '负责人ID FK',
  `c_depid` int(8) NULL DEFAULT NULL COMMENT '负责部门ID FK',
  `receive_real` double NULL DEFAULT NULL COMMENT '收款凭证',
  `remarks` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  INDEX `c_depid`(`c_depid`) USING BTREE,
  INDEX `c_empid`(`c_empid`) USING BTREE,
  INDEX `receive_type_id`(`receive_type_id`) USING BTREE,
  INDEX `receive_direction_id`(`receive_direction_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `create_id`(`create_id`) USING BTREE,
  CONSTRAINT `crm_receive_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `crm_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_receive_ibfk_3` FOREIGN KEY (`c_depid`) REFERENCES `hr_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_receive_ibfk_4` FOREIGN KEY (`c_empid`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_receive_ibfk_5` FOREIGN KEY (`receive_type_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_receive_ibfk_6` FOREIGN KEY (`receive_direction_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_receive_ibfk_7` FOREIGN KEY (`order_id`) REFERENCES `crm_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `crm_receive_ibfk_8` FOREIGN KEY (`create_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crm_receive
-- ----------------------------
INSERT INTO `crm_receive` VALUES (1, '1121', 543457, '2021-01-17', '2021-10-09', 1, 2, 44, 17, 1, '2014-10-11', 1, 1, 1, '发生后发的好说话', 1);
INSERT INTO `crm_receive` VALUES (2, '1121', 657567, '2021-01-01', '2021-01-01', 1, 2, 44, 17, 1, '2014-10-11', 1, 1, 1, '发生后发的好说话', 1);
INSERT INTO `crm_receive` VALUES (4, '1121', 2343, '2021-01-17', '2021-01-18', 1, 2, 44, 17, 1, '2014-10-11', 1, 1, 1, '发生后发的好说话', 1);
INSERT INTO `crm_receive` VALUES (5, '32131', 321313, '2020-01-12', '2021-10-09', 2, 2, 44, 19, 1, '2015-01-12', 1, 1, 1, 'hih了就算对方考虑考虑的法律卡萨诺疯狂拉升了肯定是jfk了放假啊十分快乐到家撒付款了', 1);
INSERT INTO `crm_receive` VALUES (6, '2312313', 131, '2020-04-01', '2030-03-01', 1, 2, 45, 18, 1, '2015-01-12', 2, 2, 1, '的撒dads的广泛的更多更多粉丝公司股份的时光', 1);

-- ----------------------------
-- Table structure for hr_department
-- ----------------------------
DROP TABLE IF EXISTS `hr_department`;
CREATE TABLE `hr_department`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '部门主键PK',
  `d_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `parentid` int(8) NULL DEFAULT NULL COMMENT '上级分类ID',
  `d_type_id` int(8) NULL DEFAULT NULL COMMENT '部门类别 FK',
  `d_icon_id` int(8) NULL DEFAULT NULL COMMENT '部门图标 FK',
  `d_employee` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `d_telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `d_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `d_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `d_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `d_order` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门次序',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hr_department_ibfk_1`(`d_type_id`) USING BTREE,
  INDEX `hr_department_ibfk_2`(`d_icon_id`) USING BTREE,
  CONSTRAINT `hr_department_ibfk_1` FOREIGN KEY (`d_type_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hr_department_ibfk_2` FOREIGN KEY (`d_icon_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_department
-- ----------------------------
INSERT INTO `hr_department` VALUES (1, '信息部', 0, 1, 1, '任逸航3', '1346764433', '是否', '250476029@qq.com', NULL, '10', 1, NULL);
INSERT INTO `hr_department` VALUES (2, '财务部', 0, 1, 1, '任逸航2', '1311644655', '搜肠刮肚', '250476029@qq.com', NULL, '20', 1, NULL);
INSERT INTO `hr_department` VALUES (4, '业务部', 0, 1, 1, '任逸航1', '1342222465', '省市发生', '250476029@qq.com', NULL, '20', 1, NULL);
INSERT INTO `hr_department` VALUES (5, '营销部', 0, 1, 1, '任逸航5', '1123432444', '三大方式', '250476029@qq.com', NULL, '10', 1, NULL);
INSERT INTO `hr_department` VALUES (6, '434发多少23', NULL, NULL, NULL, '任逸航', '发多少', '发多呃呃呃', '发多少', '发多少', NULL, 0, '2018-10-10');

-- ----------------------------
-- Table structure for hr_employee
-- ----------------------------
DROP TABLE IF EXISTS `hr_employee`;
CREATE TABLE `hr_employee`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '员工表ID 主键',
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `idcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `dep_id` int(8) NULL DEFAULT NULL COMMENT '部门ID FK',
  `post_id` int(8) NULL DEFAULT NULL COMMENT '岗位ID FK',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `position_id` int(8) NULL DEFAULT NULL COMMENT '职务ID FK',
  `sort` int(8) NULL DEFAULT NULL COMMENT '排序 num',
  `entrydate` date NULL DEFAULT NULL COMMENT '入职日期',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `education` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `level_id` int(8) NULL DEFAULT NULL COMMENT '员工等级 FK',
  `professional` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `schools` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  `portal` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `theme` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '皮肤背景',
  `canlogin` int(8) NULL DEFAULT 0 COMMENT '是否可以登录',
  `role_id` int(8) NULL DEFAULT NULL COMMENT '角色表 ID  FK',
  `layout` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '布局保存',
  `loginoutdate` date NULL DEFAULT NULL COMMENT '注销时间 date',
  `ispost` int(1) NULL DEFAULT 1 COMMENT '是否1在职 0离职',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dep_id`(`dep_id`) USING BTREE,
  INDEX `post_id`(`post_id`) USING BTREE,
  INDEX `position_id`(`position_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `hr_employee_ibfk_4`(`level_id`) USING BTREE,
  CONSTRAINT `hr_employee_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `hr_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hr_employee_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `hr_post` (`post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hr_employee_ibfk_3` FOREIGN KEY (`position_id`) REFERENCES `hr_position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hr_employee_ibfk_4` FOREIGN KEY (`level_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hr_employee_ibfk_5` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_employee
-- ----------------------------
INSERT INTO `hr_employee` VALUES (1, 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '任逸航', '123443434', '1995-03-28', 1, 3, '1075691532@qq.com', '先生', '18710671849', NULL, 1, 10, '2015-01-05', '陕西省宝鸡市', '备注信息1', '本科', 25, '软件工程', '西安文理学院', NULL, 1, '2015-02-01', 'img/upfile/admin.jpg', 'blue', 1, 1, NULL, '2015-01-05', 1);
INSERT INTO `hr_employee` VALUES (2, 'zhaoyang', 'E10ADC3949BA59ABBE56E057F20F883E', '颜值', '231312321', '1995-04-21', 2, 2, 'zhaoyang@qq.com', '先生', '13800012345', NULL, 2, 20, '2015-01-05', '陕西省咸阳市', '备注信息', '专科', 25, '计算机技术', '西安交通大学', NULL, 0, '2021-10-09', 'img/upfile/zhaoyang.jpg', 'grey', 1, 1, NULL, '2015-01-05', 1);
INSERT INTO `hr_employee` VALUES (4, 'hexuan', 'E10ADC3949BA59ABBE56E057F20F883E', '陈洪海', '633323199503280911', '1995-11-18', 4, 3, 'hexuan@qq.com', '女士', '13800012345', NULL, 1, 30, '2015-01-05', '陕西省西安市', 'szzxc', '本科', 27, '机械自动化', '西安长安大学', NULL, 1, NULL, 'img/emp/1.png', 'gray', 1, 1, NULL, '2015-01-05', 1);
INSERT INTO `hr_employee` VALUES (5, 'zhoupengyu', 'E10ADC3949BA59ABBE56E057F20F883E', '熊浩民', '633323199231280921', '1995-04-21', 5, 4, 'hexuan@qq.com', '先生', '23546546544', NULL, 5, 121, '2015-01-14', '陕西省西安市', 'cxzc', '本科', 27, '机械自动化', '西安长安大学', NULL, 1, NULL, NULL, NULL, 1, 1, NULL, NULL, 1);
INSERT INTO `hr_employee` VALUES (6, 'hanpengbo', 'E10ADC3949BA59ABBE56E057F20F883E', '阿爸爸', '6105438974932478924X', '2010-02-02', 5, 4, 'fadsf@qs23.com', '先生', '19846578514', NULL, 2, NULL, '2015-01-13', '宝鸡扶风', '发哈撒地方很多岁啊部分', '本科', 27, '信息技术', '西安科技大学', NULL, 1, NULL, NULL, NULL, 1, 2, NULL, NULL, 1);
INSERT INTO `hr_employee` VALUES (9, 'test', 'E10ADC3949BA59ABBE56E057F20F883E', '测试账号', '656565656565', '2018-10-02', 4, 4, '11@qq.com', '先生', '16898989898', NULL, 2, NULL, '2018-10-01', '的味道撒', '777', '本科', 27, '原子弹制造与维修', '东华大学', NULL, 1, NULL, NULL, 'grey', 1, 6, NULL, NULL, 1);

-- ----------------------------
-- Table structure for hr_position
-- ----------------------------
DROP TABLE IF EXISTS `hr_position`;
CREATE TABLE `hr_position`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '职务ID PK',
  `position_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `position_order` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '次序',
  `position_level_id` int(8) NULL DEFAULT NULL COMMENT '职务级别 Fk',
  `create_id` int(8) NULL DEFAULT NULL COMMENT '创建ID FK',
  `create_date` date NULL DEFAULT NULL COMMENT '创建日期',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_id`(`create_id`) USING BTREE,
  INDEX `hr_position_ibfk_2`(`position_level_id`) USING BTREE,
  CONSTRAINT `hr_position_ibfk_1` FOREIGN KEY (`create_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hr_position_ibfk_2` FOREIGN KEY (`position_level_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_position
-- ----------------------------
INSERT INTO `hr_position` VALUES (1, '总经理', '101', 28, 2, '2014-10-25', 1, NULL);
INSERT INTO `hr_position` VALUES (2, '管理员', '10', 29, 2, '2014-10-25', 1, '2014-11-14');
INSERT INTO `hr_position` VALUES (4, '组长', '10', 30, 2, '2014-10-25', 1, '2014-11-14');
INSERT INTO `hr_position` VALUES (5, '部门经理', '10', 30, 4, '2015-01-05', 1, '2014-11-14');
INSERT INTO `hr_position` VALUES (6, 'test', '19', 28, 1, '2018-10-08', 0, '2018-10-10');

-- ----------------------------
-- Table structure for hr_post
-- ----------------------------
DROP TABLE IF EXISTS `hr_post`;
CREATE TABLE `hr_post`  (
  `post_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '岗位ID PK',
  `post_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `position_id` int(8) NULL DEFAULT NULL COMMENT '职务ID FK',
  `position_order` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务次序号',
  `dep_id` int(8) NULL DEFAULT NULL COMMENT '岗位部门ID FK',
  `emp_id` int(8) NULL DEFAULT NULL COMMENT '岗位员工ID FK',
  `post_descript` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '岗位描述',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`) USING BTREE,
  INDEX `position_id`(`position_id`) USING BTREE,
  INDEX `dep_id`(`dep_id`) USING BTREE,
  INDEX `emp_id`(`emp_id`) USING BTREE,
  CONSTRAINT `hr_post_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `hr_position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hr_post_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `hr_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hr_post_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_post
-- ----------------------------
INSERT INTO `hr_post` VALUES (1, '管理员', 2, '10', 1, 2, '我们是管理员', 1, NULL);
INSERT INTO `hr_post` VALUES (2, '总经理', 1, '10', 2, 4, '我们是总经理', 1, NULL);
INSERT INTO `hr_post` VALUES (3, '副总经理', 1, '10', 4, 4, '我们是副总经理', 1, NULL);
INSERT INTO `hr_post` VALUES (4, '村长', 2, '200', 2, 1, '肯定是拉动', 1, NULL);
INSERT INTO `hr_post` VALUES (5, '不2固我定', 2, '2', 2, 1, '二位呃呃呃', 0, '2018-10-10');

-- ----------------------------
-- Table structure for mail_attachment
-- ----------------------------
DROP TABLE IF EXISTS `mail_attachment`;
CREATE TABLE `mail_attachment`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '邮件附件表主键 PK',
  `file_url` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件文件下载路径',
  `file_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `real_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可空',
  `mail_id` int(8) NULL DEFAULT NULL COMMENT '邮件对应FK',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mail_id`(`mail_id`) USING BTREE,
  CONSTRAINT `mail_attachment_ibfk_1` FOREIGN KEY (`mail_id`) REFERENCES `mail_flow` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mail_flow
-- ----------------------------
DROP TABLE IF EXISTS `mail_flow`;
CREATE TABLE `mail_flow`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '邮件ID PK',
  `mail_title` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件标题',
  `mail_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '邮件内容',
  `receive_id` int(8) NULL DEFAULT NULL COMMENT '接收人ID FK',
  `isview` int(1) NULL DEFAULT 0 COMMENT '是否已查看1/0',
  `view_time` datetime(0) NULL DEFAULT NULL COMMENT '查看时间',
  `recive_type_id` int(8) NULL DEFAULT NULL COMMENT '接收类型ID FK',
  `sender_id` int(8) NULL DEFAULT NULL COMMENT '发送人ID FK',
  `sender_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除 0/1',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  `important` int(1) NULL DEFAULT NULL COMMENT '邮件重要级别 FK',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `recive_type_id`(`recive_type_id`) USING BTREE,
  INDEX `sender_id`(`sender_id`) USING BTREE,
  INDEX `mail_flow_ibfk_2`(`receive_id`) USING BTREE,
  INDEX `mail_flow_ibfk_6`(`important`) USING BTREE,
  CONSTRAINT `mail_flow_ibfk_2` FOREIGN KEY (`receive_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mail_flow_ibfk_3` FOREIGN KEY (`recive_type_id`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mail_flow_ibfk_5` FOREIGN KEY (`sender_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mail_flow_ibfk_6` FOREIGN KEY (`important`) REFERENCES `param_sysparam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mail_flow
-- ----------------------------
INSERT INTO `mail_flow` VALUES (1, '讨论手速', '手速多少', 1, 1, '2021-01-06 23:10:17', 6, 2, '2021-01-22 09:24:25', 1, '2021-01-29', NULL);
INSERT INTO `mail_flow` VALUES (2, '讨论手速2的杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀杀顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶1111111111111111111111666666666666666666666666666666666666666顶顶顶顶', '手速多少时尚大方的帆帆帆帆帆帆帆帆帆帆帆帆帆帆水水水水水水水水水水水水水水水水水水水撒嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡跟鬼鬼鬼鬼鬼鬼鬼鬼鬼鬼鬼鬼鬼鬼鬼鬼鬼鬼', 1, 1, '2021-01-01 15:49:28', 6, 2, '2021-01-01 09:24:25', 0, '2021-01-01', 52);
INSERT INTO `mail_flow` VALUES (3, '讨论手速', '手速多少', 1, 0, '2020-01-19 09:24:09', 6, 2, '2021-01-22 09:24:25', 0, '2021-01-01', 52);
INSERT INTO `mail_flow` VALUES (4, '塑料的吗流口水的那时的你看斯柯达', 'dsadafafdafsafdadsf', 1, 1, '2020-01-01 11:12:43', NULL, 4, '2021-01-01 00:45:40', 1, NULL, NULL);
INSERT INTO `mail_flow` VALUES (5, '塑料的吗流口水的那时的你看斯柯达', 'currentemp', 2, 0, NULL, NULL, 4, '2021-01-19 00:45:40', 1, NULL, NULL);
INSERT INTO `mail_flow` VALUES (6, '塑料的吗流口水的那时的你看斯柯达', 'ffffffffffffffffffffffffffffffff', 1, 1, '2021-11-01 14:38:49', NULL, 4, '2021-01-01 00:45:48', 1, NULL, 52);
INSERT INTO `mail_flow` VALUES (7, '塑料的吗流口水的那时的你看斯柯达', 'saaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 2, 0, NULL, NULL, 2, '2021-01-19 00:45:48', 1, NULL, NULL);

-- ----------------------------
-- Table structure for param_city
-- ----------------------------
DROP TABLE IF EXISTS `param_city`;
CREATE TABLE `param_city`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '省市ID PK',
  `parentid` int(8) NULL DEFAULT NULL COMMENT '上级ID',
  `city` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省市名称',
  `create_id` int(8) NULL DEFAULT NULL COMMENT '创建人ID FK',
  `create_date` date NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` int(8) NULL DEFAULT NULL COMMENT '更新人ID FK',
  `update_date` date NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `update_id`(`update_id`) USING BTREE,
  INDEX `create_id`(`create_id`) USING BTREE,
  CONSTRAINT `param_city_ibfk_1` FOREIGN KEY (`update_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `param_city_ibfk_2` FOREIGN KEY (`create_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 557 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of param_city
-- ----------------------------
INSERT INTO `param_city` VALUES (1, 0, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (2, 0, '上海', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (3, 0, '天津', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (4, 0, '重庆', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (5, 0, '黑龙江', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (6, 0, '吉林', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (7, 0, '辽宁', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (8, 0, '内蒙古', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (9, 0, '宁夏', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (10, 0, '新疆', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (11, 0, '青海', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (12, 0, '甘肃', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (13, 0, '陕西', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (14, 0, '河北', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (15, 0, '河南', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (16, 0, '山东', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (17, 0, '山西', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (18, 0, '湖北', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (19, 0, '湖南', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (20, 0, '安徽', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (21, 0, '江苏', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (22, 0, ' 浙江', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (23, 0, '江西', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (24, 0, '广东', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (25, 0, '广西', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (26, 0, '福建', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (27, 0, '四川', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (28, 0, '云南', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (29, 0, '贵州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (30, 0, '西藏', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (31, 0, '海南', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (32, 0, '香港', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (33, 0, '澳门', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (34, 0, '台湾', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (35, 1, '东城区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (36, 1, '西城区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (37, 1, '宣武区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (38, 1, '崇文区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (39, 1, '朝阳区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (40, 1, '海淀区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (41, 1, '丰台区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (42, 1, '石景山区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (43, 1, '门头沟区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (44, 1, '昌平区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (45, 1, '大兴区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (46, 1, '怀柔区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (47, 1, '密云县', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (48, 1, '平谷区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (49, 1, '顺义区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (50, 1, '通州区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (51, 1, '延庆县', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (52, 1, '房山区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (53, 2, '黄浦区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (54, 2, '南市区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (55, 2, '卢湾区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (56, 2, '徐汇区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (57, 2, '长宁区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (58, 2, '静安区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (59, 2, '普陀区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (60, 2, '金山区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (61, 2, '闸北区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (62, 2, '虹口区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (63, 2, '杨浦区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (64, 2, '宝山区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (65, 2, '闵行区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (66, 2, '嘉定区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (67, 2, '松江区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (68, 2, '浦东新区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (69, 2, '青浦县', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (70, 2, '奉贤县', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (71, 2, '南汇县', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (72, 2, '崇明县', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (73, 3, '和平区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (74, 3, '河东区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (75, 3, '河西区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (76, 3, '河北区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (77, 3, '南开区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (78, 3, '红桥区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (79, 3, '塘沽区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (80, 3, '汉沽区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (81, 3, '大港区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (82, 3, '东丽区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (83, 3, '西青区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (84, 3, '津南区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (85, 3, '北辰区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (86, 3, ' 武清区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (87, 3, '宝坻区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (88, 3, '蓟 县', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (89, 3, '宁河县', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (90, 3, '静海县', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (91, 4, '永川市', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (92, 4, '黔江区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (93, 4, '涪陵区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (94, 4, '万洲区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (95, 4, '渝中区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (96, 4, '大渡口区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (97, 4, '江北区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (98, 4, '沙坪坝区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (99, 4, '九龙坡区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (100, 4, '南岸区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (101, 4, '北碚区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (102, 4, ' 万盛区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (103, 4, '双桥区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (104, 4, '渝北区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (105, 4, '巴南区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (106, 4, '长寿区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (107, 5, '哈尔滨', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (108, 5, '齐齐哈尔', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (109, 5, '牡丹江', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (110, 5, '鹤岗', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (111, 5, '双鸭山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (112, 5, '鸡西', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (113, 5, '大庆', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (114, 5, '伊春', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (115, 5, '佳木斯', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (116, 5, '七台河', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (117, 5, '黑河', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (118, 5, '绥化', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (119, 5, '大兴安岭地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (120, 6, '长春', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (121, 6, '吉林', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (122, 6, '四平', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (123, 6, '辽源', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (124, 6, '通化', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (125, 6, '白山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (126, 6, '松原', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (127, 6, '白城', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (128, 6, '延边朝鲜族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (129, 6, '高新', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (130, 6, '延吉', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (131, 6, '梅河口', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (132, 7, '沈阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (133, 7, '大连', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (134, 7, '锦州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (135, 7, '鞍山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (136, 7, '抚顺', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (137, 7, '本溪', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (138, 7, '丹东', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (139, 7, '葫芦岛', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (140, 7, '营口', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (141, 7, '盘锦', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (142, 7, '阜新', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (143, 7, '辽阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (144, 7, '铁岭', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (145, 7, '朝阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (146, 7, '瓦房店', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (147, 8, '呼和浩特', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (148, 8, '包头', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (149, 8, '乌海', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (150, 8, '赤峰', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (151, 8, '通辽', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (152, 8, '鄂尔多斯', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (153, 8, '乌兰察布盟', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (154, 8, '锡林郭勒盟', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (155, 8, '巴彦淖尔盟', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (156, 8, '阿拉善盟', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (157, 8, '兴安盟', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (158, 8, '巴彦淖尔', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (159, 8, '呼伦贝尔', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (160, 8, '集宁', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (161, 8, ' 乌兰浩特', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (162, 8, '锡林浩特', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (163, 9, '银川', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (164, 9, '石嘴山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (165, 9, '吴忠', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (166, 9, '固原', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (167, 10, '乌鲁木齐', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (168, 10, '克拉玛依', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (169, 10, '吐鲁番地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (170, 10, '哈密地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (171, 10, '和田地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (172, 10, '阿克苏地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (173, 10, '喀什地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (174, 10, '克孜勒苏柯尔克孜自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (175, 10, '巴音郭楞蒙古自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (176, 10, '昌吉回族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (177, 10, '博尔塔拉蒙古自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (178, 10, '伊犁哈萨克自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (179, 10, '阿克苏', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (180, 10, '昌吉', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (181, 10, '哈密', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (182, 10, '和田', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (183, 10, '喀什', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (184, 10, '克拉马依', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (185, 10, '库尔勒', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (186, 10, '石河子', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (187, 10, '吐鲁番', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (188, 10, ' 乌市', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (189, 10, '奎屯', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (190, 10, '伊犁', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (191, 10, '伊宁', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (192, 11, '西宁', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (193, 11, '海东地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (194, 11, ' 海北藏族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (195, 11, '黄南藏族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (196, 11, '海南藏族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (197, 11, '果洛藏族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (198, 11, '玉树藏族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (199, 11, '海西蒙古族藏族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (200, 11, '格尔木', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (201, 12, '兰州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (202, 12, '天水', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (203, 12, '金昌', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (204, 12, '白银', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (205, 12, '嘉峪关', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (206, 12, '武 威 ', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (207, 12, '张掖', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (208, 12, '平凉', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (209, 12, '酒泉', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (210, 12, '庆阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (211, 12, '定西地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (212, 12, '陇南地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (213, 12, '甘南藏族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (214, 12, '临夏回族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (215, 12, '嘉峪', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (216, 12, '武威', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (217, 13, '西安', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (218, 13, '宝鸡', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (219, 13, '延安', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (220, 13, '铜川', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (221, 13, '咸阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (222, 13, '渭南', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (223, 13, '汉中', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (224, 13, '榆林', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (225, 13, '安康', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (226, 13, '商洛', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (227, 13, '韩城', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (228, 14, '石家庄', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (229, 14, '保定', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (230, 14, '唐山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (231, 14, '秦皇岛', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (232, 14, '邯郸', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (233, 14, '邢台', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (234, 14, '张家口', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (235, 14, '承德', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (236, 14, '沧州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (237, 14, '廊坊', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (238, 14, '衡水', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (239, 14, '霸州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (240, 14, '青县', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (241, 14, '任丘', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (242, 14, '涿州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (243, 15, '郑州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (244, 15, '洛阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (245, 15, '开封', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (246, 15, '平顶山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (247, 15, '焦作', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (248, 15, '鹤壁', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (249, 15, '新乡', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (250, 15, '安阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (251, 15, '濮阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (252, 15, '许昌', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (253, 15, '漯河', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (254, 15, '三门峡', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (255, 15, '南阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (256, 15, '商丘', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (257, 15, '信阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (258, 15, '周口', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (259, 15, '驻马店', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (260, 16, '济南', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (261, 16, '青岛', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (262, 16, '烟台', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (263, 16, '淄博', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (264, 16, '枣庄', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (265, 16, '东营', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (266, 16, '潍坊', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (267, 16, '威海', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (268, 16, '济宁', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (269, 16, '泰安', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (270, 16, '日照', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (271, 16, '莱芜', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (272, 16, '德州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (273, 16, '临沂', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (274, 16, '聊城', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (275, 16, '滨州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (276, 16, '菏泽', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (277, 16, '高密', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (278, 16, '荷泽', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (279, 16, '淮坊', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (280, 16, '即墨', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (281, 16, '胶南', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (282, 16, '莱州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (283, 16, '林沂', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (284, 16, '临忻', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (285, 16, '龙口', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (286, 16, '蓬莱', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (287, 16, '青州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (288, 16, '乳山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (289, 16, '寿光', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (290, 16, '滕州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (291, 16, '文登', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (292, 16, '招远', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (293, 17, '太原', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (294, 17, '大同', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (295, 17, '朔州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (296, 17, '阳泉', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (297, 17, '长治', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (298, 17, '晋城', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (299, 17, '忻州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (300, 17, '晋中', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (301, 17, '临汾', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (302, 17, '运城', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (303, 17, '吕梁地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (304, 17, '河津', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (305, 17, '侯马', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (306, 17, '孝义', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (307, 17, '榆次', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (308, 18, '武汉', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (309, 18, '黄石', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (310, 18, '襄樊', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (311, 18, '十堰', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (312, 18, '荆州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (313, 18, '宜昌', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (314, 18, '荆门', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (315, 18, '鄂州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (316, 18, '孝感', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (317, 18, '黄冈', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (318, 18, '咸宁', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (319, 18, '随州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (320, 18, '恩施土家族苗族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (321, 18, '安陆', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (322, 18, '恩施', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (323, 18, '汉口', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (324, 18, '汉阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (325, 18, '潜江', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (326, 18, '仙桃', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (327, 18, '株州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (328, 19, '长沙', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (329, 19, '株洲', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (330, 19, '湘潭', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (331, 19, '衡阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (332, 19, '邵阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (333, 19, '岳阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (334, 19, '常德', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (335, 19, '张家界', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (336, 19, '益阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (337, 19, '郴州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (338, 19, '永州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (339, 19, '怀化', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (340, 19, '娄底', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (341, 19, '湘西土家族苗族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (342, 19, '株州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (343, 19, '邵东', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (344, 20, '合肥', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (345, 20, '芜湖', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (346, 20, '蚌埠', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (347, 20, '淮南', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (348, 20, '马鞍山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (349, 20, '淮北', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (350, 20, '铜陵', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (351, 20, '安庆', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (352, 20, '黄山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (353, 20, '滁州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (354, 20, '阜阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (355, 20, '宿州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (356, 20, '巢湖', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (357, 20, '六安', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (358, 20, '亳州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (359, 20, '池州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (360, 20, '宣城', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (361, 20, '蒙城', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (362, 20, '宁国', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (363, 20, '桐城', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (364, 21, '南京', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (365, 21, '徐州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (366, 21, '连云港', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (367, 21, '淮安', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (368, 21, '宿迁', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (369, 21, '盐城', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (370, 21, '扬州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (371, 21, '泰州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (372, 21, '南通', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (373, 21, '镇江', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (374, 21, '常州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (375, 21, '无锡', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (376, 21, '苏州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (377, 21, '常熟', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (378, 21, '丹阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (379, 21, '海门', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (380, 21, '江都', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (381, 21, '江阴', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (382, 21, '靖江', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (383, 21, '昆山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (384, 21, '溧阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (385, 21, '太仓', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (386, 21, '泰州华', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (387, 21, '吴江', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (388, 21, '吴县', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (389, 21, '宜兴', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (390, 21, '张家港', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (391, 22, '杭州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (392, 22, '宁波', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (393, 22, '温州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (394, 22, '嘉兴', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (395, 22, '湖州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (396, 22, '绍兴', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (397, 22, '金华', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (398, 22, '衢州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (399, 22, '舟山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (400, 22, '台州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (401, 22, '丽水', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (402, 22, '慈溪', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (403, 22, '东阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (404, 22, '奉化', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (405, 22, '乐清', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (406, 22, '临安', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (407, 22, '临海', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (408, 22, '平湖', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (409, 22, '瑞安', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (410, 22, '上虞', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (411, 22, '嵊州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (412, 22, '温岭', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (413, 22, '义乌', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (414, 22, '永康', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (415, 22, '余姚', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (416, 22, '诸暨', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (417, 22, '新昌', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (418, 23, '南昌', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (419, 23, '景德镇', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (420, 23, '萍乡', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (421, 23, '新余', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (422, 23, '九江', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (423, 23, '鹰潭', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (424, 23, '赣州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (425, 23, '吉安', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (426, 23, '宜春', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (427, 23, '抚州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (428, 23, '上饶', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (429, 23, '高安', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (430, 24, '广州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (431, 24, '深圳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (432, 24, '珠海', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (433, 24, '汕头', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (434, 24, '韶关', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (435, 24, '河源', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (436, 24, '梅州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (437, 24, '惠州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (438, 24, '汕尾', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (439, 24, '东莞', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (440, 24, '中山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (441, 24, '江门', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (442, 24, '佛山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (443, 24, '阳江', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (444, 24, '湛江', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (445, 24, '茂名', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (446, 24, '肇庆', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (447, 24, '清远', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (448, 24, '潮州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (449, 24, '揭阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (450, 24, '云浮', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (451, 24, '花都', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (452, 24, '开平', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (453, 24, '南海', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (454, 24, '顺德', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (455, 24, '台山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (456, 24, '增城', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (457, 24, '市梅', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (458, 25, '南宁', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (459, 25, '柳州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (460, 25, '桂林', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (461, 25, '梧州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (462, 25, '北海', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (463, 25, '防城港', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (464, 25, '钦州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (465, 25, '贵港', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (466, 25, '玉林', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (467, 25, '百色', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (468, 25, '贺州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (469, 25, '河池', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (470, 25, '来宾', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (471, 25, '崇左', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (472, 26, '福州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (473, 26, '厦门', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (474, 26, '三明', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (475, 26, '莆田', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (476, 26, '泉州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (477, 26, '漳州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (478, 26, '南平', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (479, 26, '龙岩', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (480, 26, '宁德', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (481, 26, '福清', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (482, 26, '建瓯', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (483, 26, '晋江', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (484, 26, '南安', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (485, 26, '邵武', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (486, 26, '石狮', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (487, 26, '仙游', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (488, 27, '成都', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (489, 27, '自贡', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (490, 27, '攀枝花', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (491, 27, '泸州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (492, 27, '德阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (493, 27, '绵阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (494, 27, '广元', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (495, 27, '遂宁', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (496, 27, '内江', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (497, 27, '乐山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (498, 27, '南充', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (499, 27, '宜宾', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (500, 27, '广安', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (501, 27, '达州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (502, 27, '巴中', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (503, 27, '雅安', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (504, 27, '眉山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (505, 27, '资阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (506, 27, '阿坝藏族羌族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (507, 27, '甘孜藏族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (508, 27, '凉山彝族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (509, 27, '广汉', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (510, 27, '锦阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (511, 27, '西昌', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (512, 28, '昆明', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (513, 28, '曲靖', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (514, 28, '玉溪', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (515, 28, '保山', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (516, 28, '昭通', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (517, 28, '思茅地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (518, 28, '临沧地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (519, 28, '丽江', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (520, 28, ' 文山壮族苗族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (521, 28, '红河哈尼族彝族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (522, 28, '西双版纳傣族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (523, 28, '楚雄彝族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (524, 28, '大理白族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (525, 28, '德宏傣族景颇族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (526, 28, '怒江傈傈族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (527, 28, '迪庆藏族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (528, 28, '大理', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (529, 29, '贵阳', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (530, 29, '六盘水', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (531, 29, '遵义', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (532, 29, '安顺', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (533, 29, '铜仁地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (534, 29, '毕节地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (535, 29, '黔西南布依族苗族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (536, 29, '黔东南苗族侗族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (537, 29, '黔南布依族苗族自治州', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (538, 29, '都匀', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (539, 29, '贵恙', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (540, 29, '凯里', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (541, 29, '铜仁', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (542, 30, '拉萨', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (543, 30, '那曲地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (544, 30, '昌都地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (545, 30, '山南地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (546, 30, '日喀则地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (547, 30, '阿里地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (548, 30, '林芝地区', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (549, 31, '海口', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (550, 31, '三亚', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (551, 34, '台北', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (552, 34, '高雄', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (553, 34, '台中', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (554, 34, '台南', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (555, 34, '基隆', NULL, NULL, NULL, NULL);
INSERT INTO `param_city` VALUES (556, 34, '新竹', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for param_sysparam
-- ----------------------------
DROP TABLE IF EXISTS `param_sysparam`;
CREATE TABLE `param_sysparam`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '系统菜单项ID PK',
  `parentid` int(8) NULL DEFAULT NULL COMMENT '上一级ID',
  `params_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `params_order` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '次序',
  `create_id` int(8) NULL DEFAULT NULL COMMENT '创建人ID FK',
  `create_date` date NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` int(8) NULL DEFAULT NULL COMMENT '更新人ID FK',
  `update_date` date NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_id`(`create_id`) USING BTREE,
  INDEX `update_id`(`update_id`) USING BTREE,
  INDEX `parentid`(`parentid`) USING BTREE,
  CONSTRAINT `param_sysparam_ibfk_1` FOREIGN KEY (`create_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `param_sysparam_ibfk_2` FOREIGN KEY (`update_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `param_sysparam_ibfk_3` FOREIGN KEY (`parentid`) REFERENCES `param_sysparam_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of param_sysparam
-- ----------------------------
INSERT INTO `param_sysparam` VALUES (1, 1, '无意向', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (2, 1, '有意向', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (3, 1, '已成交', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (4, 2, 'A', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (5, 2, 'B', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (6, 2, 'C', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (7, 3, '网上', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (8, 3, '客户上门', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (9, 3, '电话', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (10, 3, '转介绍', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (11, 4, '电话跟进', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (12, 4, '短信跟进', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (13, 4, 'QQ', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (14, 4, '微信', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (15, 4, '邮件', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (16, 4, '上门拜访', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (17, 5, '银行转账', '10', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (18, 5, '现金支付', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (19, 5, '承兑汇票', '30', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (20, 6, '订单签订', '10', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (21, 7, '国税发票', '10', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (22, 7, '地税发票', '20', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (23, 6, '订单发货', '30', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (24, 6, '订单签字', '40', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (25, 11, 'S级员工', '100', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (26, 11, 'A级员工', '100', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (27, 11, 'B级员工', '100', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (28, 12, 'S级职务', '22', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (29, 12, 'A级职务', '2', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (30, 12, 'B级职务', '22', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (31, 8, '农,林,牧,渔,水利业', '22', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (32, 8, '工业', '22', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (33, 8, '地质普查和勘探业', '33', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (34, 8, '建筑业', '22', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (35, 8, '交通运输业,邮电通信业', '33', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (36, 8, '商业,公共饮食业,物资供应和仓储业', '11', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (37, 8, '房地产管理,公用事业,居民服务和咨询服务业', '44', NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (38, 8, '卫生,体育和社会福利事业', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (39, 8, '教育,文化艺术和广播电视业', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (40, 8, '科学研究和综合技术服务业', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (41, 8, '金融,保险业', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (42, 8, '国家机关,党政机关和社会团体', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (43, 8, '其他行业', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (44, 13, 'L/C 信用证 (Letter of Credit)', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (45, 13, 'D/A 承兑交单', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (46, 13, 'T/T 电汇 (Telegraphic Transfer)', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (47, 13, 'M/T 信汇', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (48, 5, '网上支付', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (49, 13, 'D/D 票汇汇款 (Banker\'s Demand Draft)', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (50, 13, 'D/P 付款交单 (Document against Payment)', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (51, 13, 'CASH 现金', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (52, 14, '星标邮件', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `param_sysparam` VALUES (53, 2, 'D', '2', 1, '2018-10-10', 1, '2018-10-10');

-- ----------------------------
-- Table structure for param_sysparam_type
-- ----------------------------
DROP TABLE IF EXISTS `param_sysparam_type`;
CREATE TABLE `param_sysparam_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数顶级分类表 PK',
  `params_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `params_order` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '次序',
  `isdelete` int(11) NULL DEFAULT 1,
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of param_sysparam_type
-- ----------------------------
INSERT INTO `param_sysparam_type` VALUES (1, '客户类型', '20', 1, NULL);
INSERT INTO `param_sysparam_type` VALUES (2, '客户级别', '30', 1, NULL);
INSERT INTO `param_sysparam_type` VALUES (3, '客户来源', '40', 1, NULL);
INSERT INTO `param_sysparam_type` VALUES (4, '跟进方式', '50', 1, NULL);
INSERT INTO `param_sysparam_type` VALUES (5, '支付方式', '60', 1, NULL);
INSERT INTO `param_sysparam_type` VALUES (6, '订单状态', '70', 1, NULL);
INSERT INTO `param_sysparam_type` VALUES (7, '发票类型', '80', 1, NULL);
INSERT INTO `param_sysparam_type` VALUES (8, '所属行业', '10', 1, NULL);
INSERT INTO `param_sysparam_type` VALUES (9, '部门类别', '11', 1, NULL);
INSERT INTO `param_sysparam_type` VALUES (10, '部门图标', '11', 1, NULL);
INSERT INTO `param_sysparam_type` VALUES (11, '员工等级', '11', 1, NULL);
INSERT INTO `param_sysparam_type` VALUES (12, '职务级别', '11', 1, NULL);
INSERT INTO `param_sysparam_type` VALUES (13, '收款类别', '12', 1, NULL);
INSERT INTO `param_sysparam_type` VALUES (14, '星标邮件', '22', 1, NULL);

-- ----------------------------
-- Table structure for personal_calendar
-- ----------------------------
DROP TABLE IF EXISTS `personal_calendar`;
CREATE TABLE `personal_calendar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '个人日程表主键 PK',
  `emp_id` int(11) NULL DEFAULT NULL COMMENT '员工ID  FK',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `starttime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `isalldayevent` tinyint(1) NULL DEFAULT NULL COMMENT '是否全天事件',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面json',
  `start` datetime(0) NULL DEFAULT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `backgroundColor` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'App.getLayoutColorCode(\'green\')',
  `allDay` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'true',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `emp_id`(`emp_id`) USING BTREE,
  CONSTRAINT `personal_calendar_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_calendar
-- ----------------------------
INSERT INTO `personal_calendar` VALUES (1, 2, '的规划为儿童外套', '2021-01-06 09:26:36', '2021-01-15 09:26:43', 1, NULL, NULL, NULL, 'App.getLayoutColorCode(\'green\')', '1', NULL);
INSERT INTO `personal_calendar` VALUES (2, 2, '的规划为儿童外套', '2021-09-06 09:26:36', '2021-01-15 09:26:43', 1, NULL, NULL, NULL, 'App.getLayoutColorCode(\'green\')', '1', NULL);
INSERT INTO `personal_calendar` VALUES (3, 2, '的规划为儿童外套', '2020-01-01 09:26:36', '2020-09-15 09:26:43', 1, NULL, NULL, NULL, 'App.getLayoutColorCode(\'green\')', '1', NULL);

-- ----------------------------
-- Table structure for personal_chat
-- ----------------------------
DROP TABLE IF EXISTS `personal_chat`;
CREATE TABLE `personal_chat`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '员工聊天表 PK',
  `send_emp` int(8) NULL DEFAULT NULL COMMENT '发送消息人',
  `receive_emp` int(8) NULL DEFAULT NULL COMMENT '接收消息人',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息内容',
  `send_datetime` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personal_event
-- ----------------------------
DROP TABLE IF EXISTS `personal_event`;
CREATE TABLE `personal_event`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件内容',
  `emp_id` int(8) NULL DEFAULT NULL COMMENT '所属员工FK',
  `createdate` date NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `emp_id`(`emp_id`) USING BTREE,
  CONSTRAINT `personal_event_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personal_notes
-- ----------------------------
DROP TABLE IF EXISTS `personal_notes`;
CREATE TABLE `personal_notes`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '个人便签ID PK',
  `emp_id` int(8) NULL DEFAULT NULL COMMENT '员工ID FK',
  `emp_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工名称',
  `note_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '便签内容',
  `note_color` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '便签颜色',
  `xyz` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '坐标',
  `note_time` datetime(0) NULL DEFAULT NULL COMMENT '便签创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `emp_id`(`emp_id`) USING BTREE,
  CONSTRAINT `personal_notes_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_notes
-- ----------------------------
INSERT INTO `personal_notes` VALUES (5, 1, NULL, '2', 'blue', '164,23,1', '2014-04-23 18:12:31');

-- ----------------------------
-- Table structure for public_chat_room
-- ----------------------------
DROP TABLE IF EXISTS `public_chat_room`;
CREATE TABLE `public_chat_room`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '聊天室 ID PK',
  `chat_emp_id` int(8) NULL DEFAULT NULL COMMENT '员工ID FK',
  `chat_dep_id` int(8) NULL DEFAULT NULL COMMENT '部门ID FK',
  `chat_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息文本',
  `chat_datetime` datetime(0) NULL DEFAULT NULL COMMENT '消息发送时间',
  `chat_isdelete` int(1) NULL DEFAULT NULL COMMENT '是否已删除0/1',
  `chat_deletetime` date NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `chat_emp_id`(`chat_emp_id`) USING BTREE,
  INDEX `chat_dep_id`(`chat_dep_id`) USING BTREE,
  CONSTRAINT `public_chat_room_ibfk_1` FOREIGN KEY (`chat_emp_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `public_chat_room_ibfk_2` FOREIGN KEY (`chat_dep_id`) REFERENCES `hr_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of public_chat_room
-- ----------------------------
INSERT INTO `public_chat_room` VALUES (1, 1, 1, '呵呵呵', '2021-02-02 00:00:00', 1, '2014-09-21');
INSERT INTO `public_chat_room` VALUES (2, 1, 1, '呵呵呵', '2020-01-13 09:30:10', 1, '2014-09-21');

-- ----------------------------
-- Table structure for public_news
-- ----------------------------
DROP TABLE IF EXISTS `public_news`;
CREATE TABLE `public_news`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '公共新闻表ID PK',
  `news_title` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻标题',
  `news_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻内容',
  `create_id` int(8) NULL DEFAULT NULL COMMENT '发布人ID FK',
  `dep_id` int(8) NULL DEFAULT NULL COMMENT '发布部门ID FK',
  `news_time` date NULL DEFAULT NULL COMMENT '新闻时间',
  `isdelete` int(1) NULL DEFAULT 1 COMMENT '是否已删除0/1',
  `delete_time` date NULL DEFAULT NULL COMMENT '删除时间',
  `view_num` int(8) NULL DEFAULT 0 COMMENT '被查看次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_id`(`create_id`) USING BTREE,
  INDEX `dep_id`(`dep_id`) USING BTREE,
  CONSTRAINT `public_news_ibfk_1` FOREIGN KEY (`create_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `public_news_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `hr_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of public_news
-- ----------------------------
INSERT INTO `public_news` VALUES (1, 'vdfvdf', '黄金季节', 2, 2, '2021-01-01', 0, '2018-09-27', 0);
INSERT INTO `public_news` VALUES (2, '委屈委屈个如果', '黄金季节', 2, 2, '2015-01-28', 0, '2018-09-27', 0);
INSERT INTO `public_news` VALUES (3, '我当时1', '黄金季节倒萨哒哒哒', 4, 4, '2015-01-28', 1, '2014-08-18', 3);
INSERT INTO `public_news` VALUES (4, '的撒哈哈', '2222222222222222都市打斗法大师傅士大夫石帆胜丰大飒飒水水水水水水水水水水水水', 1, 1, '2015-01-29', 1, NULL, 0);
INSERT INTO `public_news` VALUES (5, '的萨芬', '22222222倒萨倒萨达到酷酷酷', 2, 2, '2018-09-27', 1, '2015-01-15', 0);
INSERT INTO `public_news` VALUES (7, '快来免费看书的', '的开发商开朗大方你说了算doll1', 2, 2, '2018-09-26', 1, NULL, 2);
INSERT INTO `public_news` VALUES (8, '测试', '在干嘛', 4, 4, '2018-10-09', 1, NULL, 0);
INSERT INTO `public_news` VALUES (9, '公司准备IPO', '大家好，经过几年的努力，公司发展的非常快，我们准备在美国纳斯达克IPO，届时大家都会成为亿万富翁，你说你们开不开心。1', 4, 4, '2018-10-09', 1, NULL, 1);
INSERT INTO `public_news` VALUES (10, '6', '666', 2, 2, '2018-10-09', 0, '2018-10-09', 0);
INSERT INTO `public_news` VALUES (11, '测试新闻', '这是一条测试信息。', 1, 1, '2018-10-10', 1, NULL, 0);
INSERT INTO `public_news` VALUES (12, '财务报销信息', '这是一条测试的财务报销信息。', 2, 2, '2018-10-10', 1, NULL, 0);
INSERT INTO `public_news` VALUES (13, '1', '1', 1, 1, '2021-10-09', 1, NULL, 0);

-- ----------------------------
-- Table structure for public_notice
-- ----------------------------
DROP TABLE IF EXISTS `public_notice`;
CREATE TABLE `public_notice`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '公告通知ID PK',
  `notice_title` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `notice_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `notice_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `dep_id` int(8) NULL DEFAULT NULL COMMENT '部门ID FK',
  `view_num` int(8) NULL DEFAULT NULL COMMENT '被查看次数',
  `create_id` int(8) NULL DEFAULT NULL COMMENT '创建人ID FK',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_id`(`create_id`) USING BTREE,
  INDEX `public_notice_ibfk_2`(`dep_id`) USING BTREE,
  CONSTRAINT `public_notice_ibfk_1` FOREIGN KEY (`create_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `public_notice_ibfk_2` FOREIGN KEY (`dep_id`) REFERENCES `hr_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of public_notice
-- ----------------------------
INSERT INTO `public_notice` VALUES (3, 'S', 'dsfdf', '2021-03-01', 2, 0, 2);
INSERT INTO `public_notice` VALUES (4, '沙和尚', '酷酷酷酷酷酷酷的撒旦', '2021-04-01', 2, 0, 2);
INSERT INTO `public_notice` VALUES (5, '克里斯2', '快递快递费是开发的肌肤', '2021-10-09', 1, 0, 1);
INSERT INTO `public_notice` VALUES (6, '服你得看看1', '空间的深刻搭街坊对你看法和康师傅口可口的司法权沦为111111111111111111111111111', '2021-01-15', 1, 0, 1);
INSERT INTO `public_notice` VALUES (7, '测试公告', '这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！这里是公告内容呢！', '2021-01-27', 2, 0, 2);

-- ----------------------------
-- Table structure for sys_app
-- ----------------------------
DROP TABLE IF EXISTS `sys_app`;
CREATE TABLE `sys_app`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '应用大模块id PK',
  `app_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用名称',
  `app_order` int(8) NULL DEFAULT NULL COMMENT '应用次序',
  `app_url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用链接',
  `app_method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用方法',
  `app_icon` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用图标地址',
  `app_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用a标签的ID属性',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_app
-- ----------------------------
INSERT INTO `sys_app` VALUES (1, '个人办公', 1, '#', NULL, 'icon-head-one', 'person');
INSERT INTO `sys_app` VALUES (2, 'CRM客户管理', 1, '#', NULL, 'icon-head-two', 'crm');
INSERT INTO `sys_app` VALUES (3, '人事管理', 1, '#', NULL, 'icon-head-three', 'hr');
INSERT INTO `sys_app` VALUES (4, '实用工具', 1, '#', NULL, 'icon-head-four', 'tools');
INSERT INTO `sys_app` VALUES (5, '报表分析', 1, '#', NULL, 'icon-head-five', 'table');
INSERT INTO `sys_app` VALUES (6, '系统管理', 1, '#', NULL, 'icon-head-six', 'sys');
INSERT INTO `sys_app` VALUES (7, '桌面', 0, '#', NULL, 'icon-head-right-1', 'desktop');
INSERT INTO `sys_app` VALUES (8, '个人设置', 0, '#', NULL, 'icon-head-three', 'personset');
INSERT INTO `sys_app` VALUES (9, '修改密码', 0, '#', NULL, 'icon-head-right-3', 'updatepwd');
INSERT INTO `sys_app` VALUES (10, '版权信息', 0, '#', NULL, 'icon-head-right-4', 'info');
INSERT INTO `sys_app` VALUES (11, '系统信息', 0, '#', NULL, 'icon-head-right-5', 'sysinfo');
INSERT INTO `sys_app` VALUES (12, '退出系统', 0, '#', NULL, 'icon-head-right-6', 'exit');

-- ----------------------------
-- Table structure for sys_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_login`;
CREATE TABLE `sys_login`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '登录记录表 ID',
  `emp_id` int(11) NULL DEFAULT NULL COMMENT '员工FK',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `emp_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `logintime` datetime(0) NULL DEFAULT NULL COMMENT '登陆时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `emp_id`(`emp_id`) USING BTREE,
  CONSTRAINT `sys_login_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login
-- ----------------------------
INSERT INTO `sys_login` VALUES (1, 1, '', '任逸航', '2021-06-27 23:34:41');
INSERT INTO `sys_login` VALUES (2, 1, '', '任逸航', '2021-06-27 23:36:52');
INSERT INTO `sys_login` VALUES (3, 1, '', 'admin', '2021-10-09 08:14:52');
INSERT INTO `sys_login` VALUES (4, 1, '', '任逸航', '2021-10-09 09:03:02');
INSERT INTO `sys_login` VALUES (5, 1, '', '任逸航', '2021-10-09 14:02:17');
INSERT INTO `sys_login` VALUES (6, 1, '', '任逸航', '2021-10-09 15:32:09');
INSERT INTO `sys_login` VALUES (94, 1, '', '任逸航', '2021-10-09 15:37:59');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '菜单ID PK',
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `parentid` int(8) NULL DEFAULT NULL COMMENT '上级菜单ID',
  `parentname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级菜单名称',
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单链接',
  `menu_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `menu_handler` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单事件',
  `menu_order` int(8) NULL DEFAULT NULL COMMENT '菜单排序',
  `menu_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单类型',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (4, '信息中心', 0, NULL, 'javascript:;', 'icon-youtube-sign', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (5, '新闻阅览', 4, NULL, 'pages_public/pub_news!showNews', 'icon-bolt', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (6, '公告查看', 4, NULL, 'pages_public/pub_notice!showNotice', 'icon-volume-up', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (9, '站内信息', 4, NULL, 'pages_mail/mail_flow.jsp', 'icon-envelope-alt', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (15, '客户管理', 0, NULL, 'javascript:;', 'icon-male', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (16, '客户列表', 15, NULL, 'pages_crm/crm_cust', 'icon-stackexchange', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (17, '联系人管理', 15, NULL, 'pages_crm/crm_cont', 'icon-book', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (18, '跟进管理', 15, NULL, 'pages_crm/crm_follow!findAll', 'icon-foursquare', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (19, '合同订单', 0, NULL, 'javascript:;', 'icon-book', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (20, '订单管理', 19, NULL, 'pages_crm/ma_order?v=0', 'icon-folder-close', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (21, '合同管理', 19, NULL, 'pages_crm/ma_contr', 'icon-print', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (22, '财务管理', 0, NULL, 'javascript:;', 'icon-jpy', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (23, '收款管理', 22, NULL, 'pages_crm/crm_receive', 'icon-signin', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (24, '收款流水', 22, NULL, 'pages_crm/crm_receive!findAll', 'icon-fire', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (26, '发票列表', 22, NULL, 'pages_crm/crm_invoice!findAll', 'icon-tasks', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (27, '产品管理', 0, NULL, 'javascript:;', 'icon-table', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (28, '产品类别', 27, NULL, 'pages_crm/crm_cate', 'icon-gittip', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (29, '产品列表', 27, NULL, 'pages_crm/crm_prod', 'icon-list', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (30, '人事管理', 0, NULL, 'javascript:;', 'icon-table', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (31, '部门管理', 30, NULL, 'pages_hr/hr_dep', 'icon-flickr', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (32, '职务管理', 30, NULL, 'pages_hr/hr_posi', 'icon-hospital', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (33, '岗位管理', 30, NULL, 'pages_hr/hr_post', 'icon-indent-right', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (34, '员工管理', 30, NULL, 'pages_hr/hr_emp', 'icon-group', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (35, '数据回收站', 0, NULL, 'javascript:;', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (36, '人事回收站', 35, NULL, '#', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (37, 'CRM回收站', 35, NULL, '#', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (38, '联系人回收', 37, NULL, 'pages_crm/crm_cont!trashAll', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (39, '合同回收', 37, NULL, 'pages_crm/ma_contr!trashAll', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (40, '客户回收', 37, NULL, 'pages_crm/crm_cust!trashAll', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (41, '跟进回收', 37, NULL, 'pages_crm/crm_follow!trashAll', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (42, '发票回收', 37, NULL, 'pages_crm/crm_invoice!trashAll', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (43, '订单回收', 37, NULL, 'pages_crm/ma_order!trashAll', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (44, '产品回收', 37, NULL, 'pages_crm/crm_prod!trashAll', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (45, '产品分类回收', 37, NULL, 'pages_crm/crm_cate!trashAll', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (46, '收款回收', 37, NULL, 'pages_crm/crm_receive!trashAll', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (47, '员工回收', 36, NULL, 'pages_hr/hr_emp!trashAll', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (48, '部门回收', 36, NULL, 'pages_hr/hr_dep!trashAll', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (49, '职务回收', 36, NULL, 'pages_hr/hr_posi!trashAll', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (50, '岗位回收', 36, NULL, 'pages_hr/hr_post!trashAll', 'icon-trash', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (51, '系统管理', 0, NULL, 'javascript:;', 'icon-cog', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (52, '参数管理', 51, NULL, 'pages_param/param_systype', 'icon-wrench', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (53, '角色管理', 51, NULL, 'pages_sys/sys_role', 'icon-screenshot', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `roleid` int(8) NOT NULL AUTO_INCREMENT COMMENT '角色表PK',
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `roledscript` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限说明',
  `childmenus` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前权限下可以操作的子菜单',
  `rolesort` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限排序',
  `createid` int(8) NULL DEFAULT NULL COMMENT '创建人ID FK',
  `createdate` date NULL DEFAULT NULL COMMENT '创建日期',
  `updateid` int(8) NULL DEFAULT NULL COMMENT '更新人ID  Fk',
  `updatedate` date NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`roleid`) USING BTREE,
  INDEX `createid`(`createid`) USING BTREE,
  INDEX `updateid`(`updateid`) USING BTREE,
  CONSTRAINT `sys_role_ibfk_1` FOREIGN KEY (`createid`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_ibfk_2` FOREIGN KEY (`updateid`) REFERENCES `hr_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', '拥有全部权限', '4,5,6,9,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,47,48,49,50,37,38,39,40,41,42,43,44,45,46,51,52,53', '999', 1, '2014-11-23', 1, NULL);
INSERT INTO `sys_role` VALUES (2, '员工', '拥有一些权限', '4,5,6,9,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,35,36,47,48,49,50,37,38,39,40,41,42,43,44,45,46', '20', 1, '2014-12-09', 1, NULL);
INSERT INTO `sys_role` VALUES (3, '总经理', '拥有绝大部分权限', '4,5,6,9,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,37', '888', 1, '2014-12-09', 1, NULL);
INSERT INTO `sys_role` VALUES (4, '部门经理', '比总经理权小店', '4,5,6,9,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,37', '777', 1, '2014-12-09', 1, NULL);
INSERT INTO `sys_role` VALUES (5, '销售', '拥有客户管理', '4,5,6,9,15,16,17,18,19,20,21,22,23,24,25,26', NULL, 1, '2015-02-01', 1, NULL);
INSERT INTO `sys_role` VALUES (6, '人事管理', '管理人事权限', '4,5,6,9,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29', NULL, 1, '2015-02-01', 1, NULL);
INSERT INTO `sys_role` VALUES (7, '测试', '测试角色', '4,5,15,16,30,32', NULL, 1, '2018-10-10', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
