-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2025 at 07:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `funeral_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `aids`
--

CREATE TABLE `aids` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT 0.00,
  `item_id` int(11) DEFAULT NULL,
  `aid_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contributions`
--

CREATE TABLE `contributions` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `contribution_amount` decimal(10,2) DEFAULT 0.00,
  `fine_amount` decimal(10,2) DEFAULT 0.00,
  `contribution_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `death`
--

CREATE TABLE `death` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person_name` varchar(100) NOT NULL,
  `date_of_death` date NOT NULL,
  `cause_of_death` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `death_id` int(11) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `donation_qty` int(11) NOT NULL,
  `donation_date` date NOT NULL,
  `amount` decimal(10,2) DEFAULT 0.00,
  `returned_qty` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `member_id`, `death_id`, `item_id`, `donation_qty`, `donation_date`, `amount`, `returned_qty`) VALUES
(2, 11, NULL, 5, 2, '2025-08-09', 0.00, 2),
(3, 11, NULL, 2, 50, '2025-08-09', 0.00, 50),
(4, 11, NULL, 3, 10, '2025-08-09', 0.00, 10),
(5, 11, NULL, 5, 2, '2025-08-09', 0.00, 2),
(6, 11, NULL, 2, 50, '2025-08-09', 0.00, 50),
(7, 11, NULL, 3, 10, '2025-08-09', 0.00, 10),
(8, 11, NULL, 5, 4, '2025-08-09', 0.00, 4),
(9, 11, NULL, 2, 50, '2025-08-09', 0.00, 50),
(10, 11, NULL, 3, 10, '2025-08-09', 0.00, 10),
(11, 13, NULL, 5, 1, '2025-08-09', 0.00, 1),
(12, 13, NULL, 2, 25, '2025-08-09', 0.00, 25),
(13, 13, NULL, 3, 5, '2025-08-09', 0.00, 5),
(14, 12, NULL, 2, 20, '2025-07-01', 0.00, 20),
(15, 12, NULL, 3, 2, '2025-07-01', 0.00, 2),
(16, 12, NULL, 2, 20, '2025-07-01', 0.00, 20),
(17, 12, NULL, 3, 2, '2025-07-01', 0.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `total_qty` int(11) DEFAULT 0,
  `current_qty` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `item_name`, `total_qty`, `current_qty`) VALUES
(2, 'Chair', 100, 100),
(3, 'Table', 20, 20),
(5, 'Canopies', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(50) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nic` varchar(20) DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `reg_no`, `full_name`, `address`, `dob`, `nic`, `joined_date`, `phone`, `photo`, `email`, `status`, `gender`) VALUES
(11, '1', 'A.B Silva', 'a', '2000-08-14', '723642585V', '2025-08-01', '0784561238', NULL, 'sample@gmail.com', 'active', 'Male'),
(12, '2', 'Saman Kumara', 'ww', '1995-08-07', '75894589V', '2025-08-01', '0784561238', NULL, 'sss@gmail.com', 'active', ''),
(13, '3', 'Kasuni Uthpala', 'dd', '1975-08-21', '222222222V', '2023-08-21', '0777123456', NULL, 'sss@gmail.com', 'active', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `member_relations`
--

CREATE TABLE `member_relations` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `relation_name` varchar(100) NOT NULL,
  `relation_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `reg_no` varchar(50) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nic` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `relation_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `reg_no`, `full_name`, `address`, `dob`, `nic`, `phone`, `gender`, `relation_type`) VALUES
(3, '1', 'Kasuni Perera', 'aa', '2025-08-07', 'no', 'no', 'Male', 'Child'),
(4, '1', 'Ranjani P Perera', 'ss', '2025-08-01', 'no', 'no', 'Female', 'Child'),
(5, '3', 'Nirmali Shanthi', 'ggg', '1990-08-14', '723642585V', '1234567891', 'Female', 'Spouse');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `name`) VALUES
(1, 'admin', 'admin123', 'admin', 'Lahiru Perera'),
(3, 'Lahiru', 'R123456', 'user', 'Randima Perera');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aids`
--
ALTER TABLE `aids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `contributions`
--
ALTER TABLE `contributions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `death`
--
ALTER TABLE `death`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `member_no` (`reg_no`) USING BTREE;

--
-- Indexes for table `member_relations`
--
ALTER TABLE `member_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aids`
--
ALTER TABLE `aids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contributions`
--
ALTER TABLE `contributions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `death`
--
ALTER TABLE `death`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `member_relations`
--
ALTER TABLE `member_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aids`
--
ALTER TABLE `aids`
  ADD CONSTRAINT `aids_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  ADD CONSTRAINT `aids_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`id`);

--
-- Constraints for table `contributions`
--
ALTER TABLE `contributions`
  ADD CONSTRAINT `contributions_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`);

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
  ADD CONSTRAINT `donations_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`id`);

--
-- Constraints for table `member_relations`
--
ALTER TABLE `member_relations`
  ADD CONSTRAINT `member_relations_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
