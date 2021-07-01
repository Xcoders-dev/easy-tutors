-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2021 at 03:57 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easytuitions`
--

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(255) NOT NULL,
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `P_Num` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `FName`, `LName`, `email`, `password`, `P_Num`) VALUES
(1, 'Nawaz', 'Alsg', '4', '', '588');

-- --------------------------------------------------------

--
-- Table structure for table `tuitionrequest`
--

CREATE TABLE `tuitionrequest` (
  `id` int(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `daysWeekly` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `studentClass` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `salary` varchar(255) NOT NULL,
  `tutorEmail` varchar(255) DEFAULT NULL,
  `studentEmail` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tuitionrequest_temp`
--

CREATE TABLE `tuitionrequest_temp` (
  `id` int(11) NOT NULL,
  `tuitionRequest_ID` int(11) NOT NULL,
  `studentEmail` varchar(255) NOT NULL,
  `tutorEmail` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `id` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  `P_Num` varchar(255) NOT NULL,
  `pref_city` varchar(255) DEFAULT NULL,
  `expected_Sal` varchar(255) DEFAULT NULL,
  `about_me` varchar(255) DEFAULT NULL,
  `avail_time_from` varchar(255) DEFAULT NULL,
  `avail_time_to` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`id`, `email`, `password`, `FName`, `LName`, `P_Num`, `pref_city`, `expected_Sal`, `about_me`, `avail_time_from`, `avail_time_to`, `gender`) VALUES
(1, 'tr@y.com', '12345678', 'djdj', 'dndn', '0498656497', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'tr@', '12345678', 'djdj', 'dndn', '0498656497', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'tr@gmail.com', '12345678', 'djdj', 'dndn', '0498656497', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'trddk@y.com', 'qqqqqqqq', 'jam', 'dicky', '01163648552', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'A@A', 'req.body.password', 'req.body.FName', 'req.body.LName', '0', 'req.body.pre_city', '2', 'req.body.about_me', '0', 'req.body.avail_time_to', 'male'),
(6, 'A@Aalam', '', 'MD NEWAZ Alam', 'Alam', '56566', '', '22', 'My greatest passion in life is teaching. I was born and raised in Sydney, and experienced great success at school and at university due to amazing and unforgettable teachers. This is the foundation of my commitment to helping out my students, whatever the', 'sjshd', 'shsh', 'undefined');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tuitionrequest`
--
ALTER TABLE `tuitionrequest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tuitionrequest_temp`
--
ALTER TABLE `tuitionrequest_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tuitionrequest`
--
ALTER TABLE `tuitionrequest`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tuitionrequest_temp`
--
ALTER TABLE `tuitionrequest_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
