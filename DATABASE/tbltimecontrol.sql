-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2025 at 10:54 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dlc_cbtconverted`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbltimecontrol`
--

CREATE TABLE `tbltimecontrol` (
  `id` int(11) NOT NULL,
  `candidateid` int(11) NOT NULL,
  `testid` int(11) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `curenttime` datetime DEFAULT NULL,
  `elapsed` int(11) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `securitycode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbltimecontrol`
--

INSERT INTO `tbltimecontrol` (`id`, `candidateid`, `testid`, `ip`, `starttime`, `curenttime`, `elapsed`, `completed`, `securitycode`) VALUES
(518, 1, 9, '', NULL, NULL, 0, 0, NULL),
(520, 3, 9, '', NULL, NULL, 0, 0, NULL),
(577, 7, 9, '::1', '2025-06-19 10:22:08', '2025-06-19 10:22:08', 1750321328, 1, NULL),
(679, 4, 9, '::1', '2025-06-19 10:20:36', '2025-06-19 10:25:50', 314, 1, NULL),
(681, 30, 9, '::1', '2025-06-19 10:26:03', '2025-06-19 10:26:03', 1750321563, 1, NULL),
(683, 13, 9, '::1', '2025-06-19 10:38:43', '2025-06-19 10:38:43', 1750322323, 1, NULL),
(961, 14, 9, '::1', '2025-06-19 10:39:37', '2025-06-19 10:53:05', 808, 1, NULL),
(963, 15, 9, '::1', '2025-06-19 10:54:02', '2025-06-19 10:54:02', 1750323242, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbltimecontrol`
--
ALTER TABLE `tbltimecontrol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `candidate_test` (`candidateid`,`testid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbltimecontrol`
--
ALTER TABLE `tbltimecontrol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=964;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
