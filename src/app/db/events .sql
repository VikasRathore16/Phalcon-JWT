-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-server
-- Generation Time: Mar 31, 2022 at 01:26 PM
-- Server version: 8.0.19
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `events`
--

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

CREATE TABLE `components` (
  `id` int NOT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `components`
--

INSERT INTO `components` (`id`, `component`) VALUES
(13, 'index'),
(14, 'acl'),
(15, 'secure'),
(17, 'index');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_name`, `customer_address`, `zipcode`, `product`, `quantity`) VALUES
(1, 'Vikas', 'Jankipuram', '92347', 'Mobilenew', 2),
(2, 'Vikas', 'Jankipuram', '226010', 'Mobilenew', 2),
(3, 'Vikas', 'Jankipuram', '226010', 'Mobilenew', 2),
(4, 'Vikas', 'Jankipuram', '92347', 'T-Shirt ', 2),
(5, 'Vikas', 'Jankipuram', '226010', 'T-Shirt ', 2),
(6, 'Vikas', 'Jankipuram', '226010', 'T-Shirt ', 2),
(7, 'Vikas', 'Jankipuram', '226010', 'T-Shirt ', 2),
(8, 'Vikas', 'Jankipuram', '226010', 'T-Shirt ', 2),
(9, 'Vikas', 'Jankipuram', '226010', 'T-Shirt ', 2),
(10, 'Vikas', 'Jankipuram', '226010', 'T-Shirt ', 2),
(11, 'Vikas', 'Jankipuram', '226010', 'T-Shirt ', 2),
(12, 'Vikas', 'Jankipuram', '226010', 'T-Shirt ', 2),
(13, 'Vikas', 'Jankipuram', '226010', 'T-Shirt ', 2),
(14, 'Vikas', 'Jankipuram', '92347', 'T-Shirt ', 2),
(15, 'Vikas', 'Jankipuram', '226010', 'Mobilenew', 2),
(16, 'Vikas', 'Jankipuram', '92347', 'Mobile', 2);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int NOT NULL,
  `role` varchar(255) NOT NULL,
  `component` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `role`, `component`, `action`) VALUES
(64, 'admin', '*', '*'),
(65, 'admin', 'index', 'settings'),
(66, 'admin', 'index', 'orderList'),
(73, 'manager', 'index', 'addProduct'),
(74, 'manager', 'index', 'addOrder'),
(75, 'manager', 'index', 'productList'),
(76, 'manager', 'index', 'orderList'),
(77, 'manager', 'index', 'index'),
(78, 'guest', 'index', 'productList');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `stocks` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `tags`, `price`, `stocks`) VALUES
(70, 'Mobilenew', 'Nokia 7772', 'new', 10000, 100),
(106, 'Mobile', 'asd', 'new', 213, 2),
(107, 'Mobile', 'asd', 'new', 100, 100);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role`) VALUES
(4, 'manager'),
(5, 'admin'),
(6, 'admin'),
(7, 'admin'),
(8, 'manager'),
(9, 'guest'),
(10, 'manager'),
(11, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `title_optimization` varchar(255) NOT NULL,
  `default_price` int NOT NULL,
  `default_stock` int NOT NULL,
  `default_zipcode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title_optimization`, `default_price`, `default_stock`, `default_zipcode`) VALUES
(1, 'N', 100, 100, 226010);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `jwt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `jwt`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImN0eSI6ImFwcGxpY2F0aW9uXC9qc29uIn0.eyJhdWQiOlsiaHR0cHM6XC9cL3RhcmdldC5waGFsY29uLmlvIl0sImV4cCI6MTY0ODgxMzc5MCwianRpIjoiYWJjZDEyMzQ1Njc4OSIsImlhdCI6MTY0ODcyNzM5MCwiaXNzIjoiaHR0cHM6XC9cL3BoYWxjb24uaW8iLCJuYmYiOjE2NDg3MjczMzAsInN1YiI6ImFkbWluIn0.dG2etqTbRfnI2V0zF08MQCGgwdk7CPtRTO2edbDSFFcTwq0AafZjRuUPFhOmv_odPph_yCWaF-Z4mHbeAq1sNg'),
(2, 'vikas', 'vikas@cedcoss.com', '123', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImN0eSI6ImFwcGxpY2F0aW9uXC9qc29uIn0.eyJhdWQiOlsiaHR0cHM6XC9cL3RhcmdldC5waGFsY29uLmlvIl0sImV4cCI6MTY0ODgxNTUyMywianRpIjoiYWJjZDEyMzQ1Njc4OSIsImlhdCI6MTY0ODcyOTEyMywiaXNzIjoiaHR0cHM6XC9cL3BoYWxjb24uaW8iLCJuYmYiOjE2NDg3MjkwNjMsInN1YiI6InVzZXIifQ.b9v1WdZOLozSXazW9fwkLODayMpsjHAPeRADyaci9eqEVI1QMrx3O5o48k3xiMoMIdzhnlg0HLmeyZiGiRlOHA'),
(3, 'admin@gmail.com', 'vikas@cedcoss.com', '123', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImN0eSI6ImFwcGxpY2F0aW9uXC9qc29uIn0.eyJhdWQiOlsiaHR0cHM6XC9cL3RhcmdldC5waGFsY29uLmlvIl0sImV4cCI6MTY0ODgxNjczMSwianRpIjoiYWJjZDEyMzQ1Njc4OSIsImlhdCI6MTY0ODczMDMzMSwiaXNzIjoiaHR0cHM6XC9cL3BoYWxjb24uaW8iLCJuYmYiOjE2NDg3MzAyNzEsInN1YiI6Im1hbmFnZXIifQ.FwMQ8qZ6vzL2BzDzb6xor0KBJzpflNI_lPCUP-Sr33ho0eWRb08dhSLWE0s43oSx9oct66yMLUCRVyB34lDdug');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `components`
--
ALTER TABLE `components`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
