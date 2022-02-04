-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 04, 2022 at 11:53 AM
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
(41, 8, '19:23:46.000000', 50, 50, 1),
(42, 8, '19:23:46.000000', 46, 50, 1),
(43, 8, '19:23:46.000000', 42, 46, 1),
(44, 8, '19:23:46.000000', 46, 50, 1),
(45, 8, '19:23:46.000000', 50, 54, 1),
(46, 9, '19:23:46.000000', 10, 15, 1),
(47, 9, '19:23:46.000000', 13, 13, 1),
(48, 9, '19:23:46.000000', 10, 15, 1),
(49, 9, '19:23:46.000000', 8, 19, 1),
(50, 9, '19:23:46.000000', 10, 15, 1),
(51, 10, '19:23:46.000000', 0, 0, 2),
(52, 10, '19:23:46.000000', -4, 4, 2),
(53, 10, '19:23:46.000000', 0, 0, 2),
(54, 10, '19:23:46.000000', 3, 3, 2);

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
(9, 13, '19:23:46.000000', '19:23:46.000000'),
(10, 24, '19:23:46.000000', '19:23:46.000000');

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
  MODIFY `ClientLocationID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `Event`
--
ALTER TABLE `Event`
  MODIFY `EventID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ImplicitWishlist`
--
ALTER TABLE `ImplicitWishlist`
  MODIFY `ImplicitWishlistID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `SessionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
