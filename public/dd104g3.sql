-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 
-- 伺服器版本： 10.4.11-MariaDB
-- PHP 版本： 7.4.1

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

CREATE TABLE `card` (
  `card_no` int(11) NOT NULL,
  `pro_no` int(11) NOT NULL,
  `card_name` varchar(50) NOT NULL,
  `card_date` datetime DEFAULT NULL,
  `card_type` char(1) NOT NULL DEFAULT '0' COMMENT '0:待辦事項 1:進行中 2:完成',
  `card_sta` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未完成 1:完成'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `card`
--

INSERT INTO `card` (`card_no`, `pro_no`, `card_name`, `card_date`, `card_type`, `card_sta`) VALUES
(100, 109, '待辦項目1', '2020-01-01 12:00:00', '0', 1),
(101, 110, '待辦項目2', NULL, '1', 0),
(102, 109, '待辦項目5', NULL, '0', 0),
(103, 109, '待辦項目6', NULL, '0', 0),
(104, 109, '待辦項目7', NULL, '0', 0),
(108, 109, 'test', '2020-01-01 00:00:00', '0', 0),
(109, 109, 'test', '2020-01-01 12:02:00', '0', 0),
(110, 109, '待辦項目', NULL, '0', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `card_file`
--

CREATE TABLE `card_file` (
  `file_no` int(11) NOT NULL,
  `todo_no` int(11) NOT NULL,
  `pro_no` int(11) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_src` text NOT NULL,
  `card_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `chat_record`
--

CREATE TABLE `chat_record` (
  `chat_no` int(11) NOT NULL,
  `pro_no` int(11) NOT NULL,
  `mem_no` int(11) NOT NULL,
  `chat_cont` varchar(100) NOT NULL,
  `chat_time` datetime NOT NULL,
  `chat_file` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `join_program`
--

CREATE TABLE `join_program` (
  `mem_no` int(11) NOT NULL,
  `pro_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `mall_product`
--

CREATE TABLE `mall_product` (
  `product_no` int(11) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_src` varchar(50) NOT NULL,
  `product_color` varchar(50) NOT NULL,
  `product_desc` varchar(100) NOT NULL,
  `product_type` int(11) NOT NULL,
  `product_bg_src` varchar(50) NOT NULL,
  `product_slide_img` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `mall_product`
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

CREATE TABLE `manager` (
  `mgr_no` int(11) NOT NULL,
  `mgr_name` varchar(10) NOT NULL,
  `mgr_id` varchar(20) NOT NULL,
  `mgr_psw` varchar(20) NOT NULL,
  `mgr_email` varchar(50) NOT NULL,
  `mgr_sta` tinyint(1) NOT NULL COMMENT '0:停權;1:正常'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `mem_no` int(11) NOT NULL,
  `ring_no` int(11) DEFAULT NULL,
  `mem_name` varchar(10) DEFAULT NULL,
  `mem_id` varchar(20) NOT NULL,
  `mem_psw` varchar(20) NOT NULL,
  `mem_tel` varchar(10) DEFAULT NULL,
  `mem_email` varchar(50) NOT NULL,
  `mem_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0:停權 1:正常',
  `mem_addr` varchar(50) DEFAULT NULL,
  `headshot` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`mem_no`, `ring_no`, `mem_name`, `mem_id`, `mem_psw`, `mem_tel`, `mem_email`, `mem_status`, `mem_addr`, `headshot`) VALUES
(1, NULL, NULL, 'asd', 'asd', NULL, 'asd@asd.asd', 1, NULL, 'img/user.9c173fc0.svg'),
(2, NULL, NULL, '123', '123', NULL, '123@asd.asd', 1, NULL, 'img/user.9c173fc0.svg');

-- --------------------------------------------------------

--
-- 資料表結構 `member_contact`
--

CREATE TABLE `member_contact` (
  `name_no` int(11) NOT NULL,
  `name_email` int(11) NOT NULL,
  `name_phone` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `order_no` int(11) NOT NULL,
  `mem_no` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `cret_date` date NOT NULL,
  `atr_date` date NOT NULL,
  `cel_date` date NOT NULL,
  `ship_addr` varchar(50) NOT NULL,
  `receiver_name` varchar(10) NOT NULL,
  `receiver_tel` varchar(10) NOT NULL,
  `order_sta` char(1) NOT NULL COMMENT '1:訂單處理中  2:檢貨中 3:已出貨'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `order_item`
--

CREATE TABLE `order_item` (
  `order_no` int(11) NOT NULL,
  `product_no` int(11) NOT NULL,
  `product_amout` int(11) NOT NULL,
  `product_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `person_in_charge`
--

CREATE TABLE `person_in_charge` (
  `mem_no` int(11) NOT NULL,
  `card_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `program`
--

CREATE TABLE `program` (
  `pro_no` int(11) NOT NULL,
  `pro_title` varchar(256) NOT NULL,
  `mem_no` int(11) NOT NULL,
  `pro_col` char(7) NOT NULL COMMENT '16進位色碼',
  `pro_sta` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未完成 1:完成'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `program`
--

INSERT INTO `program` (`pro_no`, `pro_title`, `mem_no`, `pro_col`, `pro_sta`) VALUES
(109, '1', 1, '#81c7d4', 0),
(110, '2', 1, '#F9BF45', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `timer_ring`
--

CREATE TABLE `timer_ring` (
  `ring_no` int(11) NOT NULL,
  `ring_name` varchar(50) NOT NULL,
  `ring_addr` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `todo`
--

CREATE TABLE `todo` (
  `todo_no` int(11) NOT NULL,
  `card_no` int(11) NOT NULL,
  `todo_title` varchar(50) NOT NULL,
  `pro_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `todo`
--

INSERT INTO `todo` (`todo_no`, `card_no`, `todo_title`, `pro_no`) VALUES
(277, 101, '2', 110),
(278, 101, '2', 110),
(289, 102, '5', 109),
(292, 103, '6', 109),
(294, 104, '7', 109),
(296, 100, '1', 109);

-- --------------------------------------------------------

--
-- 資料表結構 `todo_content`
--

CREATE TABLE `todo_content` (
  `todo_cont_no` int(11) NOT NULL,
  `todo_no` int(11) NOT NULL,
  `pro_no` int(11) NOT NULL,
  `card_no` int(11) NOT NULL,
  `todo_cont` varchar(50) NOT NULL,
  `todo_cont_sta` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未完成 1:完成',
  `todo_timer` int(11) NOT NULL DEFAULT 0,
  `todo_cont_clock` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:沒 1:有'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `todo_content`
--

INSERT INTO `todo_content` (`todo_cont_no`, `todo_no`, `pro_no`, `card_no`, `todo_cont`, `todo_cont_sta`, `todo_timer`, `todo_cont_clock`) VALUES
(317, 278, 110, 101, '2', 0, 29, 0),
(318, 278, 110, 101, '2', 0, 0, 0),
(339, 289, 109, 102, '5', 0, 5, 1),
(343, 294, 109, 104, '7', 0, 15, 1),
(346, 296, 109, 100, '1', 0, 7, 0),
(347, 296, 109, 100, '1', 0, 0, 1);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`card_no`),
  ADD KEY `pro_no` (`pro_no`);

--
-- 資料表索引 `card_file`
--
ALTER TABLE `card_file`
  ADD PRIMARY KEY (`file_no`),
  ADD KEY `todo_no` (`todo_no`),
  ADD KEY `pro_no` (`pro_no`);

--
-- 資料表索引 `chat_record`
--
ALTER TABLE `chat_record`
  ADD PRIMARY KEY (`chat_no`),
  ADD KEY `pro_no` (`pro_no`),
  ADD KEY `mem_no` (`mem_no`);

--
-- 資料表索引 `join_program`
--
ALTER TABLE `join_program`
  ADD PRIMARY KEY (`mem_no`,`pro_no`),
  ADD KEY `mem_no` (`mem_no`),
  ADD KEY `pro_no` (`pro_no`);

--
-- 資料表索引 `mall_product`
--
ALTER TABLE `mall_product`
  ADD PRIMARY KEY (`product_no`);

--
-- 資料表索引 `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`mgr_no`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`mem_no`),
  ADD UNIQUE KEY `mem_id` (`mem_id`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_no`);

--
-- 資料表索引 `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_no`,`product_no`),
  ADD KEY `order_no` (`order_no`),
  ADD KEY `order_item_ibfk_1` (`product_no`);

--
-- 資料表索引 `person_in_charge`
--
ALTER TABLE `person_in_charge`
  ADD PRIMARY KEY (`mem_no`,`card_no`),
  ADD KEY `mem_no` (`mem_no`),
  ADD KEY `card_no` (`card_no`);

--
-- 資料表索引 `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`pro_no`),
  ADD KEY `mem_no` (`mem_no`);

--
-- 資料表索引 `timer_ring`
--
ALTER TABLE `timer_ring`
  ADD PRIMARY KEY (`ring_no`);

--
-- 資料表索引 `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`todo_no`),
  ADD KEY `card_no` (`card_no`),
  ADD KEY `pro_no` (`pro_no`);

--
-- 資料表索引 `todo_content`
--
ALTER TABLE `todo_content`
  ADD PRIMARY KEY (`todo_cont_no`),
  ADD KEY `todo_no` (`todo_no`),
  ADD KEY `pro_no` (`pro_no`),
  ADD KEY `card_no` (`card_no`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `card`
--
ALTER TABLE `card`
  MODIFY `card_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `card_file`
--
ALTER TABLE `card_file`
  MODIFY `file_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `mall_product`
--
ALTER TABLE `mall_product`
  MODIFY `product_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10105;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `mem_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `order_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `program`
--
ALTER TABLE `program`
  MODIFY `pro_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `todo`
--
ALTER TABLE `todo`
  MODIFY `todo_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `todo_content`
--
ALTER TABLE `todo_content`
  MODIFY `todo_cont_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`pro_no`) REFERENCES `program` (`pro_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `card_file`
--
ALTER TABLE `card_file`
  ADD CONSTRAINT `card_file_ibfk_1` FOREIGN KEY (`todo_no`) REFERENCES `todo` (`todo_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `card_file_ibfk_2` FOREIGN KEY (`pro_no`) REFERENCES `program` (`pro_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `chat_record`
--
ALTER TABLE `chat_record`
  ADD CONSTRAINT `chat_record_ibfk_1` FOREIGN KEY (`pro_no`) REFERENCES `program` (`pro_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_record_ibfk_2` FOREIGN KEY (`mem_no`) REFERENCES `member` (`mem_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `join_program`
--
ALTER TABLE `join_program`
  ADD CONSTRAINT `join_program_ibfk_3` FOREIGN KEY (`pro_no`) REFERENCES `program` (`pro_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `join_program_ibfk_4` FOREIGN KEY (`mem_no`) REFERENCES `member` (`mem_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`product_no`) REFERENCES `mall_product` (`product_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`order_no`) REFERENCES `orders` (`order_no`);

--
-- 資料表的限制式 `person_in_charge`
--
ALTER TABLE `person_in_charge`
  ADD CONSTRAINT `person_in_charge_ibfk_2` FOREIGN KEY (`mem_no`) REFERENCES `member` (`mem_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `person_in_charge_ibfk_3` FOREIGN KEY (`card_no`) REFERENCES `card` (`card_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `program_ibfk_1` FOREIGN KEY (`mem_no`) REFERENCES `member` (`mem_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `todo`
--
ALTER TABLE `todo`
  ADD CONSTRAINT `todo_ibfk_1` FOREIGN KEY (`card_no`) REFERENCES `card` (`card_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `todo_ibfk_2` FOREIGN KEY (`pro_no`) REFERENCES `program` (`pro_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `todo_content`
--
ALTER TABLE `todo_content`
  ADD CONSTRAINT `todo_content_ibfk_1` FOREIGN KEY (`todo_no`) REFERENCES `todo` (`todo_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `todo_content_ibfk_2` FOREIGN KEY (`pro_no`) REFERENCES `program` (`pro_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `todo_content_ibfk_3` FOREIGN KEY (`card_no`) REFERENCES `card` (`card_no`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
