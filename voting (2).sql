-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2022 at 10:08 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voting`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id` int(11) NOT NULL,
  `Passsword` varchar(50) CHARACTER SET utf8 NOT NULL,
  `UserName` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Id`, `Passsword`, `UserName`) VALUES
(1, '123', 'ahmed@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE `candidate` (
  `AdminId` int(11) NOT NULL DEFAULT 1,
  `ElectionId` int(11) NOT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Id` int(11) NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Photo` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`AdminId`, `ElectionId`, `FirstName`, `Id`, `LastName`, `Photo`) VALUES
(1, 1, 'Harry', 1, 'Potter', '../image/ Screenshot (21).png');

-- --------------------------------------------------------

--
-- Table structure for table `election`
--

CREATE TABLE `election` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `EndDate` date NOT NULL,
  `AdminId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `election`
--

INSERT INTO `election` (`Id`, `Name`, `EndDate`, `AdminId`) VALUES
(1, 'elshap', '2022-05-11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `voter`
--

CREATE TABLE `voter` (
  `Id` int(11) NOT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `LastName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Password` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Photo` varchar(50) CHARACTER SET utf8 NOT NULL,
  `AdminId` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`) USING BTREE,
  ADD KEY `AdminId` (`AdminId`),
  ADD KEY `ElectionId` (`ElectionId`),
  ADD KEY `Id_2` (`Id`),
  ADD KEY `Id_3` (`Id`);

--
-- Indexes for table `election`
--
ALTER TABLE `election`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `AdminId` (`AdminId`);

--
-- Indexes for table `voter`
--
ALTER TABLE `voter`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `AdminId` (`AdminId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `election`
--
ALTER TABLE `election`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `voter`
--
ALTER TABLE `voter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202200017;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `election`
--
ALTER TABLE `election`
  ADD CONSTRAINT `election_ibfk_1` FOREIGN KEY (`AdminId`) REFERENCES `admin` (`Id`);

--
-- Constraints for table `voter`
--
ALTER TABLE `voter`
  ADD CONSTRAINT `voter_ibfk_1` FOREIGN KEY (`AdminId`) REFERENCES `admin` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
