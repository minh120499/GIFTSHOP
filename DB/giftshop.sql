-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 25, 2022 lúc 07:31 PM
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

-- --------------------------------------------------------
DROP DATABASE IF EXISTS GIFTSHOP;
CREATE DATABASE GIFTSHOP;
USE GIFTSHOP;
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
('admin', 'admin', 'Aptech Protrain, 285 Đội Cấn, Liễu Giai, Ba Đình, Hà Nội', 'eproject_gifts_shop@aptechlearning.edu.vn', '08.8888.0000', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partrient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.\r\n<br/>\r\n<br/>\r\nDonec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 'http://localhost/img/giftshop/adminavatar.png', 'http://localhost/img/giftshop/logo.png');

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
(18, 'Armand de Brignac', 'http://localhost/img/giftshop/brand/armand.jpg', 'France');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `img`) VALUES
(1, 'Birthdays Anniversary', 'http://localhost/img/giftshop/categories/birthday.'),
(2, 'Weddings Anniversary', 'http://localhost/img/giftshop/categories/wedding.j'),
(3, 'Christmas Anniversary', 'http://localhost/img/giftshop/categories/Christmas'),
(4, 'Valentine’s Day Anniversa', 'http://localhost/img/giftshop/categories/valtentin'),
(5, 'Mother’s Day Anniversary', 'http://localhost/img/giftshop/categories/motherday'),
(6, 'Easter Anniversary', 'http://localhost/img/giftshop/categories/easter.jpg'),
(7, 'Halloween Anniversary', 'http://localhost/img/giftshop/categories/halloween'),
(8, 'New Year Anniversary', 'http://localhost/img/giftshop/categories/newyear.j'),
(9, 'Clock', ''),
(10, 'Cosmetics', ''),
(11, 'Decorations', ''),
(12, 'Flower', ''),
(13, 'Picture Frame', ''),
(14, 'Teddy Bear', ''),
(15, 'Towel', ''),
(16, 'Toy', ''),
(17, 'Wine', '');

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

INSERT INTO `catepro` (`cateid`, `proid`) VALUES(1, 1),(1, 2),(1, 3),(1, 4),(1, 5),(1, 6),(1, 8),(1, 10),(1, 11),(1, 12),(1, 13),(1, 14),(1, 15),(1, 17),(1, 18),(1, 19),(1, 20),(1, 22),(1, 23),(1, 26),(1, 27),(1, 28),(1, 29),(1, 31),(1, 34),(1, 35),(1, 36),(1, 37),(1, 38),(1, 39),(1, 40),(1, 41),(1, 42),(1, 43),(1, 44),(1, 45),(1, 46),(1, 48),(1, 50),(1, 52),(1, 53),(1, 55),(1, 57),(1, 58),(1, 59),(1, 60),(1, 62),(1, 63),(1, 64),(1, 66),(1, 67),(1, 68),(1, 69),(1, 70),(1, 71),(1, 72),(1, 73),(1, 74),(1, 75),(1, 76),(1, 78),(1, 79),(1, 80),(1, 81),(1, 82),(1, 83),(1, 84),(1, 85),(1, 86),(1, 87),(1, 88),(1, 89),(1, 90),(1, 91),(2, 2),(2, 3),(2, 4),(2, 6),(2, 8),(2, 9),(2, 11),(2, 13),(2, 14),(2, 16),(2, 18),(2, 19),(2, 20),(2, 23),(2, 29),(2, 30),(2, 32),(2, 36),(2, 38),(2, 47),(2, 50),(2, 52),(2, 55),(2, 57),(2, 59),(2, 60),(2, 62),(2, 69),(2, 70),(2, 71),(2, 74),(2, 83),(2, 84),(2, 87),(2, 91),(2, 92),(3, 3),(3, 5),(3, 7),(3, 8),(3, 12),(3, 14),(3, 16),(3, 17),(3, 18),(3, 19),(3, 20),(3, 28),(3, 29),(3, 32),(3, 33),(3, 35),(3, 38),(3, 39),(3, 42),(3, 43),(3, 47),(3, 51),(3, 53),(3, 55),(3, 57),(3, 58),(3, 59),(3, 61),(3, 63),(3, 66),(3, 72),(3, 73),(3, 74),(3, 75),(3, 78),(3, 80),(3, 81),(3, 82),(3, 85),(3, 88),(4, 4),(4, 11),(4, 17),(4, 20),(4, 28),(4, 34),(4, 41),(4, 47),(4, 48),(4, 49),(4, 54),(4, 55),(4, 57),(4, 63),(4, 64),(4, 71),(4, 73),(4, 75),(4, 77),(4, 87),(4, 91),(8, 2),(8, 3),(8, 4),(8, 6),(8, 7),(8, 8),(8, 9),(8, 10),(8, 11),(8, 12),(8, 13),(8, 15),(8, 16),(8, 17),(8, 18),(8, 19),(8, 20),(8, 21),(8, 22),(8, 23),(8, 24),(8, 25),(8, 27),(8, 28),(8, 29),(8, 31),(8, 32),(8, 36),(8, 37),(8, 40),(8, 42),(8, 43),(8, 45),(8, 46),(8, 50),(8, 52),(8, 53),(8, 55),(8, 56),(8, 57),(8, 58),(8, 60),(8, 62),(8, 64),(8, 65),(8, 66),(8, 67),(8, 68),(8, 69),(8, 73),(8, 74),(8, 75),(8, 76),(8, 77),(8, 78),(8, 80),(8, 81),(8, 82),(8, 83),(8, 85),(8, 86),(8, 88),(8, 89),(8, 90),(8, 91),(9, 11),(9, 12),(9, 13),(9, 14),(9, 15),(9, 16),(9, 17),(10, 28),(10, 29),(10, 30),(10, 31),(10, 32),(10, 33),(10, 34),(10, 35),(10, 36),(11, 18),(11, 19),(11, 20),(11, 21),(11, 22),(11, 23),(11, 24),(11, 25),(11, 26),(11, 27),(12, 53),(12, 54),(12, 55),(12, 56),(12, 57),(12, 58),(12, 59),(12, 60),(12, 61),(12, 62),(12, 63),(12, 64),(12, 65),(12, 66),(13, 37),(13, 38),(13, 39),(13, 40),(13, 41),(13, 42),(14, 67),(14, 68),(14, 69),(14, 70),(14, 71),(14, 72),(14, 73),(14, 74),(14, 75),(14, 76),(15, 43),(15, 44),(15, 45),(15, 46),(15, 47),(15, 48),(15, 49),(15, 50),(15, 51),(15, 52),(16, 1),(16, 2),(16, 3),(16, 4),(16, 5),(16, 6),(16, 7),(16, 8),(16, 9),(16, 10),(17, 77),(17, 78),(17, 79),(17, 80),(17, 81),(17, 82),(17, 83),(17, 84),(17, 85),(17, 86),(17, 87),(17, 88),(17, 89),(17, 90),(17, 91),(17, 92),(5,1),(5,5),(5,7),(5,9),(5,12),(5,17),(5,19),(5,21),(5,23),(5,35),(5,43),(5,44),(5,46),(5,47),(5,66),(5,68),(5,74),(5,80),(5,81),(5,83),(5,84),(5,86),(5,87),(5,91),(6,6),(6,12),(6,18),(6,22),(6,25),(6,32),(6,35),(6,37),(6,44),(6,52),(6,55),(6,65),(6,69),(6,77),(6,80),(6,84),(6,88),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(7,11),(7,12),(7,13),(7,15),(7,16),(7,17),(7,19),(7,20),(7,21),(7,24),(7,25),(7,26),(7,27),(7,28),(7,31),(7,33),(7,34),(7,35),(7,36),(7,37),(7,38),(7,39),(7,41),(7,42),(7,43),(7,45),(7,46),(7,47),(7,48),(7,49),(7,56),(7,57),(7,58),(7,60),(7,61),(7,62),(7,63),(7,64),(7,65),(7,66),(7,67),(7,68),(7,69),(7,70),(7,71),(7,72),(7,74),(7,76),(7,77),(7,78),(7,79),(7,83),(7,85),(7,87),(7,88),(7,89),(7,90),(7,91),(7,92);

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
-- Cấu trúc bảng cho bảng `img`
--

CREATE TABLE `img` (
  `id` int(11) NOT NULL,
  `src` text DEFAULT NULL,
  `productid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `img`
--

INSERT INTO `img` (`id`, `src`, `productid`) VALUES
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
(297, 'http://localhost/img/giftshop/Wine/cnfpd3.jpg', 89);
(298, 'http://localhost/img/giftshop/Toy/pb5.jpg', 4),
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `date` varchar(10) DEFAULT NULL,
  `toname` varchar(25) DEFAULT NULL,
  `toemail` varchar(50) DEFAULT NULL,
  `tophone` varchar(15) DEFAULT NULL,
  `toaddress` varchar(100) DEFAULT NULL,
  `payment` varchar(25) DEFAULT NULL,
  `status` varchar(25) DEFAULT 'unpaid',
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
-- Cấu trúc bảng cho bảng `productdetails`
--

CREATE TABLE `productdetails` (
  `productid` int(11) NOT NULL,
  `size` varchar(25) DEFAULT NULL,
  `date` varchar(25) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `anniversary` varchar(25) DEFAULT NULL,
  `sold` int(11) DEFAULT NULL,
  `view` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `productdetails`
--

INSERT INTO `productdetails` (`productid`, `size`, `date`, `content`, `anniversary`, `sold`, `view`) VALUES
(1, '11x20x30cm', '17-5-2022', '\"Solar system gyro is also known as the solar system gyroscope. This is a physical toy', 'Children\'s Day', 196, 490),
(2, '15x18cm', '22-9-2021', 'The lollipop spinning game is made from natural wood. There are many colors for you to choose from. You can note the color you want to get when ordering. This is a very interesting game', 'Children\'s Day', 152, 380),
(3, '25x28cm', '28-10-2022', '\"Marvel superhero model is based on the image of famous characters in the movie adaptations of Marvel\'s comic books. The product is made of synthetic resin. There are many templates for you to choose from. The product is suitable as a gift for children', 'Children\'s Day', 65, 163),
(4, '19x23cm', '20-6-2021', 'The dog box is made of high quality ABS plastic. There are 4 models to choose from. You can note the model you want to receive when ordering. The shop will contact you to close the order before sending it to you. The pet saving box is a great gift for children and friends – especially dog lovers.', 'Children\'s Day', 99, 248),
(5, '6x30x30cm', '18-9-2021', 'The maze ball game is made of wood. This toy is suitable for children or as a stress reliever in a group of friends.', 'Children\'s Day', 189, 473),
(6, '9x19x24cm', '3-10-2022', '\"The mini Bowling game is made of wood and metal marbles. The gameplay is relatively simple. Suitable as gifts for children', 'Children\'s Day', 68, 170),
(7, '8x20x20cm', '4-10-2021', '\"Unique wooden draw toy set', 'Children\'s Day', 80, 200),
(8, '3x3x3cm', '7-8-2022', '\"Rubik 3×3 is made of plastic material. This is a kind of game that trains your mind and ability to concentrate. Very suitable as a gift for friends', 'Children\'s Day', 108, 270),
(9, '45cm', '21-10-2022', '\"Shrrilling Chicken is one of the hot products. It is loved by many young people. Chicken is made of plastic material', 'Children\'s Day', 125, 313),
(10, '10cm', '13-8-2022', '\"Plasma ball uses 220V electricity. The base is made of plastic', 'Children\'s Day - Christma', 136, 340),
(11, '15x17cm', '23-4-2022', '\"lassic alarm clock made of metal material. Has functions to see the time', 'Birthday- 20-11-Anniversa', 199, 498),
(12, '12x14cm', '22-6-2022', '\"The LED alarm clock is made of plastic material. The watch has many functions: date and time', 'Birthday- 20-11- Annivers', 136, 340),
(13, '20x25cm', '16-5-2022', '\"The Big ben tower clock has a core made of glass', 'Birthday- 20-11- Housewar', 70, 175),
(14, '17x20cm', '18-3-2022', '\"The dial clock is made of stainless steel', 'Birthday- 20-11- Annivers', 52, 130),
(15, '16x24cm', '12-6-2021', '\"The double-sided bicycle watch is made of metal material. There are 2 independent timers. Use 2A battery. Products suitable as gifts for boyfriends', 'Birthday- 20-11- Annivers', 50, 125),
(16, '30x35cm', '4-7-2021', '\"The Diy Clock 360 wall clock has a diameter of 40 cm. Black. Quazt machine', 'Birthday- 20-11- Housewar', 81, 203),
(17, '25x30cm', '15-8-2022', '\"The wooden bar LED clock is made of high quality plastic with imitation wood grain. There are many different colors and shapes. The parameters on the meter are displayed in digital form. The product can be used simultaneously with a 5V power source (Similar to a phone charger) or an AAA battery that can be easily purchased in the market. Led wooden clocks are very suitable as gifts for classmates', 'Birthday-Anniversary', 104, 260),
(18, '10cm', '10-6-2022', 'The galaxy crystal ball is made of K9 crystal material and modern 3D laser engraving technology.(See detailed description below to understand the features and differences of the 3 soles.) You can write in the note the type of sole you choose when ordering. We will contact you before shipping.', 'Birthday- Valentine- 20-1', 147, 368),
(19, '12cm', '11-2-2022', '\"The statue of old people watching and watching albums is made of synthetic resin. Dimensions 12cm long', 'Birthday- Valentine- 20-1', 116, 290),
(20, '6x8cm', '21-5-2022', '\"The dandelion crystal is made of K9 crystal material. You can also purchase an additional color-changing LED light base for a more shimmering light effect. Crafted with advanced 3D laser engraving technology. Crystal dandelion is suitable as a meaningful girlfriend gift', 'Birthday- Valentine- 20-1', 59, 148),
(21, '20x35cm', '27-3-2022', '\"The silent human face statue is made of artificial stone. The silent human face statue is suitable for decoration', 'Birthday- Valentine- 20-1', 109, 273),
(22, '26x41cm', '23-6-2021', '\"The horse head statue is made of artificial stone', 'Birthday- Valentine- 20-1', 55, 138),
(23, '8cm', '6-11-2022', '\"The solar system crystal ball is dense', 'Birthday- Valentine- 20-1', 167, 418),
(24, '50x60cm', '9-5-2021', 'World famous architectural models are miniature models of real buildings in the world. It is a miniature version of these works. The product is made of metal material. There are many models with different sizes and prices', 'Birthday- Valentine- 20-1', 72, 180),
(25, '22x17cm', '10-8-2021', '\"There are many colors to choose from: blue', 'Birthday- Valentine- 20-1', 120, 300),
(26, '11x24cm', '20-1-2022', '\"Sailboat model in a glass bottle measures 24 cm in length', 'Birthday- Valentine- 20-1', 126, 315),
(27, '70cm', '2-9-2022', '\"The feng shui arowana has a base made of solid natural wood', 'Birthday -Valentine- 20-1', 90, 225),
(28, '6g', '8-10-2022', '\"Always knowing how to impress with luxurious', 'Valentine-20-10-Anniversa', 175, 438),
(29, '8g', '10-12-2022', '\"YSL Rouge Pur Couture The Slim Lipstick has a slim', 'Valentine-20-10-Anniversa', 64, 160),
(30, '8g', '27-3-2021', '\"Tom Ford 8 has only been released for a while', 'Valentine-20-10-Anniversa', 151, 378),
(31, '6g', '5-9-2021', '\"Includes 6 lipstick colors of the limited edition of Dior\'s collection in celebration of this year\'s Christmas season. And all these 6 colors when you first look at it', 'Valentine-20-10-Anniversa', 174, 435),
(32, '10g', '18-8-2021', '\"With this lipstick', 'Valentine-20-10-Anniversa', 60, 150),
(33, '90ml', '2-4-2022', '\"YSL Libre fragrance opens with an explosion of mandarin orange', 'Valentine-20-10-Anniversa', 113, 283),
(34, '90ml', '17-1-2021', '\"True to the name lost cherries - Lost Cherry revolves around the note of cherry', 'Valentine-20-10-Anniversa', 133, 333),
(35, '50ml', '14-7-2022', '\"The top notes of Santal Blush are quite normal and natural: sharp', 'Valentine-20-10-Anniversa', 88, 220),
(36, '100ml', '19-4-2022', '\"Miss Dior Blooming Bouquet inspires a special and playful love. The fragrance represents freedom and seduction', 'Valentine-20-10-Anniversa', 141, 353),
(37, '17x22cm', '21-8-2021', 'Small lucky photo frame is made of natural wood with beautiful grain. There are 2 sizes for you to choose from', 'Anniversary-20-10-20-11-V', 186, 465),
(38, '18x23cm', '21-2-2021', '\"lassic photo frames are made of synthetic resin. Dimensions height 23cm', 'Anniversary-20-10-20-11-V', 138, 345),
(39, '\"20x25cm\"', '5-4-2022', '', '-Children\\\'s Day', 137, 343),
(40, '15x20cm', '17-7-2022', 'Bicycle wooden photo frame is made from natural wood material. Size 15 x 20 cm. There are 2 models for you to choose from. You can write the model you want to receive in the notes section when ordering. You can put your photo in the photo frame ', 'Anniversary-20-10-20-11-V', 63, 158),
(41, '30cm', '2-5-2021', '\"et includes 2 A6 pictures. 5 pictures a7 . All details on the picture are texture drawing', 'Anniversary-20-10-20-11-V', 95, 238),
(42, '50x60cm', '17-5-2021', '\"Wall paintings are the leading decorative decorative paintings of today\'s leading trends', 'Anniversary-20-10-20-11-V', 74, 185),
(43, '80cm', '24-9-2021', '\"A lovely scarf is an accessory that both keeps baby warm when winter comes', 'Sinh nhật-Children\'s Day', 112, 280),
(44, '40cm', '10-9-2021', '\"The soft silk scarf will make your outfit more luxurious and elegant. Simple and elegant motifs will create accents', 'Birthday- Anniversary', 175, 438),
(45, '150cm', '16-8-2021', '\" Korean style scarf with simple but delicate black and white plaid pattern. - Super soft fashion wool scarf. -Designed with new and fresh tones', 'Birthday- Anniversary', 70, 175),
(46, '180cm', '8-4-2021', '\"Not only has the effect of keeping warm', 'Birthday- Anniversary', 60, 150),
(47, '170cm', '2-4-2022', '\" Fashionable scarves and scarves are always a companion to bring boys and girls new styles in autumn and winter. Not only stopping at classic towels', 'Birthday- Anniversary', 127, 318),
(48, '160cm', '19-5-2022', '\"Very thick and smooth scarf is the most meaningful gift of all to replace your words of love in the cold winter. - Luxurious and sophisticated', 'Birthday- Anniversary', 144, 360),
(49, '150cm', '5-1-2022', 'Product : Lovely Christmas shawl - Color: Green - Red. - Material: Cotton.Product Advantages: ⁃ Design beautiful products and eye-catching Christmas motifs to beautify the Christmas season. ⁃ Breathable cotton material - safe.', 'Christmas Day', 186, 465),
(50, '170cm', '22-1-2022', '\"Texture: Solid color Product: Winter scarf Treatment: Tie-Dye Material: imitation cashmere Popular elements: tassels Style: stretch Use case: Travel', 'Birthday- Anniversary', 54, 135),
(51, '130cm', '23-7-2022', 'Style: Classical Ethnic Length (cm): Bandana Product code: Cotton Bandana Width (cm): 22cm Weaving method: Warp knitting Texture: Monochrome Foreign Trade: Yes Function: warm Processing method: woven flower', 'Birthday- Anniversary', 147, 368),
(52, '40cm', '16-4-2022', '\"Bandana is a large square scarf', 'Birthday- Anniversary', 149, 373),
(53, 'White calimero: 5 Red ros', '2-5-2022', '\"With the classic red color of the rose combined with the white color from the wolf muzzle flower and the white calimero', 'Sinh nhật-event-Tân gia', 107, 268),
(54, 'Products include: Porcela', '10-3-2021', 'Welcome spring with color and luck with a pot of pink phalaenopsis. Orchid pots are suitable for decorating homes with small spaces but still increase the coziness and elegance of the room space.', 'Tết', 187, 468),
(55, 'Products include: Single ', '7-4-2021', 'Fresh flowers are always considered a meaningful bridge for words of love. A solemn bouquet of flowers with the yellow color of pink moonlight symbolizes luck and fortune. Red carnation with a meaningful message about Deep gratitude and strong wolf snout flower reaching out to symbolize prosperity will be a perfectly suitable choice for conferences and events that need to honor and pay tribute to partners or delegates who have contributed the power to create overall success at work.', 'event-tângia', 124, 310),
(56, 'Products include: Single ', '25-11-2022', '\"Is there a more romantic scene than a late afternoon', 'Valentine-20-10', 110, 275),
(57, 'Blue ping pong : 3 Golden', '8-5-2022', '\"The rush of life sometimes makes us feel tired and bored. Why don\'t you try to wake up early - open the door and take a deep breath. Feel the fresh morning air', '20-11-event', 185, 463),
(58, 'Products include: Pink sa', '4-10-2022', '\"Red roses combined with lotus roses', 'sinh nhật- Tâ ngia-event-', 128, 320),
(59, 'Products include: White P', '24-4-2022', '\"Modern life makes many people get caught up in the whirlpool of work', 'Kỉ niệm-20-10-Valentine', 153, 383),
(60, 'Products include: Plain r', '15-6-2022', '\"Luxury purple phalaenopsis orchid pots', 'Tết-Sinh nhật', 110, 275),
(61, 'house space. Products inc', '9-5-2022', '\"Spring Prosperity consists of 5 branches of white phalaenopsis orchids decorated in high-grade porcelain pots are warm wishes at the beginning of the year for friends', 'Tết', 117, 293),
(62, '', '8-4-2022', '\"Hoa lan hồ điệp được biết đến là một loại hoa đẹp mang nhiều ý nghĩa tốt lành thích hợp dùng để chưng trong ngày tết', '', 58, 145),
(63, 'Products include: Plain r', '11-9-2021', '\"White Phalaenopsis orchid is always a luxurious gift for each other in the coming New Year and spring. The meaning of white Phalaenopsis orchid is for a good start', 'Tết', 109, 273),
(64, 'and elegance of the house', '10-4-2021', '\"ew Year\'s greeting includes 10 phalaenopsis orchids decorated in high-class white porcelain pots with Tet style as a warm New Year\'s greeting for friends', 'Tết', 128, 320),
(65, 'holidays. Products includ', '6-3-2022', '\"In feng shui', 'Event-Tân gia-Sinh nhật', 79, 198),
(66, 'Products include: Yellow ', '15-1-2022', '\"Designed with gentle tones of yellow roses and white auspicious', 'Evwnt-Tân gia', 99, 248),
(67, '30cm', '27-7-2022', '\" Poodles are made of high quality cotton.  Size 30 cm.  Available in 3 colors: white', 'Children\'s Day-sinh nhật-', 185, 463),
(68, '40cm', '16-10-2022', '\"The multicolored teddy bear measures 40 cm.  Available in 4 colors: white', 'Children\'s Day-sinh nhật-', 132, 330),
(69, '70cm', '20-3-2021', '\" Gray plush rabbit is made of high quality cotton', 'Children\'s Day-sinh nhật-', 170, 425),
(70, '\"60', '80', '10-10-2022', '100cm\"', 116, 290),
(71, '35cm', '15-11-2021', '\"Round cotton cat is made of smooth cotton material', 'Children\'s Day-sinh nhật-', 126, 315),
(72, '40x50cm', '3-7-2022', '\" Cotton elephants are made from high quality cotton.  There are many colors to choose from.  Size 40 x 50 cm.  Perfect as a gift for your girlfriend or children.\"', 'Children\'s Day-sinh nhật-', 145, 363),
(73, '\"40', '50cm\"', 'Children\'s Day-sinh nhật-kỉ niệm-lưu niệm', '24-11-2021', 63, 158),
(74, '\"20', '60', '24-12-2021', '80cm\"', 86, 215),
(75, '\"45', '60', '19-12-2022', '90cm\"', 123, 308),
(76, '65cm', '1-10-2021', '\"Husky plush dog has a length of 65 cm  This dog has 2 colors white and gray.  The product is very suitable as a gift for girlfriends on March 8 or birthday gifts', 'Children\'s Day-sinh nhật-', 175, 438),
(77, '750ml', '8-11-2022', '\"Penfolds Magill Estate Shiraz Red Wine - made from Shiraz grapes (the soul grape variety of Australian wine) from Magill vineyards on the eastern outskirts of the Adelaide Hills', 'Quà Tết- Tân gia -Birthda', 63, 158),
(78, '700ml', '12-9-2022', '\"Penfolds Bin 144 Yattarna Chardonnay Premium White Wine - Chardonnay grapes are harvested from vineyards in Tasmania', 'Quà Tết- Tân gia -Birthda', 104, 260),
(79, '750ml', '17-9-2022', '\"Penfolds St Henri Shiraz Red Wine - a wine that celebrates the heritage of the Shiraz grape. Shiraz is harvested from Barossa Valley', 'Quà Tết- Tân gia -Birthda', 155, 388),
(80, '700ml', '12-10-2022', '\"The Godfather Cabernet Sauvignon Italian red wine - The Godfather', 'Quà Tết- Tân gia -Birthda', 128, 320),
(81, '750ml', '16-2-2022', '\"This 50 Anniversario is to celebrate the 50th anniversary of the prestigious Cantine Sanmarzano distillery with a limited edition of only 7', 'Quà Tết- Tân gia -Birthda', 168, 420),
(82, '700ml', '9-5-2021', '\"Mentioning 60 Sessantanni is referring to the difference in aroma and taste. No need to enjoy', 'Quà Tết- Tân gia -Birthda', 169, 423),
(83, '750ml', '19-8-2021', '\"This bottle of wine is a typical product of the Italian wine brand Cantine San Marzano. They were born as bringing a very personal style so that anyone who looks at the bottle will become impressed from the very first moment. It\'s a beautiful deep purple ruby ​​red color that attracts the eye. In addition', 'Quà Tết- Tân gia -Birthda', 106, 265),
(84, '750ml', '25-4-2022', '\"F NegroAmaro - Italian red', 'Quà Tết- Tân gia -Birthda', 120, 300),
(85, '1000ml', '15-3-2022', '\"Absolut Elyx Vodka', 'Quà Tết- Tân gia -Birthda', 162, 405),
(86, '750ml', '11-9-2022', '\"Vodka Beluga Gold Line (also known as Vodka Beluga hammer', 'Quà Tết- Tân gia -Birthda', 129, 323),
(87, '1750ml', '4-11-2021', '\" Belvedere Vodka 1.75L is a vodka originating from Poland. Produced using a unique handcrafted technology from 100% Dankowskie barley and distilled 4 times to ensure outstanding quality', 'Quà Tết- Tân gia -Birthda', 95, 238),
(88, '700ml', '19-4-2022', '\"Snow Leopard vodka is made in Poland by Polmos Lublin', 'Quà Tết- Tân gia -Birthda', 73, 183),
(89, '750 ml', '28-6-2021', '\"If we have to mention high-class French white wines', 'Quà Tết- Tân gia -Birthda', 55, 138),
(90, '750ml', '11-11-2021', '\"Louis Roederer is a quite famous wine brand of the French region in general. The birth of the producer has made a significant contribution to the history of the development of the country\'s winemaking industry. Because all the wines born here are very special and diverse', 'Quà Tết- Tân gia -Birthda', 168, 420),
(91, '750ml', '28-8-2021', '\"Perrier Jouet Grand brut Champagne', 'Quà Tết- Tân gia -Birthda', 111, 278),
(92, '750ml', '7-8-2021', '\"France is not inferior to any other country on the market today in terms of wine production in general. And this bottle of white wine is a typical product from the beautiful country of France.  Users will feel impressed about this wine bottle from the first meeting by a beautiful appearance right from the outside of the wine bottle. It\'s a soft', 'Quà Tết- Tân gia -Birthda', 183, 458);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `productname` text DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `productname`, `brand`, `price`, `quantity`, `rating`) VALUES
(1, 'Gyroscope solar system', 1, 300, 200, 5),
(2, 'Wooden game spinning lollipop', 2, 150, 200, 5),
(3, 'Marvel superhero model', 2, 350, 200, 4.3),
(4, 'Pet box', 1, 400, 200, 4.5),
(5, 'Maze Ball Game', 4, 250, 200, 4.1),
(6, 'Mini bowling game', 1, 300, 200, 3.5),
(7, 'Love Jenga . wooden puzzle game', 4, 150, 200, 3.7),
(8, 'Rubik 3x3', 2, 70, 200, 4.1),
(9, 'Shrimp Shrimp Chicken', 3, 100, 200, 3.9),
(10, 'Plasma Ball', 1, 200, 200, 4.9),
(11, 'Classic alarm clock', 4, 25, 200, 4.7),
(12, 'Led light alarm clock', 1, 30, 200, 4.6),
(13, 'Big ben tower clock model', 3, 35, 200, 4.5),
(14, 'Digital flip clock', 1, 50, 200, 5),
(15, 'Bicycle watch with 2 faces', 4, 35, 200, 4.6),
(16, 'DIY Clock 360 . Wall Clock', 1, 25, 200, 4.2),
(17, 'Wooden Led Clock', 4, 40, 200, 4.1),
(18, 'Galactic crystal ball', 4, 200, 9, 4),
(19, 'Statue of old grandparents looking at albums', 2, 300, 8, 4),
(20, 'Crystal dandelion', 1, 200, 5, 4),
(21, 'Statue of a silent man', 4, 200, 3, 4),
(22, 'Horse head statue ', 2, 200, 6, 3),
(23, 'Solar system crystal ball', 4, 200, 9, 3),
(24, 'World famous architectural model', 4, 24, 200, 3.2),
(25, '3D Sand Painting', 1, 25, 200, 4.1),
(26, 'Model of a sailboat in a glass bottle', 3, 26, 200, 4),
(27, 'Feng Shui arowana fish', 1, 27, 200, 5),
(28, 'YSL Tatouage Couture Velvet Cream', 7, 28, 200, 3.3),
(29, 'YSL Rouge Pur Couture The Slim', 7, 29, 200, 3.8),
(30, ' Tom Ford', 8, 30, 200, 3.4),
(31, 'Dior Rouge', 6, 31, 200, 3.4),
(32, 'Dior Addict Stellar Lip Gloss', 6, 32, 200, 4.6),
(33, 'Yves Saint Laurent Libre', 7, 33, 200, 5),
(34, 'Unisex Tom Ford Lost Cherry', 8, 34, 200, 4.5),
(35, 'Tom Ford Santal Blush', 8, 35, 200, 3.4),
(36, ' Dior Miss Dior Blooming Bouquet', 6, 36, 200, 3.5),
(37, 'Small lucky photo frame', 5, 37, 200, 4.3),
(38, 'Vintage photo frames', 5, 38, 200, 3.9),
(39, 'Wooden photo frame 2 layers', 5, 39, 200, 3.5),
(40, 'Bicycle wooden photo frame', 1, 40, 200, 3.7),
(41, 'Set of 7 wall paintings', 5, 200, 3, 1),
(42, 'Iron paintings wall art SENCOM', 1, 42, 200, 4.1),
(43, 'Cute rabbit fur scarf for baby ', 4, 43, 200, 3.9),
(44, 'Square silk scarf', 4, 44, 200, 4.9),
(45, 'Korean style scarf', 3, 45, 200, 3.6),
(46, 'Soft Men\'s Scarves', 3, 46, 200, 4.3),
(47, 'Classic Gentlemen\'s Gray Knitted Towels', 3, 47, 200, 4.7),
(48, 'Valazo Scarves For Men', 4, 48, 200, 5),
(49, 'Christmas pattern scarf ', 4, 49, 200, 3.5),
(50, 'Cashmere Winter Scarves For Women', 3, 50, 200, 3.5),
(51, 'Scarf Protects Ears In Winter Against Cold', 3, 51, 200, 4.8),
(52, 'Bandanas', 4, 52, 200, 4.2),
(53, 'New flower pattern - My side ', 2, 53, 200, 4.1),
(54, 'New flower pattern - Spring butterfly wings ', 2, 54, 200, 3.7),
(55, 'New flower model - Event flowers ', 2, 55, 200, 3.8),
(56, 'New flower pattern - Sweet sunset ', 2, 56, 200, 3.4),
(57, 'Sunshine ', 2, 57, 200, 3),
(58, 'Best Wishes for Success', 2, 58, 200, 3.3),
(59, 'Beats of Love ', 2, 59, 200, 4.7),
(60, 'Security & good health and prosperity', 2, 60, 200, 4.1),
(61, 'Happy New Year', 2, 61, 200, 4.1),
(62, 'Love Spring', 2, 62, 200, 4.2),
(63, 'A myriad things go according', 2, 63, 200, 3.5),
(64, 'Happiness in the year to come.', 2, 64, 200, 4.4),
(65, 'Congratulation flowers - Good start ', 2, 65, 200, 5),
(66, 'Congratulations Flowers - Reach Out', 2, 66, 200, 3.9),
(67, 'Poodle stuffed dog', 3, 67, 200, 4.6),
(68, 'Colorful teddy bear', 1, 68, 200, 3),
(69, 'Gray bunny', 2, 69, 200, 3.7),
(70, 'Lavender purple teddy bear', 1, 70, 200, 3.3),
(71, 'Round fluffy cat', 2, 71, 200, 4.5),
(72, 'Cotton elephant', 3, 72, 200, 3.6),
(73, 'Cotton dog with a bag', 5, 73, 200, 5),
(74, 'Yellow fluffy cat', 1, 74, 200, 3.5),
(75, 'White teddy bear with bow', 3, 75, 200, 3.3),
(76, 'Husky plush dog ', 2, 76, 200, 3.5),
(77, 'Penfolds Magill Estate Shiraz', 9, 77, 200, 4.4),
(78, 'Penfolds Bin 144 Yattarna Chardonnay', 9, 78, 200, 4),
(79, 'Penfolds St Henri Shiraz ', 9, 79, 200, 3.1),
(80, 'The God Father', 10, 80, 200, 4.3),
(81, 'San Marzano 50 Anniversario', 10, 81, 200, 3.7),
(82, '60 Sessantanni Limited Edition', 10, 82, 200, 3.8),
(83, 'Collezione Cinquanta', 10, 83, 200, 4.8),
(84, 'F NegroAmaro', 10, 84, 200, 5),
(85, 'Vodka Absolut Elyx', 11, 85, 200, 4.2),
(86, 'Vodka Beluga Gold Line', 12, 86, 200, 3.3),
(87, 'Vodka Belvedere 1.75L', 13, 87, 200, 4.5),
(88, 'Vodka Snow Leopard', 14, 88, 200, 3.6),
(89, 'Champagne Nicolas Feuillatte Palmes d\'Or', 15, 89, 200, 3.9),
(90, 'Champagne Louis Roederer Brut Rose', 16, 90, 200, 3.6),
(91, 'Champagne Perrier Jouet Grand brut ', 17, 91, 200, 4.1),
(92, 'Champagne Armand De Brignac Blanc', 18, 92, 200, 4.2);

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
(1, 'giang', 'giang', 'Nguyễn Hương', 'Giang', '3671 Mahlon Street  City, State, Zip: Jersey City, New Jersey(NJ)', 'giang.nguyenhuong2@gmail.com', '732-962-6341', 'http://localhost/img/giftshop/user/default.png', '8/17/2003'),
(2, 'nam', 'nam', 'Phạm Thành', 'Nam', '1217 Devils Hill Road  City, State, Zip: Picayune, Mississippi(MS)', 'nam.phamthanh51@gmail.com', '601-798-8421', 'http://localhost/img/giftshop/user/default.png', '4/3/1987'),
(3, 'thanh', 'thanh', 'Nguyễn Tuấn', 'Thành', '3408 Hill Street  City, State, Zip: Toledo, Ohio(OH)', 'thanh.nguyentuan93@gmail.com', '419-729-8410', 'http://localhost/img/giftshop/user/default.png', '6/19/1980'),
(4, 'minh', 'minh', 'Vũ Hoàng', 'Minh', '4061 Layman Avenue  City, State, Zip: Fayetteville, North Carolina(NC)', 'minh.hihi@gmail.com', '910-829-7316', 'http://localhost/img/giftshop/user/default.png', '7/5/1993');

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
-- Chỉ mục cho bảng `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid` (`productid`);

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
-- Chỉ mục cho bảng `productdetails`
--
ALTER TABLE `productdetails`
  ADD PRIMARY KEY (`productid`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `img`
--
ALTER TABLE `img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- Các ràng buộc cho bảng `img`
--
ALTER TABLE `img`
  ADD CONSTRAINT `img_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`id`);

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
-- Các ràng buộc cho bảng `productdetails`
--
ALTER TABLE `productdetails`
  ADD CONSTRAINT `productdetails_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`id`);

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
