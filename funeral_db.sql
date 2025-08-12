-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2025 at 10:26 PM
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
  `donor_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `donation_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aids`
--

INSERT INTO `aids` (`id`, `donor_id`, `death_id`, `total_amount`, `donation_date`, `notes`, `created_at`) VALUES
(4, 14, 16, 30000.00, '2025-07-31', 'Hand over to 50000 Lkr', '2025-08-09 19:51:28'),
(5, 15, 17, 12500.00, '2025-08-10', 'Handing over Mr:kasun Perera', '2025-08-09 21:59:36'),
(6, 17, 18, 18000.00, '2025-06-11', '', '2025-08-09 22:35:58');

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

--
-- Dumping data for table `death`
--

INSERT INTO `death` (`id`, `reg_no`, `person_name`, `date_of_death`, `cause_of_death`, `notes`, `created_at`) VALUES
(16, '700000000V', 'Saman Kumara', '2025-07-31', 'an accident', 'Funeral Date - 2025.08.02', '2025-08-09 19:49:02'),
(17, '800000000V', 'Indika Sadaruvan', '2025-08-10', 'an accident', 'funeral date - 2025.08.13', '2025-08-09 21:58:03'),
(18, '911111111V', 'Nimal Dayarathna', '2025-06-11', 'an accident', '', '2025-08-09 22:35:22');

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
  `returned_qty` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `member_id`, `death_id`, `item_id`, `donation_qty`, `donation_date`, `returned_qty`) VALUES
(54, 14, 16, 14, 2, '2025-07-31', 2),
(55, 14, 16, 13, 10, '2025-07-31', 10),
(56, 14, 16, 11, 10, '2025-07-31', 10),
(57, 14, 16, 12, 10, '2025-07-31', 10),
(68, 15, 17, 14, 1, '2025-08-10', 0),
(69, 15, 17, 13, 10, '2025-08-10', 0),
(70, 15, 17, 11, 2, '2025-08-10', 0),
(71, 15, 17, 12, 2, '2025-08-10', 0),
(72, 17, 18, 14, 2, '2025-06-11', 0),
(73, 17, 18, 13, 5, '2025-06-11', 0),
(74, 17, 18, 11, 5, '2025-06-11', 0),
(75, 17, 18, 12, 5, '2025-06-11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `event_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `event_date`, `created_at`) VALUES
(1, 'Meeting', 'Meeting at Conference Hall in Mathle', '2025-08-15', '2025-08-12 20:19:50'),
(2, 'Funeral', 'Mr. Sampath (Reg Number 13) Past away at 2025.08.10 and Funeral in Cemetery in Matale', '2025-08-15', '2025-08-12 20:21:43'),
(3, 'Meeting', 'Sample Meeting', '2025-08-22', '2025-08-12 20:22:09'),
(4, 'Sample', 'Sample', '2025-08-04', '2025-08-12 20:23:03');

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
(11, 'Table', 20, 13),
(12, 'Table Umbrella', 20, 13),
(13, 'Chair', 20, 5),
(14, 'Canopies', 10, 7);

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
(14, '1', 'Jhon Saparamadu', '7/2, Kalaniya', '1970-08-24', '700000000V', '2024-08-01', '1111111111', NULL, 'sample@gmail.com', 'active', 'Male'),
(15, '2', 'Kasun Perera', '2/87, Grandpass, Colombo 12', '1980-08-03', '723642585V', '2021-08-26', '2222222222', NULL, 'sample@gmail.com', 'active', 'Male'),
(16, '3', 'Kasuni Uthpala', '125/54, Gothtuwa, colombo', '1965-08-19', '655555555V', '2020-07-15', '3333333333', NULL, 'sample@gmail.com', 'active', 'Female'),
(17, '4', 'Nimal Dayarathna', 'No8, Katunayake', '1991-08-05', '911111111V', '2019-07-27', '7777777777', NULL, 'sample@gmail.com', 'active', 'Male');

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
(6, '1', 'Saman Kumara', '7/2, Kalaniya', '1995-08-05', '779777777V', '255555555', 'Male', 'Child'),
(7, '1', 'Ranjan Perera', '7/2, Kalaniya', '1995-08-27', '980000000V', '5555555555', 'Male', 'Child'),
(8, '2', 'Indika Sadaruvan', '2/87, Grandpass, Colombo 12', '1995-09-02', '955555555V', '5555555555', 'Male', 'Child'),
(10, '1', 'Kasuni Tharanga', '7/2, Kalaniya', '1998-07-31', '77777777', '7777777777', 'Female', 'Parent');

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
(1, 'admin', 'admin123', 'admin', 'Lahiru Perera');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aids`
--
ALTER TABLE `aids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `death_id` (`death_id`);

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
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contributions`
--
ALTER TABLE `contributions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `death`
--
ALTER TABLE `death`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `member_relations`
--
ALTER TABLE `member_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  ADD CONSTRAINT `aids_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `death` (`id`) ON DELETE CASCADE;

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
