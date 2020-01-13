-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1:3306
-- 產生時間： 2020-01-13 13:58:16
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  KEY `todo_no` (`todo_no`),
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
  `pro_no` int(11) NOT NULL,
  PRIMARY KEY (`mem_no`,`pro_no`),
  KEY `mem_no` (`mem_no`),
  KEY `pro_no` (`pro_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `mall_product`
--

DROP TABLE IF EXISTS `mall_product`;
CREATE TABLE IF NOT EXISTS `mall_product` (
  `product_no` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(20) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_src` varchar(50) NOT NULL,
  `product_color` varchar(50) NOT NULL,
  `product_desc` varchar(100) NOT NULL,
  `product_type` int(11) NOT NULL,
  `product_bg_src` varchar(50) NOT NULL,
  `product_slide_img` varchar(50) NOT NULL,
  PRIMARY KEY (`product_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10105 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `mall_product`
--

INSERT INTO `mall_product` (`product_no`, `product_name`, `product_price`, `product_src`, `product_color`, `product_desc`, `product_type`, `product_bg_src`, `product_slide_img`) VALUES
(10101, '纖巧商務包', 1600, 'img/mall_img/101_black.png', '典雅黑', '<li>絨毛內裡 保護電腦不刮傷</li><li>凹形邊緣護墊 有效吸收抵禦衝擊</li>', 1, 'img/mall_img/101_bg.jpg', 'img/mall_img/101_sbg.jpg'),
(10102, '纖巧商務包', 1600, 'img/mall_img/101_brown.png', '駝棕色', '<li>絨毛內裡 保護電腦不刮傷</li><li>凹形邊緣護墊 有效吸收抵禦衝擊</li>', 1, 'img/mall_img/101_bg.jpg', 'img/mall_img/101_sbg.jpg'),
(10103, '纖巧商務包', 1600, 'img/mall_img/101_blue.png', '孔雀藍', '<li>絨毛內裡 保護電腦不刮傷</li><li>凹形邊緣護墊 有效吸收抵禦衝擊</li>', 1, 'img/mall_img/101_bg.jpg', 'img/mall_img/101_sbg.jpg'),
(10104, '纖巧商務包', 1600, 'img/mall_img/101_white.png', '白米色', '<li>絨毛內裡 保護電腦不刮傷</li><li>凹形邊緣護墊 有效吸收抵禦衝擊</li>', 1, 'img/mall_img/101_bg.jpg', 'img/mall_img/101_sbg.jpg');

-- --------------------------------------------------------

--
-- 資料表結構 `manager`
--

DROP TABLE IF EXISTS `manager`;
CREATE TABLE IF NOT EXISTS `manager` (
  `mgr_no` int(11) NOT NULL,
  `mgr_name` varchar(10) NOT NULL,
  `mgr_id` varchar(20) NOT NULL,
  `mgr_psw` varchar(20) NOT NULL,
  `mgr_email` varchar(50) NOT NULL,
  `mgr_sta` tinyint(1) NOT NULL COMMENT '0:停權;1:正常',
  PRIMARY KEY (`mgr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `mem_no` int(11) NOT NULL AUTO_INCREMENT,
  `ring_no` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `mem_no` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `cret_date` date NOT NULL,
  `atr_date` date NOT NULL,
  `cel_date` date NOT NULL,
  `ship_addr` varchar(50) NOT NULL,
  `receiver_name` varchar(10) NOT NULL,
  `receiver_tel` varchar(10) NOT NULL,
  `order_sta` char(1) NOT NULL COMMENT '1:訂單處理中  2:檢貨中 3:已出貨',
  PRIMARY KEY (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  KEY `order_item_ibfk_1` (`product_no`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD CONSTRAINT `card_file_ibfk_1` FOREIGN KEY (`todo_no`) REFERENCES `todo` (`todo_no`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `join_program_ibfk_3` FOREIGN KEY (`pro_no`) REFERENCES `program` (`pro_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `join_program_ibfk_4` FOREIGN KEY (`mem_no`) REFERENCES `member` (`mem_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`product_no`) REFERENCES `mall_product` (`product_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`order_no`) REFERENCES `orders` (`order_no`);

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
