-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2024 at 01:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unimartonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(10, 4, 'Fruits', 'All fruits are available at convenient prices', 1, 0, '2024-07-11 12:17:26', NULL),
(11, 5, 'computing', 'computers and laptops', 1, 0, '2024-07-11 13:37:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(2, '202202-00002', 'test', 'test', 'test', 'Male', '094564654', 'test', 'test@sample.com', '098f6bcd4621d373cade4e832627b4f6', 'uploads/clients/2.png?v=1644471867', 1, 1, '2022-02-10 13:44:26', '2022-02-10 13:44:35'),
(3, '202407-00001', 'John', 'Muriuki', 'Gahuo', 'Male', '0722345430', 'Talai stage', 'john@gmail.com', '5b9a889ab9c7594feceddbdbcebfa2d6', 'uploads/clients/3.png?v=1720688288', 1, 0, '2024-07-11 11:58:08', '2024-07-11 11:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`, `date_created`) VALUES
(5, 9, 5, 35, '2024-07-11 12:37:57');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `client_id`, `vendor_id`, `total_amount`, `delivery_address`, `status`, `date_created`, `date_updated`) VALUES
(5, '202407-00001', 3, 4, 175, 'Hostel L', 4, '2024-07-11 12:37:57', '2024-07-11 12:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(9, 4, 10, 'Apples', '&lt;p&gt;sweet succulent apples&lt;/p&gt;', 35, 'uploads/products/9.png?v=1720689806', 1, 0, '2024-07-11 12:22:21', '2024-07-11 12:23:26'),
(10, 5, 11, 'Laptop Microsoft Surface Pro 6 8GB Intel Core I5 SSD 256GB', '&lt;div class=&quot;b-advert-item-details-collapser__visible&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(70, 75, 79); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;&quot;&gt;&lt;div class=&quot;b-advert-attribute h-pb-5&quot; style=&quot;margin: 0px; padding: 0px 0px 5px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div itemprop=&quot;itemCondition&quot; class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;Refurbished&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;CONDITION&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute h-pb-5&quot; style=&quot;margin: 0px; padding: 0px 0px 5px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;Laptop&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;TYPE&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute h-pb-5&quot; style=&quot;margin: 0px; padding: 0px 0px 5px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div itemprop=&quot;brand&quot; class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;Microsoft&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;BRAND&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute h-pb-5&quot; style=&quot;margin: 0px; padding: 0px 0px 5px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div itemprop=&quot;model&quot; class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;Surface Pro 6&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;MODEL&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute h-pb-5&quot; style=&quot;margin: 0px; padding: 0px 0px 5px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;Convertible Laptops&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;SUBTYPE&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute h-pb-5&quot; style=&quot;margin: 0px; padding: 0px 0px 5px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;8GB&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;RAM&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-item-details-collapser__rest&quot; style=&quot;margin: 0px; padding: 0px; overflow: hidden; color: rgb(70, 75, 79); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;&quot;&gt;&lt;div class=&quot;b-advert-item-details-collapser__rest-wrapper&quot; style=&quot;margin: 0px; padding: 0px; height: 222px; opacity: 1;&quot;&gt;&lt;div class=&quot;b-advert-attribute&quot; style=&quot;margin: 0px; padding: 0px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;Intel Core i5&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;PROCESSOR&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute&quot; style=&quot;margin: 0px; padding: 0px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;Octa Core&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;NUMBER OF CORES&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute&quot; style=&quot;margin: 0px; padding: 0px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;256GB&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;STORAGE CAPACITY&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute&quot; style=&quot;margin: 0px; padding: 0px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;SSD&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;STORAGE TYPE&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute&quot; style=&quot;margin: 0px; padding: 0px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;12&quot; / 12.3&quot;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;DISPLAY SIZE&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute&quot; style=&quot;margin: 0px; padding: 0px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;Intel&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;GRAPHICS CARD&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute&quot; style=&quot;margin: 0px; padding: 0px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;512MB&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;GRAPHICS CARD MEMORY&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute&quot; style=&quot;margin: 0px; padding: 0px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;Windows 11&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;OPERATING SYSTEM&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute&quot; style=&quot;margin: 0px; padding: 0px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;Yes&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;EXCHANGE POSSIBLE&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-attribute&quot; style=&quot;margin: 0px; padding: 0px; display: inline-block; max-width: 50%; vertical-align: top; width: 438.5px;&quot;&gt;&lt;div itemprop=&quot;color&quot; class=&quot;b-advert-attribute__value&quot; style=&quot;margin: 0px 0px 8px; padding: 0px; color: rgb(40, 54, 62); font-size: 14px; line-height: 18px;&quot;&gt;Gray&lt;/div&gt;&lt;div class=&quot;b-advert-attribute__key&quot; style=&quot;margin: 0px; padding: 0px; color: rgb(108, 142, 160); font-size: 10px; line-height: 12px; max-width: 100%; overflow: hidden; text-overflow: ellipsis; text-transform: uppercase; text-wrap: nowrap;&quot;&gt;COLOR&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;b-advert-item-details-collapser__button h-pt-10 h-dflex h-flex-main-end&quot; style=&quot;margin: 0px; padding: 10px 0px 0px; display: flex; justify-content: flex-end; color: rgb(70, 75, 79); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px;&quot;&gt;&lt;div class=&quot;b-advert-item-details-collapser__button-wrapper&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;button type=&quot;button&quot; class=&quot;fw-button qa-fw-button fw-button--type-primary-link-like fw-button--size-small&quot; style=&quot;padding: 0px 8px; font-size: 14px; line-height: 1; border-width: initial; border-style: none; border-color: initial; border-radius: 4px; color: rgb(0, 181, 63); outline: none; position: relative; transition: box-shadow 0.2s ease 0s; text-wrap: nowrap; will-change: box-shadow; z-index: 1; height: 24px; fill: rgb(0, 181, 63) !important;&quot;&gt;&lt;span class=&quot;fw-button__content&quot; style=&quot;margin: 0px; padding: 0px; align-items: center; display: flex; height: 24px; justify-content: center;&quot;&gt;&lt;/span&gt;&lt;/button&gt;&lt;/div&gt;&lt;/div&gt;', 50000, NULL, 1, 0, '2024-07-11 13:39:04', '2024-07-11 13:40:27');

-- --------------------------------------------------------

--
-- Table structure for table `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Dry Goods', 1, 0, '2022-02-09 08:49:34', NULL),
(2, 'Cosmetics', 1, 0, '2022-02-09 08:49:46', NULL),
(3, 'Produce', 1, 0, '2022-02-09 08:50:31', NULL),
(4, 'Other', 1, 0, '2022-02-09 08:50:36', '2024-07-11 12:25:07'),
(5, 'Others', 1, 1, '2022-02-09 08:50:41', '2022-02-09 08:50:45'),
(6, 'Clothes', 1, 0, '2024-07-11 12:26:21', NULL),
(7, 'Health', 1, 0, '2024-07-11 12:27:00', NULL),
(8, 'Entertainment', 1, 0, '2024-07-11 12:27:57', NULL),
(9, 'Computing & Electronics', 1, 0, '2024-07-11 12:29:00', NULL),
(10, 'Hard & Soft drinks', 1, 0, '2024-07-11 12:30:13', NULL),
(11, 'Household Supplies', 1, 0, '2024-07-11 12:30:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'UnimartOnline'),
(6, 'short_name', 'Unimart.com'),
(11, 'logo', 'uploads/logo-1720684228.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1720683680.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '5b9a889ab9c7594feceddbdbcebfa2d6', 'uploads/avatar-1.png?v=1644472635', NULL, 1, '2021-01-20 14:02:37', '2024-07-11 12:57:25'),
(11, 'Claire', 'Wanjiru', 'clairew', '5b9a889ab9c7594feceddbdbcebfa2d6', 'uploads/avatar-11.png?v=1720690458', NULL, 2, '2022-02-10 13:55:52', '2024-07-11 12:34:18');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(3, '202202-00003', 2, 'test', 'test', '123123123', 'test', '098f6bcd4621d373cade4e832627b4f6', 'uploads/vendors/3.png?v=1644471934', 1, 1, '2022-02-10 13:45:34', '2022-02-10 13:50:15'),
(4, '202407-00001', 3, 'mary-Groceries', 'Mary Kamau', '0794865430', 'marygroceries', '5b9a889ab9c7594feceddbdbcebfa2d6', 'uploads/vendors/4.png?v=1720687704', 1, 0, '2024-07-11 11:48:24', '2024-07-11 11:48:24'),
(5, '202407-00002', 9, 'Lantec Computers', 'Joseh Lantec', '0987654321', 'Lantec', '5b9a889ab9c7594feceddbdbcebfa2d6', 'uploads/vendors/5.png?v=1720693983', 1, 0, '2024-07-11 13:33:03', '2024-07-11 13:33:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
