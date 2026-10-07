-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2026 at 07:12 AM
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
-- Database: `laundry_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `created_at`) VALUES
(1, 1, 'Created new order: ORD-20260913092708-160', '2026-09-13 07:27:08'),
(2, 1, 'Recorded payment of ₱50.00 for order: ORD-20260913092708-160', '2026-09-13 07:30:15'),
(3, 1, 'Added new customer: Pia Dog', '2026-10-04 22:56:49'),
(4, 1, 'Updated customer: Pia Dog', '2026-10-04 23:00:03'),
(5, 1, 'Deleted customer: Pia Dog', '2026-10-04 23:03:51'),
(6, 1, 'Updated customer: PIA PILAYa', '2026-10-04 23:04:00'),
(7, 1, 'Added new customer: DOg pia', '2026-10-04 23:04:36'),
(8, 1, 'Updated customer: DOg pia', '2026-10-04 23:04:44'),
(9, 1, 'Created new order: ORD-20261005010550-324', '2026-10-04 23:05:50'),
(10, 1, 'Updated order ORD-20260913084803-383 status from Drying to Claimed', '2026-10-04 23:07:52'),
(11, 1, 'Updated order ORD-20260913084803-383 status from Claimed to Received', '2026-10-04 23:08:02'),
(12, 1, 'Updated order ORD-20261005010550-324 status from Received to Claimed', '2026-10-04 23:09:00'),
(13, 1, 'Added new customer: superman', '2026-10-04 23:09:27'),
(14, 1, 'Created new order: ORD-20261005011013-699', '2026-10-04 23:10:13'),
(15, 1, 'Updated order ORD-20260913090746-253 status from Received to Ready', '2026-10-04 23:10:30'),
(16, 1, 'Updated order ORD-20260913092708-160 status from Received to Ready', '2026-10-04 23:11:15'),
(17, 1, 'Updated order ORD-20260913092708-160 status from Ready to Claimed', '2026-10-04 23:11:37'),
(18, 1, 'Added new service: washing ironing', '2026-10-04 23:17:36'),
(19, 1, 'Updated service: Dry Cleaning Ironing', '2026-10-04 23:20:05'),
(20, 1, 'Updated service: Self-Service (DIY) Laundromat', '2026-10-04 23:21:41'),
(21, 1, 'Deleted service: Self-Service (DIY) Laundromat', '2026-10-04 23:21:48'),
(22, 1, 'Added new customer: batman', '2026-10-04 23:36:15'),
(23, 1, 'Updated customer: batman', '2026-10-04 23:36:30'),
(24, 1, 'Deleted customer: batman', '2026-10-04 23:37:13'),
(25, 1, 'Added new service: folding', '2026-10-04 23:37:54'),
(26, 1, 'Created new order: ORD-20261005013844-398', '2026-10-04 23:38:44'),
(27, 1, 'Recorded payment of ₱50.00 for order: ORD-20260913092708-160', '2026-10-04 23:39:38'),
(28, 1, 'Updated order ORD-20261005010550-324 status from Claimed to Ready', '2026-10-04 23:40:53'),
(29, 1, 'Updated order ORD-20260913092708-160 status from Claimed to Ready', '2026-10-04 23:41:03');

-- --------------------------------------------------------

--
-- Table structure for table `bag_sizes`
--

CREATE TABLE `bag_sizes` (
  `id` int(11) NOT NULL,
  `bag_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bag_sizes`
--

INSERT INTO `bag_sizes` (`id`, `bag_name`, `description`, `status`, `created_at`) VALUES
(1, 'Small', 'Small laundry bag', 'active', '2026-09-13 03:19:50'),
(2, 'Medium', 'Medium laundry bag', 'active', '2026-09-13 03:19:50'),
(3, 'Large', 'Large laundry bag', 'inactive', '2026-09-13 03:19:50');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `fullname`, `contact`, `address`, `created_at`) VALUES
(1, 'PIA PILAYa', '1236547890', 'Pag Asa Rizas', '2026-09-13 03:40:46'),
(3, 'DOg pia', '545\\21', 'HAhhahahah', '2026-10-04 23:04:36'),
(4, 'superman', '24544215464', 'ngek', '2026-10-04 23:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `laundry_orders`
--

CREATE TABLE `laundry_orders` (
  `id` int(11) NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `bag_size_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `amount_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_status` enum('unpaid','partial','paid') NOT NULL DEFAULT 'unpaid',
  `order_status` enum('received','washing','drying','folding','ready','claimed') NOT NULL DEFAULT 'received',
  `received_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `claimed_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laundry_orders`
--

INSERT INTO `laundry_orders` (`id`, `order_number`, `customer_id`, `service_id`, `bag_size_id`, `quantity`, `total_amount`, `amount_paid`, `payment_status`, `order_status`, `received_at`, `claimed_at`, `created_by`) VALUES
(1, 'ORD-20260913080928-562', 1, 16, 2, 10, 600.00, 600.00, 'paid', 'claimed', '2026-09-13 06:09:28', NULL, 1),
(2, 'ORD-20260913082905-150', 1, 14, 2, 15, 600.00, 600.00, 'paid', 'received', '2026-09-13 06:29:05', NULL, 1),
(3, 'ORD-20260913084103-448', 1, 15, 2, 10, 300.00, 300.00, 'paid', 'received', '2026-09-13 06:41:03', NULL, 1),
(4, 'ORD-20260913084526-676', 1, 16, 1, 5, 300.00, 300.00, 'paid', 'received', '2026-09-13 06:45:26', NULL, 1),
(5, 'ORD-20260913084803-383', 1, 16, 2, 5, 300.00, 300.00, 'paid', 'received', '2026-09-13 06:48:03', NULL, 1),
(6, 'ORD-20260913090746-253', 1, 16, 2, 12, 715.20, 715.20, 'paid', 'ready', '2026-09-13 07:07:46', NULL, 1),
(7, 'ORD-20260913092708-160', 1, 14, 1, 5, 200.00, 200.00, 'paid', 'ready', '2026-09-13 07:27:08', NULL, 1),
(8, 'ORD-20261005010550-324', 3, 14, 2, 12, 480.00, 480.00, 'paid', 'ready', '2026-10-04 23:05:50', NULL, 1),
(9, 'ORD-20261005011013-699', 4, 15, 1, 5, 150.00, 150.00, 'paid', 'received', '2026-10-04 23:10:13', NULL, 1),
(10, 'ORD-20261005013844-398', 4, 16, 2, 10, 600.00, 600.00, 'paid', 'received', '2026-10-04 23:38:44', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `recorded_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `amount`, `payment_date`, `recorded_by`) VALUES
(1, 3, 300.00, '2026-09-13 06:41:03', 1),
(2, 4, 300.00, '2026-09-13 06:47:00', 1),
(3, 5, 100.00, '2026-09-13 06:48:03', 1),
(4, 5, 200.00, '2026-09-13 06:49:05', 1),
(5, 5, 200.00, '2026-09-13 07:08:47', 1),
(6, 7, 50.00, '2026-09-13 07:30:15', 1),
(7, 8, 480.00, '2026-10-04 23:05:50', 1),
(8, 7, 100.00, '2026-10-04 23:07:38', 1),
(9, 6, 715.20, '2026-10-04 23:08:31', 1),
(10, 9, 150.00, '2026-10-04 23:10:13', 1),
(11, 10, 600.00, '2026-10-04 23:38:44', 1),
(12, 7, 50.00, '2026-10-04 23:39:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `price_per_kg` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`id`, `service_id`, `price_per_kg`, `created_at`) VALUES
(1, 14, 40.00, '2026-09-13 06:06:02'),
(2, 15, 30.00, '2026-09-13 06:06:02'),
(3, 16, 60.00, '2026-09-13 06:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `description_en` text DEFAULT NULL,
  `description_tl` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `description_en`, `description_tl`, `description`, `price`, `status`, `created_at`) VALUES
(11, 'Dry Cleaning Ironing', 'jajbbs', 'jnsaj', NULL, 0.00, 'active', '2026-09-13 05:20:54'),
(12, 'Pressing & Ironing', 'Professional steam or heat pressing to provide crisp, wrinkle-free business attire and uniforms.', 'Propesyonal na pagpaplantsa gamit ang steam o init upang masiguradong diretso, maayos, at walang kulubot ang mga uniporme at damit-pang-opisina.', NULL, 0.00, 'active', '2026-09-13 05:21:37'),
(14, 'Wash', 'asd', 'fas', NULL, NULL, 'active', '2026-09-13 06:03:20'),
(15, 'Fold', 'asffs', 'sfafsd', NULL, NULL, 'active', '2026-09-13 06:03:32'),
(16, 'Ironing', 'dgfsdasdf', 'adfadsf', NULL, NULL, 'active', '2026-09-13 06:03:45'),
(17, 'washing ironing', 'eme', 'eme', NULL, NULL, 'active', '2026-10-04 23:17:36'),
(18, 'folding', 'hgjhjv', 'hfhfghhg', NULL, NULL, 'active', '2026-10-04 23:37:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','employee') NOT NULL DEFAULT 'employee',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `password`, `role`, `status`, `created_at`) VALUES
(1, 'System Administrator', 'admin', '$2y$10$ZcTC1ss1Mo2/rfTGWZWyMe/Z/slomBV8XLmrtlBW22C2.UTEOD4zW', 'admin', 'active', '2026-09-13 03:19:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bag_sizes`
--
ALTER TABLE `bag_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laundry_orders`
--
ALTER TABLE `laundry_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `bag_size_id` (`bag_size_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `recorded_by` (`recorded_by`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
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
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `bag_sizes`
--
ALTER TABLE `bag_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `laundry_orders`
--
ALTER TABLE `laundry_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `laundry_orders`
--
ALTER TABLE `laundry_orders`
  ADD CONSTRAINT `laundry_orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `laundry_orders_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `laundry_orders_ibfk_3` FOREIGN KEY (`bag_size_id`) REFERENCES `bag_sizes` (`id`),
  ADD CONSTRAINT `laundry_orders_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `laundry_orders` (`id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `pricing`
--
ALTER TABLE `pricing`
  ADD CONSTRAINT `pricing_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
