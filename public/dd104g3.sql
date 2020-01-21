-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1:3306
-- 產生時間： 2020-01-21 07:22:51
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `card_file`
--

DROP TABLE IF EXISTS `card_file`;
CREATE TABLE IF NOT EXISTS `card_file` (
  `file_no` int(11) NOT NULL AUTO_INCREMENT,
  `pro_no` int(11) NOT NULL,
  `card_no` int(11) NOT NULL,
  `todo_no` int(11) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_src` text NOT NULL,
  PRIMARY KEY (`file_no`),
  KEY `pro_no` (`pro_no`),
  KEY `card_no` (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=15151652 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `mall_product`
--

INSERT INTO `mall_product` (`product_no`, `product_num`, `product_name`, `product_price`, `product_src`, `product_color`, `product_desc`, `product_type`, `product_bg_src`, `product_slide_img`, `index_on`, `product_on`) VALUES
(10101, 101, '纖巧商務包', 1600, 'img/mall_img/101_black.png', '典雅黑', '絨毛內裡 保護電腦不刮傷凹形邊緣護墊 有效吸收抵禦衝擊', 1, 'img/mall_img/101_bg.jpg', 'img/mall_img/101_sbg.jpg', 0, 1),
(10102, 101, '纖巧商務包', 1600, 'img/mall_img/101_brown.png', '駝棕色', '絨毛內裡 保護電腦不刮傷凹形邊緣護墊 有效吸收抵禦衝擊', 1, 'img/mall_img/101_bg.jpg', 'img/mall_img/101_sbg.jpg', 1, 1),
(10103, 101, '纖巧商務包', 1600, 'img/mall_img/101_blue.png', '孔雀藍', '絨毛內裡 保護電腦不刮傷凹形邊緣護墊 有效吸收抵禦衝擊', 1, 'img/mall_img/101_bg.jpg', 'img/mall_img/101_sbg.jpg', 0, 1),
(10104, 101, '纖巧商務包', 1600, 'img/mall_img/101_white.png', '白米色', '絨毛內裡 保護電腦不刮傷凹形邊緣護墊 有效吸收抵禦衝擊', 1, 'img/mall_img/101_bg.jpg', 'img/mall_img/101_sbg.jpg', 0, 1),
(10201, 102, '迷你單肩包', 1200, 'img/mall_img/102_black.png', '典雅黑', '精緻的設計為休閒裝增添優雅氣息。 最上等的牛真皮具有獨特的柔軟性，穿著舒適。', 1, 'img/mall_img/102_bg.jpg', 'img/mall_img/102_sbg.jpg', 0, 1),
(10202, 102, '迷你單肩包', 1200, 'img/mall_img/102_blue.png', '孔雀藍', '精緻的設計為休閒裝增添優雅氣息。 最上等的牛真皮具有獨特的柔軟性，穿著舒適。', 1, 'img/mall_img/102_bg.jpg', 'img/mall_img/102_sbg.jpg', 1, 1),
(10203, 102, '迷你單肩包', 1200, 'img/mall_img/102_brown.png', '駝棕色', '精緻的設計為休閒裝增添優雅氣息。 最上等的牛真皮具有獨特的柔軟性，穿著舒適。', 1, 'img/mall_img/102_bg.jpg', 'img/mall_img/102_sbg.jpg', 0, 1),
(10204, 102, '迷你單肩包', 1200, 'img/mall_img/102_red.png', '皇家紅', '精緻的設計為休閒裝增添優雅氣息。 最上等的牛真皮具有獨特的柔軟性，穿著舒適。', 1, 'img/mall_img/102_bg.jpg', 'img/mall_img/102_sbg.jpg', 0, 1),
(10301, 103, '手拿包', 900, 'img/mall_img/103_black.png', '典雅黑', '3個口袋 外面有拉鍊', 1, 'img/mall_img/103_bg.jpg', 'img/mall_img/103_sbg.jpg', 0, 1),
(10302, 103, '手拿包', 900, 'img/mall_img/103_blue.png', '孔雀藍', '3個口袋 外面有拉鍊', 1, 'img/mall_img/103_bg.jpg', 'img/mall_img/103_sbg.jpg', 1, 1),
(10303, 103, '手拿包', 900, 'img/mall_img/103_brown.png', '駝棕色', '3個口袋 外面有拉鍊', 1, 'img/mall_img/103_bg.jpg', 'img/mall_img/103_sbg.jpg', 0, 1),
(10304, 103, '手拿包', 900, 'img/mall_img/103_pink.png', '櫻花粉', '3個口袋 外面有拉鍊', 1, 'img/mall_img/103_bg.jpg', 'img/mall_img/103_sbg.jpg', 0, 1),
(20101, 201, '牛皮真皮身份證夾', 790, 'img/mall_img/201_black.png', '神秘黑', '最優質的牛皮製成 可取下膠片', 2, 'img/mall_img/201_bg.jpg', 'img/mall_img/201_sbg.jpg', 1, 1),
(20102, 201, '牛皮真皮身份證夾', 790, 'img/mall_img/201_brown.png', '神秘黑', '最優質的牛皮製成 可取下膠片', 2, 'img/mall_img/201_bg.jpg', 'img/mall_img/201_sbg.jpg', 0, 1),
(20103, 201, '牛皮真皮身份證夾', 790, 'img/mall_img/201_green.png', '孔雀藍', '最優質的牛皮製成 可取下膠片', 2, 'img/mall_img/201_bg.jpg', 'img/mall_img/201_sbg.jpg', 0, 1),
(20104, 201, '牛皮真皮身份證夾', 790, 'img/mall_img/201_white.png', '白米色', '最優質的牛皮製成 可取下膠片', 2, 'img/mall_img/201_bg.jpg', 'img/mall_img/201_sbg.jpg', 0, 1),
(20201, 202, '真皮卡套', 880, 'img/mall_img/202_black.png', '神秘黑', '可放大約20張名片厚度 不易打滑、享受質感', 2, 'img/mall_img/202_bg.jpg', 'img/mall_img/202_sbg.jpg', 1, 1),
(20202, 202, '真皮卡套', 880, 'img/mall_img/202_brown.png', '駝棕色', '可放大約20張名片厚度 不易打滑、享受質感', 2, 'img/mall_img/202_bg.jpg', 'img/mall_img/202_sbg.jpg', 0, 1),
(20203, 202, '真皮卡套', 880, 'img/mall_img/202_pink.png', '櫻花粉', '可放大約20張名片厚度 不易打滑、享受質感', 2, 'img/mall_img/202_bg.jpg', 'img/mall_img/202_sbg.jpg', 0, 1),
(20204, 202, '真皮卡套', 880, 'img/mall_img/202_red.png', '皇家紅', '可放大約20張名片厚度 不易打滑、享受質感', 2, 'img/mall_img/202_bg.jpg', 'img/mall_img/202_sbg.jpg', 0, 1),
(20301, 203, '超薄名片夾', 500, 'img/mall_img/203_black.png', '神秘黑', '一個簡單而纖薄的名片夾，可用於辦公室工作人員。', 2, 'img/mall_img/203_bg.jpg', 'img/mall_img/203_sbg.jpg', 1, 1),
(20302, 203, '超薄名片夾', 500, 'img/mall_img/203_brown.png', '駝棕色', '一個簡單而纖薄的名片夾，可用於辦公室工作人員。', 2, 'img/mall_img/203_bg.jpg', 'img/mall_img/203_sbg.jpg', 0, 1),
(15151651, 151, '48484', 48488, 'img/mall_img/mat_ft.4f7a9f32.jpg', '哈囉黃', '111111111', 1, 'img/mall_img/mat_ft_r.3d1720db.jpg', 'img/mall_img/2.png', 1, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `manager`
--

INSERT INTO `manager` (`mgr_no`, `mgr_name`, `mgr_id`, `mgr_psw`, `mgr_email`, `mgr_sta`) VALUES
(1, NULL, 'admin', 'admin', NULL, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
(7, 1, 4800, '2020-01-21 11:14:06', NULL, NULL, 'eeeeeeeee', 'dddd', 'dddd', '2');

-- --------------------------------------------------------

--
-- 資料表結構 `order_item`
--

DROP TABLE IF EXISTS `order_item`;
CREATE TABLE IF NOT EXISTS `order_item` (
  `order_no` int(11) NOT NULL,
  `product_no` int(11) NOT NULL,
  `product_amout` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  PRIMARY KEY (`order_no`,`product_no`),
  KEY `order_no` (`order_no`),
  KEY `product_no` (`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- 資料表結構 `program`
--

DROP TABLE IF EXISTS `program`;
CREATE TABLE IF NOT EXISTS `program` (
  `pro_no` int(11) NOT NULL AUTO_INCREMENT,
  `pro_title` varchar(256) NOT NULL,
  `mem_no` int(11) NOT NULL,
  `pro_col` char(7) NOT NULL COMMENT '16進位色碼',
  `pro_sta` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未完成 1:完成',
  PRIMARY KEY (`pro_no`),
  KEY `mem_no` (`mem_no`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

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
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`order_no`) REFERENCES `orders` (`order_no`),
  ADD CONSTRAINT `order_item_ibfk_3` FOREIGN KEY (`product_no`) REFERENCES `mall_product` (`product_no`);

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
