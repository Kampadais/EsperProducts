-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 15, 2022 at 05:49 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `ad_multimedia`
--

CREATE TABLE `ad_multimedia` (
  `id` int(10) UNSIGNED NOT NULL,
  `location` varchar(300) NOT NULL,
  `adOfferId` int(10) UNSIGNED NOT NULL,
  `multimediaTypeId` int(10) UNSIGNED NOT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_multimedia`
--

INSERT INTO `ad_multimedia` (`id`, `location`, `adOfferId`, `multimediaTypeId`, `deletedDate`) VALUES
(1, 'C:/Users/user/Campaigns/Multimedia1', 1, 2, NULL),
(2, 'C:/Users/user/Campaigns/Multimedia2', 1, 3, NULL),
(3, 'C:/Users/user/Campaigns/Multimedia3', 1, 3, NULL),
(4, 'C:/Users/user/Campaigns/Multimedia', 5, 2, NULL),
(5, 'C:/Users/user/Campaigns/Multimedia55', 5, 5, NULL),
(6, 'C:/Users/user/Campaigns/Multimedia', 3, 2, NULL),
(7, 'C:/Users/user/Campaigns/Multimedia12', 3, 3, NULL),
(8, 'C:/Users/user/Campaigns/Multimedia13', 3, 3, NULL),
(9, 'C:/Users/user/Campaigns/Multimedia', 4, 1, NULL),
(10, 'C:/Users/user/Campaigns/Multimedia6', 4, 4, NULL),
(11, 'C:/Users/user/Campaigns/Multimedia6', 2, 2, NULL),
(12, 'C:/Users/user/Campaigns/Multimedia7', 2, 7, NULL),
(13, 'C:/Users/user/Campaigns/Multimedia1', 2, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ad_offers`
--

CREATE TABLE `ad_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `clientId` int(10) UNSIGNED DEFAULT NULL,
  `productCategoryId` int(10) UNSIGNED DEFAULT NULL,
  `brandId` int(10) UNSIGNED DEFAULT NULL,
  `clientLoyaltyStatusId` int(10) UNSIGNED DEFAULT NULL,
  `productId` int(10) UNSIGNED DEFAULT NULL,
  `ageGroupId` int(10) UNSIGNED DEFAULT NULL,
  `genderId` int(10) UNSIGNED DEFAULT NULL,
  `minDiscount` float NOT NULL,
  `maxDiscount` float NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 0,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `createdDate` datetime NOT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_offers`
--

INSERT INTO `ad_offers` (`id`, `code`, `description`, `clientId`, `productCategoryId`, `brandId`, `clientLoyaltyStatusId`, `productId`, `ageGroupId`, `genderId`, `minDiscount`, `maxDiscount`, `isActive`, `startDate`, `endDate`, `createdDate`, `deletedDate`) VALUES
(1, 'CP-3-3-10', 'Cellphones discount', NULL, 21, NULL, NULL, NULL, 3, 2, 5, 10, 1, '2022-06-17 10:00:00', '2022-09-18 10:00:00', '2021-01-07 10:00:00', NULL),
(2, 'LP-3-1-25', 'up your game with a nnew laptop', NULL, 22, NULL, 1, NULL, 3, 1, 5, 25, 1, '2022-06-17 10:00:00', '2022-07-10 08:30:00', '2021-05-17 10:00:00', NULL),
(3, 'DLL-5', 'everyone should use this', NULL, 16, NULL, NULL, NULL, 3, 1, 10.3, 20, 0, '2022-05-01 08:30:00', '2022-08-10 08:30:00', '2021-03-14 10:00:00', NULL),
(4, 'SAVE15', 'ee', NULL, 16, NULL, 3, NULL, 3, 2, 2, 13, 1, '2021-08-11 07:30:00', '2021-09-02 12:00:00', '2021-06-09 10:00:00', NULL),
(5, 'Summer11', 'get ready for summer', NULL, NULL, NULL, NULL, 51, 3, 1, 12.7, 15, 1, '2021-08-12 08:30:00', '2021-10-13 10:00:00', '2021-02-27 10:00:00', NULL),
(6, 'ttt', NULL, NULL, NULL, NULL, NULL, 56, 3, 2, 20, 30, 1, '2021-08-11 17:00:00', '2021-08-14 15:00:00', '2021-06-13 10:00:00', NULL),
(7, 'qqqq', NULL, NULL, NULL, NULL, NULL, 56, 3, 1, 6, 15, 1, '2021-08-13 09:00:00', '2021-08-15 12:00:00', '2021-04-21 10:00:00', NULL),
(15, 'MS-101', NULL, NULL, NULL, 5, NULL, NULL, 3, NULL, 3.5, 15, 1, '2021-04-11 11:16:00', '2021-10-07 15:30:00', '2021-07-30 10:00:00', NULL),
(18, 'TR-500', 'save a fortune with this code', 23, NULL, NULL, NULL, 33, NULL, NULL, 10.5, 10.5, 0, '2021-08-13 00:00:00', '2021-08-14 00:00:00', '2021-08-05 10:00:00', NULL),
(24, 'RFF16', 'do you want to save money? use this code!', NULL, NULL, 4, 1, NULL, NULL, 1, 2, 4, 1, '2021-03-05 09:00:00', '2021-05-25 23:00:00', '2021-09-09 12:00:00', NULL),
(25, 'FOO20', 'hello world', NULL, 19, 7, 3, NULL, 4, NULL, 20, 25, 1, '2020-02-28 01:00:00', '2020-12-25 10:00:00', '2020-02-27 09:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ad_offers_history`
--

CREATE TABLE `ad_offers_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `adOfferId` int(10) UNSIGNED NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `finalDiscount` float NOT NULL,
  `sentDate` datetime NOT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_offers_history`
--

INSERT INTO `ad_offers_history` (`id`, `adOfferId`, `clientId`, `finalDiscount`, `sentDate`, `deletedDate`) VALUES
(1, 4, 8, 11.5, '2021-08-18 15:00:00', NULL),
(2, 4, 23, 8.3, '2021-08-20 10:00:00', NULL),
(3, 4, 31, 5, '2021-08-17 20:00:00', NULL),
(4, 5, 23, 15, '2021-08-13 15:00:00', NULL),
(5, 4, 36, 12, '2021-09-01 15:00:00', NULL),
(6, 5, 11, 14, '2021-09-27 18:00:00', NULL),
(9, 15, 7, 7, '2021-09-05 15:00:00', NULL),
(10, 15, 9, 16, '2021-06-18 10:00:00', NULL),
(11, 15, 7, 13, '2021-07-05 18:00:00', NULL),
(12, 24, 16, 2, '2021-04-10 06:00:00', NULL),
(13, 24, 19, 3.5, '2021-03-07 14:00:00', NULL),
(14, 25, 5, 25, '2020-05-13 10:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `age_groups`
--

CREATE TABLE `age_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `minAge` int(10) UNSIGNED DEFAULT NULL,
  `maxAge` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `age_groups`
--

INSERT INTO `age_groups` (`id`, `name`, `minAge`, `maxAge`) VALUES
(2, 'Young Adults', 18, 35),
(3, 'Middle Aged', 36, 60),
(4, 'Elderly', 61, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_users`
--

CREATE TABLE `auth_users` (
  `Id` int(10) UNSIGNED NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext DEFAULT NULL,
  `SecurityStamp` longtext DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `deletedDate` datetime DEFAULT NULL,
  `latestCredentialsUpdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_users`
--

INSERT INTO `auth_users` (`Id`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`, `deletedDate`, `latestCredentialsUpdate`) VALUES
(1, 'public', 'PUBLIC', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEGv6BgbKa5IYMavydbEmVdKvdhoYuOFCzb/GcKGTozpjfxzGAad7oR825Ju1gNv0ow==', 'ZFZAS2DZ3EFV5CYMSLCEBOGQQEWQTZEE', '34430670-802c-43fe-a2fb-a7ead0154ebb', NULL, 0, 0, NULL, 1, 0, NULL, '2021-10-06 09:46:40'),
(5, 'stavelas@gmail.com', 'STAVELAS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEA0E6M3HM5WdRHSS7YJwa95tAj/aVD0ajutaeVCz2/VJgZOiyuh4dsr7YQZanD9JkQ==', 'U4CEGK5YJQVYJ5CXJO4AB67TCPSWTHWW', 'e3867ffe-2224-4e53-b1d9-88f27222016d', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(7, 'ziwgou@gmail.com', 'ZIWGOU@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEAH4RY9Z5M+29V8rseBSPaLYiaHPAtE2b2fubYe8SpNLRS76qjVHil/W3UFh4uD8Tg==', 'ASMGXGQOSQQMQMMHZM5IWKA7OET54FJV', 'f6b689ea-e118-4374-a894-6139f3021056', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(8, 'gewrgiou@gmail.com', 'GEWRGIOU@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEA6x5jv+DFGKpdUQ5sf7Fi66cKpclqDiOPHYqYR2Mqf+XbjEsTVJHhTTXOcLDzO1gw==', 'LDGKCVM5T6DRYJHWY6RGIHS5UBWYTU2O', 'e0df25a7-0c45-4b47-b10a-03ca8204f6b4', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(9, 'iasonas@gmail.com', 'IASONAS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEJAPk2WXrKpLLyo093E1ljYFza8LfH9rc/xAEWy5gqC3MKuob5c4jJ6ivnEKMRXGzQ==', '6HSBBRAGSXCVROAVMMDCXFKSUISMA4VP', '166e96e1-ecf2-4e8e-88b1-26cb4f468850', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(10, 'mosxos@gmail.com', 'MOSXOS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEBtS+rqNOBxRa7GiY86pjbz8zmAtQzYSh77by8sdifqCAPoib4Y0oh1jL9Dux5m8xw==', 'OTPYMLMRLTWAQN2YWQ3OEXW4SYELDUZ5', '73db33e4-94fa-41b2-ad5f-3aa7149295e1', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(11, 'papanikolaou@gmail.com', 'PAPANIKOLAOU@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEKK0H89USkqF31O/GCo96VFBEJX5EG651NgiRhNw2/7oHlMMhphzXdewEx0MNEa/Cg==', 'DR5A3BEZGW5BBJCLKYZOQNSSBXELJXZX', '3b666bd1-86d3-4d4e-bc8f-ca1045e3b998', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(12, 'kalogerakis@gmail.com', 'KALOGERAKIS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEJRbMG/7QvvcabvIXn3Wy4MWOLdlQ5BjJa6ihFTPkRhITvWCtyV6tUhUkbsNW3WHdQ==', '2D4XPKTVRQ6K4QZGYIVFAUIN4OCLOEEM', '2799b0dd-18e7-4d5c-be8c-855e55c4c646', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(13, 'katzas@gmail.com', 'KATZAS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEJH8z1uhy+jO4PRH/uhEGOutGJ7cxi4aOfg0zXm7hwQ8PIB0VEMg5DhSDwoVf09iRQ==', 'KHMT66CFBH2WYJQVJGKDRSRT2TPJHJJP', 'ad53fe1e-f171-4967-8806-3a05e48ccec3', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(14, 'papagrigoriou@gmail.com', 'PAPAGRIGORIOU@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEBMnV1RyA0TDSklnSem8iBGyQRoLN7qYqfVRiAI00wOgBnNHq3DT5ejNyGsW/waTkw==', 'VUVU7XPFX66656TPNYO3SJTYPLVGLKZT', 'dde795f3-61fc-41ab-a6c8-897049efe131', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(15, 'lwlis@gmail.com', 'LWLIS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEHRhUR3J5lFBT3AiFWUiPOskVrIabLKIEQ73P4ZRM6TyI2CS4ZkgKuuzRXFilS0rdA==', '7HE5BFIUWMXMLP3ZNCRK6U4U2IIPNJ3D', 'e1199a30-ba79-42cb-af45-99e355bfa2ce', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(16, 'kitsios@gmail.com', 'KITSIOS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEL8nIqGmPI+JQVmic8Cn4poOm59d9po7cjCHkvX6rg3QRbYpcHuExBJvgFrZtciZpQ==', 'XSE2ACZSOWAVR57OXDNMOWDG7MM4BIOL', '2cc31ed9-6913-4db8-8707-fe7beffe4c6a', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(17, 'kapsalis@gmail.com', 'KAPSALIS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEJ1B0zQCLUtK/T9d1xOzSb5SkQviorPtjU3P1rX8440l9iiJRjgrtJS6P3ZZ8M16fQ==', 'OMDDAXRRQNTUTBW5SK2RVGQAFMRVPOVO', 'ca181de0-a312-41d5-b254-51e6e9bf1c2e', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(18, 'spirou@gmail.com', 'SPIROU@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEMHXpOi5t6fQ8zCOFVvBKNLf+i49nQhK+UKfi8yWyAsCYPPhALKSw9nVKz7n/o4Lxg==', 'B57HOJDAVVY2L6SJRSOQXHCLBSPHPC2L', 'ea18be9c-c945-4935-a050-34444d8ab1f0', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(19, 'sdoukos@gmail.com', 'SDOUKOS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEJJtt40m7igAl3+3N0QQ1GlFhBUuQZ6+LkH9sHdYrDlOvfrvJNL4UA1PzjfqtBnOng==', '6IQDCWB4JGDZIO6LFC5AHPOMDPHHW4YG', '9fa0b8df-9e64-4924-8e0b-e56cf4a8e4a7', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(20, 'prionidis@gmail.com', 'PRIONIDIS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEFtY/rSoZTVw8pNjJdbVCIryxyMNn1epmW1upL4B/Znl4zsI4GmlG6ASWKdWd0D/yQ==', 'LMOFNTAMXIUM6LCIZQDAQOAIW2KHXXTE', '15c6456c-228c-4f02-945d-2245c33f73a1', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(21, 'dhmos@gmail.com', 'DHMOS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEPjO127T/QdblPwXTkBxrw4jwfssl/ncqgx8ha+Al1TZT7YQU3xYQvYZC3bcfkBMbg==', 'F2TVEQV72QCPYEXQ2UNDAJ7BLVN5XHDL', 'c2dffab8-a84c-42cb-b7e4-9d87ec4f2699', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(23, 'kaminari@gmail.com', 'KAMINARI@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAENPmNcYWEvhqgRHp/m6f1DAL2qDj79h2P/UgwDeiN7dq253QsxZ/C41RHQiRjJr8sA==', 'Y33EPFPSW3YDGHSEG66XFG4KEGO2JPDF', '36644e73-aa85-490b-b010-4a5278eeeb98', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(24, 'tassou@gmail.com', 'TASSOU@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEDDW+b0tQeQRiygvDlhW7APw1CZG3G2fKixTw+Gvkb88sn5eyaMqnJTSHb/kJRdm+g==', 'GKUCZYGUIK2G53G4FBQXHHNTV4AMMH4H', 'c1a323e5-daa9-4e85-bea6-cffbceefd50d', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(25, 'dekola@gmail.com', 'DEKOLA@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEGd0z3HlYx7Yv+AQD5ijkeCw7vORxTxI+EqKRd8xTQhbaS4H8JOTPseKCBqHp5VWJg==', 'JOE6VBIHRLJVARX2AJS7I3C5II6LNMFZ', '45eae091-1575-4daa-aecf-4f22b1fd2624', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(26, 'motsios@gmail.com', 'MOTSIOS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAELoLDHFZXAXzWt/nwHbGlizU7/zB+9fbC4U7vsoFs5QyEz6hJ9uGdJ+YLlSIn/OsBg==', 'DGVUZHE6OLKGERZJXKYBZMG67TMOEBZ3', 'eda067b7-9369-4a29-88cd-635ba70816c3', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(27, 'petros@gmail.com', 'PETROS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEPZEhUXUQXZ1E5RjR2wUCpGINDa9S+y8IAj3BgHK3yoXiD864hU4teOtjpZtgH58kQ==', 'GRMPPJ4NFWCY2PKMO3LV3PIUKPGDK56O', 'bb2b8210-8d5a-42ad-92b2-44619a0145d8', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(29, 'tnikoleta@gmail.com', 'TNIKOLETA@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAELs17hk00QGF0Kn7BrHdgUqFE/9oh6B8q2QzgO/ELzpNeW2XQnr7tKBjBuK5IMVDbw==', 'MD2GGHBASPYGUHALGHBJ6UOF2CZPDBHO', 'acb700d6-f185-49ba-9baa-9787af864a3f', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(30, 'kpantoflidou@gmail.com', 'KPANTOFLIDOU@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEHkOk85D4RkyOaptB7b6FjIbixRMSba32G8CNJ22K0bFrOdTt/anFt6IxHm6YOpG+g==', 'DK4SJUBEST7NGZSQHWZIOFR2TXP6QSDP', '4d8365ba-f8c7-437d-8687-a6a404cd4178', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(31, 'vafeiadou@gmail.com', 'VAFEIADOU@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAENXy5F5Brd5Qmzx1bmRpoqQjc0cTxuCizf3W1ItjWn6g2CYbS8zoK4O0wKSAg7kBOg==', 'WPZ2OMQCPYULWH4ONMQIPBAY2MABTQDQ', 'f3174c31-50a9-4d69-96db-56fe78b16724', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(32, 'dhmopoulou@gmail.com', 'DHMOPOULOU@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEJyik291ab1PlaPoR6a0hTxP4RdUowJxBOYT4bOH8gqeulg74bjsfLZoQbaYh5HErw==', 'Z6JE3ORBWMLFHKRJF26OZHVKWL2EIZU2', 'd187171d-7770-4a56-9eb4-26d94c1a271e', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(36, 'paulou@gmail.com', 'PAULOU@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAELItBOAxXFLgxT9Q5tiC6B3GMMHia3Nv3K8Hed55WpPElIbmI8HZHZDfK2tOMSMj0g==', 'HNRDWCW2FQ2OVBBXDAED6NG5ZQRVUKJF', 'e3fc4462-5c60-4cbe-8068-93dfdbb1e123', NULL, 0, 0, NULL, 1, 0, NULL, '2021-10-19 11:44:38'),
(37, 'mpekiaris@gmail.com', 'MPEKIARIS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEL7WDMYRvmRxbxKQ6KQ5buDrQIsh7anGCKyubFiPlPKxp9vKiAHHr1e8+x/CD9xoqw==', 'XXRN5YYGQ7V5447ESBDJS3OSPTFFNUWY', 'd39d5ae0-ff4d-4c1c-b5c1-31a26f49276b', NULL, 0, 0, NULL, 1, 0, NULL, '2021-10-06 09:47:44'),
(38, 'sakkas@gmail.com', 'SAKKAS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEIDvn9PkH1GAk7MhwN6UFIhZKT8UCn/+CcvDQOTbY5Lhc0RCIVI/rhU3upuQXY0mfQ==', 'RQHXLZPR76ZVL3CACNEZSMHFSFC3SYK3', '278bdeab-2864-491d-b33b-a1d79959f7bd', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(44, 'ddimitris@gmail.com', 'DDIMITRIS@GMAIL.COM', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEIyaEt7dW2BRxmiSrdQNJGrGJ1CNlOmtb7j7CbKS7e5CztAL35bJwA2IDqbPVS9GsQ==', 'B5WS27HLEJH4UAMGINT7TLIRHL6T7OIE', '901f7f3c-994d-47a9-9ad1-b460a3392faa', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(45, 'cms_admin', 'CMS_ADMIN', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEG0hDmwseufR/MiKXKj2t0KMsDmRHKTF1ZgMGbgCMfkJy7J3CJFbySQMWhFPtB00ow==', '4KQD4IXXEIO5PFWADQ5TVWTUFOOHDKIV', 'c3cafb74-6601-4c82-8f08-ad3f754c2898', '9999999345', 0, 0, NULL, 1, 0, NULL, '2021-10-06 09:42:58'),
(65, 'client1', 'CLIENT1', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEOIByU3QrIXhm7y/+3amuu95HtuQCGQ2S2DtcqyzSggZclJZcSpM4vG0bzat79GNnw==', 'MIDJ622ZXF5XTVN5UTIREXMV7LXYN3DK', 'bfd5ad90-1773-412a-8dd8-36a3269f19d4', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(109, 'client2TEST33', 'CLIENT2TEST33', 'tkkkk@ffff.gr', 'TKKKK@FFFF.GR', 0, 'AQAAAAEAACcQAAAAEGl5WQF23s6UbBdhfAmi4wtt11bZ1jTe7caSz4KCtvMWDVqhUOofiCO3WvDM3mmJAQ==', 'VAPUV7FLOASUKONTPCIRZLN3U3MGUP24', '6163c22b-3dee-40c0-b1b9-5f4bf6d0abcb', NULL, 0, 0, NULL, 1, 0, NULL, '2021-06-24 10:31:58'),
(135, 'client23', 'CLIENT23', 'lel2@test.com', 'LEL2@TEST.COM', 0, 'AQAAAAEAACcQAAAAEBG+DVvGPW5I6fJmJD2v1CzqLKAPnUxO9VZmPRm8OyIzPqeAeUM2oa5j2VU7badf0w==', 'GVIDQREZGB3QQIVQDDZSPUEMR4HLGI6D', '0bcff284-3bd9-4f63-9be7-2a86f89a92ee', '3456789440', 0, 0, NULL, 1, 0, NULL, NULL),
(136, 'cms_test', 'CMS_TEST', 'asdasd@mmmail.aa', 'ASDASD@MMMAIL.AA', 0, 'AQAAAAEAACcQAAAAEO2ezI5h9Trvq13ax+1vHdFeCXKexs7hJS0ImnJmzrsMCF/965iIyWNpuf0HtSbbsA==', 'D33K7DWA7YDLSDOXXHLYWKFGKX2N3DE3', 'f5cbe839-149e-495f-901a-227c807e7116', NULL, 0, 0, NULL, 1, 0, NULL, '2021-10-06 09:44:40'),
(156, 'string', 'STRING', NULL, NULL, 0, 'AQAAAAEAACcQAAAAEENoOqtMP2M7eJybrRLW1g2emT24W47a5w7930wDxnIW52x2hQbksR3uS4Ma+Z0+Vg==', '4ON4DLCGMI4UCNH5WEE3GSFD4I2WDLTK', 'fa25ce9e-f24b-4f2d-a9b7-e4ea58c2b463', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(162, 'client232211', 'CLIENT232211', 'lel211@test.com', 'LEL211@TEST.COM', 0, 'AQAAAAEAACcQAAAAEDMwVUgLduUWpjkTuOL6Igw4N7adQF6BGdiZc7ksJpJAVHZfozpTBxh6Vuzf6VK0CA==', '3NA7ROAV4GKPNWB7GBADYMRW7WGJUSYD', '1457539d-0b5f-4cb9-97dc-2e8e48f46edf', '9999999346', 0, 0, NULL, 1, 0, NULL, NULL),
(168, 'dimivalek', 'DIMIVALEK', 'dvalekardas@terracom.gr', 'DVALEKARDAS@TERRACOM.GR', 0, 'AQAAAAEAACcQAAAAEAMvGJVcWMbdKh42+rxtMBKIVIO76HHFVy05WziYOPeUBOdnwD/4Eg0fDTJf5JFjbw==', 'KFTYG7AVOFCXD3EILCVI5JUIZQRE6YYW', 'e1203ab5-834d-4887-8590-39318223308d', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(169, 'dvalekardas', 'DVALEKARDAS', 'dvalekardas@gmail.com', 'DVALEKARDAS@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEDMOoqcgPVl/NQAiYWxAn0Hrwp6rUO56/WqjJXJIUfoZHP/uCKKG9ANGLVV8ALw8GQ==', 'WIXOEKF5HMJRCJGB5MRYHVHM26YD4AV2', '2bc639a9-40a9-4d95-a4e5-539ce4a51b6c', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(171, 'dimivaleka', 'DIMIVALEKA', 'dvalekardas@hotmail.com', 'DVALEKARDAS@HOTMAIL.COM', 0, 'AQAAAAEAACcQAAAAEKUSwvHZqhEVno5vUIem5ERucVV+zCfl5NsQ3kt3UF+v6TVMdp/UjNctL8E/DIOsWQ==', 'KZCOG57DFJF3BF6NWIAT3W7DNGDGDOGN', '74d43369-be6a-40a3-97aa-4a2223c0de2c', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(172, 'd1111', 'D1111', 'di@test.gr', 'DI@TEST.GR', 0, 'AQAAAAEAACcQAAAAEBa02Zbsr6ek8wGSF5jMlmSPnouHyFTEhgjW3RSlz/GHukkjFS3DyVXPQfgppE7SJQ==', 'NUDRXHVPLEG4IU6OX2LGAVVISCQHHOFF', 'a2ecae79-9736-42ee-affc-f983f648ffcf', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(173, 'dimi1', 'DIMI1', 'di@gmail.gr', 'DI@GMAIL.GR', 0, 'AQAAAAEAACcQAAAAELhD0M0LrfRtJ1n/euLhkzqA+P7vPBmRIile+Xj/oX9qERc6aRGQdKCESC6bj/BW7g==', 'F6ANIEURAQ4IU5XKHS56KNZ2E3LLVK5Y', '644be4a3-d343-4bcb-b5de-dbbccabcd9e8', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(175, 'Valekardas', 'VALEKARDAS', 'divalekardas@terracom.gr', 'DIVALEKARDAS@TERRACOM.GR', 0, 'AQAAAAEAACcQAAAAEOOd96/D5IVNTOQ+rgG8rkUlhx6wm4n7Ls7RoKOsduBR6NB6OSNdkdWd0qfeywNRkw==', 'TKGYSSYYSVCI6WQGCPUJRFH5DVOAVLKD', 'e710653c-7f5b-40e6-a0fd-cd2e615b4987', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(176, 'xaxax', 'XAXAX', 's@gmail.com', 'S@GMAIL.COM', 0, 'AQAAAAEAACcQAAAAEM6UvDVxi/LZlWgchTJQ02HXVl6EMwFF9rw2BpjGZMBxve7vPCEr/4nd5TgpqZosxw==', 'PSJMU7D3LP4A5DYQMXX3AR2YPODCBEC4', '26ed7769-6cec-403b-b0da-8a7378096a8c', NULL, 0, 0, NULL, 1, 0, NULL, NULL),
(178, 'pao13', 'PAO13', 'pao13@gmal.com', 'PAO13@GMAL.COM', 0, 'AQAAAAEAACcQAAAAEKAlhy0Uy9xHZZoX69X1kj2EBP0CV/LpIdGMIUFjrjpEGLtDSy2g1eZLWi3pAovBzg==', 'HDTHCV3WI5EWFHWZ4Z5BVMQ5EMI6O67W', '1c691ecb-c8fe-4d45-bae1-346ccc14c8cf', NULL, 0, 0, NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `baskets`
--

CREATE TABLE `baskets` (
  `id` int(10) UNSIGNED NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `basket_items`
--

CREATE TABLE `basket_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `basketId` int(10) UNSIGNED NOT NULL,
  `productId` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `createdDate` datetime NOT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `beacons`
--

CREATE TABLE `beacons` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `major` int(11) NOT NULL,
  `minor` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `floor` int(11) NOT NULL,
  `accuracy` double NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `beacons`
--

INSERT INTO `beacons` (`id`, `uuid`, `major`, `minor`, `name`, `latitude`, `longitude`, `floor`, `accuracy`, `isActive`, `createdDate`, `updatedDate`, `deletedDate`) VALUES
(11, 'b9407f30-f5f8-466e-aff9-25556b57fe6d', 5, 5089, 'test beacon17', 89.18134594, -1.6712567832, 0, 3.7, 1, '2021-10-13 07:15:41', NULL, NULL),
(12, 'f7826da6-4fa2-4e98-8024-bc5b71e0893e', 4797, 26248, '3PpN', 0, 0, 0, 3, 1, '2021-10-18 06:25:23', NULL, NULL),
(13, 'f7826da6-4fa2-4e98-8024-bc5b71e0893e', 61711, 12887, 'f2gk', 0, 0, 0, 3, 1, '2021-10-18 06:25:43', NULL, NULL),
(14, 'f7826da6-4fa2-4e98-8024-bc5b71e0893e', 5586, 5657, 'sBTI', 0, 0, 0, 3, 1, '2021-10-18 06:26:00', NULL, NULL),
(15, 'f7826da6-4fa2-4e98-8024-bc5b71e0893e', 29682, 8467, 'eKK1', 0, 0, 0, 3, 1, '2021-10-18 06:26:12', NULL, NULL),
(16, 'f7826da6-4fa2-4e98-8024-bc5b71e0893e', 43294, 40290, 'yiBb', 0, 0, 0, 3, 1, '2021-10-18 06:26:23', NULL, NULL),
(17, 'f7826da6-4fa2-4e98-8024-bc5b71e0893e', 4532, 8656, 'a7jC', 0, 0, 0, 3, 1, '2021-10-18 06:26:33', NULL, NULL),
(19, 'f7826da6-4fa2-4e98-8024-bc5b71e0893e', 15432, 23459, 'MQhE', 0, 0, 0, 3, 1, '2021-10-18 06:27:50', NULL, NULL),
(20, 'f7826da6-4fa2-4e98-8024-bc5b71e0893e', 20642, 50360, 'go6G', 0, 0, 0, 3, 1, '2021-10-18 06:28:01', NULL, NULL),
(21, 'f7826da6-4fa2-4e98-8024-bc5b71e0893e', 58691, 28859, '1zKv', 0, 0, 0, 3, 1, '2021-10-18 06:28:12', NULL, NULL),
(22, 'f7826da6-4fa2-4e98-8024-bc5b71e0893e', 23862, 6390, 'xBVg', 0, 0, 0, 3, 1, '2021-10-18 06:28:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `createdDate`, `updatedDate`, `deletedDate`) VALUES
(4, 'LG', '2020-02-20 11:33:23', NULL, NULL),
(5, 'SAMSUNG', '2020-04-06 12:33:23', NULL, NULL),
(6, 'APPLE', '2020-05-13 08:47:06', NULL, NULL),
(7, 'BOSH', '2021-05-13 12:33:23', NULL, NULL),
(8, 'ΑΝΤΩΝΙΑΔΗΣ Χ & Κ Ο.Ε', '2021-06-01 12:33:23', NULL, NULL),
(9, 'LENOVO', '2021-06-17 17:07:35', NULL, NULL),
(10, 'COMPUCON', '2021-07-30 12:33:23', NULL, NULL),
(11, 'NOKERO', '2021-08-01 12:33:23', NULL, NULL),
(12, 'Chinavasion', '2021-08-05 12:33:23', NULL, NULL),
(13, 'Nokia', '2021-08-10 12:33:23', NULL, NULL),
(14, 'Starbucks', '2021-08-12 08:25:57', '2021-08-12 08:43:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstName` varchar(40) DEFAULT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `clientLoyaltyStatusId` int(10) UNSIGNED NOT NULL,
  `genderId` int(10) UNSIGNED DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `notificationsLimit` int(10) UNSIGNED DEFAULT NULL,
  `isFamily` tinyint(1) NOT NULL DEFAULT 0,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstName`, `lastName`, `clientLoyaltyStatusId`, `genderId`, `dateOfBirth`, `notificationsLimit`, `isFamily`, `createdDate`, `updatedDate`, `deletedDate`) VALUES
(5, 'Μενιος', 'Σταβέλας', 3, 1, '1975-01-22', 10, 0, '2021-03-11 15:00:23', NULL, NULL),
(7, 'Ευαγγελια', 'Ζιωγα', 1, 2, '1975-01-22', 2, 1, '2021-03-11 15:00:23', NULL, NULL),
(8, 'Κωνσταντίνα', 'Γεωργιου', 3, 2, '1975-01-22', NULL, 0, '2021-03-11 15:00:23', NULL, NULL),
(9, 'Ιασονας', 'Τυφλοπουλος', 1, 1, '1975-01-22', NULL, 0, '2021-03-11 15:00:23', NULL, NULL),
(10, 'Δημητρης', 'Μοσχος', 1, 1, NULL, NULL, 0, '2021-03-11 15:00:23', NULL, NULL),
(11, 'Μεροπη', 'Παπανικολαου', 2, 2, NULL, 3, 1, '2021-03-11 15:00:23', NULL, NULL),
(12, 'Μαριος', 'Καλογερακης', 1, 1, NULL, 5, 0, '2021-03-11 15:00:23', NULL, NULL),
(13, 'Ηλιας', 'Κατζας', 2, 1, '1985-03-03', 5, 0, '2021-03-11 15:00:23', NULL, NULL),
(14, 'Παναγιωτα', 'Παπαγρηγοριου', 1, 2, NULL, 5, 0, '2021-03-11 15:00:23', NULL, NULL),
(15, 'Βαλαντης', 'Λωλης', 2, 1, NULL, 6, 0, '2021-03-11 15:00:23', NULL, NULL),
(16, 'Νικος', 'Κιτσιος', 1, 1, NULL, 4, 0, '2021-03-11 15:00:23', NULL, NULL),
(17, 'Ανδρονικος', 'Καψαλης', 1, 1, NULL, 2, 0, '2021-03-11 15:00:23', NULL, NULL),
(18, 'Μαρια', 'Σπυρου', 1, 2, NULL, 7, 1, '2021-03-11 15:00:23', NULL, NULL),
(19, 'Σταυρος', 'Σδουκος', 1, 1, NULL, 8, 0, '2021-03-11 15:00:23', NULL, NULL),
(20, 'Μανωλης', 'Πριονιδης', 2, 1, NULL, 9, 0, '2021-03-11 15:00:23', NULL, NULL),
(21, 'Δημος', 'Ευαγγέλου', 2, 1, '1978-09-16', NULL, 0, '2021-03-11 15:00:23', NULL, NULL),
(23, 'Ελευθερια', 'Καμιναρη', 3, 2, '2003-05-05', 0, 1, '2021-03-11 15:00:23', NULL, NULL),
(24, 'Αναστασια', 'Τασσου', 2, 2, '1998-03-12', 0, 0, '2021-03-11 15:00:23', NULL, NULL),
(25, 'Ευανθια', 'Δεκολα', 2, 2, NULL, 0, 1, '2021-03-11 15:00:23', NULL, NULL),
(26, 'Αλεξανδρος', 'Μοτσιος', 2, 1, NULL, 6, 0, '2021-03-11 15:00:23', NULL, NULL),
(27, 'Πετρος', 'Χολιδης', 2, 1, NULL, NULL, 0, '2021-03-11 15:00:23', NULL, NULL),
(29, 'Νικολετα', 'Τσανη', 2, 2, NULL, 4, 0, '2021-03-11 15:00:23', NULL, NULL),
(30, 'Κυριακη', 'Παντοφλιδου', 3, 2, NULL, NULL, 1, '2021-03-11 15:00:23', NULL, NULL),
(31, 'Χριστινα', 'Βαφειαδου', 3, 2, '1994-07-04', NULL, 0, '2021-03-11 15:00:23', NULL, NULL),
(32, 'Αντωνια', 'Δημοπουλου', 1, 2, NULL, 5, 0, '2021-03-11 15:00:23', NULL, NULL),
(36, 'Παύλος', 'Παύλου', 1, 1, NULL, 5, 0, '2021-03-11 15:00:23', NULL, NULL),
(37, 'Νίκος', 'Μπεκιάρης', 2, 1, NULL, 20, 0, '2021-03-11 15:00:23', '2021-08-05 13:40:50', NULL),
(38, 'Δημητριος', 'Σακκας', 1, 1, NULL, 0, 0, '2021-03-11 15:00:23', NULL, NULL),
(44, 'Δημητρης', 'Δαλκαβουζης', 1, 1, NULL, 3, 0, '2021-03-11 15:00:23', NULL, NULL),
(65, 'hello', 'world', 1, 2, '1997-06-01', 5, 0, '2021-06-03 09:57:12', NULL, NULL),
(109, 'qqqq', NULL, 1, 2, '2000-06-01', 5, 0, '2021-06-11 15:17:55', '2021-06-24 13:31:58', NULL),
(135, 'hello', 'world', 1, 2, '1972-06-01', 5, 0, '2021-07-28 11:33:05', NULL, NULL),
(156, 'string', 'string222', 1, 1, '2020-09-22', 0, 1, '2021-09-22 07:15:25', NULL, NULL),
(162, 'hello', 'world', 1, 2, '2020-06-01', 5, 0, '2021-09-27 12:57:07', NULL, NULL),
(168, NULL, NULL, 1, 1, NULL, NULL, 0, '2021-10-14 13:39:22', NULL, NULL),
(169, NULL, NULL, 1, 1, NULL, NULL, 0, '2021-10-14 13:45:06', NULL, NULL),
(171, NULL, NULL, 1, 1, NULL, NULL, 0, '2021-10-14 13:46:28', NULL, NULL),
(172, NULL, NULL, 1, 1, NULL, NULL, 0, '2021-10-19 08:44:26', NULL, NULL),
(173, NULL, NULL, 1, 1, NULL, NULL, 0, '2021-10-19 11:15:56', NULL, NULL),
(175, NULL, NULL, 1, 1, NULL, NULL, 0, '2021-10-19 11:21:45', NULL, NULL),
(176, NULL, NULL, 1, 1, NULL, NULL, 0, '2021-10-19 11:31:55', NULL, NULL),
(178, NULL, NULL, 1, 1, NULL, NULL, 0, '2021-10-19 11:40:55', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_loyalty_status`
--

CREATE TABLE `client_loyalty_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client_loyalty_status`
--

INSERT INTO `client_loyalty_status` (`id`, `name`, `description`) VALUES
(1, 'Basic', 'Clients who purchased the Basic package.'),
(2, 'Premium', 'Clients who purchased the Premium package.'),
(3, 'Gold', 'Clients who purchased the Gold package.');

-- --------------------------------------------------------

--
-- Table structure for table `client_preferences`
--

CREATE TABLE `client_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `productCategoryId` int(10) UNSIGNED NOT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `explicit_wishlist_items`
--

CREATE TABLE `explicit_wishlist_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `productId` int(10) UNSIGNED NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `explicit_wishlist_items`
--

INSERT INTO `explicit_wishlist_items` (`id`, `clientId`, `productId`, `startDate`, `endDate`, `deletedDate`) VALUES
(1, 5, 52, '2021-03-24 10:43:44', NULL, NULL),
(7, 5, 53, '2021-03-24 10:43:44', NULL, NULL),
(11, 7, 36, '2021-03-24 10:43:44', NULL, NULL),
(12, 7, 47, '2021-03-24 10:43:44', NULL, NULL),
(13, 8, 56, '2021-03-24 10:43:44', NULL, NULL),
(14, 8, 55, '2021-03-24 10:43:44', NULL, NULL),
(15, 9, 33, '2021-03-24 10:43:44', NULL, NULL),
(19, 9, 33, '2021-03-24 10:43:44', NULL, NULL),
(24, 8, 36, '2020-03-15 00:00:00', NULL, NULL),
(25, 7, 48, '2021-05-23 09:00:00', NULL, NULL),
(26, 5, 56, '2021-11-16 01:27:40', '2022-01-04 01:27:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `name`) VALUES
(2, 'Female'),
(1, 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `multimedia_types`
--

CREATE TABLE `multimedia_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `multimedia_types`
--

INSERT INTO `multimedia_types` (`id`, `name`) VALUES
(7, 'avi'),
(4, 'jpeg'),
(1, 'mp3'),
(2, 'mp4'),
(5, 'pdf'),
(3, 'png');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(50) NOT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `productCategoryId` int(10) UNSIGNED NOT NULL,
  `brandId` int(10) UNSIGNED NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  `retailPrice` float NOT NULL,
  `notes` varchar(100) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `productUrl` varchar(300) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `description`, `productCategoryId`, `brandId`, `model`, `retailPrice`, `notes`, `isActive`, `productUrl`, `createdDate`, `updatedDate`, `deletedDate`) VALUES
(32, 'WMB-1', 'Το πλυντήριο ρούχων WAL28RH2GR από τον κατασκευαστή Bosch, έχει χωρητικότητα κάδου κατάλληλη για έως και 10 κιλά άπλυτων ρούχων, και μπορεί να καλύψει τις ανάγκες μιας πολύτεκνης οικογένειας. Παράλληλα χάρη στον μεγάλο κάδο, εκτός από πολλά ρούχα για πλύσιμο μπορεί να χωράει και παπλώματα ή κουβέρτες. Η φόρτωση των ρούχων γίνεται από τη στρογγυλή πόρτα...', 16, 10, 'WAL28RH2GR ', 624.9, NULL, 1, 'https://www.skroutz.gr/s/27786954/Bosch-WAL28RH2GR-%CE%A0%CE%BB%CF%85%CE%BD%CF%84%CE%AE%CF%81%CE%B9%CE%BF-%CE%A1%CE%BF%CF%8D%CF%87%CF%89%CE%BD-10kg-1400-%CE%A3%CF%84%CF%81%CE%BF%CF%86%CF%8E%CE%BD.html?from=featured', '2021-03-02 11:18:02', '2021-06-16 11:55:21', NULL),
(33, 'WMB-2', 'Πλυντήριο ρούχων χωρητικότητας 8 kg με EcoSilence Drive για αθόρυβη λειτουργία και εξαιρετική ανθεκτικότητα. Χάρη στη λειτουργία SpeedPerfect τα ρούχα είναι τέλεια πλυμένα σε έως 65% λιγότερο χρόνο.\r\n\r\nΟι χρήστες που το έχουν αγοράσει το ξεχωρίζουν κυρίως γιατί πλένει καλά τα ρούχα και είναι ικανοποιητική η χωρητικότητά του.', 16, 10, 'WAN24008GR', 361.99, NULL, 1, 'https://www.skroutz.gr/s/22813100/Bosch-WAN24008GR-%CE%A0%CE%BB%CF%85%CE%BD%CF%84%CE%AE%CF%81%CE%B9%CE%BF-%CE%A1%CE%BF%CF%8D%CF%87%CF%89%CE%BD-8kg-1200-%CE%A3%CF%84%CF%81%CE%BF%CF%86%CF%8E%CE%BD.html', '2021-03-02 11:38:55', '2021-03-12 13:22:47', NULL),
(34, 'WMS-1', 'To πλυντήριο ρούχων της Samsung με χωρητικότητα 9 κιλά και τεχνολογία Eco Bubble, που δημιουργεί φυσαλίδες αφρού και καθαρίζει βαθύτερα τα ρούχα.  Οι χρήστες που το έχουν αγοράσει το ξεχωρίζουν κυρίως γιατί είναι ικανοποιητική η χωρητικότητά του.', 16, 5, 'WW90TA046AE', 422.99, NULL, 1, 'https://www.skroutz.gr/s/25726854/Samsung-WW90TA046AE-%CE%A0%CE%BB%CF%85%CE%BD%CF%84%CE%AE%CF%81%CE%B9%CE%BF-%CE%A1%CE%BF%CF%8D%CF%87%CF%89%CE%BD-9kg-1400-%CE%A3%CF%84%CF%81%CE%BF%CF%86%CF%8E%CE%BD.html', '2021-03-02 11:38:43', '2021-03-12 12:52:31', NULL),
(35, 'WMS-2', 'To πλυντήριο ρούχων της Samsung με χωρητικότητα 10,5 κιλά και τεχνολογία AI Control δίνει τη δυνατότητα προσαρμογής των προγραμμάτων πλύσης ανάλογα με τις προτιμήσεις σου και τις καιρικές συνθήκες.\r\n\r\nΟι χρήστες που το έχουν αγοράσει το ξεχωρίζουν κυρίως γιατί είναι ικανοποιητική η χωρητικότητά του.', 16, 5, 'WW10T654DLH', 540, NULL, 1, 'https://www.skroutz.gr/s/25662166/Samsung-WW10T654DLH-%CE%A0%CE%BB%CF%85%CE%BD%CF%84%CE%AE%CF%81%CE%B9%CE%BF-%CE%A1%CE%BF%CF%8D%CF%87%CF%89%CE%BD-10-5kg-1400-%CE%A3%CF%84%CF%81%CE%BF%CF%86%CF%8E%CE%BD.html', '2021-03-02 12:08:56', '2021-03-12 12:53:05', NULL),
(36, 'MPA-13P', 'Ταχύτητα 5G. Επεξεργαστής A15 Bionic. Εξελιγμένο νέο λογισμικό για επεξεργασία φωτογραφίας. Αυτόματα ρυθμιζόμενος ρυθμός ανανέωσης 120Hz.', 21, 6, 'iPhone 13 Pro Max 5G', 1328.2, NULL, 1, 'https://www.skroutz.gr/s/31105160/Apple-iPhone-13-Pro-Max-5G-6GB-128GB-Sierra-Blue.html', '2021-03-02 12:33:42', NULL, NULL),
(45, 'MPA-13', NULL, 21, 6, 'iPhone 13 5G', 845.84, NULL, 1, 'https://www.skroutz.gr/s/31006584/Apple-iPhone-13-5G-4GB-128GB-Midnight.html#description', '2021-03-02 15:18:12', NULL, NULL),
(46, 'MPS-A52', 'Multi Role Quad Camera 64MP με OIS, μπαταρία 4.500 mAh, αντοχή IP67 και Fast Charging 25W', 21, 5, 'Galaxy A52s 5G', 312.92, NULL, 1, 'https://www.skroutz.gr/s/30662995/Samsung-Galaxy-A52s-5G-6GB-128GB-Awesome-Black.html', '2021-03-02 15:18:53', NULL, NULL),
(47, 'MPS-Z3', '', 21, 5, 'Galaxy Z Fold 3 5G', 1318.77, NULL, 1, 'https://www.skroutz.gr/s/30445633/Samsung-Galaxy-Z-Fold-3-5G-12GB-256GB-Phantom-Black.html', '2021-03-02 15:27:40', NULL, NULL),
(48, 'MPL-G8', 'Με επεξεργαστή Snapdragon 855, κάμερα με ευρύτερο οπτικό πεδίο 137 μοιρών και ασφαλείς επιλογές βιομετρικής αναγνώρισης.', 21, 4, 'G8S ThinQ', 580, NULL, 0, 'https://www.skroutz.gr/s/19283100/LG-G8S-ThinQ-6GB-128GB-Aurora-Black.html', '2021-03-02 15:30:52', NULL, NULL),
(51, 'LA-P14', NULL, 22, 6, 'Apple MacBook Pro 14\" (2021)', 2959.85, 'string', 0, 'https://www.skroutz.gr/s/31899606/Apple-MacBook-Pro-14-2021-M1-Pro-10-core-16GB-1TB-Retina-Display-Space-Gray-US.html', '2021-03-04 14:12:48', NULL, NULL),
(52, 'LA-A13', 'Με τον επεξεργαστή M1 8 πυρήνων που αποδίδει 2,8 φορές μεγαλύτερη επεξεργαστική ισχύ και μέχρι 5 φορές καλύτερα γραφικά από την προηγούμενη γενιά. Διαθέτει λειτουργικό macOS Big Sur ειδικά σχεδιασμένο για τον M1, οθόνη Retina, και γρήγορο και αθόρυβο πληκτρολόγιο.', 22, 6, 'MacBook Air 13.3\" ', 1083, 'string', 1, 'https://www.skroutz.gr/s/25634434/Apple-MacBook-Air-13-3-M1-8GB-256GB-Retina-Display-2020-Space-Gray-GR.html', '2021-03-04 14:18:00', NULL, NULL),
(53, 'LL-TE142', NULL, 22, 9, 'ThinkPad E14 Gen 2 (Intel)', 1466.19, 'string', 1, 'https://www.skroutz.gr/s/26333495/Lenovo-ThinkPad-E14-Gen-2-Intel-i7-1165G7-16GB-1TB-FHD-W10-GR-Keyboard-Black.html', '2021-03-04 14:19:45', NULL, NULL),
(54, 'LL-TE143', NULL, 22, 9, 'ThinkPad E14 Gen 3 (AMD)', 1424.5, 'string', 1, 'https://www.skroutz.gr/s/32473200/Lenovo-ThinkPad-E14-Gen-3-AMD-Ryzen-7-5700U-16GB-1TB-FHD-W10-Pro-GR-Keyboard.html', '2021-03-04 14:23:48', NULL, NULL),
(55, 'LL-L5A', NULL, 22, 9, 'Legion 5 17ACH6', 1199.01, 'string', 1, 'https://www.skroutz.gr/s/32259774/Lenovo-Legion-5-17ACH6-Ryzen-7-5800H-16GB-512GB-GeForce-RTX-3050-FHD-W11-Home-Phantom-Blue-Shadow-Black.html?from=catspan', '2021-03-04 14:24:15', NULL, NULL),
(56, 'LL-L5B', NULL, 22, 9, ' Legion 5 15ARH05 ', 805.56, 'string', 1, 'https://www.skroutz.gr/s/27633526/Lenovo-Legion-5-15ARH05-Ryzen-5-4600H-8GB-512GB-GeForce-GTX-1650-Ti-FHD-No-OS-US-Keyboard-Phantom-Black.html?from=catspan', '2021-03-04 14:25:47', NULL, NULL),
(57, 'Sh/GrSWo', 'string', 1, 7, 'string', 738, 'string', 1, 'string', '2021-03-04 14:25:54', NULL, NULL),
(58, 'Sh/GrSMe', 'string', 17, 6, 'string', 224, 'string', 1, 'string', '2021-03-04 14:26:58', NULL, NULL),
(59, 'Sh/BlMMe', 'string', 1, 5, 'string', 75, 'string', 1, 'string', '2021-03-04 14:41:09', NULL, NULL),
(60, 'Sh/BlSWo', NULL, 15, 4, NULL, 6, NULL, 1, NULL, '2021-03-05 12:28:26', NULL, NULL),
(61, 'Sh/BlSMe', NULL, 15, 5, NULL, 5, NULL, 1, NULL, '2021-03-05 12:30:00', NULL, NULL),
(62, 'Sh/BlLWo', NULL, 16, 7, NULL, 56, NULL, 0, NULL, '2021-03-05 12:30:50', NULL, NULL),
(63, 'Sh/BlLMe', NULL, 16, 13, NULL, 24, NULL, 0, NULL, '2021-03-05 12:31:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `createdDate`, `updatedDate`, `deletedDate`) VALUES
(1, 'TV', '2020-02-20 11:33:23', NULL, NULL),
(15, 'Refrigerator', '2020-04-06 12:33:23', NULL, NULL),
(16, 'Washing machine', '2020-05-13 08:47:06', NULL, NULL),
(17, 'Sofa', '2021-05-13 12:33:23', NULL, NULL),
(18, 'Wardrobe', '2021-06-01 12:33:23', NULL, NULL),
(19, 'Bed', '2021-06-17 17:07:35', NULL, NULL),
(20, 'Air condition', '2021-07-30 12:33:23', NULL, NULL),
(21, 'Cell phone', '2021-08-01 12:33:23', NULL, NULL),
(22, 'Laptop', '2021-08-05 12:33:23', NULL, NULL),
(23, 'Oven', '2021-08-10 12:33:23', NULL, NULL),
(24, 'Telephones', '2021-08-12 09:37:44', '2021-08-12 09:39:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `productId` int(10) UNSIGNED NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `floor` int(11) NOT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`id`, `productId`, `latitude`, `longitude`, `floor`, `deletedDate`) VALUES
(1, 36, 12, 34, 1, NULL),
(2, 36, 45, 122, 2, NULL),
(3, 36, 3.1, -12.12, 3, NULL),
(4, 45, 38.8951, -12.12, 1, NULL),
(5, 51, 38.8951, -77.0364, 0, NULL),
(10, 47, 40, 77, 1, NULL),
(11, 52, -28.8951, 12.12, 1, NULL),
(12, 32, 28.8951, -12.12, 1, NULL),
(13, 33, -53, 52, 1, NULL),
(14, 34, -21, 65, 1, NULL),
(15, 35, 43, -32, 1, NULL),
(16, 46, -86, -52, 1, NULL),
(17, 48, 99, -32, 1, NULL),
(18, 53, 234, -43, 1, NULL),
(19, 54, -13, -52, 1, NULL),
(20, 55, 43, -12, 1, NULL),
(21, 56, 45, 48, 1, NULL),
(22, 57, -42, -2, 1, NULL),
(23, 58, -20, 42, 1, NULL),
(24, 59, -24, 24, 1, NULL),
(25, 60, 65, 32, 1, NULL),
(26, 61, 78, -5, 1, NULL),
(27, 62, -43, 21, 1, NULL),
(28, 63, -28.8951, -12.12, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_multimedia`
--

CREATE TABLE `product_multimedia` (
  `id` int(10) UNSIGNED NOT NULL,
  `location` varchar(300) NOT NULL,
  `productId` int(10) UNSIGNED NOT NULL,
  `multimediaTypeId` int(10) UNSIGNED NOT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_multimedia`
--

INSERT INTO `product_multimedia` (`id`, `location`, `productId`, `multimediaTypeId`, `deletedDate`) VALUES
(1, 'C:/Users/user/Desktop/multimedia', 32, 1, NULL),
(2, 'C:/Users/user/Desktop/multimedia', 36, 2, NULL),
(3, 'C:/Users/user/Desktop/multimedia2', 36, 3, NULL),
(4, 'C:/Users/user/Desktop/multimedia', 45, 4, NULL),
(5, 'C:/Users/user/Desktop/multimedia', 48, 5, NULL),
(7, 'C:/Users/user/Desktop/multimedia13', 52, 7, NULL),
(8, 'C:/Users/user/Desktop/multimedia', 52, 2, NULL),
(9, 'C:/Users/user/Desktop/multimedia44', 36, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `productId` int(10) UNSIGNED NOT NULL,
  `rating` float NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `clientId`, `productId`, `rating`, `comment`, `createdDate`, `deletedDate`) VALUES
(1, 36, 32, 4, 'nice', '2021-04-20 14:16:51', NULL),
(2, 36, 36, 3, 'ok', '2021-04-20 14:16:51', NULL),
(3, 36, 36, 4.5, 'good', '2021-04-20 14:16:51', NULL),
(4, 36, 36, 5, 'excellent', '2021-04-20 14:16:51', NULL),
(5, 36, 32, 1, '', '2021-04-20 14:16:51', NULL),
(6, 36, 45, 9, 'alomost perfect', '2021-04-20 14:16:51', NULL),
(7, 36, 45, 10, 'perfect!!', '2021-04-20 14:16:51', NULL),
(8, 36, 51, 7.5, 'thnx', '2021-04-20 14:16:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_specifications`
--

CREATE TABLE `product_specifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `productId` int(10) UNSIGNED NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_specifications`
--

INSERT INTO `product_specifications` (`id`, `productId`, `key`, `value`, `deletedDate`) VALUES
(1, 32, 'test', 'good', NULL),
(2, 32, 'hello', 'world', NULL),
(3, 34, 'foo', 'bar', NULL),
(5, 32, 'aaa', 'bbb', NULL),
(9, 51, 'sizes', 'large,medium', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `Id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES
(1, 'admin', 'ADMIN', 'f3cfcf88-e36c-4611-af63-4d9e082f3e3d'),
(2, 'user', 'USER', 'eb00bee4-5339-41ed-b877-0417274a5d36'),
(3, 'client', 'CLIENT', 'a6f2f481-db1b-45bb-8114-919ca422f7b9'),
(6, 'sub-admin', 'SUB-ADMIN', '09a85f30-3438-4b80-80e5-ec77b1c10f6f');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `productId` int(10) UNSIGNED NOT NULL,
  `explicitWishlistItemId` int(10) UNSIGNED DEFAULT NULL,
  `purchaseDate` datetime NOT NULL,
  `buyPrice` float NOT NULL,
  `adOfferId` int(10) UNSIGNED DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `clientId`, `productId`, `explicitWishlistItemId`, `purchaseDate`, `buyPrice`, `adOfferId`, `createdDate`, `deletedDate`) VALUES
(1, 8, 36, 24, '2021-08-19 12:00:00', 15, 4, '2021-08-19 12:49:33', NULL),
(2, 31, 45, NULL, '2021-09-01 18:00:00', 10, 4, '2021-09-01 15:00:33', NULL),
(3, 37, 51, 11, '2021-04-16 12:00:00', 23.7, NULL, '2021-04-16 12:49:33', NULL),
(5, 10, 32, NULL, '2021-06-18 12:00:00', 100, NULL, '2021-04-21 12:18:11', NULL),
(6, 7, 48, 25, '2021-09-06 12:00:00', 100, 15, '2021-09-06 12:00:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `branchName` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `deletedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `branchName`, `createdDate`, `updatedDate`, `deletedDate`) VALUES
(1, 'Public', 'public ioannina', '2021-03-02 11:05:23', '2021-07-22 12:03:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `UserId` int(10) UNSIGNED NOT NULL,
  `RoleId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`UserId`, `RoleId`) VALUES
(1, 2),
(5, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(36, 3),
(37, 3),
(38, 3),
(44, 3),
(45, 1),
(65, 3),
(109, 3),
(135, 3),
(136, 6),
(156, 3),
(162, 3),
(168, 3),
(169, 3),
(171, 3),
(172, 3),
(173, 3),
(175, 3),
(176, 3),
(178, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad_multimedia`
--
ALTER TABLE `ad_multimedia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ad_multimedia_un` (`location`,`adOfferId`),
  ADD KEY `ad_multimedia_fk` (`multimediaTypeId`),
  ADD KEY `ad_multimedia_fk_1` (`adOfferId`);

--
-- Indexes for table `ad_offers`
--
ALTER TABLE `ad_offers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ad_campaign_vouchers_un` (`code`),
  ADD KEY `ad_campaign_vouchers_FK_3` (`clientLoyaltyStatusId`),
  ADD KEY `ad_campaign_vouchers_FK_1` (`productCategoryId`),
  ADD KEY `ad_campaign_vouchers_FK_4` (`ageGroupId`),
  ADD KEY `ad_campaign_offers_FK` (`clientId`),
  ADD KEY `ad_campaign_offers_FK_1` (`genderId`),
  ADD KEY `ad_offers_FK` (`brandId`),
  ADD KEY `ad_campaign_vouchers_FK_2` (`productId`);

--
-- Indexes for table `ad_offers_history`
--
ALTER TABLE `ad_offers_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ad_messages_fk` (`clientId`),
  ADD KEY `ad_offers_history_FK` (`adOfferId`);

--
-- Indexes for table `age_groups`
--
ALTER TABLE `age_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `age_groups_un` (`name`);

--
-- Indexes for table `auth_users`
--
ALTER TABLE `auth_users`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  ADD UNIQUE KEY `auth_users_un_email` (`Email`),
  ADD UNIQUE KEY `auth_users_un_mobile` (`PhoneNumber`),
  ADD KEY `EmailIndex` (`NormalizedEmail`);

--
-- Indexes for table `baskets`
--
ALTER TABLE `baskets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `baskets_un` (`code`),
  ADD KEY `baskets_FK` (`clientId`);

--
-- Indexes for table `basket_items`
--
ALTER TABLE `basket_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `basket_items_un` (`basketId`,`productId`),
  ADD KEY `basket_items_FK_1` (`productId`);

--
-- Indexes for table `beacons`
--
ALTER TABLE `beacons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `beacons_UN` (`uuid`,`major`,`minor`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_un` (`name`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_fk` (`clientLoyaltyStatusId`),
  ADD KEY `clients_fk_1` (`genderId`);

--
-- Indexes for table `client_loyalty_status`
--
ALTER TABLE `client_loyalty_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_loyalty_status_un` (`name`);

--
-- Indexes for table `client_preferences`
--
ALTER TABLE `client_preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_preferences_un` (`clientId`,`productCategoryId`),
  ADD KEY `client_preferences_FK_1` (`productCategoryId`);

--
-- Indexes for table `explicit_wishlist_items`
--
ALTER TABLE `explicit_wishlist_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `explicitwishlist_fk` (`clientId`),
  ADD KEY `explicit_wishlist_items_fk` (`productId`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `genders_un` (`name`);

--
-- Indexes for table `multimedia_types`
--
ALTER TABLE `multimedia_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `multimedia_types_un` (`name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_un` (`sku`),
  ADD KEY `products_fk_1` (`productCategoryId`),
  ADD KEY `products_fk_3` (`brandId`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_categories_un` (`name`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_locations_fk` (`productId`);

--
-- Indexes for table `product_multimedia`
--
ALTER TABLE `product_multimedia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_multimedia_un` (`productId`,`location`),
  ADD KEY `product_multimedia_fk` (`productId`),
  ADD KEY `product_multimedia_fk_1` (`multimediaTypeId`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_fk` (`productId`),
  ADD KEY `product_reviews_fk1` (`clientId`);

--
-- Indexes for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_specifications_un` (`productId`,`key`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `RoleNameIndex` (`NormalizedName`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_fk` (`clientId`),
  ADD KEY `transactions_fk_1` (`productId`),
  ADD KEY `transactions_fk_2` (`explicitWishlistItemId`),
  ADD KEY `transactions_fk_4` (`adOfferId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_User_Roles_RoleId` (`RoleId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ad_multimedia`
--
ALTER TABLE `ad_multimedia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ad_offers`
--
ALTER TABLE `ad_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `ad_offers_history`
--
ALTER TABLE `ad_offers_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `age_groups`
--
ALTER TABLE `age_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_users`
--
ALTER TABLE `auth_users`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `baskets`
--
ALTER TABLE `baskets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `basket_items`
--
ALTER TABLE `basket_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beacons`
--
ALTER TABLE `beacons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `client_loyalty_status`
--
ALTER TABLE `client_loyalty_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `client_preferences`
--
ALTER TABLE `client_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `explicit_wishlist_items`
--
ALTER TABLE `explicit_wishlist_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `multimedia_types`
--
ALTER TABLE `multimedia_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product_locations`
--
ALTER TABLE `product_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `product_multimedia`
--
ALTER TABLE `product_multimedia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ad_multimedia`
--
ALTER TABLE `ad_multimedia`
  ADD CONSTRAINT `ad_multimedia_FK1` FOREIGN KEY (`adOfferId`) REFERENCES `ad_offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ad_multimedia_fk` FOREIGN KEY (`multimediaTypeId`) REFERENCES `multimedia_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ad_offers`
--
ALTER TABLE `ad_offers`
  ADD CONSTRAINT `ad_campaign_offers_FK` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ad_campaign_offers_FK_1` FOREIGN KEY (`genderId`) REFERENCES `genders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ad_campaign_vouchers_FK_1` FOREIGN KEY (`productCategoryId`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ad_campaign_vouchers_FK_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ad_campaign_vouchers_FK_3` FOREIGN KEY (`clientLoyaltyStatusId`) REFERENCES `client_loyalty_status` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ad_campaign_vouchers_FK_4` FOREIGN KEY (`ageGroupId`) REFERENCES `age_groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ad_offers_FK` FOREIGN KEY (`brandId`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ad_offers_history`
--
ALTER TABLE `ad_offers_history`
  ADD CONSTRAINT `ad_messages_fk` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ad_offers_history_FK` FOREIGN KEY (`adOfferId`) REFERENCES `ad_offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `baskets`
--
ALTER TABLE `baskets`
  ADD CONSTRAINT `baskets_FK` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `basket_items`
--
ALTER TABLE `basket_items`
  ADD CONSTRAINT `basket_items_FK` FOREIGN KEY (`basketId`) REFERENCES `baskets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `basket_items_FK_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_fk` FOREIGN KEY (`clientLoyaltyStatusId`) REFERENCES `client_loyalty_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clients_fk_1` FOREIGN KEY (`genderId`) REFERENCES `genders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clients_fk_2` FOREIGN KEY (`id`) REFERENCES `auth_users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_preferences`
--
ALTER TABLE `client_preferences`
  ADD CONSTRAINT `client_preferences_FK` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_preferences_FK_1` FOREIGN KEY (`productCategoryId`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `explicit_wishlist_items`
--
ALTER TABLE `explicit_wishlist_items`
  ADD CONSTRAINT `explicit_wishlist_items_fk` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `explicitwishlist_fk` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_fk_1` FOREIGN KEY (`productCategoryId`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_fk_3` FOREIGN KEY (`brandId`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD CONSTRAINT `product_locations_fk` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_multimedia`
--
ALTER TABLE `product_multimedia`
  ADD CONSTRAINT `product_multimedia_fk` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_multimedia_fk_1` FOREIGN KEY (`multimediaTypeId`) REFERENCES `multimedia_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_fk` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_reviews_fk1` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD CONSTRAINT `product_specifications_FK` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_fk` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_fk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_fk_6` FOREIGN KEY (`adOfferId`) REFERENCES `ad_offers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_fk_7` FOREIGN KEY (`explicitWishlistItemId`) REFERENCES `explicit_wishlist_items` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `users_FK` FOREIGN KEY (`id`) REFERENCES `auth_users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FK_User_Roles_Auth_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `auth_users` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_User_Roles_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
