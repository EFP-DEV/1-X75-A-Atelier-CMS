-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 14, 2025 at 06:29 PM
-- Server version: 10.6.18-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sandbox`
--

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `id` int(10) UNSIGNED NOT NULL,
  `visitor_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'e.g. favorite, basket, wishlist',
  `description` varchar(255) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`id`, `visitor_id`, `name`, `description`, `is_public`, `created_at`, `updated_at`) VALUES
(1, 1, 'Favorites', 'A curated list of must-haves, handpicked by our discerning visitor.', 1, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(2, 2, 'Wishlist', 'Dream big – these items are goals on a shopping list.', 0, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(3, 3, 'Cart', 'Not just a cart; it’s a trolley of aspirations.', 1, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(4, 4, 'Impulse Buys', 'Because sometimes you just can’t resist a good deal.', 0, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(5, 5, 'Gifts', 'Ideas for when you need to impress someone special.', 1, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(6, 6, 'Clearance Finds', 'The bargain bin never looked so chic.', 0, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(7, 7, 'Tech Toolbox', 'All the gadgets and gizmos that make life fun.', 1, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(8, 8, 'Book Nook', 'A collection for the literary and the witty alike.', 0, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(9, 9, 'Home Essentials', 'Everything you need for a cozy yet clever abode.', 1, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(10, 10, 'Oddities', 'A collection of things that are strangely irresistible.', 0, '2025-04-10 18:40:40', '2025-04-10 18:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `collection_item`
--

CREATE TABLE `collection_item` (
  `collection_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collection_item`
--

INSERT INTO `collection_item` (`collection_id`, `item_id`, `quantity`, `created_at`) VALUES
(1, 1, 1, '2025-04-10 18:40:40'),
(1, 2, 2, '2025-04-10 18:40:40'),
(1, 3, 1, '2025-04-10 18:40:40'),
(2, 2, 1, '2025-04-10 18:40:40'),
(2, 3, 1, '2025-04-10 18:40:40'),
(2, 4, 1, '2025-04-10 18:40:40'),
(3, 3, 1, '2025-04-10 18:40:40'),
(3, 4, 2, '2025-04-10 18:40:40'),
(3, 5, 1, '2025-04-10 18:40:40'),
(4, 4, 1, '2025-04-10 18:40:40'),
(4, 5, 1, '2025-04-10 18:40:40'),
(4, 6, 1, '2025-04-10 18:40:40'),
(5, 5, 1, '2025-04-10 18:40:40'),
(5, 6, 3, '2025-04-10 18:40:40'),
(5, 7, 1, '2025-04-10 18:40:40'),
(6, 6, 1, '2025-04-10 18:40:40'),
(6, 7, 1, '2025-04-10 18:40:40'),
(7, 7, 1, '2025-04-10 18:40:40'),
(7, 8, 2, '2025-04-10 18:40:40'),
(8, 8, 1, '2025-04-10 18:40:40'),
(8, 9, 1, '2025-04-10 18:40:40'),
(9, 9, 1, '2025-04-10 18:40:40'),
(9, 10, 1, '2025-04-10 18:40:40'),
(10, 1, 1, '2025-04-10 18:40:40'),
(10, 10, 1, '2025-04-10 18:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(10) UNSIGNED NOT NULL,
  `operator_id` int(10) UNSIGNED NOT NULL COMMENT 'creator',
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL COMMENT 'Path to the main image',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Optional, depends on site type',
  `stock` int(10) UNSIGNED DEFAULT NULL COMMENT 'Optional, for product inventory',
  `status` enum('draft','published','archived') DEFAULT 'draft',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `operator_id`, `title`, `slug`, `description`, `content`, `image`, `price`, `stock`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mechanical Keyboard', 'mechanical-keyboard', 'A tactile keyboard that clicks with every keystroke.', 'This keyboard isn’t just key—it’s the typecast star of your desktop.', 'keyboard.jpg', 99.99, 50, 'published', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(2, 2, 'Sit & Code Throne', 'sit-code-throne', 'Not your average chair—built to seat your bugs and support your byte-sized ideas.', 'Where comfort meets code: take a seat and let your errors fall off your throne.', 'dev-chair.jpg', 499.99, 20, 'published', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(3, 3, 'Noise-Cancelling Headphones', 'noise-cancelling-headphones', 'Headphones that silence distractions and amplify your code’s voice.', 'Ideal for debugging in peace—these headphones truly speak volumes.', 'headphones.jpg', 199.99, 30, 'published', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(4, 4, 'Byte Me Laptop', 'byte-me-laptop', 'This high-performance laptop is so fast, it’ll byte off more than you can chew.', 'Engineered to compile code at lightning speed—it’s a real “tech”nical marvel.', 'laptop.jpg', 1299.99, 10, 'published', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(5, 5, 'Cloud Storage Subscription', 'cloud-storage-subscription', 'Store your code in the clouds, where your data never falls down.', 'Backup your projects with a service that’s always above the rest—no rainy days here!', 'cloud.jpg', 9.99, 100, 'published', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(6, 6, 'Wireless Charging Dock', 'wireless-charging-dock', 'A dock that charges your devices wire-free and error-free.', 'Keep your gadgets powered up without any strings attached—say goodbye to deadlocks!', 'charging-dock.jpg', 39.99, 50, 'draft', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(7, 7, '4K Monitor', '4k-monitor', 'A monitor so sharp, it renders your bugs pixel-perfectly out of sight.', 'Enjoy vivid visuals and ample screen real estate to display your code in style—resolution guaranteed!', 'monitor.jpg', 299.99, 15, 'published', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(8, 8, 'Retro Gaming Console', 'retro-gaming-console', 'A console that’s a blast from the past—perfect for when you need to reboot your brain.', 'Unwind with vintage games and relive the golden era of arcade coding—fun that never crashes.', 'console.jpg', 149.99, 25, 'archived', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(9, 9, 'Bluetooth Debug Speaker', 'bluetooth-debug-speaker', 'A speaker that plays tunes and drops witty bug fixes.', 'Let it amplify your debugging sessions with clever error messages—volume control for your soul.', 'debug-speaker.jpg', 79.99, 40, 'published', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(10, 10, 'Smartwatch for Developers', 'smartwatch-for-developers', 'A smartwatch that tracks time and code commits with pinpoint precision.', 'Stay connected on the go and never miss a beat, commit, or coffee break—wrist tech at its finest.', 'dev-smartwatch.jpg', 249.99, 30, 'published', '2025-04-10 18:40:40', '2025-04-10 18:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `item_tag`
--

CREATE TABLE `item_tag` (
  `item_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_tag`
--

INSERT INTO `item_tag` (`item_id`, `tag_id`, `created_at`) VALUES
(1, 1, '2025-04-10 18:40:40'),
(1, 2, '2025-04-10 18:40:40'),
(1, 3, '2025-04-10 18:40:40'),
(2, 2, '2025-04-10 18:40:40'),
(2, 3, '2025-04-10 18:40:40'),
(2, 4, '2025-04-10 18:40:40'),
(3, 3, '2025-04-10 18:40:40'),
(3, 4, '2025-04-10 18:40:40'),
(3, 5, '2025-04-10 18:40:40'),
(4, 4, '2025-04-10 18:40:40'),
(4, 5, '2025-04-10 18:40:40'),
(4, 6, '2025-04-10 18:40:40'),
(5, 5, '2025-04-10 18:40:40'),
(5, 6, '2025-04-10 18:40:40'),
(5, 7, '2025-04-10 18:40:40'),
(6, 6, '2025-04-10 18:40:40'),
(6, 7, '2025-04-10 18:40:40'),
(7, 7, '2025-04-10 18:40:40'),
(7, 8, '2025-04-10 18:40:40'),
(8, 8, '2025-04-10 18:40:40'),
(8, 9, '2025-04-10 18:40:40'),
(9, 9, '2025-04-10 18:40:40'),
(9, 10, '2025-04-10 18:40:40'),
(10, 1, '2025-04-10 18:40:40'),
(10, 10, '2025-04-10 18:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `is_spam` tinyint(1) DEFAULT 0,
  `operator_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Operator who read the message',
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `name`, `email`, `subject`, `content`, `is_read`, `is_spam`, `operator_id`, `ip_address`, `created_at`, `read_at`) VALUES
(1, 'Lucy L.', 'lucy.l@example.com', 'Infinite Loop of Errors', 'My website is caught in an infinite loop—any tips to break the recursion?', 0, 0, 1, '198.51.100.10', '2025-04-10 18:40:40', NULL),
(2, 'Mark T.', 'mark.t@example.com', 'CSS Not Found', 'My layout is all over the place—seems like my CSS file got lost in the cloud!', 1, 0, 2, '198.51.100.11', '2025-04-10 18:40:40', NULL),
(3, 'Nina P.', 'nina.p@example.com', '404 Error on My Code', 'My script can’t seem to find a critical element—getting a 404 on function calls!', 0, 0, 3, '198.51.100.12', '2025-04-10 18:40:40', NULL),
(4, 'Oscar Q.', 'oscar.q@example.com', 'Database Disaster', 'My queries are returning nothing but errors. Is my database on vacation?', 1, 0, 4, '198.51.100.13', '2025-04-10 18:40:40', NULL),
(5, 'Pam S.', 'pam.s@example.com', 'Wishlist Widget Woes', 'My wishlist widget isn’t rendering properly—it clearly needs a developer’s magic touch.', 0, 0, 5, '198.51.100.14', '2025-04-10 18:40:40', NULL),
(6, 'Quinn R.', 'quinn.r@example.com', 'API Timeout Blues', 'The API is timing out more than my lunch break—could use some advice on retry logic!', 1, 0, 6, '198.51.100.15', '2025-04-10 18:40:40', NULL),
(7, 'Rose U.', 'rose.u@example.com', 'Bootstrap Breakdown', 'My responsive design just broke at 768px. Bootstrap, are you even listening?', 0, 0, 7, '198.51.100.16', '2025-04-10 18:40:40', NULL),
(8, 'Sam V.', 'sam.v@example.com', 'Smartwatch Sync Issues', 'My smartwatch isn’t syncing with my dev tools—am I missing a critical update?', 1, 0, 8, '198.51.100.17', '2025-04-10 18:40:40', NULL),
(9, 'Tina W.', 'tina.w@example.com', 'Browser Compatibility Cringe', 'My site looks bizarre on Internet Explorer—time to fully embrace modern standards!', 0, 0, 9, '198.51.100.18', '2025-04-10 18:40:40', NULL),
(10, 'Victor X.', 'victor.x@example.com', 'Git Commit Gone Wild', 'I accidentally pushed a bug to production—Git blame is real and unforgiving!', 1, 0, 10, '198.51.100.19', '2025-04-10 18:40:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

CREATE TABLE `operator` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL COMMENT 'Hashed using password_hash()',
  `email` varchar(100) NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operator`
--

INSERT INTO `operator` (`id`, `username`, `password`, `email`, `last_login`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'ada', '$2y$10$wH1tEeR9d8YpVJ/kuT2Ehe9IhcGdW8LZcK7M8bzKHc9zDey.XpXiS', 'ada@lovelace.tech', '1970-11-26 23:00:00', 0, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(2, 'grace', '$2y$10$A8j9kL0mN1oP2qR3sT4uV5wX6yZ7aB8cD9eF0gH1iJ2kL3mN4oPqRs', 'grace@hopper.tech', '1991-12-31 23:00:00', 0, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(3, 'alan', '$2y$10$Z3x4c5v6b7n8m9q0w1e2r3t4y5u6i7o8p9a0s1d2f3g4h5j6k7l8m', 'alan@turing.ai', '1970-06-06 23:00:00', 0, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(4, 'dennis', '$2y$10$Q1w2e3r4t5y6u7i8o9p0a1s2d3f4g5h6j7k8l9z0x1c2v3b4n5m6O', 'dennis@ritchie.dev', '2011-10-11 22:00:00', 0, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(5, 'bill', '$2y$10$P0o9i8u7y6t5r4e3w2q1a2s3d4f5g6h7j8k9l0z1x2c3v4b5n6m7L', 'bill@gates.com', '2024-12-10 08:05:55', 1, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(6, 'charles', '$2y$10$M1n2b3v4c5x6z7l8k9j0h1g2f3d4s5a6p7o8i9u0y1t2r3e4w5q6R', 'charles@babbage.tech', '1970-10-17 23:00:00', 0, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(7, 'linus', '$2y$10$N9m8b7v6c5x4z3l2k1j0h9g8f7d6s5a4p3o2i1u0y9t8r7e6w5q4T', 'linus@torvalds.org', '2024-09-18 14:22:10', 1, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(8, 'paul', '$2y$10$L0k9j8h7g6f5d4s3a2p1o0i9u8y7t6r5e4w3q2z1x0c9v8b7n6m5N', 'paul@otlet.info', '1970-12-14 23:00:00', 0, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(9, 'tim', '$2y$10$R5e4w3q2z1x0c9v8b7n6m5L4k3j2h1g0f9d8s7a6p5o4i3u2y1t0S', 'tim@bernerslee.org', '2025-02-28 21:10:05', 1, '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(10, 'radia', '$2y$10$T1r2e3w4q5z6x7c8v9b0n1m2L3k4j5h6g7f8d9s0a1p2o3i4u5y6I', 'radia@perlman.tech', '2024-10-31 06:30:00', 1, '2025-04-10 18:40:40', '2025-04-10 18:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price_min` decimal(10,2) DEFAULT NULL,
  `price_max` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `is_sale` tinyint(1) DEFAULT 0,
  `rating` tinyint(4) DEFAULT 0,
  `product_type` enum('standard','fancy','popular','special','sale') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price_min`, `price_max`, `price`, `sale_price`, `image`, `is_sale`, `rating`, `product_type`, `created_at`) VALUES
(1, 'Fancy Product', 40.00, 80.00, NULL, NULL, 'https://dummyimage.com/450x300/dee2e6/6c757d.jpg', 0, 0, 'fancy', '2025-04-08 08:52:15'),
(2, 'Special Item', NULL, NULL, 20.00, 18.00, 'https://dummyimage.com/450x300/dee2e6/6c757d.jpg', 1, 5, 'special', '2025-04-08 08:52:15'),
(3, 'Sale Item', NULL, NULL, 50.00, 25.00, 'https://dummyimage.com/450x300/dee2e6/6c757d.jpg', 1, 0, 'sale', '2025-04-08 08:52:15'),
(4, 'Popular Item', NULL, NULL, 40.00, NULL, 'https://dummyimage.com/450x300/dee2e6/6c757d.jpg', 0, 5, 'popular', '2025-04-08 08:52:15'),
(5, 'Sale Item', NULL, NULL, 50.00, 25.00, 'https://dummyimage.com/450x300/dee2e6/6c757d.jpg', 1, 0, 'sale', '2025-04-08 08:52:15'),
(6, 'Fancy Product', 120.00, 280.00, NULL, NULL, 'https://dummyimage.com/450x300/dee2e6/6c757d.jpg', 0, 0, 'fancy', '2025-04-08 08:52:15'),
(7, 'Special Item', NULL, NULL, 20.00, 18.00, 'https://dummyimage.com/450x300/dee2e6/6c757d.jpg', 1, 5, 'special', '2025-04-08 08:52:15'),
(8, 'Popular Item', NULL, NULL, 40.00, NULL, 'https://dummyimage.com/450x300/dee2e6/6c757d.jpg', 0, 5, 'popular', '2025-04-08 08:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

CREATE TABLE `search` (
  `id` int(10) UNSIGNED NOT NULL,
  `visitor_id` int(10) UNSIGNED DEFAULT NULL,
  `query` varchar(255) NOT NULL,
  `results_count` int(10) UNSIGNED DEFAULT 0,
  `session_id` varchar(255) DEFAULT NULL COMMENT 'To track user sessions',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `search`
--

INSERT INTO `search` (`id`, `visitor_id`, `query`, `results_count`, `session_id`, `created_at`) VALUES
(1, 1, '/search?query=quirky+office+chairs+for+creative+minds&tag_id=7,3', 7, 'a1b2c3d4e5f67890123456789abcdef0', '2025-04-10 18:40:40'),
(2, 2, '/search?query=vintage+gadgets+with+modern+flair&tag_id=4,8', 5, 'f0e1d2c3b4a5968778695a4b3c2d1e0f', '2025-04-10 18:40:40'),
(3, 3, '/search?query=eco-friendly+products+that+don’t+break+the+bank&tag_id=5,9', 12, '1234567890abcdef1234567890abcdef', '2025-04-10 18:40:40'),
(4, 4, '/search?query=smart+devices+with+a+sense+of+humor', 9, 'fedcba0987654321fedcba0987654321', '2025-04-10 18:40:40'),
(5, 5, '/search?query=books+that+make+you+laugh+and+think&tag_id=2,10', 8, '0f1e2d3c4b5a69788796a5b4c3d2e1f0', '2025-04-10 18:40:40'),
(6, 6, '/search?query=cutting-edge+tech+for+gadget+geeks&tag_id=3,7', 15, 'abcdef0123456789abcdef0123456789', '2025-04-10 18:40:40'),
(7, 7, '/search?query=retro+gaming+consoles+for+a+blast+from+the+past&tag_id=8', 6, '11223344556677889900aabbccddeeff', '2025-04-10 18:40:40'),
(8, 8, '/search?query=must-have+travel+accessories+with+personality&tag_id=6,9', 4, 'ffeeddccbbaa00998877665544332211', '2025-04-10 18:40:40'),
(9, 9, '/search?query=art+pieces+that+spark+conversation&tag_id=9,1', 10, '13579bdf02468ace13579bdf02468ace', '2025-04-10 18:40:40'),
(10, 10, '/search?query=unique+home+decor+for+the+unconventional&tag_id=10,2', 11, 'eca86420bdf13579eca86420bdf13579', '2025-04-10 18:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `operator_id` int(10) UNSIGNED NOT NULL COMMENT 'creator',
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `operator_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Programming', 'programming', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(2, 2, 'Web Development', 'web-development', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(3, 3, 'Algorithms', 'algorithms', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(4, 4, 'Data Structures', 'data-structures', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(5, 5, 'Cybersecurity', 'cybersecurity', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(6, 6, 'Cloud Computing', 'cloud-computing', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(7, 7, 'Machine Learning', 'machine-learning', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(8, 8, 'Databases', 'databases', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(9, 9, 'Networking', 'networking', '2025-04-10 18:40:40', '2025-04-10 18:40:40'),
(10, 10, 'Software Engineering', 'software-engineering', '2025-04-10 18:40:40', '2025-04-10 18:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `id` int(10) UNSIGNED NOT NULL,
  `visitor_token` varchar(255) NOT NULL COMMENT 'Identifier for visitor',
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `dark_mode` tinyint(1) DEFAULT 0,
  `font_size` enum('small','medium','large') DEFAULT 'medium',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_activity` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `visitor_token`, `ip_address`, `user_agent`, `dark_mode`, `font_size`, `created_at`, `updated_at`, `last_activity`) VALUES
(1, 'token-fox-001', '203.0.113.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 0, 'medium', '2025-04-10 18:40:40', '2025-04-10 18:40:40', '2025-03-22 11:00:00'),
(2, 'token-owl-002', '203.0.113.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)', 1, 'large', '2025-04-10 18:40:40', '2025-04-10 18:40:40', '2025-03-22 11:05:00'),
(3, 'token-lion-003', '203.0.113.3', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64)', 0, 'small', '2025-04-10 18:40:40', '2025-04-10 18:40:40', '2025-03-22 11:10:00'),
(4, 'token-tiger-004', '203.0.113.4', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64)', 1, 'medium', '2025-04-10 18:40:40', '2025-04-10 18:40:40', '2025-03-22 11:15:00'),
(5, 'token-eagle-005', '203.0.113.5', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)', 0, 'medium', '2025-04-10 18:40:40', '2025-04-10 18:40:40', '2025-03-22 11:20:00'),
(6, 'token-panther-006', '203.0.113.6', 'Mozilla/5.0 (Linux; Android 10)', 0, 'large', '2025-04-10 18:40:40', '2025-04-10 18:40:40', '2025-03-22 11:25:00'),
(7, 'token-bear-007', '203.0.113.7', 'Mozilla/5.0 (Windows NT 10.0; WOW64)', 1, 'small', '2025-04-10 18:40:40', '2025-04-10 18:40:40', '2025-03-22 11:30:00'),
(8, 'token-wolf-008', '203.0.113.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0)', 0, 'medium', '2025-04-10 18:40:40', '2025-04-10 18:40:40', '2025-03-22 11:35:00'),
(9, 'token-hawk-009', '203.0.113.9', 'Mozilla/5.0 (X11; Linux x86_64)', 1, 'large', '2025-04-10 18:40:40', '2025-04-10 18:40:40', '2025-03-22 11:40:00'),
(10, 'token-fox-010', '203.0.113.10', 'Mozilla/5.0 (iPad; CPU OS 13_0 like Mac OS X)', 0, 'medium', '2025-04-10 18:40:40', '2025-04-10 18:40:40', '2025-03-22 11:45:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_id` (`visitor_id`);

--
-- Indexes for table `collection_item`
--
ALTER TABLE `collection_item`
  ADD PRIMARY KEY (`collection_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `operator_id` (`operator_id`);

--
-- Indexes for table `item_tag`
--
ALTER TABLE `item_tag`
  ADD PRIMARY KEY (`item_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operator_id` (`operator_id`);

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_id` (`visitor_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `operator_id` (`operator_id`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visitor_token` (`visitor_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `operator`
--
ALTER TABLE `operator`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `search`
--
ALTER TABLE `search`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `visitor`
--
ALTER TABLE `visitor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `collection`
--
ALTER TABLE `collection`
  ADD CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collection_item`
--
ALTER TABLE `collection_item`
  ADD CONSTRAINT `collection_item_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collection_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`operator_id`) REFERENCES `operator` (`id`);

--
-- Constraints for table `item_tag`
--
ALTER TABLE `item_tag`
  ADD CONSTRAINT `item_tag_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`operator_id`) REFERENCES `operator` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `search`
--
ALTER TABLE `search`
  ADD CONSTRAINT `search_ibfk_1` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`operator_id`) REFERENCES `operator` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
