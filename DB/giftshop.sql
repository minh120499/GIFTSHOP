-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 04, 2022 lúc 03:07 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `giftshop`
--
DROP DATABASE IF EXISTS `giftshop`;
CREATE DATABASE `giftshop`;
USE `giftshop`;
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `administrator`
--

CREATE TABLE `administrator` (
  `account` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `aboutus` text DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `logo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `administrator`
--

INSERT INTO `administrator` (`account`, `password`, `address`, `email`, `phone`, `aboutus`, `avatar`, `logo`) VALUES
('admin', 'admin', 'Aptech Protrain, 285 Doi Can, Lieu Giai, Ba Dinh, Ha Noi', 'eproject_gifts_shop@aptechlearning.edu.vn', '08.8888.0000', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partrient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.\r\n\r\nDonec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 'http://localhost/img/giftshop/adminavatar.png', 'http://localhost/img/giftshop/logo.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`id`, `name`, `img`, `country`) VALUES
(1, 'Gamla', 'http://localhost/img/giftshop/brand/gamla.png', 'Thailand'),
(2, 'Metreero', 'http://localhost/img/giftshop/brand/metreero.png', 'Vietnam'),
(3, 'Keoni', 'http://localhost/img/giftshop/brand/keoni.png', 'Korea'),
(4, 'Nuletter', 'http://localhost/img/giftshop/brand/nuletter.png', 'Singapore'),
(5, 'Jline', 'http://localhost/img/giftshop/brand/jline.png', 'China'),
(6, 'Dior', 'http://localhost/img/giftshop/brand/dior.png', 'France'),
(7, 'Ysl', 'http://localhost/img/giftshop/brand/ysl.jpg', 'France'),
(8, 'Tomford', 'http://localhost/img/giftshop/brand/tomford.jpg', 'USA'),
(9, 'Penfolds', 'http://localhost/img/giftshop/brand/penfolds.jpg', 'Australia'),
(10, 'Cantine San Marzano', 'http://localhost/img/giftshop/brand/sanmazrano.png', 'Italy'),
(11, 'Absolut Elyx', 'http://localhost/img/giftshop/brand/absolutely.png', 'Sweden'),
(12, 'Begula', 'http://localhost/img/giftshop/brand/begula.png', 'Russia'),
(13, 'Belvedere', 'http://localhost/img/giftshop/brand/belvedere.png', 'Poland'),
(14, 'Snow Leopard', 'http://localhost/img/giftshop/brand/snowleopar.png', 'Poland'),
(15, 'Nicolas Feuillatte', 'http://localhost/img/giftshop/brand/nicolas.png', 'France'),
(16, 'Louis Roederer', 'http://localhost/img/giftshop/brand/louis.png', 'France'),
(17, 'Perrier Jouet', 'http://localhost/img/giftshop/brand/pj.jpg', 'France'),
(18, 'Armand de Brignac', 'http://localhost/img/giftshop/brand/armand.png', 'France');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `img`) VALUES
(1, 'Birthdays Anniversary', 'http://localhost/img/giftshop/categories/birthday.jpg'),
(2, 'Weddings Anniversary', 'http://localhost/img/giftshop/categories/wedding.jpg'),
(3, 'Christmas Anniversary', 'http://localhost/img/giftshop/categories/Christmas.jpg'),
(4, 'Valentine Day Anniversa', 'http://localhost/img/giftshop/categories/valtentine.jpg'),
(5, 'Mother Day Anniversary', 'http://localhost/img/giftshop/categories/motherday.jpg'),
(6, 'Easter Day Anniversary', 'http://localhost/img/giftshop/categories/easter.jpg'),
(7, 'Halloween Anniversary', 'http://localhost/img/giftshop/categories/halloween.jpg'),
(8, 'New Year Anniversary', 'http://localhost/img/giftshop/categories/newyear.jpg'),
(9, 'Clock', 'http://localhost/img/giftshop/categories/clock.jpg'),
(10, 'Cosmetics', 'http://localhost/img/giftshop/categories/cosmetic.png'),
(11, 'Decorations', 'http://localhost/img/giftshop/categories/deco.jpg'),
(12, 'Flower', 'http://localhost/img/giftshop/categories/flower.jpg'),
(13, 'Picture Frame', 'http://localhost/img/giftshop/categories/fp.png'),
(14, 'Teddy Bear', 'http://localhost/img/giftshop/categories/teddy.png'),
(15, 'Scarf', 'http://localhost/img/giftshop/categories/scarf.jfif'),
(16, 'Toy', 'http://localhost/img/giftshop/categories/toy.png'),
(17, 'Wine', 'http://localhost/img/giftshop/categories/wine.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catepro`
--

CREATE TABLE `catepro` (
  `cateid` int(11) NOT NULL,
  `proid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `catepro`
--

INSERT INTO `catepro` (`cateid`, `proid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 8),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 22),
(1, 23),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 31),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 48),
(1, 50),
(1, 52),
(1, 53),
(1, 55),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 62),
(1, 63),
(1, 64),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(2, 2),
(2, 3),
(2, 4),
(2, 6),
(2, 8),
(2, 9),
(2, 11),
(2, 13),
(2, 14),
(2, 16),
(2, 18),
(2, 19),
(2, 20),
(2, 23),
(2, 29),
(2, 30),
(2, 32),
(2, 36),
(2, 38),
(2, 47),
(2, 50),
(2, 52),
(2, 55),
(2, 57),
(2, 59),
(2, 60),
(2, 62),
(2, 69),
(2, 70),
(2, 71),
(2, 74),
(2, 83),
(2, 84),
(2, 87),
(2, 91),
(2, 92),
(3, 3),
(3, 5),
(3, 7),
(3, 8),
(3, 12),
(3, 14),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 28),
(3, 29),
(3, 32),
(3, 33),
(3, 35),
(3, 38),
(3, 39),
(3, 42),
(3, 43),
(3, 47),
(3, 51),
(3, 53),
(3, 55),
(3, 57),
(3, 58),
(3, 59),
(3, 61),
(3, 63),
(3, 66),
(3, 72),
(3, 73),
(3, 74),
(3, 75),
(3, 78),
(3, 80),
(3, 81),
(3, 82),
(3, 85),
(3, 88),
(4, 4),
(4, 11),
(4, 17),
(4, 20),
(4, 28),
(4, 34),
(4, 41),
(4, 47),
(4, 48),
(4, 49),
(4, 54),
(4, 55),
(4, 57),
(4, 63),
(4, 64),
(4, 71),
(4, 73),
(4, 75),
(4, 77),
(4, 87),
(4, 91),
(8, 2),
(8, 3),
(8, 4),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(8, 13),
(8, 15),
(8, 16),
(8, 17),
(8, 18),
(8, 19),
(8, 20),
(8, 21),
(8, 22),
(8, 23),
(8, 24),
(8, 25),
(8, 27),
(8, 28),
(8, 29),
(8, 31),
(8, 32),
(8, 36),
(8, 37),
(8, 40),
(8, 42),
(8, 43),
(8, 45),
(8, 46),
(8, 50),
(8, 52),
(8, 53),
(8, 55),
(8, 56),
(8, 57),
(8, 58),
(8, 60),
(8, 62),
(8, 64),
(8, 65),
(8, 66),
(8, 67),
(8, 68),
(8, 69),
(8, 73),
(8, 74),
(8, 75),
(8, 76),
(8, 77),
(8, 78),
(8, 80),
(8, 81),
(8, 82),
(8, 83),
(8, 85),
(8, 86),
(8, 88),
(8, 89),
(8, 90),
(8, 91),
(9, 11),
(9, 12),
(9, 13),
(9, 14),
(9, 15),
(9, 16),
(9, 17),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(10, 36),
(11, 18),
(11, 19),
(11, 20),
(11, 21),
(11, 22),
(11, 23),
(11, 24),
(11, 25),
(11, 26),
(11, 27),
(12, 53),
(12, 54),
(12, 55),
(12, 56),
(12, 57),
(12, 58),
(12, 59),
(12, 60),
(12, 61),
(12, 62),
(12, 63),
(12, 64),
(12, 65),
(12, 66),
(13, 37),
(13, 38),
(13, 39),
(13, 40),
(13, 41),
(13, 42),
(14, 67),
(14, 68),
(14, 69),
(14, 70),
(14, 71),
(14, 72),
(14, 73),
(14, 74),
(14, 75),
(14, 76),
(15, 43),
(15, 44),
(15, 45),
(15, 46),
(15, 47),
(15, 48),
(15, 49),
(15, 50),
(15, 51),
(15, 52),
(16, 1),
(16, 2),
(16, 3),
(16, 4),
(16, 5),
(16, 6),
(16, 7),
(16, 8),
(16, 9),
(16, 10),
(17, 77),
(17, 78),
(17, 79),
(17, 80),
(17, 81),
(17, 82),
(17, 83),
(17, 84),
(17, 85),
(17, 86),
(17, 87),
(17, 88),
(17, 89),
(17, 90),
(17, 91),
(17, 92);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `date` varchar(15) DEFAULT NULL,
  `rating` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `fullname` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id`, `fullname`, `email`, `title`, `content`) VALUES
(1, 'Vu Hoang Minh', 'minhihi@gmail.com', 'find a bug', 'cant login');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `date` text DEFAULT NULL,
  `toname` text DEFAULT NULL,
  `toemail` text DEFAULT NULL,
  `tophone` text DEFAULT NULL,
  `toaddress` text DEFAULT NULL,
  `payment` text DEFAULT NULL,
  `status` text DEFAULT 'unpaid',
  `userid` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ordersdetail`
--

CREATE TABLE `ordersdetail` (
  `productid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `coupon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productimg`
--

CREATE TABLE `productimg` (
  `id` int(11) NOT NULL,
  `src` text DEFAULT NULL,
  `productid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `productimg`
--

INSERT INTO `productimg` (`id`, `src`, `productid`) VALUES
(1, 'http://localhost/img/giftshop/Toy/gss2.jpg', 1),
(2, 'http://localhost/img/giftshop/Toy/gss3.jpg', 1),
(3, 'http://localhost/img/giftshop/Toy/gss4.jpg', 1),
(4, 'http://localhost/img/giftshop/Toy/wgsl1.jpg', 2),
(5, 'http://localhost/img/giftshop/Toy/wgsl2.jpg', 2),
(6, 'http://localhost/img/giftshop/Toy/wgsl3.jpg', 2),
(7, 'http://localhost/img/giftshop/Toy/wgsl4.jpg', 2),
(8, 'http://localhost/img/giftshop/Toy/wgsl5.jpg', 2),
(9, 'http://localhost/img/giftshop/Toy/msm1.jpg', 3),
(10, 'http://localhost/img/giftshop/Toy/msm2.jpg', 3),
(11, 'http://localhost/img/giftshop/Toy/msm3.jpg', 3),
(12, 'http://localhost/img/giftshop/Toy/msm4.jpg', 3),
(13, 'http://localhost/img/giftshop/Toy/pb1.jpg', 4),
(14, 'http://localhost/img/giftshop/Toy/pb2.jpg', 4),
(15, 'http://localhost/img/giftshop/Toy/pb3.jpg', 4),
(16, 'http://localhost/img/giftshop/Toy/pb4.jpg', 4),
(17, 'http://localhost/img/giftshop/Toy/mbg1.jpg', 5),
(18, 'http://localhost/img/giftshop/Toy/mbg2.jpg', 5),
(19, 'http://localhost/img/giftshop/Toy/mbg3.jpg', 5),
(20, 'http://localhost/img/giftshop/Toy/mbg4.jpg', 5),
(21, 'http://localhost/img/giftshop/Toy/minibg1.jpg', 6),
(22, 'http://localhost/img/giftshop/Toy/minibg2.jpg', 6),
(23, 'http://localhost/img/giftshop/Toy/minibg3.jpg', 6),
(24, 'http://localhost/img/giftshop/Toy/minibg4.jpg', 6),
(25, 'http://localhost/img/giftshop/Toy/ljwpg1.jpg', 7),
(26, 'http://localhost/img/giftshop/Toy/ljwpg2.jpg', 7),
(27, 'http://localhost/img/giftshop/Toy/ljwpg3.jpg', 7),
(28, 'http://localhost/img/giftshop/Toy/ljwpg4.jpg', 7),
(29, 'http://localhost/img/giftshop/Toy/rubik1.jpg', 8),
(30, 'http://localhost/img/giftshop/Toy/rubik2.jpg', 8),
(31, 'http://localhost/img/giftshop/Toy/rubik3.jpg', 8),
(32, 'http://localhost/img/giftshop/Toy/rubik4.jpg', 8),
(33, 'http://localhost/img/giftshop/Toy/ssc1.jpg', 9),
(34, 'http://localhost/img/giftshop/Toy/ssc2.jpg', 9),
(35, 'http://localhost/img/giftshop/Toy/pb1.jpg', 10),
(36, 'http://localhost/img/giftshop/Toy/pb2.jpg', 10),
(37, 'http://localhost/img/giftshop/Toy/pb3.jpg', 10),
(38, 'http://localhost/img/giftshop/Toy/pb4.jpg', 10),
(39, 'http://localhost/img/giftshop/Toy/pb5.jpg', 10),
(40, 'http://localhost/img/giftshop/Clock/cac1.jpg', 11),
(41, 'http://localhost/img/giftshop/Clock/cac2.jpg', 11),
(42, 'http://localhost/img/giftshop/Clock/cac3.jpg', 11),
(43, 'http://localhost/img/giftshop/Clock/cac4.jpg', 11),
(44, 'http://localhost/img/giftshop/Clock/cac5.jpg', 11),
(45, 'http://localhost/img/giftshop/Clock/llac1.jpg', 12),
(46, 'http://localhost/img/giftshop/Clock/llac2.jpg', 12),
(47, 'http://localhost/img/giftshop/Clock/bbtcm2.png', 13),
(48, 'http://localhost/img/giftshop/Clock/bbtcm3.png', 13),
(49, 'http://localhost/img/giftshop/Clock/bbtcm4.png', 13),
(50, 'http://localhost/img/giftshop/Clock/bbtcm5.png', 13),
(51, 'http://localhost/img/giftshop/Clock/bbtcm6.png', 13),
(52, 'http://localhost/img/giftshop/Clock/dfc1.jpg', 14),
(53, 'http://localhost/img/giftshop/Clock/dfc2.jpg', 14),
(54, 'http://localhost/img/giftshop/Clock/dfc3.jpg', 14),
(55, 'http://localhost/img/giftshop/Clock/dfc4.jpg', 14),
(56, 'http://localhost/img/giftshop/Clock/bww2f1.png', 15),
(57, 'http://localhost/img/giftshop/Clock/bww2f2.png', 15),
(58, 'http://localhost/img/giftshop/Clock/bww2f3.png', 15),
(59, 'http://localhost/img/giftshop/Clock/bww2f4.png', 15),
(60, 'http://localhost/img/giftshop/Clock/dc360wc1.jpg', 16),
(61, 'http://localhost/img/giftshop/Clock/dc360wc2.jpg', 16),
(62, 'http://localhost/img/giftshop/Clock/dc360wc3.png', 16),
(63, 'http://localhost/img/giftshop/Clock/wlc1.jpg', 17),
(64, 'http://localhost/img/giftshop/Clock/wlc2.jpg', 17),
(65, 'http://localhost/img/giftshop/Clock/wlc3.jpg', 17),
(66, 'http://localhost/img/giftshop/Clock/wlc4.jpg', 17),
(67, 'http://localhost/img/giftshop/Decoration/gcb1.jpg', 18),
(68, 'http://localhost/img/giftshop/Decoration/gcb2.jpg', 18),
(69, 'http://localhost/img/giftshop/Decoration/gcb3.jpg', 18),
(70, 'http://localhost/img/giftshop/Decoration/gcb4.jpg', 18),
(71, 'http://localhost/img/giftshop/Decoration/sooglaa1.jpg', 19),
(72, 'http://localhost/img/giftshop/Decoration/sooglaa2.jpg', 19),
(73, 'http://localhost/img/giftshop/Decoration/sooglaa3.jpg', 19),
(74, 'http://localhost/img/giftshop/Decoration/cd1.jpg', 20),
(75, 'http://localhost/img/giftshop/Decoration/cd2.jpg', 20),
(76, 'http://localhost/img/giftshop/Decoration/cd3.jpg', 20),
(77, 'http://localhost/img/giftshop/Decoration/cd4.jpg', 20),
(78, 'http://localhost/img/giftshop/Decoration/soasm1.jpg', 21),
(79, 'http://localhost/img/giftshop/Decoration/soasm2.jpg', 21),
(80, 'http://localhost/img/giftshop/Decoration/soasm3.jpg', 21),
(81, 'http://localhost/img/giftshop/Decoration/soasm4.jpg', 21),
(82, 'http://localhost/img/giftshop/Decoration/hhs1.jpg', 22),
(83, 'http://localhost/img/giftshop/Decoration/hhs2.jpg', 22),
(84, 'http://localhost/img/giftshop/Decoration/hhs3.jpg', 22),
(85, 'http://localhost/img/giftshop/Decoration/sscb1.jpg', 23),
(86, 'http://localhost/img/giftshop/Decoration/sscb2.jpg', 23),
(87, 'http://localhost/img/giftshop/Decoration/sscb3.jpg', 23),
(88, 'http://localhost/img/giftshop/Decoration/sscb4.jpg', 23),
(89, 'http://localhost/img/giftshop/Decoration/sscb5.jpg', 23),
(90, 'http://localhost/img/giftshop/Decoration/wfam1.jpg', 24),
(91, 'http://localhost/img/giftshop/Decoration/wfam2.jpg', 24),
(92, 'http://localhost/img/giftshop/Decoration/wfam3.jpg', 24),
(93, 'http://localhost/img/giftshop/Decoration/wfam4.jpg', 24),
(94, 'http://localhost/img/giftshop/Decoration/wfam5.jpg', 24),
(95, 'http://localhost/img/giftshop/Decoration/3dsp1.jpg', 25),
(96, 'http://localhost/img/giftshop/Decoration/3dsp2.jpg', 25),
(97, 'http://localhost/img/giftshop/Decoration/2dsp3.jpg', 25),
(98, 'http://localhost/img/giftshop/Decoration/3dsp4.jpg', 25),
(99, 'http://localhost/img/giftshop/Decoration/moasiabg1.jpg', 26),
(100, 'http://localhost/img/giftshop/Decoration/moasiabg2.jpg', 26),
(101, 'http://localhost/img/giftshop/Decoration/moasiabg3.jpg', 26),
(102, 'http://localhost/img/giftshop/Decoration/moasiabg4.jpg', 26),
(103, 'http://localhost/img/giftshop/Decoration/fsaf1.jpg', 27),
(104, 'http://localhost/img/giftshop/Decoration/fsaf2.jpg', 27),
(105, 'http://localhost/img/giftshop/Decoration/fsaf3jpg.jpg', 27),
(106, 'http://localhost/img/giftshop/Cosmetic/ysltcvc1.jpg', 28),
(107, 'http://localhost/img/giftshop/Cosmetic/ysltcvc2.jpg', 28),
(108, 'http://localhost/img/giftshop/Cosmetic/ysltcvc3.jpg', 28),
(109, 'http://localhost/img/giftshop/Cosmetic/ysltcvc4.jpg', 28),
(110, 'http://localhost/img/giftshop/Cosmetic/yslrpcts1.jpg', 29),
(111, 'http://localhost/img/giftshop/Cosmetic/yslrpcts2.jpg', 29),
(112, 'http://localhost/img/giftshop/Cosmetic/yslrpcts3.jpg', 29),
(113, 'http://localhost/img/giftshop/Cosmetic/tf1.jpg', 30),
(114, 'http://localhost/img/giftshop/Cosmetic/tf2.jpg', 30),
(115, 'http://localhost/img/giftshop/Cosmetic/tf3.jpg', 30),
(116, 'http://localhost/img/giftshop/Cosmetic/dr1.jpg', 31),
(117, 'http://localhost/img/giftshop/Cosmetic/dr2.jpg', 31),
(118, 'http://localhost/img/giftshop/Cosmetic/dr3.jpg', 31),
(119, 'http://localhost/img/giftshop/Cosmetic/ysll1.jpg', 33),
(120, 'http://localhost/img/giftshop/Cosmetic/ysll2.jpg', 33),
(121, 'http://localhost/img/giftshop/Cosmetic/ysll3.jpg', 33),
(122, 'http://localhost/img/giftshop/Cosmetic/ysll4.jpg', 33),
(123, 'http://localhost/img/giftshop/Cosmetic/utflc1.jpg', 34),
(124, 'http://localhost/img/giftshop/Cosmetic/utflc2.jpg', 34),
(125, 'http://localhost/img/giftshop/Cosmetic/utflc3.jpg', 34),
(126, 'http://localhost/img/giftshop/Cosmetic/utflc4.jpg', 34),
(127, 'http://localhost/img/giftshop/Cosmetic/tfsb1.jpg', 35),
(128, 'http://localhost/img/giftshop/Cosmetic/tfsb2.jpg', 35),
(129, 'http://localhost/img/giftshop/Cosmetic/tfsb3.jpg', 35),
(130, 'http://localhost/img/giftshop/Cosmetic/dmdbb1.jpg', 36),
(131, 'http://localhost/img/giftshop/Cosmetic/dmdbb2.jpg', 36),
(132, 'http://localhost/img/giftshop/Cosmetic/dmdbb3.jpg', 36),
(133, 'http://localhost/img/giftshop/Cosmetic/dmdbb4.jpg', 36),
(134, 'http://localhost/img/giftshop/Picture_frame/slpf1.jpg', 37),
(135, 'http://localhost/img/giftshop/Picture_frame/slpf2.jpg', 37),
(136, 'http://localhost/img/giftshop/Picture_frame/slpf3.jpg', 37),
(137, 'http://localhost/img/giftshop/Picture_frame/slpf4.jpg', 37),
(138, 'http://localhost/img/giftshop/Picture_frame/vpf1.jpg', 38),
(139, 'http://localhost/img/giftshop/Picture_frame/vpf2.jpg', 38),
(140, 'http://localhost/img/giftshop/Picture_frame/vpf3.jpg', 38),
(141, 'http://localhost/img/giftshop/Picture_frame/vpf4.jpg', 38),
(142, 'http://localhost/img/giftshop/Picture_frame/wpf2l1.jpg', 39),
(143, 'http://localhost/img/giftshop/Picture_frame/wpf2l2.jpg', 39),
(144, 'http://localhost/img/giftshop/Picture_frame/wpf2l3.jpg', 39),
(145, 'http://localhost/img/giftshop/Picture_frame/bwpf1.jpg', 40),
(146, 'http://localhost/img/giftshop/Picture_frame/bwpf2.jpg', 40),
(147, 'http://localhost/img/giftshop/Picture_frame/bwpf3.jpg', 40),
(148, 'http://localhost/img/giftshop/Picture_frame/ipwas1.jpg', 40),
(149, 'http://localhost/img/giftshop/Picture_frame/so7wp1.jpg', 41),
(150, 'http://localhost/img/giftshop/Picture_frame/so7wp2.jpg', 41),
(151, 'http://localhost/img/giftshop/Picture_frame/so7wp3.jpg', 41),
(152, 'http://localhost/img/giftshop/Picture_frame/ipwas2.jpg', 42),
(153, 'http://localhost/img/giftshop/Picture_frame/ipwas3.jpg', 42),
(154, 'http://localhost/img/giftshop/scarf/crfsfb1.png', 43),
(155, 'http://localhost/img/giftshop/scarf/crfsfb2.png', 43),
(156, 'http://localhost/img/giftshop/scarf/crfsfb4.png', 43),
(157, 'http://localhost/img/giftshop/scarf/crfsfb13.png', 43),
(158, 'http://localhost/img/giftshop/scarf/sss1.jpg', 44),
(159, 'http://localhost/img/giftshop/scarf/sss2.jpg', 44),
(160, 'http://localhost/img/giftshop/scarf/sss3.jpg', 44),
(161, 'http://localhost/img/giftshop/scarf/sss4.jpg', 44),
(162, 'http://localhost/img/giftshop/scarf/kss1.png', 45),
(163, 'http://localhost/img/giftshop/scarf/sms1.jpg', 46),
(164, 'http://localhost/img/giftshop/scarf/sms2.jpg', 46),
(165, 'http://localhost/img/giftshop/scarf/sms3.png', 46),
(166, 'http://localhost/img/giftshop/scarf/cggkt1.png', 47),
(167, 'http://localhost/img/giftshop/scarf/cggkt2.png', 47),
(168, 'http://localhost/img/giftshop/scarf/vsfm1.jpg', 48),
(169, 'http://localhost/img/giftshop/scarf/vsfm2.jpg', 48),
(170, 'http://localhost/img/giftshop/scarf/vsfm3.jpg', 48),
(171, 'http://localhost/img/giftshop/scarf/vsfm4.jpg', 48),
(172, 'http://localhost/img/giftshop/scarf/cps1.jpg', 49),
(173, 'http://localhost/img/giftshop/scarf/cps2.jpg', 49),
(174, 'http://localhost/img/giftshop/scarf/cps3.jpg', 49),
(175, 'http://localhost/img/giftshop/scarf/cps4.jpg', 49),
(176, 'http://localhost/img/giftshop/scarf/cwsfw1.jpg', 50),
(177, 'http://localhost/img/giftshop/scarf/cwsfw2.jpg', 50),
(178, 'http://localhost/img/giftshop/scarf/cwsfw3.jpg', 50),
(179, 'http://localhost/img/giftshop/scarf/speiwac1.jpg', 51),
(180, 'http://localhost/img/giftshop/scarf/speiwac2.jpg', 51),
(181, 'http://localhost/img/giftshop/scarf/speiwac3.jpg', 51),
(182, 'http://localhost/img/giftshop/scarf/b1.jpg', 52),
(183, 'http://localhost/img/giftshop/scarf/b2.jpg', 52),
(184, 'http://localhost/img/giftshop/scarf/b3.jpg', 52),
(185, 'http://localhost/img/giftshop/scarf/b4.jpg', 52),
(186, 'http://localhost/img/giftshop/Flower/nfpms1.jpg', 53),
(187, 'http://localhost/img/giftshop/Flower/nfpms2.jpg', 53),
(188, 'http://localhost/img/giftshop/Flower/nfpsbw1.jpg', 54),
(189, 'http://localhost/img/giftshop/Flower/nfpsbw2.jpg', 54),
(190, 'http://localhost/img/giftshop/Flower/nfmef1.png', 55),
(191, 'http://localhost/img/giftshop/Flower/nfmef2.png', 55),
(192, 'http://localhost/img/giftshop/Flower/nfpss1.png', 56),
(193, 'http://localhost/img/giftshop/Flower/nfpss2.png', 56),
(194, 'http://localhost/img/giftshop/Flower/sunshine2.jpg', 57),
(195, 'http://localhost/img/giftshop/Flower/bwfs1.png', 58),
(196, 'http://localhost/img/giftshop/Flower/bwfs2.png', 58),
(197, 'http://localhost/img/giftshop/Flower/bol1.jpg', 59),
(198, 'http://localhost/img/giftshop/Flower/bol2.jpg', 59),
(199, 'http://localhost/img/giftshop/Flower/sghap1.jpg', 60),
(200, 'http://localhost/img/giftshop/Flower/sghap2.jpg', 60),
(201, 'http://localhost/img/giftshop/Flower/amtga1.jpg', 63),
(202, 'http://localhost/img/giftshop/Flower/amtga2.jpg', 63),
(203, 'http://localhost/img/giftshop/Flower/hitytc1.jpg', 64),
(204, 'http://localhost/img/giftshop/Flower/hitytc2.jpg', 64),
(205, 'http://localhost/img/giftshop/Flower/cfgs1.png', 65),
(206, 'http://localhost/img/giftshop/Flower/cfgs2.png', 65),
(207, 'http://localhost/img/giftshop/Flower/cfro1.png', 66),
(208, 'http://localhost/img/giftshop/Flower/cfro2.png', 66),
(209, 'http://localhost/img/giftshop/Flower/hny1.jpg', 61),
(210, 'http://localhost/img/giftshop/Flower/hny2.jpg', 61),
(211, 'http://localhost/img/giftshop/Flower/Flower4_1.png', 62),
(212, 'http://localhost/img/giftshop/Flower/Flower5_1.png', 62),
(213, 'http://localhost/img/giftshop/Flower/Flower6_1.jpg', 62),
(214, 'http://localhost/img/giftshop/Flower/Flower7_1.jpg', 62),
(215, 'http://localhost/img/giftshop/Flower/Flower8_1.jpg', 62),
(216, 'http://localhost/img/giftshop/Flower/Flower9_1.jpg', 62),
(217, 'http://localhost/img/giftshop/Flower/Flower10_1.png', 62),
(218, 'http://localhost/img/giftshop/Flower/Flower11_1.jpg', 62),
(219, 'http://localhost/img/giftshop/Flower/Flower12_1.png', 62),
(220, 'http://localhost/img/giftshop/Flower/Flower13_1.jpg', 62),
(221, 'http://localhost/img/giftshop/Teddy_bear/psd1.jpg', 67),
(222, 'http://localhost/img/giftshop/Teddy_bear/psd2.jpg', 67),
(223, 'http://localhost/img/giftshop/Teddy_bear/psd3.jpg', 67),
(224, 'http://localhost/img/giftshop/Teddy_bear/ctb1.jpg', 68),
(225, 'http://localhost/img/giftshop/Teddy_bear/ctb2.jpg', 68),
(226, 'http://localhost/img/giftshop/Teddy_bear/ctb3.jpg', 68),
(227, 'http://localhost/img/giftshop/Teddy_bear/gb1.jpg', 69),
(228, 'http://localhost/img/giftshop/Teddy_bear/gb2.jpg', 69),
(229, 'http://localhost/img/giftshop/Teddy_bear/gb3.jpg', 69),
(230, 'http://localhost/img/giftshop/Teddy_bear/lptb1.jpg', 70),
(231, 'http://localhost/img/giftshop/Teddy_bear/lptb2.jpg', 70),
(232, 'http://localhost/img/giftshop/Teddy_bear/lptb3.jpg', 70),
(233, 'http://localhost/img/giftshop/Teddy_bear/lptb4.jpg', 70),
(234, 'http://localhost/img/giftshop/Teddy_bear/rfc1.jpg', 71),
(235, 'http://localhost/img/giftshop/Teddy_bear/rfc2.jpg', 71),
(236, 'http://localhost/img/giftshop/Teddy_bear/rfc3.jpg', 71),
(237, 'http://localhost/img/giftshop/Teddy_bear/ce1.jpg', 72),
(238, 'http://localhost/img/giftshop/Teddy_bear/ce2.jpg', 72),
(239, 'http://localhost/img/giftshop/Teddy_bear/ce3.jpg', 72),
(240, 'http://localhost/img/giftshop/Teddy_bear/cdwab1.jpg', 73),
(241, 'http://localhost/img/giftshop/Teddy_bear/cdwab2.jpg', 73),
(242, 'http://localhost/img/giftshop/Teddy_bear/cdwab3.jpg', 73),
(243, 'http://localhost/img/giftshop/Teddy_bear/yfc1.jpg', 74),
(244, 'http://localhost/img/giftshop/Teddy_bear/yfc2.jpg', 74),
(245, 'http://localhost/img/giftshop/Teddy_bear/yfc3.jpg', 74),
(246, 'http://localhost/img/giftshop/Teddy_bear/wtdwb1.jpg', 75),
(247, 'http://localhost/img/giftshop/Teddy_bear/wtdwb2.jpg', 75),
(248, 'http://localhost/img/giftshop/Teddy_bear/wtdwb3.jpg', 75),
(249, 'http://localhost/img/giftshop/Teddy_bear/hpd1.jpg', 76),
(250, 'http://localhost/img/giftshop/Teddy_bear/hpd2.jpg', 76),
(251, 'http://localhost/img/giftshop/Teddy_bear/hpd3.jpg', 76),
(252, 'http://localhost/img/giftshop/Wine/pmes1.jpg', 77),
(253, 'http://localhost/img/giftshop/Wine/pmes2.jpg', 77),
(254, 'http://localhost/img/giftshop/Wine/pmes3.jpg', 77),
(255, 'http://localhost/img/giftshop/Wine/pb144yc1.png', 78),
(256, 'http://localhost/img/giftshop/Wine/pb144yc2.png', 78),
(257, 'http://localhost/img/giftshop/Wine/pshs1.jpg', 79),
(258, 'http://localhost/img/giftshop/Wine/pshs2.jpg', 79),
(259, 'http://localhost/img/giftshop/Wine/tgf1.png', 80),
(260, 'http://localhost/img/giftshop/Wine/tgf2.jpg', 80),
(261, 'http://localhost/img/giftshop/Wine/sm50a1.jpg', 81),
(262, 'http://localhost/img/giftshop/Wine/sm50a2.jpg', 81),
(263, 'http://localhost/img/giftshop/Wine/sm50a3.png', 81),
(264, 'http://localhost/img/giftshop/Wine/60sle1.jpg', 82),
(265, 'http://localhost/img/giftshop/Wine/60sle2.jpg', 82),
(266, 'http://localhost/img/giftshop/Wine/60sle3.jpg', 82),
(267, 'http://localhost/img/giftshop/Wine/60sle4.jpg', 82),
(268, 'http://localhost/img/giftshop/Wine/cc1.jpg', 83),
(269, 'http://localhost/img/giftshop/Wine/cc2.jpg', 83),
(270, 'http://localhost/img/giftshop/Wine/cc3.jpg', 83),
(271, 'http://localhost/img/giftshop/Wine/cc4.jpg', 83),
(272, 'http://localhost/img/giftshop/Wine/fna1.jpg', 84),
(273, 'http://localhost/img/giftshop/Wine/fna2.jpg', 84),
(274, 'http://localhost/img/giftshop/Wine/fna3.jpg', 84),
(275, 'http://localhost/img/giftshop/Wine/vae1.jpg', 85),
(276, 'http://localhost/img/giftshop/Wine/vae2.jpg', 85),
(277, 'http://localhost/img/giftshop/Wine/vbgl1.jpg', 86),
(278, 'http://localhost/img/giftshop/Wine/vbgl2.jpg', 86),
(279, 'http://localhost/img/giftshop/Wine/vbgl3.jpg', 86),
(280, 'http://localhost/img/giftshop/Wine/vb1.jpg', 87),
(281, 'http://localhost/img/giftshop/Wine/vb2.jpg', 87),
(282, 'http://localhost/img/giftshop/Wine/vb3.jpg', 87),
(283, 'http://localhost/img/giftshop/Wine/vsl1.jpg', 88),
(284, 'http://localhost/img/giftshop/Wine/vsl2.jpg', 88),
(285, 'http://localhost/img/giftshop/Wine/vsl3.jpg', 88),
(286, 'http://localhost/img/giftshop/Wine/clrbr1.jpg', 90),
(287, 'http://localhost/img/giftshop/Wine/clrbr2.jpg', 90),
(288, 'http://localhost/img/giftshop/Wine/clrbr3.jpg', 90),
(289, 'http://localhost/img/giftshop/Wine/cpjgb1.jpg', 91),
(290, 'http://localhost/img/giftshop/Wine/cpjgb2.jpg', 91),
(291, 'http://localhost/img/giftshop/Wine/cpjgb3.jpg', 91),
(292, 'http://localhost/img/giftshop/Wine/cadbb1.jpg', 92),
(293, 'http://localhost/img/giftshop/Wine/cadbb2.jpg', 92),
(294, 'http://localhost/img/giftshop/Wine/cadbb3.png', 92),
(295, 'http://localhost/img/giftshop/Wine/cnfpd1.jpg', 89),
(296, 'http://localhost/img/giftshop/Wine/cnfpd2.jpg', 89),
(297, 'http://localhost/img/giftshop/Wine/cnfpd3.jpg', 89),
(298, 'http://localhost/img/giftshop/Cosmetic/daslg1.jpg', 32),
(299, 'http://localhost/img/giftshop/Cosmetic/daslg2.jpg', 32),
(300, 'http://localhost/img/giftshop/Cosmetic/daslg3.jpg', 32),
(301, 'http://localhost/img/giftshop/Cosmetic/daslg4.jpg', 32);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `price` float DEFAULT NULL,
  `date` text DEFAULT NULL,
  `size` text DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `anniversary` text DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `sold` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`size`, `date`, `detail`, `anniversary`, `sold`, `view`, `id`, `name`, `brand`, `price`, `quantity`, `rating`) VALUES
('11x20x30cm', '17/05/2022', 'Solar system gyro is also known as the solar system gyroscope. This is a physical toy, as well as an interesting decor, suitable for the office space. The product is mainly made of plastic material. See the product video below the detailed description. Suitable as a gift for friends, colleagues, students, lovers of unique and scientific decorations.\r\n', 'Children\'s Day', 196, 490, 1, 'Gyroscope solar system', 1, 300, 200, 5),
('15x18cm', '22/09/2021', 'The lollipop spinning game is made from natural wood. There are many colors for you to choose from. You can note the color you want to get when ordering. This is a very interesting game.', 'Children\'s Day', 152, 380, 2, 'Wooden game spinning lollipop', 2, 150, 200, 5),
('25x28cm', '28/10/2022', 'Marvel superhero model is based on the image of famous characters in the movie adaptations of Marvel\'s comic books. The product is made of synthetic resin. There are many templates for you to choose from. The product is suitable as a gift for children, children\'s Tet gifts, or people who love Marvel characters.', 'Children\'s Day', 65, 163, 3, 'Marvel superhero model', 2, 350, 200, 4.3),
('19x23cm', '20/06/2021', 'The dog box is made of high quality ABS plastic. There are 4 models to choose from. You can note the model you want to receive when ordering. The shop will contact you to close the order before sending it to you. The pet saving box is a great gift for children and friends – especially dog lovers.\r\n', 'Children\'s Day', 99, 248, 4, 'Pet box', 1, 400, 200, 4.5),
('6x30x30cm', '18/09/2021', 'The maze ball game is made of wood. This toy is suitable for children or as a stress reliever in a group of friends.\r\n', 'Children\'s Day', 189, 473, 5, 'Maze Ball Game', 4, 250, 200, 4.1),
('9x19x24cm', '03/10/2022', 'The mini Bowling game is made of wood and metal marbles. The gameplay is relatively simple. Suitable as gifts for children, gifts for friends.\r\n', 'Children\'s Day', 68, 170, 6, 'Mini bowling game', 1, 300, 200, 3.5),
('8x20x20cm', '04/10/2021', 'Unique wooden draw toy set, this product is loved by many young people, usually in shops or snack shops or have these toys. Playing while drinking and talking is really interesting. Unlike the Wood Draw Game Set, which uses dice to play. The Love Jenga wooden draw set has a completely different way of playing. This wooden draw set has 54 bars, 27 pink bars and 27 white bars. Each Jenga wooden stick will have a command in English and Chinese. Players take turns drawing the wooden stick they like and then make a bridge on that wooden stick. This is a very interesting game to play with a group of friends and colleagues. Helps reduce stress and bring joy to the whole group. Birthday gifts.\r\n', 'Children\'s Day', 80, 200, 7, 'Love Jenga . wooden puzzle game', 4, 150, 200, 3.7),
('3x3x3cm', '07/08/2022', 'Rubik 3×3 is made of plastic material. This is a kind of game that trains your mind and ability to concentrate. Very suitable as a gift for friends, children.\r\n', 'Children\'s Day', 108, 270, 8, 'Rubik 3x3', 2, 70, 200, 4.1),
('45cm', '21/10/2022', 'Shrrilling Chicken is one of the hot products. It is loved by many young people. Chicken is made of plastic material, yellow color. When squeezed, it makes a very loud and funny sound. The product is very suitable as a gift for children, friends, or trolling others.\r\n', 'Children\'s Day', 125, 313, 9, 'Shrimp Shrimp Chicken', 3, 100, 200, 3.9),
('10cm', '13/08/2022', 'Plasma ball uses 220V electricity. The base is made of plastic, the ball is made of glass. From the center of the sphere beautiful rays of light are continuously emitted. And when you touch any point with your hand. Anywhere on the sphere, the rays will immediately focus at the tip of your finger and it is very attractive as if you were controlling the electric current with your own hands\r\n', 'Children\'s Day Christmas', 136, 340, 10, 'Plasma Ball', 1, 200, 200, 4.9),
('15x17cm', '23/04/2022', 'Classic alarm clock made of metal material. Has functions to see the time, alarm, LED light to see the time in the night. The alarm clock is suitable as a birthday gift, a gift for a girlfriend, etc\r\n', 'Birthday, 20-11, Anniversary', 199, 498, 11, 'Classic alarm clock', 4, 25, 200, 4.7),
('12x14cm', '22/06/2022', 'The LED alarm clock is made of plastic material. The watch has many functions: date and time, alarm, temperature, date memory, ... Especially comes with a pen that can write on notes or messages you want to send. This is a meaningful gift for your girlfriend, or as a birthday gift, a gift for friends\r\n', 'Birthday, 20-11, Anniversary', 136, 340, 12, 'Led light alarm clock', 1, 30, 200, 4.6),
('20x25cm', '16/05/2022', 'The Big ben tower clock has a core made of glass, and the outside is covered with layers of powder-coated metal. Has a color changing LED light. The product is suitable as a birthday gift for boyfriend, girlfriend, housewarming gift, ...\r\n', 'Birthday, 20-11, Housewarming', 70, 175, 13, 'Big ben tower clock model', 3, 35, 200, 4.5),
('17x20cm', '18/03/2022', 'The dial clock is made of stainless steel, Display 24h day and night mode. Take a look at the detailed product description below to better understand how the watch works. The product is very suitable as a gift for your boss, a gift for a customer or a partner, or as a gift for a boyfriend...\r\n', 'Birthday, 20-11, Anniversary', 52, 130, 14, 'Digital flip clock', 1, 50, 200, 5),
('16x24cm', '12/06/2021', 'The double-sided bicycle watch is made of metal material. There are 2 independent timers. Use 2A battery. Products suitable as gifts for boyfriends, girlfriends, colleagues, or gifts for parents, family members ...\r\n', 'Birthday, 20-11, Anniversary', 50, 125, 15, 'Bicycle watch with 2 faces', 4, 35, 200, 4.6),
('30x35cm', '04/07/2021', 'The Diy Clock 360 wall clock has a diameter of 40 cm. Black. Quazt machine, uses AA batteries. The product is packaged and comes with detailed installation instructions. Diy wall clock brings a new and unique feature to your home. Suitable as a housewarming gift or a wedding gift, \r\n', 'Birthday, 20-11, Housewarming', 81, 203, 16, 'DIY Clock 360 . Wall Clock', 1, 25, 200, 4.2),
('25x30cm', '15/08/2022', 'The wooden bar LED clock is made of high quality plastic with imitation wood grain. There are many different colors and shapes. The parameters on the meter are displayed in digital form. The product can be used simultaneously with a 5V power source (Similar to a phone charger) or an AAA battery that can be easily purchased in the market. Led wooden clocks are very suitable as gifts for classmates, colleagues, especially those who are active and love creativity.\r\n', 'Birthday, Anniversary', 104, 260, 17, 'Wooden Led Clock', 4, 40, 200, 4.1),
('10cm', '10/06/2022', 'The galaxy crystal ball is made of K9 crystal material and modern 3D laser engraving technology.(See detailed description below to understand the features and differences of the 3 soles.) You can write in the note the type of sole you choose when ordering. We will contact you before shipping.\r\n', 'Birthday Valentine 20-11', 147, 368, 18, 'Galactic crystal ball', 4, 200, 200, 4),
('12cm', '11/02/2022', 'The statue of old people watching and watching albums is made of synthetic resin. Dimensions 12cm long, 8cm wide, 11.5cm high. This is a meaningful souvenir for grandparents, as a wedding gift or for a girlfriend.\r\n', 'Birthday Valentine 20-11', 116, 290, 19, 'Statue of old grandparents looking at albums', 2, 300, 200, 4),
('6x8cm', '21/05/2022', 'The dandelion crystal is made of K9 crystal material. You can also purchase an additional color-changing LED light base for a more shimmering light effect. Crafted with advanced 3D laser engraving technology. Crystal dandelion is suitable as a meaningful girlfriend gift, gift for close friends, colleagues, ...\r\n', 'Birthday Valentine 20-11', 59, 148, 20, 'Crystal dandelion', 1, 200, 200, 4),
('20x35cm', '27/03/2022', 'The silent human face statue is made of artificial stone. The silent human face statue is suitable for decoration, housewarming gift, boss gift, teacher gift\r\n', 'Birthday Valentine 20-11', 109, 273, 21, 'Statue of a silent man', 4, 200, 200, 4),
('26x41cm', '23/06/2021', 'The horse head statue is made of artificial stone, ivory white. The statue has a unique meaning of success. The product is suitable for interior decoration, housewarming gift, boss gift or teacher gift, .\r\n', 'Birthday Valentine 20-11', 55, 138, 22, 'Horse head statue', 2, 200, 200, 3),
('8cm', '06/11/2020', 'The solar system crystal ball is dense, very firm in the hand. The black crystal base keeps the ball steady. The base and sphere are separate. We have fastening support if you want. This product is very suitable as a birthday gift for a boyfriend, a gift for a boss, a gift for teachers or colleagues in the company,\r\n', 'Birthday Valentine 20-11', 167, 418, 23, 'Solar system crystal ball', 4, 200, 200, 3),
('50x60cm', '09/05/2021', 'World famous architectural models are miniature models of real buildings in the world. It is a miniature version of these works. The product is made of metal material. There are many models with different sizes and prices\r\n', 'Birthday Valentine 20-11', 72, 180, 24, 'World famous architectural model', 4, 24, 200, 3.2),
('22x17cm', '10/08/2021', 'There are many colors to choose from: blue, green, pink and purple. You can create as many pictures as you like. (See detailed product description below for product understanding). The product is suitable as a gift for boyfriend, girlfriend, friends, colleagues,\r\n', 'Birthday Valentine 20-11', 120, 300, 25, '3D Sand Painting', 1, 25, 200, 4.1),
('11x24cm', '20/01/2022', 'Sailboat model in a glass bottle measures 24 cm in length, 11 cm in height. The product is carefully packed to avoid breakage during transit. The product includes a wooden base, a glass bottle inside with a hand-crafted glass sailboat model. The model of a sailboat in a glass bottle is suitable for a boss, a gift for parents, a birthday gift for a boyfriend, etc.\r\n', 'Birthday Valentine 20-11', 126, 315, 26, 'Model of a sailboat in a glass bottle', 3, 26, 200, 4),
('70cm', '02/09/2022', 'The feng shui arowana has a base made of solid natural wood, and the body of the fish is made of high-quality plastic. High finish with sharp simulated details. Feng shui arowana fish means wealth, wealth and fortune for the owner. The product is very suitable as a housewarming gift, a gift for a boss.\r\n', 'Birthday Valentine 20-11', 90, 225, 27, 'Feng Shui arowana fish', 1, 27, 200, 5),
('6g', '08/10/2022', 'Always knowing how to impress with luxurious, bold designs, the YSL Tatouage Couture lipstick collection is certainly no exception. YSL cream lipstick put on a proud, splendid shirt typical of the French beauty brand. The luxurious black lip cap is combined with a transparent matte body, lined with gold-plated YSL letters. This is the next step of the Tatouage line and the combined Vinyl cream has created an indelible mark of this matte lipstick version. YSL 216 lipstick is meticulously processed with every detail\r\n', 'Valentine, 20-10 Anniversary', 175, 438, 28, 'YSL Tatouage Couture Velvet Cream', 7, 28, 200, 3.3),
('8g', '10/12/2022', 'YSL Rouge Pur Couture The Slim Lipstick has a slim, luxurious body with a golden shell. Silky smooth lipstick. Lightly on the lips with a thin, light surface. The lipstick has the ability to be super vibrant, lasts all day and does not dry the lips. (6 colors). Suitable as a gift for girls and women\r\n', 'Valentine, 20-10 Anniversary', 64, 160, 29, 'YSL Rouge Pur Couture The Slim', 7, 29, 200, 3.8),
('8g', '27/03/2021', 'Tom Ford 8 has only been released for a while, but has created a worldwide fever.i Son Tomford has a long-lasting lipstick, a very classy design and especially the lead content in the lipstick is not present. Along with that is an extremely diverse color palette Son Tomford is a special and extremely luxurious gift that every modern woman aspires to have\r\n', 'Valentine, 20-10 Anniversary', 151, 378, 30, 'Tom Ford', 8, 30, 200, 3.4),
('6g', '05/09/2021', 'Includes 6 lipstick colors of the limited edition of Dior\'s collection in celebration of this year\'s Christmas season. And all these 6 colors when you first look at it, make you fall in love immediately. Not only because all the colors are so beautiful, too flattering, but these are also Dior\'s best-selling colors. The perfect color mixing and calibration will leave you satisfied.\r\n', 'Valentine, 20-10 Anniversary', 174, 435, 31, 'Dior Rouge', 6, 31, 200, 3.4),
('10g', '18/08/2021', 'With this lipstick, you can combine it with any color lipstick of different colors. Or if you want to own a glossy, natural lip, you can apply Dior Addict Stellar Lip Gloss 864 Dior Rise lip balm combined with light, clear makeup with a little fresh blush to achieve. The most perfect effect. More specifically, this lip balm is suitable for all skin tones.\r\n', 'Valentine, 20-10 Anniversary', 60, 150, 32, 'Dior Addict Stellar Lip Gloss', 6, 32, 200, 4.6),
('90ml', '02/04/2022', 'YSL Libre fragrance opens with an explosion of mandarin orange, black currant and orange leaf essential oil, the lavender composition appears to add softness to the freshness of citrus. Jasmine in the heart creates a delicate beauty that can leave others spellbound for hours, when accompanied by an elegant lavender scent. Because of the oriental style, the last note of Yves Saint Laurent 7 Libre cannot lack the ingredients of musk, vanilla, and cedar to bring a passionate, warm flavor that lasts for hours.\r\n', 'Valentine, 20-10 Anniversary', 113, 283, 33, 'Yves Saint Laurent Libre', 7, 33, 200, 5),
('90ml', '17/01/2021', 'True to the name \"Lost Cherries\" - Lost Cherry revolves around the note of cherry, a sweet, juicy fruit that often brings a sense of provocative, seductive and innocent in the art of perfumery. . If cherry is the main note, besides the support from red wine notes, almonds and tonka bean are the next outstanding scents. Those ingredients all bring a warm, passionate and sweet like candy, but with the ability of the Tom Ford 8 family, it is a mature and bold candy, not immature or childish.\r\n', 'Valentine, 20-10 Anniversary', 133, 333, 34, 'Unisex Tom Ford Lost Cherry', 8, 34, 200, 4.5),
('50ml', '14/07/2022', 'The top notes of Santal Blush are quite normal and natural: sharp, dry and fragrant with resin with notes of frankincense and fennel. As time passed and the initial sharpness became more quiet, the sweetness of cinnamon and rose began to reveal, followed by the sandalwood note moving slowly and slowly to fill in. filled the cold voids with a little warmth and softness. The end will be a mixture of oud wood and leather with a strong smoky and dry scent, followed by soft, delicate jasmine and ylang-ylang flowers and meanwhile sensual musk is gradually ignited and then all. both explode in an intense and striking way.\r\n', 'Valentine, 20-10 Anniversary', 88, 220, 35, 'Tom Ford Santal Blush', 8, 35, 200, 3.4),
('100ml', '19/04/2022', 'Miss Dior Blooming Bouquet inspires a special and playful love. The fragrance represents freedom and seduction, characterized by a charm and ability to captivate the heart. With a heart of peony, reformulated and formed with a lively rose scent, it accentuates timeless magnificence with silky smoothness and juicy nuances with peach blossom and apricot blossom. The overall fragrance is boldly floral and expresses an endless fascination with timeless beauty and refinement\r\n', 'Valentine, 20-10 Anniversary', 141, 353, 36, 'Dior Miss Dior Blooming Bouquet', 6, 36, 200, 3.5),
('17x22cm', '21/08/2021', 'Small lucky photo frame is made of natural wood with beautiful grain. There are 2 sizes for you to choose from\r\n', 'Anniversary, 20-10, 20-11', 186, 465, 37, 'Small lucky photo frame', 5, 37, 200, 4.3),
('18x23cm', '21/02/2021', 'Classic photo frames are made of synthetic resin. Dimensions height 23cm, width 18cm. Suitable as souvenirs, birthday gifts, gifts for girlfriends, classmates, ...\r\n', 'Anniversary, 20-10, 20-11', 138, 345, 38, 'Vintage photo frames', 5, 38, 200, 3.9),
('20$25cm', '05/04/2022', 'The 2-layer wooden photo frame is made from wood material. There are 2 sizes for you to choose from. (See detailed description below). The product is suitable as a housewarming gift, a gift for a girlfriend, a birthday gift,\r\n', 'Children\'s Day', 137, 343, 39, 'Wooden photo frame 2 layers', 5, 39, 200, 3.5),
('15x20cm', '17/07/2022', 'Bicycle wooden photo frame is made from natural wood material. Size 15 x 20 cm. There are 2 models for you to choose from. You can write the model you want to receive in the notes section when ordering. You can put your photo in the photo frame \r\n', 'Anniversary, 20-10, 20-11', 63, 158, 40, 'Bicycle wooden photo frame', 1, 40, 200, 3.7),
('30cm', '02/05/2021', 'et includes 2 A6 pictures. 5 pictures a7 . All details on the picture are texture drawing, not because of the fuzzy print quality. Please review the sample carefully before purchasing. Material: printed and laminated on 5mm thick fomex plastic, waterproof, moisture-proof and mildew-proof. 5mm thickness, stickers, wall paintings or can be wall paintings in sets, with 2-sided adhesive tape to easily stick pictures. Paintings can be pasted as stickers to decorate study corners. bedroom wall murals\r\n', 'Anniversary, 20-10, 20-11', 95, 238, 41, 'Set of 7 wall paintings', 5, 200, 200, 1),
('50x60cm', '17/05/2021', 'Wall paintings are the leading decorative decorative paintings of today\'s leading trends, designed by bending iron bars to create art and coated with high-class, luxurious powder-coated paint with color fastness up to more than 10 years. Decorative iron paintings or art iron paintings are indispensable decorative products, bringing modernity, elegance and uniqueness to the interior space\r\n', 'Anniversary, 20-10, 20-11', 74, 185, 42, 'Iron paintings wall art SENCOM', 1, 42, 200, 4.1),
('80cm', '24/09/2021', 'A lovely scarf is an accessory that both keeps baby warm when winter comes, she can wear it when going out, going to school, during the Christmas season... all suitable and extremely pretty.\r\n- The scarf is also suitable as a gift, when parents are having a headache choosing a gift for their baby, give them a scarf for their birthday, Christmas gift or learning reward... Definitely our baby would love it.\r\n- A perfectly designed scarf will make the children extremely lovely and will not feel uncomfortable wearing it because the scarf is very light and the fur is extremely soft. Suitable for all baby\'s daily wear\"\r\n', 'Birthday, Children\'s Day', 112, 280, 43, 'Cute rabbit fur scarf for baby', 4, 43, 200, 3.9),
('40cm', '10/09/2021', 'The soft silk scarf will make your outfit more luxurious and elegant. Simple and elegant motifs will create accents, helping you look successful but still very sweet and never out of fashion.\r\n', 'Birthday, Children\'s Day', 175, 438, 44, 'Square silk scarf', 4, 44, 200, 4.9),
('150cm', '16/08/2021', 'Korean style scarf with simple but delicate black and white plaid pattern.\r\n- Super soft fashion wool scarf.\r\n-Designed with new and fresh tones, bringing a difference to the girls\' wardrobe, easy to coordinate, suitable for cold winter days, bringing a feeling of both warmth and comfort. The shawl is light but still exudes elegance.\"\r\n', 'Birthday, Children\'s Day', 70, 175, 45, 'Korean style scarf', 3, 45, 200, 3.6),
('180cm', '08/04/2021', 'Not only has the effect of keeping warm, woolen scarves are also a way to tone and create a more impressive style for the wearer. - A very thick and smooth scarf is a more meaningful gift than your words of love in the cold winter. - Luxurious and sophisticated, extreme western color never goes out of fashion. - Wide scarf has many unique styles or becomes a very luxurious shawl. - The fleece material is soft, smooth, and keeps warm well - Suitable for both Men and Women, can make couple and group clothes. Scarves are easy to wear, easy to coordinate with many styles, suitable for everyone – Scarves Meaningful gifts for relatives and friends\r\n', 'Birthday, Children\'s Day', 60, 150, 46, 'Soft Men\'s Scarves', 3, 46, 200, 4.3),
('170cm', '02/04/2022', ' Fashionable scarves and scarves are always a companion to bring boys and girls new styles in autumn and winter. Not only stopping at classic towels, today there are many new designs and diverse materials born to serve the needs of users.\r\n', 'Birthday, Children\'s Day', 127, 318, 47, 'Classic Gentlemen\'s Gray Knitted Towels', 3, 47, 200, 4.7),
('160cm', '19/05/2022', 'Very thick and smooth scarf is the most meaningful gift of all to replace your words of love in the cold winter.\r\n- Luxurious and sophisticated, extreme western color never goes out of fashion.\r\n- Wide scarf has many unique styles or becomes a very luxurious shawl.\r\n- The fleece material is soft, smooth, and keeps warm well\r\n- Suitable for both Men and Women, can make couple and group clothes. Scarves are easy to wear, easy to coordinate with many styles, suitable for everyone\r\n– Scarves Meaningful gifts for relatives and friends. \"\r\n', 'Birthday, Children\'s Day', 144, 360, 48, 'Valazo Scarves For Men', 4, 48, 200, 5),
('150cm', '05/02/2022', 'Product : Lovely Christmas shawl - Color: Green - Red. - Material: Cotton.Product Advantages: ⁃ Design beautiful products and eye-catching Christmas motifs to beautify the Christmas season. ⁃ Breathable cotton material - safe.\r\n', 'Christmas', 186, 465, 49, 'Christmas pattern scarf', 4, 49, 200, 3.5),
('170cm', '22/01/2022', 'Texture: Solid color Product: Winter scarf Treatment: Tie-Dye Material: imitation cashmere Popular elements: tassels Style: stretch Use case: Travel, travel Function: keep warm Suitable for the season: winter, spring and autumn\r\n', 'Birthday, Anniversary', 54, 135, 50, 'Cashmere Winter Scarves For Women', 3, 50, 200, 3.5),
('130cm', '23/07/2022', 'Style: Classical Ethnic Length (cm): Bandana Product code: Cotton Bandana Width (cm): 22cm Weaving method: Warp knitting Texture: Monochrome Foreign Trade: Yes Function: warm Processing method: woven flower\r\n', 'Birthday, Anniversary', 147, 368, 51, 'Scarf Protects Ears In Winter Against Cold', 3, 51, 200, 4.8),
('40cm', '16/04/2022', 'Bandana is a large square scarf, used to create accents for costumes. This item was very popular in the 70s, associated with the dusty image of the cowboys of the American West. With only one bandana, Kpop idols can create many unique variations for their outfits. Bandana Streetwear or backpacking is extremely versatile with the ability to customize useful accessories\r\n', 'Birthday, Anniversary', 149, 373, 52, 'Bandanas', 4, 52, 200, 4.2),
('White calimero: 5 Red rose : 15 Red Lan Moka: 5 White wolf muzzle: 8', '02/05/2022', 'With the classic red color of the rose combined with the white color from the wolf muzzle flower and the white calimero, it creates an overall harmony and beauty for this bouquet. The bouquet is suitable for any occasion to celebrate the birthdays. special events, birthdays.... Products include: \r\n', 'Birthday, New Year, Housewarming', 107, 268, 53, 'New flower pattern - My side', 2, 53, 200, 4.1),
('Products include: Porcelain honeycomb pot: 1 Pink Phalaenopsis: 16', '10/03/2021', 'Welcome spring with color and luck with a pot of pink phalaenopsis. Orchid pots are suitable for decorating homes with small spaces but still increase the coziness and elegance of the room space.\r\n', 'New Year', 187, 468, 54, 'New flower pattern - Spring butterfly wings', 2, 54, 200, 3.7),
('Products include: Single red carnation : 5 Moonlight rose gold : 5 Snout of a wolf with two joys: 5', '07/04/2021', 'Fresh flowers are always considered a meaningful bridge for words of love. A solemn bouquet of flowers with the yellow color of pink moonlight symbolizes luck and fortune. Red carnation with a meaningful message about Deep gratitude and strong wolf snout flower reaching out to symbolize prosperity will be a perfectly suitable choice for conferences and events that need to honor and pay tribute to partners or delegates who have contributed the power to create overall success at work.\r\n', 'New Year, Housewarming', 124, 310, 55, 'New flower model - Event flowers', 2, 55, 200, 3.8),
('Products include: Single purple carnation : 10 Red jade chain : 8 Purple Star Flower: 2 Pink candy: ', '25/11/2022', 'Is there a more romantic scene than a late afternoon, watching each pink sunbeam at the end of the day shine through the purple clouds that are gently drifting in the distant sky. A combination that cannot be more beautiful between the faithful purple color of carnations and the lovely sweetness of pink candy will be an extremely romantic gift for couples who are immersed in love and happiness.\r\n', 'Valentine, 20-10', 110, 275, 56, 'New flower pattern - Sweet sunset', 2, 56, 200, 3.4),
('Blue ping pong : 3 Golden Phalaenopsis: 6 Bird of Heaven: 3 Chicken eggs : 7 Moonlight rose gold : 1', '08/05/2022', 'The rush of life sometimes makes us feel tired and bored. Why don\'t you try to wake up early - open the door and take a deep breath. Feel the fresh morning air, the cold mist, The scent of warm sunshine Starts the day with lots of energy and refreshing spirit.\r\nProducts include:\"\r\n', '20-11 New Year', 185, 463, 57, 'Sunshine', 2, 57, 200, 3),
('Products include: Pink sand wall border: 5 Red jade chain : 10 New red lotus: 20 Red rose : 20 Scorp', '04/10/2022', 'Red roses combined with lotus roses, and auspicious stones are planted in a circle, symbolizing success, fullness, and abundance in career and life. Accompanied by orchid branches reaching up to symbolize success. The flower pattern is a wish of success suitable for friends, relatives, customers on the occasion of birthday, grand opening, anniversary.\r\n', 'Birthday, New Year, Housewarming', 128, 320, 58, 'Best Wishes for Success', 2, 58, 200, 3.3),
('Products include: White Phalaenopsis: 12 Mimi flower: 25 Pink skin: 50 White wolf muzzle : 30', '24/04/2022', 'Modern life makes many people get caught up in the whirlpool of work, sometimes forgetting to nurture a whirling relationship and sometimes forgetting to be passionate about love with their partner. And that\'s it. is the reason that fresh flowers were born to help us convey the messages of love in life.A vase of fresh flowers placed on the desk, in the beloved home or a vase given to a special day. The difference between relatives and friends will help us keep our relationships and appreciate each other more and more.', 'Valentine, 20-10 Anniversary', 153, 383, 59, 'Beats of Love', 2, 59, 200, 4.7),
('Products include: Plain round porcelain basin: 1 Purple Phalaenopsis: 6', '15/06/2022', 'Luxury purple phalaenopsis orchid pots, with beautiful designs, are planted in high-grade porcelain pots as wishes to the recipient. Wishing you happiness and health. A happy and peaceful life. Suitable for gifting occasions. birthday, grand opening, partner meeting.\r\n', 'Birthday, New Year', 110, 275, 60, 'Security & good health and prosperity', 2, 60, 200, 4.1),
('house space. Products include: Plain round porcelain basin: 1 Yellow Phalaenopsis: 5', '09/05/2022', 'Spring Prosperity\"\" consists of 5 branches of white phalaenopsis orchids decorated in high-grade porcelain pots are warm wishes at the beginning of the year for friends, bringing fortune, prosperity and feng shui to the owner. The living room has a small space, a nicely decorated orchid pot adds to the coziness and elegance of the house space.\r\n', 'New Year', 117, 293, 61, 'Happy New Year', 2, 61, 200, 4.1),
('house space. Products include: Plain round porcelain basin: 1 Yellow Phalaenopsis: 5', '08/04/2022', 'Phalaenopsis orchids are known to be a beautiful flower with many auspicious meanings, suitable for display on New Year\'s Day, A charming, aristocratic, and fortune-filled pot of phalaenopsis orchids to display in the house will bring great things. auspicious, lucky for the homeowner in the first days of the new year.', 'New Year', 58, 145, 62, 'Love Spring', 2, 62, 200, 4.2),
('Products include: Plain round porcelain basin: 1 White Phalaenopsis: 5', '11/09/2021', 'White Phalaenopsis orchid is always a luxurious gift for each other in the coming New Year and spring. The meaning of white Phalaenopsis orchid is for a good start, perfect success. It will be a very meaningful spring gift or a very meaningful congratulatory gift to give to relatives, friends, partners or customers.\r\n', 'New Year', 109, 273, 63, 'A myriad things go according', 2, 63, 200, 3.5),
('and elegance of the house space. Products include: Purple Phalaenopsis: 3 White Phalaenopsis: 3 Gold', '10/04/2021', 'New Year\'s greeting includes 10 phalaenopsis orchids decorated in high-class white porcelain pots with Tet style as a warm New Year\'s greeting for friends, bringing fortune, prosperity and feng shui. Elegant phalaenopsis flowers will be suitable for living rooms with space, a specially decorated orchid pot adds to the coziness and elegance of the house space.\r\n', 'New Year', 128, 320, 64, 'Happiness in the year to come.', 2, 64, 200, 4.4),
('holidays. Products include: Green wall sand: 15 Water bamboo leaves: 20 Yellow wolf muzzle: 20 Gold ', '06/03/2022', 'In feng shui, yellow is very suitable for weddings and festivals. It also symbolizes Fire energy and strength... The congratulatory flower shelf is seriously invested by florists because we always understand that it is. is the reputation of customers, of an entire business.We always receive the love from customers, especially businesses who trust and order floral designs to celebrate the opening, inauguration, organize events and in other important holidays.\r\n', 'New Year, Housewarming, Birthday', 79, 198, 65, 'Congratulation flowers - Good start', 2, 65, 200, 5),
('Products include: Yellow carnation : 5 Single orange carnation : 8 Butter green single carnation : 5', '15/01/2022', 'Designed with gentle tones of yellow roses and white auspicious, the floral pattern is designed in a tall style that creates vivid, harmonious and elegant lines. The flower basket carries the meaning of strength. and try to rise up, suitable for relatives, friends and colleagues on the occasion of opening, congratulation and reunion days.\r\n', 'New Year, Housewarming', 99, 248, 66, 'Congratulations Flowers - Reach Out', 2, 66, 200, 3.9),
('30cm', '27/07/2022', '\"\r\nPoodles are made of high quality cotton.\r\n\r\nSize 30 cm.\r\n\r\nAvailable in 3 colors: white, brown and yellow.\r\n\r\nThis dog has a very cute and funny face.\r\n\r\nSuitable as gifts for girlfriends, gifts for children.\r\n', 'Children\'s Day Birthday', 185, 463, 67, 'Poodle stuffed dog', 3, 67, 200, 4.6),
('40cm', '16/10/2022', 'The multicolored teddy bear measures 40 cm.\r\n\r\nAvailable in 4 colors: white, grey, brown and pink.\r\n\r\nMade from soft cotton material.\r\n\r\nSuitable as a gift for girlfriends, for children\"\" \"\r\n', 'Children\'s Day Birthday', 132, 330, 68, 'Colorful teddy bear', 1, 68, 200, 3),
('70cm', '20/03/2021', '\r\nGray plush rabbit is made of high quality cotton, safe to use.\r\n\r\nCute and funny design.\r\n\r\nSize length size 70cm.\r\n\r\nGray plush bunny is suitable as a gift for a girlfriend or for children.\r\n\"\" \"\r\n', 'Children\'s Day Birthday', 170, 425, 69, 'Gray bunny', 2, 69, 200, 3.7),
('60x80x100cm', '10/10/2022', '\r\nLavender purple teddy bear with fluffy and very soft fur. Products are available in different sizes\r\n\r\n     Size 60 cm price 229 k\r\n     Size 80 cm price 319 k\r\n     Size 100 cm price 439 k\r\n\r\nThis teddy bear is very suitable as a gift for a girlfriend on birthday, Valentine, ... or a gift for children.\"\r\n', 'Children\'s Day Birthday', 116, 290, 70, 'Lavender purple teddy bear', 1, 70, 200, 3.3),
('35cm', '15/11/2021', 'Round cotton cat is made of smooth cotton material, safe to use.\r\n\r\nThe product has many colors for you to choose: white, yellow, gray and black. You can note the color you want to choose when ordering. Shop will contact you to finalize the order before sending.\r\n\r\nSize length 35cm.\r\n\r\nRound fluffy cats are suitable as gifts for babies, girlfriends gifts, birthday gifts or children\'s Tet gifts, ...\"\r\n', 'Children\'s Day Birthday', 126, 315, 71, 'Round fluffy cat', 2, 71, 200, 4.5),
('40x50cm', '03/07/2022', '\r\nCotton elephants are made from high quality cotton.\r\n\r\nThere are many colors to choose from.\r\n\r\nSize 40 x 50 cm.\r\n\r\nPerfect as a gift for your girlfriend or children.\"\r\n', 'Children\'s Day Birthday', 145, 363, 72, 'Cotton elephant', 3, 72, 200, 3.6),
('40x50cm', '14/04/2020', '\"\r\nAvailable in 2 colors, cream and white.\r\n\r\nYou can write the color and size you want to receive in the note when ordering. The shop will contact you to close the order before sending it to you.\r\n\r\nThe product is made of soft cotton material.\r\n\r\nVery suitable as a gift for girlfriends, gifts for children.\"\r\n', 'Children\'s Day Birthday', 63, 158, 73, 'Cotton dog with a bag', 5, 73, 200, 5),
('20x60x80cm', '24/12/2021', 'Yellow cotton cat is made from high quality cotton that is safe for users\r\n\r\nVarious facial expressions are available\r\n\r\nAvailable in sizes 20cm, 60cm and 80cm.\r\n\r\nThis is a great gift for a girlfriend or child.\r\n', 'Children\'s Day Birthday', 86, 215, 74, 'Yellow fluffy cat', 1, 74, 200, 3.5),
('45x60x90cm', '19/12/2022', 'A white teddy bear with a bow is very suitable as a girlfriend\'s birthday gift, a gift for a lover on her birthday, March 8, ...', 'Children\'s Day Birthday', 123, 308, 75, 'White teddy bear with bow', 3, 75, 200, 3.3),
('65cm', '01/10/2021', 'Husky plush dog has a length of 65 cm\r\n\r\nThis dog has 2 colors white and gray.\r\n\r\nThe product is very suitable as a gift for girlfriends on March 8 or birthday gifts, children\'s gifts,', 'Children\'s Day Birthday', 175, 438, 76, 'Husky plush dog', 2, 76, 200, 3.5),
('750ml', '08/11/2022', 'Penfolds Magill Estate Shiraz Red Wine - made from Shiraz grapes (the soul grape variety of Australian wine) from Magill vineyards on the eastern outskirts of the Adelaide Hills, Australia. The grapes are hand-harvested for production, after fermenting for 17 months in American and French oak barrels. \r\n', 'New Year, Housewarming, Birthday', 63, 158, 77, 'Penfolds Magill Estate Shiraz', 9, 77, 200, 4.4),
('700ml', '12/09/2022', 'Penfolds Bin 144 Yattarna Chardonnay Premium White Wine - Chardonnay grapes are harvested from vineyards in Tasmania, Tumbarumba and the Adelaide Hills, Australia. After fermentation, the wine is aged for 8 months in French oak barrels.\r\n', 'New Year, Housewarming, Birthday', 104, 260, 78, 'Penfolds Bin 144 Yattarna Chardonnay', 9, 78, 200, 4),
('750ml', '17/09/2022', 'Penfolds St Henri Shiraz Red Wine - a wine that celebrates the heritage of the Shiraz grape. Shiraz is harvested from Barossa Valley, McLaren Vale, Eden Valley, Port Lincoln, Australia. After fermentation, the wine is aged for 12 months in oak barrels. \r\n', 'New Year, Housewarming, Birthday', 155, 388, 79, 'Penfolds St Henri Shiraz', 9, 79, 200, 3.1),
('700ml', '12/10/2022', 'The Godfather Cabernet Sauvignon Italian red wine - The Godfather, made from Cabernet Sauvignon grapes Gala Dinner No Menu in July 2019.\r\n\r\nGodfather Cabernet Sauvignon wine was inspired by the movie The Godfather - Godfather to name the wine bottle. Bottled and luxuriously waxed to make Godfather Cabernet Sauvignon more impressive.\r\n', 'New Year, Housewarming, Birthday', 128, 320, 80, 'The God Father', 10, 80, 200, 4.3),
('750ml', '16/02/2022', 'This 50 Anniversario is to celebrate the 50th anniversary of the prestigious Cantine Sanmarzano distillery with a limited edition of only 7,500 annually, with two grape varieties Primitivo and Negro Amaro with 60-80 year old vines grown in the Sava region , Sanmarzano, grapes are left to ripen almost dry on the tree and then harvested. When harvesting, it has to be done by hand and in the early morning the grapes are at their best \r\n', 'New Year, Housewarming, Birthday', 168, 420, 81, 'San Marzano 50 Anniversario', 10, 81, 200, 3.7),
('700ml', '09/50/2021', 'Mentioning 60 Sessantanni is referring to the difference in aroma and taste. No need to enjoy, right from the moment you open the bottle you are conquered by the passionate and seductive aroma of the wine. That scent has the ability to impress and have a strong impact on the sense of smell like an invitation that makes you unable not to enjoy.\r\n\r\nAnd when you take small sips on your lips, all your senses are awakened and you feel that this is really the best Italian wine.', 'New Year, Housewarming, Birthday', 169, 423, 82, '60 Sessantanni Limited Edition', 10, 82, 200, 3.8),
('750ml', '19/08/2021', 'This bottle of wine is a typical product of the Italian wine brand Cantine San Marzano. They were born as bringing a very personal style so that anyone who looks at the bottle will become impressed from the very first moment. It\'s a beautiful deep purple ruby ​​red color that attracts the eye. In addition, it is its taste that is the basic factor to conquer the hearts of wine users. The wine has strong aromas of many ripe fruits such as ripe plums, assorted fruits and vanilla. A slight note of aroma from licorice also adds richness to the wine. With such a gentle and romantic wine, there is no reason for wine users to refuse to own a bottle of wine. Possessing a perfect wine quality at a very affordable price, not too expensive….wine is always a great choice for customers.', 'New Year, Housewarming, Birthday', 106, 265, 83, 'Collezione Cinquanta', 10, 83, 200, 4.8),
('750ml', '25/04/2022', 'F NegroAmaro - Italian red, very full and deep purple, rich and complex in aromas with soft, spongy tannins and flavors of vanilla, ripe plums, purple myrtle, marmalade. The wine is quite thick, full of flavor in the mouth, round, soft and harmonious, rich in tannins, greasy with subtle buttery and cream flavors, mixed with the aroma of passionate cocoa and seductive cedar. It spreads in the mouth and is pleasantly smooth with a sweet and delicate finish.\r\n\r\nGrapes are hand-picked, picked early in the morning, selecting the best bunches of grapes. At the winery, the selection will again be made to select the best grapes to make the F.', 'New Year, Housewarming, Birthday', 120, 300, 84, 'F NegroAmaro', 10, 84, 200, 5),
('1000ml', '15/03/2022', 'Absolut Elyx Vodka, Pernod Ricard, travel retail, announces the launch of Absolut Elyx, the new ultra-premium vodka.\r\n\r\nCrafted in small quantities from specially selected winter wheat granaries with purified source water, this vodka has been researched and developed for more than 10 years, the company says.\r\n\r\nReturning to the five-century legacy of the tradition of making vodka on the Skane farms, located in southern Sweden, Absolut restores the stillness that has been distilled since 1929 at the Ahus distillery. This factory uses the traditional type of barrel (copper) for unique taste, crystallization quality, excellent texture.', 'New Year, Housewarming, Birthday', 162, 405, 85, 'Vodka Absolut Elyx', 11, 85, 200, 4.2),
('750ml', '11/09/2022', 'Vodka Beluga Gold Line (also known as Vodka Beluga hammer, hammer with one end is a small hammer and a brush head comes with a bottle of wine used to hit the wax head when opening the bottle) is the house\'s most premium beluga line. Mariinsky (founded in 1900) is a limited edition exclusively for wine connoisseurs around the world.Like Beluga Noble, the ingredients are also malt and water from a well in Sebiria but the production process The raw materials for production are more carefully selected and the best quality ones are used to produce Beluga.\r\n\r\nBeluga Gold Line wine filtration, increased from 3 times to 5 times, settling time from 30 days to 90 days compared to Beluga Noble. That\'s why Beluga Gold Line has a more perfect taste.\r\n\r\nEach bottle of Beluga Gold Line is assigned a unique code, sealed with a special cork covered with beeswax and a Vodka identification code. Each bottle of wine will have a special hammer and corkscrew attached.', 'New Year, Housewarming, Birthday', 129, 323, 86, 'Vodka Beluga Gold Line', 12, 86, 200, 3.3),
('1750ml', '04/11/2021', 'Belvedere Vodka 1.75L is a vodka originating from Poland. Produced using a unique handcrafted technology from 100% Dankowskie barley and distilled 4 times to ensure outstanding quality, mild flavor and subtle sweetness.\r\n\r\nBelvedere vodka was imported to Vietnam by Moet Hennessy, a large reputable corporation, so we are quite confident about the quality of that wine.\r\n\r\nMade from clear and pure deep groundwater, Belvedere is made according to the traditional Polish vodka recipe from 600 years ago, so before its modern appearance, Belvedere wine is classic. With a standard strength of 40% according to international standards for vodka, Belvedere can be used in many ways. You can drink Belvedere directly to enjoy the barley taste or you can use Belvedere to make your favorite cocktails.\r\n', 'New Year, Housewarming, Birthday', 95, 238, 87, 'Vodka Belvedere 1.75L', 13, 87, 200, 4.5),
('700ml', '19/04/2022', 'Snow Leopard vodka is made in Poland by Polmos Lublin, one of the finest vodka distilleries in the world. For over 100 years, Polmos Lublin has been recognized for producing some of the finest vodkas due to its skill. , experience and sophisticated distillation process.\r\n\r\nSnow Leopard is the first premium vodka made with rare spelled. Affectionately called the \"\"grandfather of all seeds\"\". Spelled was first cultivated more than 5000 years ago by the Egyptians.\r\n\r\nSpelled has a distinct fresh, nutty flavor. The tough shell protects the contaminant particles from the outside as well as maintaining nutrients resulting in a freshness not found in any other grain. Spelled is grown with the use of pesticides and fertilizers, and is usually purchased for four or five times the price of winter wheat or rye.', 'New Year, Housewarming, Birthday', 73, 183, 88, 'Vodka Snow Leopard', 14, 88, 200, 3.6),
('750 ml', '28/06/2021', 'If we have to mention high-class French white wines, it is impossible not to mention the name of this wine. The wine was born the brainchild of producer Nicolas Feuillatte. Matured from the combination of The perfect combination of two grape varieties is Chardonnay - Pinot Noir. These are two grape varieties chosen by many winemakers to produce white wine bottles. Possessing a rich and round taste, the grape variety has decided. Determine the dominant flavor of the bottle.\r\n\r\nBesides, when enjoying, you also feel the rich variety of aromas from other fruits such as pears or apples.\r\n\r\nThe 12% concentration is enough to show the lightness and romance in the style of the bottle. With a well-balanced structure, a moderate amount of smooth tannins, the wine has always been the target of many users and has become one of the top premium white wines loved and sought by many. . Suitable wine for you to choose to use as a gift for your boss and important partners.', 'New Year, Housewarming, Birthday', 55, 138, 89, 'Champagne Nicolas Feuillatte Palmes d\'Or', 15, 89, 200, 3.9),
('750ml', '11/11/2021', 'Louis Roederer is a quite famous wine brand of the French region in general. The birth of the producer has made a significant contribution to the history of the development of the country\'s winemaking industry. Because all the wines born here are very special and diverse, making the special in French wine unlike any other.\r\n\r\nThis bottle of wine is typical of the producer. Matured by the perfect combination in certain proportions from the Chardonnay - Pinot Noir grape varieties, the wine contains rich and round aromas from these two grape varieties. In addition, the wine is also noted from many other ripe fruit aromas such as red berries, aromas from smoke and a hint of rose.\r\n\r\nA rather complex wine structure is contained in a glass bottle with pastel pink color, creating an extremely smooth and eye-catching external beauty. Moreover, with a gentle concentration of 12.5%, it ensures a smooth and smooth tannin content. In important parties such as entertaining partners or in luxury gift baskets, the presence of a bottle of wine is guaranteed to bring the best spiritual value.', 'New Year, Housewarming, Birthday', 168, 420, 90, 'Champagne Louis Roederer Brut Rose', 16, 90, 200, 3.6),
('750ml', '28/08/2021', 'Perrier Jouet Grand brut Champagne, a blend of Pinot Noir (40%), Meunier (40%) and Chardonnay 20%. This Champagne is aged for a minimum of 36 months.\r\n\r\nChampagne is the drink for the elite because of its elaborate production, limited quantities, within the new French Champagne region known as Champagne as well as its much higher price tag than regular sparkling/sparkling.\r\n\r\nChampagne party is always a party of luxury and luxury, held on important occasions or in luxurious or 5-star restaurants. If you want to enjoy a delicious Champagne, treat and awaken your senses, you can\'t drink it casually and suddenly if it is not served properly.', 'New Year, Housewarming, Birthday', 111, 278, 91, 'Champagne Perrier Jouet Grand brut', 17, 91, 200, 4.1),
('750ml', '07/08/2021', 'France is not inferior to any other country on the market today in terms of wine production in general. And this bottle of white wine is a typical product from the beautiful country of France.\r\n\r\nUsers will feel impressed about this wine bottle from the first meeting by a beautiful appearance right from the outside of the wine bottle. It\'s a soft, nostalgic light white color, the color of autumn, the color of people who are delicate, flexible and rhythmic.\r\n\r\nMoreover, the taste in the wine is the factor that scores users. It is the fresh aroma from the Chardonnay grape variety, the main ingredient that makes up the flavor of the wine. In addition, the wine also has aromas of many other ripe fruits such as oranges, tangerines or grapefruits of all kinds. Followed by aromas of lightly buttered pastry, pear aromas, and a hint of gingerbread. On the palate, flavors of guava are complemented by sweet spices and a fresh mineral finish…', 'New Year, Housewarming, Birthday', 183, 458, 92, 'Champagne Armand De Brignac Blanc', 18, 92, 200, 4.2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `firstname` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `avatar` text DEFAULT 'http://localhost/img/giftshop/user/default.png',
  `birthday` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`, `address`, `email`, `phone`, `avatar`, `birthday`) VALUES
(1, 'giang', 'giang', 'Nguyen Huong', 'Giang', ' 25 Nguyen Chi Thanh, Dong Da, Hanoi', 'giang.nguyenhuong2@gmail.com', '732-962-6341', 'http://localhost/img/giftshop/user/default.png', '8/17/2003'),
(2, 'nam', 'nam', 'Pham Thanh', 'Nam', '2 Linh Nam, Hoang Mai, Hanoi', 'nam.phamthanh51@gmail.com', '601-798-8421', 'http://localhost/img/giftshop/user/default.png', '4/3/1987'),
(3, 'thanh', 'thanh', 'Nguyen Tuan', 'Thành', '34 Tran Phu, Rach Gia, Kien Giang', 'thanh.nguyentuan93@gmail.com', '419-729-8410', 'http://localhost/img/giftshop/user/default.png', '6/19/1980'),
(4, 'minh', 'minh', 'Vu Hoang', 'Minh', ' 30/78 Le Loi, Ngo Quyen, Hai Phong', 'minh.hihi@gmail.com', '910-829-7316', 'http://localhost/img/giftshop/user/default.png', '7/5/1993');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`userid`, `productid`) VALUES
(4, 84),
(4, 89),
(4, 91);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `catepro`
--
ALTER TABLE `catepro`
  ADD PRIMARY KEY (`cateid`,`proid`),
  ADD KEY `proid` (`proid`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid` (`productid`),
  ADD KEY `userid` (`userid`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Chỉ mục cho bảng `ordersdetail`
--
ALTER TABLE `ordersdetail`
  ADD PRIMARY KEY (`productid`,`orderid`),
  ADD KEY `orderid` (`orderid`);

--
-- Chỉ mục cho bảng `productimg`
--
ALTER TABLE `productimg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid` (`productid`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`userid`,`productid`),
  ADD KEY `productid` (`productid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `productimg`
--
ALTER TABLE `productimg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=624;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `catepro`
--
ALTER TABLE `catepro`
  ADD CONSTRAINT `catepro_ibfk_1` FOREIGN KEY (`cateid`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `catepro_ibfk_2` FOREIGN KEY (`proid`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `ordersdetail`
--
ALTER TABLE `ordersdetail`
  ADD CONSTRAINT `ordersdetail_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `ordersdetail_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `productimg`
--
ALTER TABLE `productimg`
  ADD CONSTRAINT `img_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`);

--
-- Các ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
