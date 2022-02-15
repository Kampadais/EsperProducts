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
-- Database: `ProximiotDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `ClientLocation`
--

CREATE TABLE `ClientLocation` (
  `ClientLocationID` int(10) UNSIGNED NOT NULL,
  `SessionID` int(10) UNSIGNED DEFAULT NULL,
  `Timestamp` time(6) DEFAULT NULL,
  `Lat` int(10) DEFAULT NULL,
  `Lon` int(10) DEFAULT NULL,
  `Floor` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ClientLocation`
--

INSERT INTO `ClientLocation` (`ClientLocationID`, `SessionID`, `Timestamp`, `Lat`, `Lon`, `Floor`) VALUES
(55, 8, '29:28:07.273256', 29, -10, 1),
(56, 8, '29:28:07.273256', 27, -12, 1),
(57, 8, '29:28:07.273256', 30, -10, 1),
(58, 8, '29:28:07.273256', 26, -14, 1),
(59, 8, '29:28:07.273256', 27, -13, 1),
(60, 8, '29:28:07.273256', 29, -14, 1),
(61, 8, '29:28:07.273256', 27, -13, 1),
(62, 8, '29:28:07.273256', 26, -14, 1),
(63, 8, '29:28:07.273256', 26, -13, 1),
(64, 8, '29:28:07.273256', 25, -13, 1),
(65, 8, '29:28:07.273256', 26, -11, 1),
(66, 8, '29:28:07.273256', 27, -13, 1),
(67, 8, '29:28:07.273256', 28, -14, 1),
(68, 8, '29:28:07.273256', 26, -16, 1),
(69, 8, '29:28:07.273256', 28, -13, 1),
(70, 8, '29:28:07.273256', 29, -14, 1),
(71, 8, '29:28:07.273256', 27, -15, 1),
(72, 8, '29:28:07.273256', 26, -16, 1),
(73, 8, '29:28:07.273256', 25, -17, 1),
(74, 8, '29:28:07.273256', 24, -16, 1),
(75, 8, '23:28:07.273256', 23, -17, 1),
(76, 8, '23:28:07.273256', 0, 0, 0),
(77, 8, '29:28:07.273256', -53, 51, 1),
(78, 8, '29:28:07.273256', -52, 50, 1),
(79, 8, '29:28:07.273256', -54, 52, 1),
(80, 8, '29:28:07.273256', -53, 51, 1),
(81, 8, '29:28:07.273256', -53, 51, 1),
(82, 8, '29:28:07.273256', -52, 50, 1),
(83, 8, '29:28:07.273256', -54, 53, 1),
(84, 8, '29:28:07.273256', -55, 49, 1),
(85, 8, '29:28:07.273256', -54, 50, 1),
(86, 8, '29:28:07.273256', -53, 48, 1),
(87, 8, '29:28:07.273256', -53, 51, 1),
(88, 8, '29:28:07.273256', -53, 51, 1),
(89, 8, '29:28:07.273256', -54, 50, 1),
(90, 8, '29:28:07.273256', -52, 51, 1),
(91, 8, '29:28:07.273256', -52, 51, 1),
(92, 8, '29:28:07.273256', 0, 0, 0),
(93, 8, '29:28:07.273256', 43, -32, 1),
(94, 8, '29:28:07.273256', 43, -32, 1),
(95, 8, '29:28:07.273256', 43, -32, 1),
(96, 8, '29:28:07.273256', 43, -32, 1),
(97, 8, '29:28:07.273256', 43, -32, 1),
(98, 8, '29:28:07.273256', 43, -32, 1),
(99, 8, '29:28:07.273256', 43, -32, 1),
(100, 8, '29:28:07.273256', 43, -32, 1),
(101, 8, '29:28:07.273256', 43, -32, 1),
(102, 8, '29:28:07.273256', 43, -32, 1),
(103, 8, '29:28:07.273256', 43, -32, 1),
(104, 8, '29:28:07.273256', 43, -32, 1),
(105, 8, '29:28:07.273256', 43, -32, 1),
(106, 8, '29:28:07.273256', 43, -32, 1),
(107, 8, '29:28:07.273256', 43, -32, 1),
(108, 8, '29:28:07.273256', 43, -32, 1),
(109, 8, '29:28:07.273256', 43, -32, 1),
(110, 8, '29:28:07.273256', 43, -32, 1),
(111, 8, '29:28:07.273256', 43, -32, 1),
(112, 8, '29:28:07.273256', 43, -32, 1),
(113, 8, '29:28:07.273256', 43, -32, 1),
(114, 8, '29:28:07.273256', 43, -32, 1),
(115, 8, '29:28:07.273256', 43, -32, 1),
(116, 8, '29:28:07.273256', 0, 0, 0),
(117, 9, '29:28:07.273256', 12, 34, 1),
(118, 9, '29:28:07.273256', 12, 34, 1),
(119, 9, '29:28:07.273256', 12, 34, 1),
(120, 9, '29:28:07.273256', 12, 34, 1),
(121, 9, '29:28:07.273256', 12, 34, 1),
(122, 9, '29:28:07.273256', 12, 34, 1),
(123, 9, '29:28:07.273256', 3, -12, 3),
(124, 9, '29:28:07.273256', 3, -12, 3),
(125, 9, '29:28:07.273256', 3, -12, 3),
(126, 9, '29:28:07.273256', 3, -12, 3),
(127, 9, '29:28:07.273256', 3, -12, 3),
(128, 9, '29:28:07.273256', 3, -12, 3),
(129, 9, '29:28:07.273256', 3, -12, 3),
(130, 9, '29:28:07.273256', 45, 122, 2),
(131, 9, '29:28:07.273256', 45, 122, 2),
(132, 9, '29:28:07.273256', 45, 122, 2),
(133, 9, '29:28:07.273256', 45, 122, 2),
(134, 9, '29:28:07.273256', 45, 122, 2),
(135, 9, '29:28:07.273256', 45, 122, 2),
(136, 9, '29:28:07.273256', 45, 122, 2),
(137, 10, '29:28:07.273256', 38, -77, 0),
(138, 10, '29:28:07.273256', 38, -77, 0),
(139, 10, '29:28:07.273256', 38, -77, 0),
(140, 10, '29:28:07.273256', 38, -77, 0),
(141, 10, '29:28:07.273256', 38, -77, 0),
(142, 10, '29:28:07.273256', 38, -77, 0),
(143, 10, '29:28:07.273256', 38, -77, 0),
(144, 10, '29:28:07.273256', 38, -77, 0),
(145, 10, '29:28:07.273256', 38, -77, 0),
(146, 10, '29:28:07.273256', 38, -77, 0),
(147, 10, '29:28:07.273256', 38, -77, 0),
(148, 10, '29:28:07.273256', 38, -77, 0),
(149, 10, '29:28:07.273256', 38, -77, 0),
(150, 10, '29:28:07.273256', 38, -77, 0),
(151, 10, '29:28:07.273256', 38, -77, 0),
(152, 10, '29:28:07.273256', 38, -77, 0),
(153, 10, '29:28:07.273256', 38, -77, 0),
(154, 10, '29:28:07.273256', 38, -77, 0),
(155, 10, '29:28:07.273256', 38, -77, 0),
(156, 10, '29:28:07.273256', 38, -77, 0),
(157, 10, '29:28:07.273256', 38, -77, 0),
(158, 10, '29:28:07.273256', 38, -77, 0),
(159, 10, '29:28:07.273256', 38, -77, 0),
(160, 10, '29:28:07.273256', 38, -77, 0),
(161, 10, '29:28:07.273256', 0, 0, 0),
(162, 10, '29:28:07.273256', 234, -43, 1),
(163, 10, '29:28:07.273256', 234, -43, 1),
(164, 10, '29:28:07.273256', 234, -43, 1),
(165, 10, '29:28:07.273256', 234, -43, 1),
(166, 10, '29:28:07.273256', 234, -43, 1),
(167, 10, '29:28:07.273256', 234, -43, 1),
(168, 10, '29:28:07.273256', 234, -43, 1),
(169, 10, '29:28:07.273256', 234, -43, 1),
(170, 10, '29:28:07.273256', 234, -43, 1),
(171, 10, '29:28:07.273256', 234, -43, 1),
(172, 10, '29:28:07.273256', 234, -43, 1),
(173, 10, '29:28:07.273256', 234, -43, 1),
(174, 10, '29:28:07.273256', 234, -43, 1),
(175, 10, '29:28:07.273256', 234, -43, 1),
(176, 10, '29:28:07.273256', 234, -43, 1),
(177, 10, '29:28:07.273256', 234, -43, 1),
(178, 10, '29:28:07.273256', 234, -43, 1),
(179, 10, '29:28:07.273256', 234, -43, 1),
(180, 10, '29:28:07.273256', 234, -43, 1),
(181, 10, '29:28:07.273256', 234, -43, 1),
(182, 10, '29:28:07.273256', 0, 0, 0),
(183, 11, '29:28:07.273256', -53, 51, 1),
(184, 11, '29:28:07.273256', -53, 51, 1),
(185, 11, '29:28:07.273256', -53, 51, 1),
(186, 11, '29:28:07.273256', -53, 51, 1),
(187, 11, '29:28:07.273256', -53, 51, 1),
(188, 11, '29:28:07.273256', -53, 51, 1),
(189, 11, '29:28:07.273256', 43, -32, 1),
(190, 11, '29:28:07.273256', 43, -32, 1),
(191, 11, '29:28:07.273256', 43, -32, 1),
(192, 11, '29:28:07.273256', 43, -32, 1),
(193, 11, '29:28:07.273256', 43, -32, 1),
(194, 11, '29:28:07.273256', 43, -32, 1),
(195, 11, '29:28:07.273256', 99, -32, 1),
(196, 11, '29:28:07.273256', 99, -32, 1),
(197, 11, '29:28:07.273256', 99, -32, 1),
(198, 11, '29:28:07.273256', 99, -32, 1),
(199, 11, '29:28:07.273256', 99, -32, 1),
(200, 11, '29:28:07.273256', 99, -32, 1),
(201, 11, '29:28:07.273256', 45, 48, 1),
(202, 11, '29:28:07.273256', 45, 48, 1),
(203, 11, '29:28:07.273256', 45, 48, 1),
(204, 11, '29:28:07.273256', 45, 48, 1),
(205, 11, '29:28:07.273256', 45, 48, 1),
(206, 11, '29:28:07.273256', 45, 48, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE `Event` (
  `EventID` int(10) UNSIGNED NOT NULL,
  `ClientLocationID` int(10) UNSIGNED DEFAULT NULL,
  `ProductID` int(10) UNSIGNED DEFAULT NULL,
  `CampaignID` int(10) UNSIGNED DEFAULT NULL,
  `Content` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ImplicitWishlist`
--

CREATE TABLE `ImplicitWishlist` (
  `ImplicitWishlistID` int(10) UNSIGNED NOT NULL,
  `ClientID` int(10) UNSIGNED DEFAULT NULL,
  `ProductID` int(10) UNSIGNED DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ImplicitWishlist`
--

INSERT INTO `ImplicitWishlist` (`ImplicitWishlistID`, `ClientID`, `ProductID`, `StartDate`, `EndDate`) VALUES
(1, 5, 55, NULL, NULL),
(2, 7, 45, NULL, NULL),
(3, 8, 53, NULL, NULL),
(4, 9, 53, NULL, NULL),
(5, 9, 55, NULL, NULL),
(6, 9, 61, NULL, NULL),
(7, 19, 36, NULL, NULL),
(8, 8, 36, NULL, NULL),
(9, 7, 48, NULL, NULL),
(10, 5, 56, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Pattern`
--

CREATE TABLE `Pattern` (
  `PatternID` int(10) UNSIGNED NOT NULL,
  `EventID` int(10) UNSIGNED DEFAULT NULL,
  `Duration` time DEFAULT NULL,
  `NotificationID` int(10) UNSIGNED DEFAULT NULL,
  `TransactionID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Recommendation`
--

CREATE TABLE `Recommendation` (
  `RecommendationID` int(10) UNSIGNED NOT NULL,
  `ClientLocationID` int(10) UNSIGNED DEFAULT NULL,
  `NotificationID` int(10) UNSIGNED DEFAULT NULL,
  `TransactionID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Session`
--

CREATE TABLE `Session` (
  `SessionID` int(10) UNSIGNED NOT NULL,
  `ClientID` int(10) UNSIGNED DEFAULT NULL,
  `StartTime` time(6) DEFAULT NULL,
  `EndTime` time(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Session`
--

INSERT INTO `Session` (`SessionID`, `ClientID`, `StartTime`, `EndTime`) VALUES
(8, 5, '19:23:46.000000', '19:23:46.000000'),
(9, 7, '19:23:46.000000', '19:23:46.000000'),
(10, 8, '19:23:46.000000', '19:23:46.000000'),
(11, 9, '19:23:46.000000', '19:23:46.000000');

-- --------------------------------------------------------

--
-- Table structure for table `SmartNotification`
--

CREATE TABLE `SmartNotification` (
  `NotificationID` int(10) UNSIGNED NOT NULL,
  `ClientID` int(10) UNSIGNED DEFAULT NULL,
  `ProductID` int(10) UNSIGNED DEFAULT NULL,
  `Content` varchar(100) DEFAULT NULL,
  `CampaignID` int(10) UNSIGNED DEFAULT NULL,
  `SentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ClientLocation`
--
ALTER TABLE `ClientLocation`
  ADD PRIMARY KEY (`ClientLocationID`),
  ADD KEY `SessionID` (`SessionID`);

--
-- Indexes for table `Event`
--
ALTER TABLE `Event`
  ADD PRIMARY KEY (`EventID`),
  ADD KEY `ClientLocationID` (`ClientLocationID`);

--
-- Indexes for table `ImplicitWishlist`
--
ALTER TABLE `ImplicitWishlist`
  ADD PRIMARY KEY (`ImplicitWishlistID`);

--
-- Indexes for table `Pattern`
--
ALTER TABLE `Pattern`
  ADD PRIMARY KEY (`PatternID`),
  ADD KEY `NotificationID` (`NotificationID`),
  ADD KEY `EventID` (`EventID`);

--
-- Indexes for table `Recommendation`
--
ALTER TABLE `Recommendation`
  ADD PRIMARY KEY (`RecommendationID`),
  ADD KEY `ClientLocationID` (`ClientLocationID`),
  ADD KEY `NotificationID` (`NotificationID`);

--
-- Indexes for table `Session`
--
ALTER TABLE `Session`
  ADD PRIMARY KEY (`SessionID`);

--
-- Indexes for table `SmartNotification`
--
ALTER TABLE `SmartNotification`
  ADD PRIMARY KEY (`NotificationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ClientLocation`
--
ALTER TABLE `ClientLocation`
  MODIFY `ClientLocationID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `Event`
--
ALTER TABLE `Event`
  MODIFY `EventID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ImplicitWishlist`
--
ALTER TABLE `ImplicitWishlist`
  MODIFY `ImplicitWishlistID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Pattern`
--
ALTER TABLE `Pattern`
  MODIFY `PatternID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Recommendation`
--
ALTER TABLE `Recommendation`
  MODIFY `RecommendationID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Session`
--
ALTER TABLE `Session`
  MODIFY `SessionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `SmartNotification`
--
ALTER TABLE `SmartNotification`
  MODIFY `NotificationID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ClientLocation`
--
ALTER TABLE `ClientLocation`
  ADD CONSTRAINT `clientlocation_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `Session` (`SessionID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Event`
--
ALTER TABLE `Event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`ClientLocationID`) REFERENCES `ClientLocation` (`ClientLocationID`);

--
-- Constraints for table `Pattern`
--
ALTER TABLE `Pattern`
  ADD CONSTRAINT `pattern_ibfk_1` FOREIGN KEY (`NotificationID`) REFERENCES `SmartNotification` (`NotificationID`),
  ADD CONSTRAINT `pattern_ibfk_2` FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`);

--
-- Constraints for table `Recommendation`
--
ALTER TABLE `Recommendation`
  ADD CONSTRAINT `recommendation_ibfk_1` FOREIGN KEY (`ClientLocationID`) REFERENCES `ClientLocation` (`ClientLocationID`),
  ADD CONSTRAINT `recommendation_ibfk_2` FOREIGN KEY (`NotificationID`) REFERENCES `SmartNotification` (`NotificationID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
