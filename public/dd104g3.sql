-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1:3306
-- 產生時間： 2020-02-04 12:30:44
-- 伺服器版本: 5.7.23
-- PHP 版本： 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `dd104g3`
--

-- --------------------------------------------------------

--
-- 資料表結構 `card`
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE IF NOT EXISTS `card` (
  `card_no` int(11) NOT NULL AUTO_INCREMENT,
  `pro_no` int(11) NOT NULL,
  `card_name` varchar(50) NOT NULL,
  `card_date` datetime DEFAULT NULL,
  `card_type` char(1) NOT NULL DEFAULT '0' COMMENT '0:待辦事項 1:進行中 2:完成',
  `card_sta` int(11) NOT NULL DEFAULT '0' COMMENT '0:未完成 1:完成',
  PRIMARY KEY (`card_no`),
  KEY `pro_no` (`pro_no`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `card`
--

INSERT INTO `card` (`card_no`, `pro_no`, `card_name`, `card_date`, `card_type`, `card_sta`) VALUES
(11, 4, 'aaa', NULL, '1', 0),
(17, 9, 'card1-1', '2020-02-04 06:00:00', '1', 0),
(18, 9, 'card1-2', NULL, '1', 0),
(19, 9, 'card1-3', NULL, '0', 0),
(20, 9, 'card1-4', '2020-02-05 13:00:00', '0', 0),
(21, 9, 'card1-5', NULL, '2', 1),
(22, 9, 'card1-6', '2020-02-13 15:00:00', '2', 0),
(23, 9, 'card1-7', NULL, '1', 0),
(24, 10, 'card2-1', NULL, '0', 0),
(25, 10, 'card2-2', NULL, '0', 0),
(26, 10, 'card2-3', NULL, '0', 0),
(27, 11, 'card3-1', NULL, '0', 0),
(28, 11, 'card3-2', '2020-02-04 11:00:00', '1', 0),
(29, 11, 'card3-3', NULL, '2', 1),
(33, 13, 'qwe', NULL, '0', 0),
(34, 14, 'zxc', NULL, '2', 0),
(51, 22, '陪家人度過周莫', '2020-02-15 00:00:00', '1', 1),
(52, 22, '吃宵夜', NULL, '2', 0),
(53, 22, '睡覺', NULL, '0', 0),
(56, 23, '真美好午餐', NULL, '1', 0),
(57, 23, '真美好晚餐', NULL, '2', 0),
(58, 24, '真美好電影院', '2020-02-06 05:00:00', '1', 0),
(73, 11, '123', NULL, '0', 0),
(94, 39, '專案設計卡', NULL, '0', 0),
(95, 39, '專案報告', NULL, '1', 0),
(96, 39, '前端工程', NULL, '2', 0),
(98, 40, '去sound wave創作音樂', NULL, '1', 0),
(99, 40, '去sound wave創作音樂', NULL, '2', 0),
(100, 40, '到肉肉健身房健身', NULL, '0', 0),
(101, 40, '陪家人度過', '2020-02-08 00:00:00', '1', 0),
(102, 41, 'ggjkjhgfdz', NULL, '1', 0),
(103, 41, 'dfghjkl;\'lkjhgf', NULL, '1', 0),
(104, 41, 'aaa', NULL, '2', 0),
(105, 41, 'aaa', '2020-02-04 00:00:00', '0', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `card_file`
--

DROP TABLE IF EXISTS `card_file`;
CREATE TABLE IF NOT EXISTS `card_file` (
  `file_no` int(11) NOT NULL AUTO_INCREMENT,
  `pro_no` int(11) NOT NULL,
  `card_no` int(11) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_src` text NOT NULL,
  PRIMARY KEY (`file_no`),
  KEY `pro_no` (`pro_no`),
  KEY `card_no` (`card_no`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `card_file`
--

INSERT INTO `card_file` (`file_no`, `pro_no`, `card_no`, `file_name`, `file_src`) VALUES
(20, 9, 21, 'demo_data.xlsx', './pmFiles/demo_data.xlsx'),
(21, 9, 21, 'program_member_8.jpg', './pmFiles/program_member_8.jpg'),
(22, 9, 22, 'program_member_7.jpg', './pmFiles/program_member_7.jpg'),
(215, 40, 101, 'logo_in.svg', './pmFiles/logo_in.svg'),
(216, 40, 101, 'FrontEnd_usecase_v4.zip', './pmFiles/FrontEnd_usecase_v4.zip'),
(217, 40, 101, 'userstory_All_v1.docx', './pmFiles/userstory_All_v1.docx'),
(219, 41, 105, 'DD104_第56期資策會Web前端設計工程師班學員資料及個人作品.xlsx', './pmFiles/DD104_第56期資策會Web前端設計工程師班學員資料及個人作品.xlsx'),
(220, 41, 105, '下載.jpeg', './pmFiles/下載.jpeg');

-- --------------------------------------------------------

--
-- 資料表結構 `chat_record`
--

DROP TABLE IF EXISTS `chat_record`;
CREATE TABLE IF NOT EXISTS `chat_record` (
  `chat_no` int(11) NOT NULL,
  `pro_no` int(11) NOT NULL,
  `mem_no` int(11) NOT NULL,
  `chat_cont` varchar(100) NOT NULL,
  `chat_time` datetime NOT NULL,
  `chat_file` varchar(50) NOT NULL,
  PRIMARY KEY (`chat_no`),
  KEY `pro_no` (`pro_no`),
  KEY `mem_no` (`mem_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `join_program`
--

DROP TABLE IF EXISTS `join_program`;
CREATE TABLE IF NOT EXISTS `join_program` (
  `mem_no` int(11) NOT NULL,
  `inv_by_mem` int(11) NOT NULL,
  `pro_no` int(11) NOT NULL,
  `pro_mem_inv` int(11) NOT NULL DEFAULT '0' COMMENT '0:邀請中 1:已加入 2:已拒絕',
  `inv_sta` int(11) NOT NULL DEFAULT '1' COMMENT '0:未讀 1:已讀',
  PRIMARY KEY (`mem_no`,`pro_no`),
  KEY `mem_no` (`mem_no`),
  KEY `pro_no` (`pro_no`),
  KEY `join_program_ibfk_3` (`inv_by_mem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `join_program`
--

INSERT INTO `join_program` (`mem_no`, `inv_by_mem`, `pro_no`, `pro_mem_inv`, `inv_sta`) VALUES
(1, 1, 4, 1, 1),
(1, 1, 5, 1, 1),
(1, 3, 22, 1, 1),
(3, 3, 9, 1, 1),
(3, 3, 10, 1, 1),
(3, 3, 11, 1, 1),
(3, 3, 13, 1, 1),
(3, 3, 14, 1, 1),
(3, 3, 22, 1, 1),
(3, 3, 39, 1, 1),
(3, 12, 40, 1, 1),
(3, 13, 41, 0, 0),
(3, 3, 42, 1, 1),
(4, 3, 9, 1, 1),
(4, 3, 11, 1, 1),
(4, 4, 23, 1, 1),
(4, 4, 24, 1, 1),
(5, 3, 11, 1, 1),
(5, 3, 13, 1, 1),
(6, 3, 11, 1, 1),
(7, 3, 11, 1, 1),
(7, 3, 13, 1, 1),
(8, 3, 13, 1, 1),
(9, 3, 13, 1, 1),
(12, 12, 40, 1, 1),
(12, 13, 41, 0, 0),
(13, 13, 41, 1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `mall_product`
--

DROP TABLE IF EXISTS `mall_product`;
CREATE TABLE IF NOT EXISTS `mall_product` (
  `product_no` int(11) NOT NULL AUTO_INCREMENT,
  `product_num` int(11) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_src` varchar(50) DEFAULT NULL,
  `product_color` varchar(50) DEFAULT NULL,
  `product_desc` varchar(100) DEFAULT NULL,
  `product_type` int(11) NOT NULL,
  `product_bg_src` varchar(50) DEFAULT NULL,
  `product_slide_img` varchar(50) DEFAULT NULL,
  `index_on` int(1) NOT NULL DEFAULT '0' COMMENT '0: 下架 1:上架',
  `product_on` int(1) NOT NULL DEFAULT '1' COMMENT '0: 下架 1:上架',
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=30403 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `mall_product`
--

INSERT INTO `mall_product` (`product_no`, `product_num`, `product_name`, `product_price`, `product_src`, `product_color`, `product_desc`, `product_type`, `product_bg_src`, `product_slide_img`, `index_on`, `product_on`) VALUES
(10101, 101, '纖巧商務包', 1600, 'img/mall_img/101_black.png', '典雅黑', '絨毛內裡 保護電腦不刮傷凹形邊緣護墊 有效吸收抵禦衝擊', 1, 'img/mall_img/101_bg.jpg', 'img/mall_img/101_sbg.jpg', 0, 0),
(10102, 101, '纖巧商務包', 1600, 'img/mall_img/101_brown.png', '駝棕色', '絨毛內裡 保護電腦不刮傷凹形邊緣護墊 有效吸收抵禦衝擊', 1, 'img/mall_img/101_bg.jpg', 'img/mall_img/101_sbg.jpg', 0, 0),
(10103, 101, '纖巧商務包', 1600, 'img/mall_img/101_blue.png', '孔雀藍', '絨毛內裡 保護電腦不刮傷凹形邊緣護墊 有效吸收抵禦衝擊', 1, 'img/mall_img/101_bg.jpg', 'img/mall_img/101_sbg.jpg', 1, 1),
(10104, 101, '纖巧商務包', 1600, 'img/mall_img/101_white.png', '白米色', '絨毛內裡 保護電腦不刮傷凹形邊緣護墊 有效吸收抵禦衝擊', 1, 'img/mall_img/101_bg.jpg', 'img/mall_img/101_sbg.jpg', 0, 1),
(10105, 101, ' 纖巧商務包', 1600, 'img/mall_img/101_red.png', '皇家紅', '絨毛內裡 保護電腦不刮傷凹形邊緣護墊 有效吸收抵禦衝擊', 1, 'img/mall_img/101_bg.jpg', 'img/mall_img/101_sbg.jpg', 0, 0),
(10201, 102, '迷你手提袋', 1200, 'img/mall_img/102_black.png', '典雅黑', '精緻的設計為休閒裝增添優雅氣息。 最上等的牛真皮具有獨特的柔軟性，穿著舒適。', 1, 'img/mall_img/102_bg.jpg', 'img/mall_img/102_sbg.jpg', 0, 1),
(10202, 102, '迷你手提袋', 1200, 'img/mall_img/102_blue.png', '孔雀藍', '精緻的設計為休閒裝增添優雅氣息。 最上等的牛真皮具有獨特的柔軟性，穿著舒適。', 1, 'img/mall_img/102_bg.jpg', 'img/mall_img/102_sbg.jpg', 0, 1),
(10203, 102, '迷你手提袋', 1200, 'img/mall_img/102_brown.png', '駝棕色', '精緻的設計為休閒裝增添優雅氣息。 最上等的牛真皮具有獨特的柔軟性，穿著舒適。', 1, 'img/mall_img/102_bg.jpg', 'img/mall_img/102_sbg.jpg', 0, 1),
(10204, 102, '迷你手提袋', 1200, 'img/mall_img/102_red.png', '皇家紅', '精緻的設計為休閒裝增添優雅氣息。 最上等的牛真皮具有獨特的柔軟性，穿著舒適。', 1, 'img/mall_img/102_bg.jpg', 'img/mall_img/102_sbg.jpg', 0, 0),
(10301, 103, '迷你單肩包', 900, 'img/mall_img/103_black.png', '典雅黑', '3個口袋 外面有拉鍊', 1, 'img/mall_img/103_bg.jpg', 'img/mall_img/103_sbg.jpg', 0, 1),
(10302, 103, '迷你單肩包', 900, 'img/mall_img/103_blue.png', '孔雀藍', '3個口袋 外面有拉鍊', 1, 'img/mall_img/103_bg.jpg', 'img/mall_img/103_sbg.jpg', 1, 1),
(10303, 103, '迷你單肩包', 900, 'img/mall_img/103_brown.png', '駝棕色', '3個口袋 外面有拉鍊', 1, 'img/mall_img/103_bg.jpg', 'img/mall_img/103_sbg.jpg', 0, 1),
(10304, 103, '迷你單肩包', 900, 'img/mall_img/103_pink.png', '櫻花粉', '3個口袋 外面有拉鍊', 1, 'img/mall_img/103_bg.jpg', 'img/mall_img/103_sbg.jpg', 0, 1),
(10401, 104, '手拿包', 899, 'img/mall_img/104_black.png', '典雅黑', '擁有三個不同大小的口袋，可以折疊並用作手拿包。', 1, 'img/mall_img/104_bg.jpg', 'img/mall_img/104_sbg.jpg', 0, 1),
(10402, 104, '手拿包', 899, 'img/mall_img/104_green.png', '寶石綠', '擁有三個不同大小的口袋，可以折疊並用作手拿包。', 1, 'img/mall_img/104_bg.jpg', 'img/mall_img/104_sbg.jpg', 0, 1),
(10403, 104, '手拿包', 899, 'img/mall_img/104_brown.png', '駝棕色', '擁有三個不同大小的口袋，可以折疊並用作手拿包。', 1, 'img/mall_img/104_bg.jpg', 'img/mall_img/104_sbg.jpg', 0, 1),
(20101, 201, '真皮識別證', 399, 'img/mall_img/201_black.png', '優雅黑', '最優質的牛皮製成 可取下膠片', 2, 'img/mall_img/201_bg-2.jpg', 'img/mall_img/201_sbg.jpg', 0, 1),
(20103, 201, '真皮識別證', 399, 'img/mall_img/201_green.png', '湖水綠', '最優質的牛皮製成 可取下膠片', 2, 'img/mall_img/201_bg-2.jpg', 'img/mall_img/201_sbg.jpg', 0, 1),
(20201, 202, '真皮卡套', 880, 'img/mall_img/202_black.png', '神秘黑', '可放大約20張名片厚度 不易打滑、享受質感', 2, 'img/mall_img/202_bg.jpg', 'img/mall_img/202_sbg.jpg', 0, 1),
(20202, 202, '真皮卡套', 880, 'img/mall_img/202_brown.png', '駝棕色', '可放大約20張名片厚度 不易打滑、享受質感', 2, 'img/mall_img/202_bg.jpg', 'img/mall_img/202_sbg.jpg', 0, 1),
(20203, 202, '真皮卡套', 880, 'img/mall_img/202_pink.png', '櫻花粉', '可放大約20張名片厚度 不易打滑、享受質感', 2, 'img/mall_img/202_bg.jpg', 'img/mall_img/202_sbg.jpg', 0, 1),
(20204, 202, '真皮卡套', 880, 'img/mall_img/202_red.png', '皇家紅', '可放大約20張名片厚度 不易打滑、享受質感', 2, 'img/mall_img/202_bg.jpg', 'img/mall_img/202_sbg.jpg', 0, 1),
(20301, 203, '超薄名片夾', 500, 'img/mall_img/203_black.png', '神秘黑', '一個簡單而纖薄的名片夾，可用於辦公室工作人員。', 2, 'img/mall_img/203_bg.jpg', 'img/mall_img/203_sbg.jpg', 1, 1),
(20302, 203, '超薄名片夾', 500, 'img/mall_img/203_brown.png', '駝棕色', '一個簡單而纖薄的名片夾，可用於辦公室工作人員。', 2, 'img/mall_img/203_bg.jpg', 'img/mall_img/203_sbg.jpg', 0, 1),
(30101, 301, 'iPhone手機殼', 999, 'img/mall_img/301_black.png', '典雅黑', '一個簡單的iPhone外殼，讓您充分享受真皮質感。', 3, 'img/mall_img/301_bg.jpg', 'img/mall_img/301_sbg.jpg', 0, 1),
(30102, 301, 'iPhone手機殼', 999, 'img/mall_img/301_blue.png', '孔雀藍', '一個簡單的iPhone外殼，讓您充分享受真皮質感。', 3, 'img/mall_img/301_bg.jpg', 'img/mall_img/301_sbg.jpg', 0, 1),
(30103, 301, 'iPhone手機殼', 999, 'img/mall_img/301_brown.png', '駝棕色', '一個簡單的iPhone外殼，讓您充分享受真皮質感。', 3, 'img/mall_img/301_bg.jpg', 'img/mall_img/301_sbg.jpg', 0, 1),
(30104, 301, 'iPhone手機殼', 999, 'img/mall_img/301_red.png', '皇家紅', '一個簡單的iPhone外殼，讓您充分享受真皮質感。', 3, 'img/mall_img/301_bg.jpg', 'img/mall_img/301_sbg.jpg', 0, 1),
(30201, 302, '卷筆盒', 688, 'img/mall_img/302_black.png', '神秘黑', '時下流行的捲狀筆盒，實用性的容量。', 3, 'img/mall_img/302_bg.jpg', 'img/mall_img/302_sbg.jpg', 1, 1),
(30202, 302, '卷筆盒', 688, 'img/mall_img/302_brown.png', '駝棕色', '時下流行的捲狀筆盒，實用性的容量。', 3, 'img/mall_img/302_bg.jpg', 'img/mall_img/302_sbg.jpg', 0, 1),
(30203, 302, '卷筆盒', 688, 'img/mall_img/302_yellow.png', '活力黃', '時下流行的捲狀筆盒，實用性的容量。', 3, 'img/mall_img/302_bg.jpg', 'img/mall_img/302_sbg.jpg', 0, 1),
(30204, 302, '卷筆盒', 688, 'img/mall_img/302_pink.png', '櫻花粉', '時下流行的捲狀筆盒，實用性的容量。', 3, 'img/mall_img/302_bg.jpg', 'img/mall_img/302_sbg.jpg', 0, 1),
(30301, 303, '護照本', 800, 'img/mall_img/303_black.png', '典雅黑', '高品質的真皮，用於存放機票及票根，輕鬆出示護照。', 3, 'img/mall_img/303_bg.jpg', 'img/mall_img/303_sbg.jpg', 0, 1),
(30302, 303, '護照本', 800, 'img/mall_img/303_green.png', '孔雀藍', '高品質的真皮，用於存放機票及票根，輕鬆出示護照。', 3, 'img/mall_img/303_bg.jpg', 'img/mall_img/303_sbg.jpg', 0, 1),
(30303, 303, '護照本', 800, 'img/mall_img/303_red.png', '皇家紅', '高品質的真皮，用於存放機票及票根，輕鬆出示護照。', 3, 'img/mall_img/303_bg.jpg', 'img/mall_img/303_sbg.jpg', 0, 1),
(30304, 303, '護照本', 800, 'img/mall_img/303_white.png', '白米色', '高品質的真皮，用於存放機票及票根，輕鬆出示護照。', 3, 'img/mall_img/303_bg.jpg', 'img/mall_img/303_sbg.jpg', 0, 1),
(30401, 304, 'iPhone手機翻蓋套', 799, 'img/mall_img/304_red.png', '皇家紅', '高品質真皮，內部設有名片口袋，方便職人們在商業場合中使用。', 3, 'img/mall_img/304_bg.jpg', 'img/mall_img/304_sbg.jpg', 1, 1),
(30402, 304, 'iPhone手機翻蓋套', 799, 'img/mall_img/304_blue.png', '湖水綠', '高品質真皮，內部設有名片口袋，方便職人們在商業場合中使用。', 3, 'img/mall_img/304_bg.jpg', 'img/mall_img/304_sbg.jpg', 1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `manager`
--

DROP TABLE IF EXISTS `manager`;
CREATE TABLE IF NOT EXISTS `manager` (
  `mgr_no` int(11) NOT NULL AUTO_INCREMENT,
  `mgr_name` varchar(10) DEFAULT NULL,
  `mgr_id` varchar(20) NOT NULL,
  `mgr_psw` varchar(20) NOT NULL,
  `mgr_email` varchar(50) DEFAULT NULL,
  `mgr_sta` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:停權;1:正常',
  PRIMARY KEY (`mgr_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `manager`
--

INSERT INTO `manager` (`mgr_no`, `mgr_name`, `mgr_id`, `mgr_psw`, `mgr_email`, `mgr_sta`) VALUES
(1, NULL, 'admin', 'admin', NULL, 1),
(2, NULL, '123', '456', NULL, 0),
(3, NULL, '456', '456', NULL, 0),
(4, NULL, '789', '789', NULL, 0),
(5, NULL, '111', '111', NULL, 0),
(6, NULL, '225', '225', NULL, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `mem_no` int(11) NOT NULL AUTO_INCREMENT,
  `ring_no` varchar(256) DEFAULT './audio/ring1.mp3',
  `mem_name` varchar(10) DEFAULT NULL,
  `mem_id` varchar(20) NOT NULL,
  `mem_psw` varchar(20) NOT NULL,
  `mem_tel` varchar(10) DEFAULT NULL,
  `mem_email` varchar(50) NOT NULL,
  `mem_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:停權 1:正常',
  `mem_addr` varchar(50) DEFAULT NULL,
  `headshot` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`mem_no`),
  UNIQUE KEY `mem_id` (`mem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `member`
--

INSERT INTO `member` (`mem_no`, `ring_no`, `mem_name`, `mem_id`, `mem_psw`, `mem_tel`, `mem_email`, `mem_status`, `mem_addr`, `headshot`) VALUES
(1, './audio/ring2.mp3', '小華', 'dd104g3', 'dd104g3', '0905111992', 'dd104g3@dd.DD', 1, '中壢區', '20200201_165042dd104g3.png'),
(2, './audio/ring1.mp3', NULL, 'ddd104', 'ddd104', NULL, 'ccpopocket@gmail.com', 0, NULL, '20200130_65521ddd104.png'),
(3, './audio/ring1.mp3', '郝不帥', 'user2', 'user2', '0999123456', 'martinezchen02@gmail.com', 0, '中正路18巷3號', '20200203_30752user2.jpg'),
(4, './audio/ring1.mp3', '曾美好', 'user3', 'user3', NULL, 'user3@com.tw', 1, NULL, '20200201_165302user3.png'),
(5, './audio/ring1.mp3', '麻幾兔', 'user4', 'user4', NULL, 'user4@com.tw', 1, NULL, '20200201_165325user4.png'),
(6, './audio/ring1.mp3', '董董', 'user5', 'user5', NULL, 'user5@com.tw', 1, NULL, '20200201_165402user5.jpg'),
(7, './audio/ring1.mp3', '哈幾麻', 'user6', 'user6', NULL, 'user6@com.tw', 1, NULL, '20200201_165427user6.jpg'),
(8, './audio/ring1.mp3', 'Aenita', 'user7', 'user7', NULL, 'user7@com.tw', 1, NULL, '20200201_165451user7.jpg'),
(9, './audio/ring1.mp3', 'MergeTO', 'user8', 'user8', NULL, 'user8@com.tw', 1, NULL, '20200201_165507user8.jpg'),
(12, './audio/ring1.mp3', 'hihi', 'user1', 'user1', NULL, 'ccpopocket@gmail.com', 1, NULL, '20200203_30752user1.png'),
(13, './audio/ring1.mp3', NULL, 'cathy', 'wwwwww', NULL, 'yujia.chieh@howspace.net', 1, NULL, '20200203_25543cathy.png'),
(14, './audio/ring1.mp3', NULL, 'abc123', 'abc123', NULL, 'seanchen676@gmail.com', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `member_contact`
--

DROP TABLE IF EXISTS `member_contact`;
CREATE TABLE IF NOT EXISTS `member_contact` (
  `name_no` int(11) NOT NULL,
  `name_email` int(11) NOT NULL,
  `name_phone` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_no` int(11) NOT NULL AUTO_INCREMENT,
  `mem_no` int(11) DEFAULT NULL,
  `product_price` int(11) NOT NULL,
  `cret_date` datetime NOT NULL,
  `atr_date` datetime DEFAULT NULL,
  `cel_date` datetime DEFAULT NULL,
  `ship_addr` varchar(50) NOT NULL,
  `receiver_name` varchar(10) NOT NULL,
  `receiver_tel` varchar(10) NOT NULL,
  `order_sta` char(1) NOT NULL COMMENT '1:訂單處理中  2:檢貨中 3:已出貨',
  PRIMARY KEY (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `orders`
--

INSERT INTO `orders` (`order_no`, `mem_no`, `product_price`, `cret_date`, `atr_date`, `cel_date`, `ship_addr`, `receiver_name`, `receiver_tel`, `order_sta`) VALUES
(1, NULL, 1600, '2020-01-21 09:32:48', NULL, NULL, '', '', '', '2'),
(2, NULL, 4800, '2020-01-21 09:33:51', NULL, NULL, '', 'dfdfdf', 'fffffff', '2'),
(3, NULL, 14400, '2020-01-21 09:35:15', NULL, NULL, 'testtest', 'test', 'test', '2'),
(4, NULL, 4800, '2020-01-21 10:14:43', NULL, NULL, '', 'zzzz', '', '2'),
(5, NULL, 24000, '2020-01-21 10:28:54', NULL, NULL, '5165166323123', '123132321', '165132132', '2'),
(6, NULL, 6320, '2020-01-21 10:39:46', NULL, NULL, '111', '', '', '2'),
(7, 1, 4800, '2020-01-21 11:14:06', NULL, NULL, 'eeeeeeeee', 'dddd', 'dddd', '4'),
(8, 1, 1600, '2020-01-30 14:51:35', NULL, NULL, '', '', '', '4'),
(9, 3, 4400, '2020-01-31 16:08:06', NULL, NULL, '桃園市中壢區中大路300號', '郝帥', '0987654321', '4'),
(10, 3, 0, '2020-01-31 22:48:02', NULL, NULL, '', '', '', '4'),
(11, 3, 3596, '2020-02-01 15:03:25', NULL, NULL, 'hhhhhh', 'hhh', 'hhh', '4'),
(12, 1, 2500, '2020-02-01 20:54:18', NULL, NULL, '', '', '', '4'),
(13, 3, 1598, '2020-02-01 21:21:40', NULL, NULL, '中正路18巷3號', '娜美', '0999123456', '4'),
(14, 3, 14672, '2020-02-01 22:37:14', NULL, NULL, '中正路18巷3號', '娜美', '0999123456', '4'),
(15, 3, 2199, '2020-02-02 13:34:18', NULL, NULL, '中壢', '小花', '0950803905', '1'),
(16, 3, 16180, '2020-02-02 14:51:32', NULL, NULL, '中正路18巷3號', '娜美', '0999123456', '4'),
(17, 13, 8989, '2020-02-02 14:51:40', NULL, NULL, 'qqq', 'bb', '091234568', '4'),
(18, 3, 16048, '2020-02-02 19:58:58', NULL, NULL, '中正路18巷3號', '娜美', '0999123456', '1'),
(19, 10, 14400, '2020-02-02 19:59:05', NULL, NULL, '', '12313', '1233', '1'),
(20, 10, 12800, '2020-02-02 20:03:10', NULL, NULL, '', '', '', '1'),
(21, 3, 33600, '2020-02-02 20:03:10', NULL, NULL, '中正路18巷3號', '娜美', '0999123456', '1'),
(22, 3, 18193, '2020-02-03 11:06:48', NULL, NULL, '中正路18巷3號', '娜美', '0999123456', '1'),
(23, 12, 8792, '2020-02-03 11:06:54', '2020-02-03 11:16:30', NULL, '11111', 'ees', '10234324', '2'),
(24, 13, 1600, '2020-02-03 11:15:31', NULL, NULL, 'sdfghjkl', 'fghjkl;\'', 'dfghjkl;', '1'),
(25, 12, 2800, '2020-02-03 11:15:33', NULL, NULL, '中正路18巷3號', '娜美', '0999123456', '4');

-- --------------------------------------------------------

--
-- 資料表結構 `order_item`
--

DROP TABLE IF EXISTS `order_item`;
CREATE TABLE IF NOT EXISTS `order_item` (
  `order_no` int(11) NOT NULL,
  `mem_no` int(11) NOT NULL,
  `product_name_color` varchar(20) NOT NULL,
  `order_product_price` int(11) NOT NULL,
  `order_product_num` int(11) NOT NULL,
  `cret_time` datetime NOT NULL,
  KEY `order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `order_item`
--

INSERT INTO `order_item` (`order_no`, `mem_no`, `product_name_color`, `order_product_price`, `order_product_num`, `cret_time`) VALUES
(8, 1, '纖巧商務包駝棕色', 1600, 1, '2020-01-30 14:51:35'),
(9, 3, '纖巧商務包典雅黑', 1600, 1, '2020-01-31 16:08:06'),
(9, 3, '迷你手提袋駝棕色', 1200, 1, '2020-01-31 16:08:06'),
(9, 3, '護照本孔雀藍', 800, 2, '2020-01-31 16:08:06'),
(11, 3, '手拿包駝棕色', 899, 4, '2020-02-01 15:03:25'),
(12, 1, '迷你單肩包典雅黑', 900, 1, '2020-02-01 20:54:18'),
(12, 1, '纖巧商務包典雅黑', 1600, 1, '2020-02-01 20:54:18'),
(13, 3, 'iPhone手機殼駝棕色', 999, 1, '2020-02-01 21:21:40'),
(13, 3, '真皮識別證典雅黑', 799, 2, '2020-02-01 21:21:40'),
(14, 3, '卷筆盒活力黃', 688, 19, '2020-02-01 22:37:14'),
(14, 3, '纖巧商務包孔雀藍', 1600, 1, '2020-02-01 22:37:14'),
(15, 3, '迷你手提袋孔雀藍', 1200, 1, '2020-02-02 13:34:18'),
(15, 3, 'iPhone手機殼孔雀藍', 999, 1, '2020-02-02 13:34:18'),
(15, 3, '手拿包駝棕色', 899, 1, '2020-02-02 13:34:18'),
(16, 3, '真皮識別證優雅黑', 799, 19, '2020-02-02 14:51:32'),
(16, 3, 'iPhone手機殼孔雀藍', 999, 1, '2020-02-02 14:51:32'),
(17, 13, '真皮識別證優雅黑', 799, 10, '2020-02-02 14:51:40'),
(17, 13, 'iPhone手機殼典雅黑', 999, 1, '2020-02-02 14:51:40'),
(18, 3, '卷筆盒駝棕色', 688, 21, '2020-02-02 19:58:59'),
(18, 3, '纖巧商務包白米色', 1600, 1, '2020-02-02 19:58:59'),
(19, 10, '纖巧商務包典雅黑', 1600, 8, '2020-02-02 19:59:05'),
(19, 10, '纖巧商務包白米色', 1600, 1, '2020-02-02 19:59:05'),
(20, 10, '纖巧商務包白米色', 1600, 1, '2020-02-02 20:03:10'),
(20, 10, '纖巧商務包典雅黑', 1600, 1, '2020-02-02 20:03:10'),
(20, 10, '纖巧商務包孔雀藍', 1600, 6, '2020-02-02 20:03:10'),
(21, 3, '纖巧商務包典雅黑', 1600, 20, '2020-02-02 20:03:10'),
(21, 3, '纖巧商務包白米色', 1600, 1, '2020-02-02 20:03:10'),
(21, 3, '纖巧商務包孔雀藍', 1600, 1, '2020-02-02 20:03:10'),
(22, 3, 'iPhone手機殼駝棕色', 999, 7, '2020-02-03 11:06:48'),
(22, 3, '纖巧商務包白米色', 1600, 7, '2020-02-03 11:06:48'),
(22, 3, '迷你手提袋孔雀藍', 1200, 1, '2020-02-03 11:06:48'),
(23, 12, '真皮識別證優雅黑', 699, 8, '2020-02-03 11:06:54'),
(23, 12, '纖巧商務包典雅黑', 1600, 2, '2020-02-03 11:06:54'),
(24, 13, '纖巧商務包孔雀藍', 1600, 1, '2020-02-03 11:15:31'),
(25, 12, '纖巧商務包孔雀藍', 1600, 1, '2020-02-03 11:15:33'),
(25, 12, '迷你手提袋典雅黑', 1200, 1, '2020-02-03 11:15:33');

-- --------------------------------------------------------

--
-- 資料表結構 `person_in_charge`
--

DROP TABLE IF EXISTS `person_in_charge`;
CREATE TABLE IF NOT EXISTS `person_in_charge` (
  `mem_no` int(11) NOT NULL,
  `card_no` int(11) NOT NULL,
  PRIMARY KEY (`mem_no`,`card_no`),
  KEY `mem_no` (`mem_no`),
  KEY `card_no` (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `person_in_charge`
--

INSERT INTO `person_in_charge` (`mem_no`, `card_no`) VALUES
(1, 11),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 33),
(3, 34),
(4, 17),
(13, 105);

-- --------------------------------------------------------

--
-- 資料表結構 `program`
--

DROP TABLE IF EXISTS `program`;
CREATE TABLE IF NOT EXISTS `program` (
  `pro_no` int(11) NOT NULL AUTO_INCREMENT,
  `pro_title` varchar(256) NOT NULL,
  `mem_no` int(11) NOT NULL,
  `pro_col` char(9) NOT NULL COMMENT '16進位色碼',
  `pro_sta` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未完成 1:完成',
  PRIMARY KEY (`pro_no`),
  KEY `mem_no` (`mem_no`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `program`
--

INSERT INTO `program` (`pro_no`, `pro_title`, `mem_no`, `pro_col`, `pro_sta`) VALUES
(4, 'aa', 1, '#f9bf45', 0),
(5, 'adsfad', 1, '#3581B8', 0),
(9, '專案1', 3, '#a6c1ee', 0),
(10, '專案2', 3, '#f8c3cd', 1),
(11, '專案3', 3, '#f9bf45', 0),
(13, '專案5', 3, '#A09CB0', 1),
(14, '專案6', 3, '#B2967D', 1),
(22, '專案8', 3, '#6C39C8FF', 1),
(23, '真美好日程', 4, '#A09CB0', 0),
(24, '真美好專案', 4, '#48A9A6', 0),
(39, '專案設計', 3, '#eb7a77', 0),
(40, '一日行程', 12, '#3581B8', 0),
(41, 'test', 13, '#EB7A77', 1),
(42, 'test', 3, '#4F3EC8FF', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `timer_ring`
--

DROP TABLE IF EXISTS `timer_ring`;
CREATE TABLE IF NOT EXISTS `timer_ring` (
  `ring_no` int(11) NOT NULL,
  `ring_name` varchar(50) NOT NULL,
  `ring_addr` varchar(50) NOT NULL,
  PRIMARY KEY (`ring_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `todo`
--

DROP TABLE IF EXISTS `todo`;
CREATE TABLE IF NOT EXISTS `todo` (
  `todo_no` int(11) NOT NULL AUTO_INCREMENT,
  `pro_no` int(11) NOT NULL,
  `card_no` int(11) NOT NULL,
  `todo_title` varchar(50) NOT NULL,
  PRIMARY KEY (`todo_no`),
  KEY `card_no` (`card_no`),
  KEY `pro_no` (`pro_no`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `todo`
--

INSERT INTO `todo` (`todo_no`, `pro_no`, `card_no`, `todo_title`) VALUES
(27, 4, 11, 'aaa'),
(34, 9, 17, '1-1-1'),
(35, 9, 17, '1-1-2'),
(36, 9, 18, '1-2-1'),
(37, 9, 18, '1-2-2'),
(38, 9, 21, 'jghj'),
(39, 9, 20, '1'),
(40, 9, 20, '2'),
(41, 11, 28, 'gfh'),
(42, 11, 28, 'fgh'),
(55, 22, 51, '陪兒子'),
(56, 22, 51, '陪老婆'),
(78, 11, 73, 'asd'),
(169, 39, 95, '加到番茄'),
(170, 39, 94, '番茄茄'),
(176, 40, 101, '晚上'),
(177, 40, 101, '陪兒子');

-- --------------------------------------------------------

--
-- 資料表結構 `todo_content`
--

DROP TABLE IF EXISTS `todo_content`;
CREATE TABLE IF NOT EXISTS `todo_content` (
  `todo_cont_no` int(11) NOT NULL AUTO_INCREMENT,
  `pro_no` int(11) NOT NULL,
  `card_no` int(11) NOT NULL,
  `todo_no` int(11) NOT NULL,
  `todo_cont` varchar(50) NOT NULL,
  `todo_cont_sta` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未完成 1:完成',
  `todo_timer` int(11) NOT NULL DEFAULT '0',
  `todo_cont_clock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:沒 1:有',
  PRIMARY KEY (`todo_cont_no`),
  KEY `todo_no` (`todo_no`),
  KEY `pro_no` (`pro_no`),
  KEY `card_no` (`card_no`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `todo_content`
--

INSERT INTO `todo_content` (`todo_cont_no`, `pro_no`, `card_no`, `todo_no`, `todo_cont`, `todo_cont_sta`, `todo_timer`, `todo_cont_clock`) VALUES
(68, 4, 11, 27, 'aaa', 0, 26, 1),
(69, 4, 11, 27, 'aaa', 0, 10, 0),
(70, 4, 11, 27, 'asdfdsaf', 0, 0, 0),
(79, 9, 17, 34, '1-1-1-1', 0, 10, 0),
(80, 9, 17, 34, '1-1-1-2', 0, 28, 0),
(81, 9, 17, 34, '1-1-1-3', 1, 10, 0),
(82, 9, 17, 35, '1-1-2-1', 1, 10, 0),
(83, 9, 18, 36, '1-2-1-1', 1, 10, 0),
(84, 9, 18, 36, '1-2-1-2', 1, 10, 0),
(85, 9, 18, 37, '1-2-2-1', 1, 15, 0),
(86, 9, 21, 38, 'dhj', 0, 10, 0),
(87, 9, 21, 38, 'lll', 1, 10, 0),
(88, 9, 20, 39, '1-1', 0, 10, 0),
(89, 9, 20, 39, '1-4', 0, 10, 0),
(90, 11, 28, 41, 'ghjghj', 0, 10, 0),
(91, 11, 28, 41, 'uiouio', 1, 10, 0),
(92, 11, 28, 42, 'ghj', 1, 10, 0),
(117, 22, 51, 55, '打籃球', 0, 0, 0),
(118, 22, 51, 55, '打遊戲', 0, 0, 0),
(119, 22, 51, 56, '洗衣', 0, 0, 0),
(155, 11, 73, 78, 'as', 0, 0, 0),
(392, 39, 95, 169, '畫logo', 1, 10, 1),
(393, 39, 94, 170, 'wireframe繪製', 1, 8, 1),
(401, 40, 101, 176, '刷廁所', 1, 0, 1),
(402, 40, 101, 176, '洗衣', 1, 5, 1),
(403, 40, 101, 177, '打羽球', 0, 0, 1),
(405, 40, 101, 177, '看動畫', 0, 0, 0);

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`pro_no`) REFERENCES `program` (`pro_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `card_file`
--
ALTER TABLE `card_file`
  ADD CONSTRAINT `card_file_ibfk_2` FOREIGN KEY (`pro_no`) REFERENCES `program` (`pro_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `card_file_ibfk_3` FOREIGN KEY (`card_no`) REFERENCES `card` (`card_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `chat_record`
--
ALTER TABLE `chat_record`
  ADD CONSTRAINT `chat_record_ibfk_1` FOREIGN KEY (`pro_no`) REFERENCES `program` (`pro_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_record_ibfk_2` FOREIGN KEY (`mem_no`) REFERENCES `member` (`mem_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `join_program`
--
ALTER TABLE `join_program`
  ADD CONSTRAINT `join_program_ibfk_1` FOREIGN KEY (`pro_no`) REFERENCES `program` (`pro_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `join_program_ibfk_2` FOREIGN KEY (`mem_no`) REFERENCES `member` (`mem_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `join_program_ibfk_3` FOREIGN KEY (`inv_by_mem`) REFERENCES `member` (`mem_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_no`) REFERENCES `orders` (`order_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `person_in_charge`
--
ALTER TABLE `person_in_charge`
  ADD CONSTRAINT `person_in_charge_ibfk_2` FOREIGN KEY (`mem_no`) REFERENCES `member` (`mem_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `person_in_charge_ibfk_3` FOREIGN KEY (`card_no`) REFERENCES `card` (`card_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `program_ibfk_1` FOREIGN KEY (`mem_no`) REFERENCES `member` (`mem_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `todo`
--
ALTER TABLE `todo`
  ADD CONSTRAINT `todo_ibfk_1` FOREIGN KEY (`card_no`) REFERENCES `card` (`card_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `todo_ibfk_2` FOREIGN KEY (`pro_no`) REFERENCES `program` (`pro_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `todo_content`
--
ALTER TABLE `todo_content`
  ADD CONSTRAINT `todo_content_ibfk_1` FOREIGN KEY (`todo_no`) REFERENCES `todo` (`todo_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `todo_content_ibfk_2` FOREIGN KEY (`pro_no`) REFERENCES `program` (`pro_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `todo_content_ibfk_3` FOREIGN KEY (`card_no`) REFERENCES `card` (`card_no`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
