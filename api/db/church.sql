-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2018 at 02:04 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `church`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` int(10) NOT NULL,
  `createDate` datetime NOT NULL,
  `title` varchar(150) NOT NULL,
  `notes` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assert`
--

CREATE TABLE `assert` (
  `id` int(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `datePurchased` datetime NOT NULL,
  `status` varchar(30) NOT NULL,
  `cetergory` int(10) NOT NULL,
  `createdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `id` int(10) NOT NULL,
  `noteID` int(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `file` text NOT NULL,
  `createDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `discription` text NOT NULL,
  `status` varchar(30) NOT NULL,
  `createdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(10) NOT NULL,
  `title` varchar(150) NOT NULL,
  `discription` text NOT NULL,
  `date` datetime NOT NULL,
  `time` varchar(10) NOT NULL,
  `location` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_member`
--

CREATE TABLE `event_member` (
  `id` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `eventId` int(10) NOT NULL,
  `createDate` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(10) NOT NULL,
  `title` text NOT NULL,
  `discription` text NOT NULL,
  `createDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `reason` text NOT NULL,
  `createdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cell` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `role` varchar(30) NOT NULL,
  `acuptation` varchar(150) NOT NULL,
  `dateJoined` varchar(30) NOT NULL,
  `createdate` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `modifiledBy` int(10) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `title` varchar(10) NOT NULL,
  `agegroup` varchar(30) NOT NULL,
  `meritalStatus` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `cell`, `address`, `role`, `acuptation`, `dateJoined`, `createdate`, `status`, `modifiedDate`, `modifiledBy`, `password`, `title`, `agegroup`, `meritalStatus`) VALUES
(2, 'User', '', 'user@saintio.com', '', '', 'admin', '', '2018-09-03 00:00:00', '2018-09-18 00:00:00', '', NULL, NULL, 'pass', '', '', ''),
(3, 'xsdfg', 'xDSfcv', 'zsda@erfg', 'sadfg', 'zsdff', 'saint', 'zsadf', '0000-00-00 00:00:00', '2018-09-10 22:50:04', 'active', NULL, NULL, 'xDSfcv', 'Youth', 'Dr', 'w'),
(4, 'Ntombi', 'Manyoni', 'queries@ndu-systems.net', '08454545', 'Ulundi', 'saint', 'Nurse', '0000-00-00 00:00:00', '2018-09-10 22:57:35', 'active', NULL, NULL, 'Manyoni', 'Mrs', 'Aldult', 'Maried'),
(5, 'Nkosi', 'Mthembu', 'info@mail.com', '02988977', 'na', 'saint', 'Na', '0000-00-00 00:00:00', '2018-09-10 23:08:27', 'active', NULL, NULL, 'Mthembu', 'Mr', 'Sunday School', 'single'),
(6, 'queries@ndu-systems.net', 'mrnnmthembu@gmail.com', 'mrnnmthembu@gmail.com', 'mrnnmthembu@gma', 'kmj', 'saint', 'mrnnmthembu@gmail.com', '0000-00-00 00:00:00', '2018-09-10 23:09:14', 'active', NULL, NULL, 'mrnnmthembu@gmail.com', 'Dr', 'Youth', '6'),
(7, 'SADFgh', 'xSDFg', 'SDFg@efgb', 'fstyr', 'xsdfg', 'saint', 'xSDF', '2018-09-12', '2018-09-10 23:24:59', 'active', NULL, NULL, 'xSDFg', 'Dr', 'Sunday School', '43'),
(8, 'sadaf', 'zsadf', 'xsda@wefsd', 'swerty', 'asadf', 'saint', 'sdfsd', '2018-09-19', '2018-09-13 21:41:08', 'active', NULL, NULL, 'zsadf', 'Mrs', 'Sunday School', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assert`
--
ALTER TABLE `assert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_member`
--
ALTER TABLE `event_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assert`
--
ALTER TABLE `assert`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_member`
--
ALTER TABLE `event_member`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
