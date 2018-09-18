-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 18, 2018 at 09:17 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.0.31

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
  `date` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `reason` text NOT NULL,
  `createdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `date`, `status`, `userID`, `reason`, `createdate`) VALUES
(14, 'new', 'new', 15, 'new', '2018-09-17 13:46:03'),
(15, 'new', 'new', 16, 'new', '2018-09-17 13:46:58'),
(16, 'new', 'new', 17, 'new', '2018-09-17 13:47:51'),
(17, 'new', 'new', 18, 'new', '2018-09-17 13:48:34'),
(18, '2018-09-02', 'p', 15, 'na', '2018-09-17 13:58:18'),
(19, '2018-09-02', 'p', 16, 'na', '2018-09-17 13:58:55'),
(20, '2018-09-02', 'p', 17, 'na', '2018-09-17 13:59:00'),
(21, '2018-09-03', 'p', 15, 'na', '2018-09-18 09:06:59'),
(22, '2018-09-03', 'p', 18, 'na', '2018-09-18 09:07:10'),
(23, '2018-09-03', 'p', 16, 'na', '2018-09-18 09:09:17'),
(24, '2018-09-03', 'p', 17, 'na', '2018-09-18 09:09:22'),
(25, '2018-09-02', 'p', 18, 'na', '2018-09-18 09:10:29'),
(26, '2018-09-06', 'p', 17, 'na', '2018-09-18 09:10:43');

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
(15, 'Themba', 'Mthembu', 'themba@mail.com', '9021821083012', 'Test', 'saint', 'Test', '2018-09-13', '2018-09-17 13:46:03', 'active', NULL, NULL, 'Mthembu', 'Dr', 'Aldult', 'Single'),
(16, 'Nelly', 'Ndlovu', 'nellynd@telkom.co.za', '07863627', 'TEST', 'saint', 'HR MANAGER', '2018-09-14', '2018-09-17 13:46:58', 'active', NULL, NULL, 'Ndlovu', 'Mrs', 'Aldult', 'Married'),
(17, 'THUSO', 'NDLOVU', 'thusu@mail.com', '92812891', 'Test', 'saint', 'NA', '2018-09-06', '2018-09-17 13:47:51', 'active', NULL, NULL, 'NDLOVU', 'Mr', 'Youth', 'Single'),
(18, 'Ndumiso', 'Mthembu', 'nlb2@mail.com', '0842672817', 'Test', 'saint', 'Software Dev', '2018-09-19', '2018-09-17 13:48:34', 'active', NULL, NULL, 'Mthembu', 'Mr', 'Youth', 'Single');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
