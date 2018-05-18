-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2017 at 03:12 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `parent_id`) VALUES
(1, 'tshirts', 1),
(2, 'jumpers', 1),
(4, 'knitwear', 1),
(5, 'bridal', 3),
(6, 'cocktail', 3),
(7, 'maxi', 3),
(8, 'shift', 3),
(9, 'summer', 3),
(10, 'warp', 3),
(11, 'shoes', 5),
(12, 'hats', 5),
(13, 'bags', 5),
(14, 'scarves', 5),
(16, 'gloves', 5),
(17, 'trouser', 2),
(18, 'coat', 6),
(20, 'skirt', 4);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` int(11) UNSIGNED DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int(11) UNSIGNED DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `address`, `city`, `country`, `postcode`, `email`, `password_hash`, `phone`, `role`, `date`) VALUES
(1, 'Tajammul', 'Mustafa', '12/D', 'Bolzeb', 'Italy', 2341, 'tajammulmustafa@gmail.com', '$2y$14$3k4mpitt77XZ6p48r0Q6vu0wJupXAuAGSjlLJd03N9gLnWMFP72vW', 1223232323, 'Admin', '2017-05-31'),
(2, 'Sara', 'Kahan', 'err', 'hhh', 'hhh', 455, 'sara@gmail.com', '$2y$14$BCTe0BlhqbdxVjI8Q6KCTeObRYKg0i1n2SOwjQn2sRRwT8xLYPQk6', 66666, 'Customer', '2017-05-31'),
(3, 'Tajammul', 'Mustafa', 'cdscds', 'Bolzeb', 'Italy', 2341, 'tajammul@gmail.com', '$2y$14$F6iGJN5GxpbJepWiwf4NgObkjWyhTpOcVEEWtAwvjUkYdJ3g/TuEe', 1223232323, 'Customer', '2017-06-01'),
(4, 'Tajammul', 'Mustafa', 'cdscds', 'Bolzeb', 'Italy', 1212, 'taj@gmail.com', '$2y$14$ljm8TiKi5F9uODk1KLIQ1uTUWs56YvJsnuSfH3jOBXV.UotBVBGwy', 1223232323, 'Customer', '2017-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `qauntity` int(11) NOT NULL,
  `color` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `pic_path` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `category_id`, `name`, `qauntity`, `color`, `price`, `pic_path`, `description`) VALUES
(1, 1, 'Cropped', 11, 'blue', 30, 'images/top/tshirt/b1.jpg', ''),
(2, 1, 'Cropped', 10, 'blue', 30, 'images/top/tshirt/b2.jpg', ''),
(3, 1, 'Off The shoulder', 7, 'blue', 30, 'images/top/tshirt/b3.jpg', ''),
(4, 1, 'Crew Neck', 12, 'blue', 30, 'images/top/tshirt/b4.jpg', ''),
(5, 1, 'Off The shoulder', 12, 'blue', 30, 'images/top/tshirt/b5.jpg', ''),
(6, 1, 'Rocker', 10, 'blue', 30, 'images/top/tshirt/b6.jpg', ''),
(7, 1, 'V-Neck', 8, 'blue', 30, 'images/top/tshirt/b7.jpg', ''),
(8, 1, 'Oversized', 12, 'blue', 30, 'images/top/tshirt/b8.jpg', ''),
(9, 1, 'Round', 12, 'blue', 30, 'images/top/tshirt/b9.jpg', ''),
(10, 1, 'Off The shoulder', 12, 'blue', 30, 'images/top/tshirt/b10.jpg', ''),
(11, 2, 'Gumslip', -1, 'blue', 30, 'images/top/jumper/b1.jpg', ''),
(12, 2, 'Gumslip', -1, 'blue', 30, 'images/top/jumper/b2.jpg', ''),
(13, 2, 'Cord Pinafore', 0, 'blue', 30, 'images/top/jumper/b3.jpg', ''),
(14, 2, 'Gumslip', -1, 'blue', 30, 'images/top/jumper/b4.jpg', ''),
(15, 2, 'Gumslip', -1, 'blue', 30, 'images/top/jumper/b5.jpg', ''),
(16, 2, 'Kirtle-Jumper', 11, 'blue', 30, 'images/top/jumper/b6.jpg', ''),
(17, 2, 'Kirtle-Jumper', 12, 'blue', 30, 'images/top/jumper/b7.jpg', ''),
(18, 2, 'Kirtle-Jumper', 6, 'blue', 30, 'images/top/jumper/b8.jpg', ''),
(19, 2, 'Kirtle-Jumper', 6, 'blue', 30, 'images/top/jumper/b9.jpg', ''),
(20, 2, 'Kirtle-Jumper', 6, 'blue', 30, 'images/top/jumper/b10.jpg', ''),
(26, 4, 'cream knit', 5, 'blue', 30, 'images/top/knitwear/b1.jpg', ''),
(27, 4, 'cream knit', 7, 'blue', 30, 'images/top/knitwear/b2.jpg', ''),
(28, 4, 'cream knit', 2, 'blue', 30, 'images/top/knitwear/b3.jpg', ''),
(29, 4, 'cream knit', 12, 'blue', 30, 'images/top/knitwear/b4.jpg', ''),
(30, 4, 'blouson sleeved knitwear', 8, 'blue', 30, 'images/top/knitwear/b5.jpg', ''),
(31, 5, 'A-Line', 11, 'blue', 30, 'images/dress/bridal/b1.jpg', ''),
(32, 5, 'Trumpet-Gown', 12, 'blue', 30, 'images/dress/bridal/b2.jpg', ''),
(33, 5, 'Mermaid', 0, 'blue', 30, 'images/dress/bridal/b3.jpg', ''),
(34, 5, 'A-Line', 12, 'blue', 30, 'images/dress/bridal/b4.jpg', ''),
(35, 5, 'A-Line', 12, 'blue', 30, 'images/dress/bridal/b5.jpg', ''),
(36, 6, 'Maternity Cocktail Dress', 12, 'blue', 30, 'images/dress/cocktail/b1.jpg', ''),
(37, 6, 'Plus Size Cocktail Dress', 2, 'blue', 30, 'images/dress/cocktail/b2.jpg', ''),
(38, 6, 'Maternity Cocktail Dress', 11, 'blue', 30, 'images/dress/cocktail/b3.jpg', ''),
(39, 6, 'Vintage Cocktail Dress', 12, 'blue', 30, 'images/dress/cocktail/b4.jpg', ''),
(40, 6, 'Vintage Cocktail Dress', 9, 'blue', 30, 'images/dress/cocktail/b5.jpg', ''),
(41, 7, 'Halter Neck/Halter Top', 9, 'blue', 30, 'images/dress/maxi/b1.jpg', ''),
(42, 7, 'Halter Neck/Halter Top', 3, 'blue', 30, 'images/dress/maxi/b2.jpg', ''),
(43, 7, 'V-Neck Style', 0, 'blue', 30, 'images/dress/maxi/b3.jpg', ''),
(44, 7, 'V-Neck Style', 12, 'blue', 30, 'images/dress/maxi/b4.jpg', ''),
(45, 7, 'Halter Neck/Halter Top', 9, 'blue', 30, 'images/dress/maxi/b5.jpg', ''),
(46, 9, 'summer1', 12, 'blue', 30, '2', ''),
(47, 9, 'summer2', 12, 'blue', 30, '2', ''),
(48, 9, 'summer3', 12, 'blue', 30, '2', ''),
(49, 9, 'summer4', 12, 'blue', 30, '2', ''),
(50, 9, 'summer5', 12, 'blue', 30, '2', ''),
(51, 10, 'warp1', 12, 'blue', 30, '2', ''),
(52, 10, 'warp2', 12, 'blue', 30, '2', ''),
(53, 10, 'warp3', 12, 'blue', 30, '2', ''),
(54, 10, 'warp3', 12, 'blue', 30, '2', ''),
(55, 10, 'warp4', 12, 'blue', 30, '2', ''),
(56, 10, 'warp5', 12, 'blue', 30, '2', ''),
(57, 8, 'shift1', 12, 'blue', 30, '2', ''),
(58, 8, 'shift2', 12, 'blue', 30, '2', ''),
(59, 8, 'shift3', 12, 'blue', 30, '2', ''),
(60, 8, 'shift4', 12, 'blue', 30, '2', ''),
(61, 8, 'shift5', 12, 'blue', 30, '2', ''),
(62, 8, 'shift6', 12, 'blue', 30, '2', ''),
(63, 11, 'Sneaker', 10, 'blue', 30, 'images/accessory/shoe/b1.jpg', ''),
(64, 11, 'Jogger', 10, 'blue', 30, 'images/accessory/shoe/b2.jpg', ''),
(65, 11, 'Sneaker', 2, 'blue', 30, 'images/accessory/shoe/b3.jpg', ''),
(66, 11, 'Sneaker', 12, 'blue', 30, 'images/accessory/shoe/b4.jpg', ''),
(67, 11, 'party-shoe', 10, 'blue', 30, 'images/accessory/shoe/b5.jpg', ''),
(68, 12, 'summer-hat', 12, 'blue', 30, 'images/accessory/hat/b1.jpg', ''),
(69, 12, 'summer-hat', 11, 'blue', 30, 'images/accessory/hat/b2.jpg', ''),
(70, 12, 'Beach-Hat', 12, 'blue', 30, 'images/accessory/hat/b3.jpg', ''),
(71, 12, 'Summer-Hat', 8, 'blue', 30, 'images/accessory/hat/b4.jpg', ''),
(72, 12, 'Summer-Hat', 10, 'blue', 30, 'images/accessory/hat/b5.jpg', ''),
(73, 14, 'Wrap-Scarves', 10, 'blue', 30, 'images/accessory/scarf/b1.jpg', ''),
(74, 14, 'Wrap-Scarves', 0, 'blue', 30, 'images/accessory/scarf/b2.jpg', ''),
(75, 14, 'Wrap-Scarves', 0, 'blue', 30, 'images/accessory/scarf/b3.jpg', ''),
(76, 14, 'Wrap-Scarves', 12, 'blue', 30, 'images/accessory/scarf/b4.jpg', ''),
(77, 14, 'Wrap-Scarves', 6, 'blue', 30, 'images/accessory/scarf/b5.jpg', ''),
(83, 16, 'glove1', 12, 'blue', 30, 'images/accessory/glove/b1.jpg', ''),
(84, 16, 'glove2', 12, 'blue', 30, 'images/accessory/glove/b2.jpg', ''),
(85, 16, 'glove3', 4, 'blue', 30, 'images/accessory/glove/b3.jpg', ''),
(86, 16, 'glove4', 7, 'blue', 30, 'images/accessory/glove/b4.jpg', ''),
(87, 16, 'glove5', 12, 'blue', 30, 'images/accessory/glove/b5.jpg', ''),
(88, 13, 'HOBO-Bag', 12, 'blue', 30, 'images/accessory/bag/b1.jpg', ''),
(89, 13, 'HOBO-Bag', 8, 'blue', 20, 'images/accessory/bag/b2.jpg', ''),
(90, 13, 'HOBO-Bag', 10, 'blue', 20.9, 'images/accessory/bag/b3.jpg', ''),
(91, 13, 'short-Shoulder Bag', 12, 'blue', 12, 'images/accessory/bag/b5.jpg', ''),
(92, 13, 'short-Shoulder Bag', 12, 'blue', 30, 'images/accessory/bag/b5.jpg', ''),
(109, 17, 'Formal-Menwear', -2, 'blue', 30, 'images/trouser/trouser/b1.jpg', 'asdasdsadsdasdsadfsaeasdfsafdfasdasdasdsadsadasd'),
(110, 17, 'Gym-Trouser', 0, 'blue', 20, 'images/trouser/trouser/b2.jpg', 'asdasdsadsdasdsadfsaeasdfsafdfasdasdasdsadsadasd'),
(111, 17, 'Yoga', 2, 'blue', 20.9, 'images/trouser/trouser/b3.jpg', 'asdasdsadsdasdsadfsaeasdfsafdfasdasdasdsadsadasd'),
(112, 17, 'Yoga', 10, 'blue', 12, 'images/trouser/trouser/b4.jpg', 'asdasdsadsdasdsadfsaeasdfsafdfasdasdasdsadsadasd'),
(113, 17, 'Casual', 1, 'blue', 12, 'images/trouser/trouser/b5.jpg', ''),
(114, 18, 'Leather-Jacket Black', 10, 'blue', 12, 'images/coat/coat/b1.jpg', ''),
(115, 18, 'Leather-Jacket Red', 11, 'blue', 12, 'images/coat/coat/b2.jpg', ''),
(116, 18, 'Leather-Jacket Zipper', 6, 'blue', 12, 'images/coat/coat/b3.jpg', ''),
(117, 18, 'Leather-Jacket skinny', 12, 'blue', 12, 'images/coat/coat/b4.jpg', ''),
(118, 18, 'Leather-jacket Skinny', 11, 'black', 12, 'images/coat/coat/b5.jpg', 'asdasdsadsdasdsadfsaeasdfsafdfasdasdasdsadsadasd'),
(124, 20, 'Dirndl Skirt', 0, 'blue', 30, 'images/skirt/skirt/b1.jpg', ''),
(125, 20, 'Flared Skirt', 0, 'blue', 20, 'images/skirt/skirt/b2.jpg', ''),
(126, 20, 'Gored Skirt', -4, 'blue', 20.9, 'images/skirt/skirt/b3.jpg', ''),
(127, 20, 'Dirndl Skirt', 0, 'blue', 12, 'images/skirt/skirt/b4.jpg', ''),
(128, 20, 'Flared Skirt', 0, 'blue', 12, 'images/skirt/skirt/b5.jpg', ''),
(129, 4, 'blouson sleeved knitwear', 5, 'blue', 50, 'images/top/knitwear/b6.jpg', ''),
(130, 4, 'blouson sleeved knitwear', 5, 'blue', 50, 'images/top/knitwear/b7.jpg', ''),
(131, 4, 'blouson sleeved knitwear', 5, 'blue', 50, 'images/top/knitwear/b8.jpg', ''),
(132, 4, 'blouson sleeved knitwear', 5, 'blue', 50, 'images/top/knitwear/b9.jpg', ''),
(133, 4, 'Easy-wear Knit', 3, 'blue', 60, 'images/top/knitwear/b10.jpg', ''),
(134, 4, 'Fine-knit Collar', 2, 'blue', 35, 'images/top/knitwear/b11.jpg', ''),
(135, 4, 'Skinny-knitwear', 5, 'blue', 35, 'images/top/knitwear/b12.jpg', ''),
(136, 4, 'Skinny-knitwear', 5, 'blue', 39, 'images/top/knitwear/b13.jpg', ''),
(137, 4, 'Skinny-knitwear', 5, 'blue', 60, 'images/top/knitwear/b15.jpg', ''),
(138, 4, 'Easy-wear Knit', 2, 'blue', 49, 'images/top/knitwear/b14.jpg', ''),
(139, 1, 'V-Neck', 11, 'Black', 29, 'images/top/tshirt/b11.jpg', ''),
(140, 1, 'Girls', 11, 'Black', 29, 'images/top/tshirt/b12.jpg', ''),
(141, 1, 'Cropped', 11, 'Black', 29, 'images/top/tshirt/b13.jpg', ''),
(142, 1, 'Round', 11, 'Black', 29, 'images/top/tshirt/b14.jpg', ''),
(143, 1, 'Rocker', 9, 'Black', 29, 'images/top/tshirt/b15.jpg', ''),
(144, 2, 'Sarafan-Jumper', 1, 'Indigo', 39, 'images/top/jumper/b11.jpg', ''),
(145, 2, 'Sarafan-Jumper', 1, 'Indigo', 39, 'images/top/jumper/b12.jpg', ''),
(146, 2, 'Sarafan-Jumper', 1, 'Indigo', 39, 'images/top/jumper/b13.jpg', ''),
(147, 2, 'Sarafan-Jumper', 1, 'Indigo', 39, 'images/top/jumper/b14.jpg', ''),
(148, 2, 'Cord Pinafore', 3, 'Indigo', 39, 'images/top/jumper/b15.jpg', ''),
(149, 17, 'Tides-Womenwar', 91, 'Black', 19, 'images/trouser/trouser/b6.jpg', ''),
(150, 17, 'Tides-Womenwar', 91, 'Black', 19, 'images/trouser/trouser/b7.jpg', ''),
(151, 17, 'Tides-Womenwar', 91, 'Black', 19, 'images/trouser/trouser/b8.jpg', ''),
(152, 17, 'Casual-Trouser', 4, 'Black', 19, 'images/trouser/trouser/b9.jpg', ''),
(153, 17, 'Fly-Womenwear', 11, 'Black', 19, 'images/trouser/trouser/b10.jpg', ''),
(154, 17, 'EasyWear-Trouser', 1, 'Black', 19, 'images/trouser/trouser/b11.jpg', ''),
(155, 17, 'Casual-Touser', 4, 'Black', 19, 'images/trouser/trouser/b12.jpg', ''),
(156, 17, 'Formal-Menwear', -2, 'Black', 19, 'images/trouser/trouser/b13.jpg', ''),
(157, 17, 'Formal-Menwear', -2, 'Black', 19, 'images/trouser/trouser/b14.jpg', ''),
(158, 17, 'Tides-Womenwar', 91, 'Black', 19, 'images/trouser/trouser/b15.jpg', ''),
(159, 5, 'Modified A-Line', 5, 'blue', 800, 'images/dress/bridal/b6.jpg', ''),
(160, 5, 'Modified A-Line', 5, 'blue', 800, 'images/dress/bridal/b7.jpg', ''),
(161, 5, 'Trumpet-Gown', 5, 'blue', 800, 'images/dress/bridal/b8.jpg', ''),
(162, 5, 'Mermaid', 5, 'blue', 800, 'images/dress/bridal/b9.jpg', ''),
(163, 5, 'Trumpet-Gown', 2, 'blue', 800, 'images/dress/bridal/b10.jpg', ''),
(164, 5, 'A-Line', 5, 'blue', 800, 'images/dress/bridal/b11.jpg', ''),
(165, 5, 'A-Line', 5, 'blue', 800, 'images/dress/bridal/b12.jpg', ''),
(166, 5, 'Mermaid', 5, 'blue', 800, 'images/dress/bridal/b13.jpg', ''),
(167, 5, 'Mermaid', 5, 'blue', 800, 'images/dress/bridal/b14.jpg', ''),
(168, 5, 'Mermaid', 5, 'blue', 800, 'images/dress/bridal/b15.jpg', ''),
(169, 6, 'Black-Cocktail', 3, 'Black', 59, 'images/dress/cocktail/b6.jpg', ''),
(170, 6, 'Plus Size Cocktail Dress', 2, 'Black', 59, 'images/dress/cocktail/b7.jpg', ''),
(171, 6, 'Maternity Cocktail Dress', 5, 'Black', 59, 'images/dress/cocktail/b8.jpg', ''),
(172, 6, 'Vintage Cocktail Dress', 5, 'Black', 59, 'images/dress/cocktail/b9.jpg', ''),
(173, 6, 'Plus Size Cocktail Dress', 2, 'Black', 59, 'images/dress/cocktail/b10.jpg', ''),
(174, 6, 'Vintage Cocktail Dress', 5, 'Black', 59, 'images/dress/cocktail/b11.jpg', ''),
(175, 6, 'Vintage Cocktail Dress', 5, 'Black', 59, 'images/dress/cocktail/b12.jpg', ''),
(176, 6, 'Maternity Cocktail Dress', 5, 'Black', 59, 'images/dress/cocktail/b13.jpg', ''),
(177, 6, 'Vintage Cocktail Dress', 5, 'Black', 59, 'images/dress/cocktail/b14.jpg', ''),
(178, 6, 'Plus Size Cocktail Dress', 2, 'Black', 59, 'images/dress/cocktail/b15.jpg', ''),
(179, 7, 'Plunge/Front plunge', 11, 'Black', 39, 'images/dress/maxi/b6.jpg', ''),
(180, 7, 'Plunge/Front plunge', 11, 'Black', 39, 'images/dress/maxi/b7.jpg', ''),
(181, 7, 'Halter Neck/Halter Top', 11, 'Black', 39, 'images/dress/maxi/b8.jpg', ''),
(182, 7, 'Strapless Maxi', 7, 'Black', 39, 'images/dress/maxi/b9.jpg', ''),
(183, 7, 'Plunge/Front plunge', 11, 'Black', 39, 'images/dress/maxi/b10.jpg', ''),
(184, 7, 'Off-Shoulder', 11, 'Black', 39, 'images/dress/maxi/b11.jpg', ''),
(185, 7, 'Plunge/Front plunge', 11, 'Black', 39, 'images/dress/maxi/b12.jpg', ''),
(186, 7, 'Halter Neck/Halter Top', 9, 'Black', 39, 'images/dress/maxi/b13.jpg', ''),
(187, 7, 'Plunge/Front plunge', 11, 'Black', 39, 'images/dress/maxi/b14.jpg', ''),
(188, 7, 'Off-Shoulder', 11, 'Black', 39, 'images/dress/maxi/b15.jpg', ''),
(189, 20, 'Gored Skirt', -4, 'Black', 29, 'images/skirt/skirt/b6.jpg', ''),
(190, 20, 'Dirndl Skirt', 0, 'Black', 29, 'images/skirt/skirt/b7.jpg', ''),
(191, 20, 'Flared Skirt', 0, 'Black', 29, 'images/skirt/skirt/b8.jpg', ''),
(192, 20, 'Gored Skirt', -4, 'Black', 29, 'images/skirt/skirt/b9.jpg', ''),
(193, 20, 'Dirndl Skirt', 0, 'Black', 29, 'images/skirt/skirt/b10.jpg', ''),
(194, 20, 'Flared Skirt', 0, 'Black', 29, 'images/skirt/skirt/b11.jpg', ''),
(195, 20, 'Gored Skirt', -4, 'Black', 29, 'images/skirt/skirt/b12.jpg', ''),
(196, 20, 'Dirndl Skirt', 0, 'Black', 29, 'images/skirt/skirt/b13.jpg', ''),
(197, 20, 'Flared Skirt', 0, 'Black', 29, 'images/skirt/skirt/b14.jpg', ''),
(198, 20, 'Gored Skirt', -4, 'Black', 29, 'images/skirt/skirt/b15.jpg', ''),
(199, 11, 'Long Shoe', 5, 'Black', 149, 'images/accessory/shoe/b6.jpg', ''),
(200, 11, 'Long Shoe', 5, 'Black', 149, 'images/accessory/shoe/b7.jpg', ''),
(201, 11, 'Long Shoe', 1, 'Black', 149, 'images/accessory/shoe/b8.jpg', ''),
(202, 11, 'Long Shoe', 2, 'Black', 149, 'images/accessory/shoe/b9.jpg', ''),
(203, 11, 'Long Shoe', 5, 'Black', 149, 'images/accessory/shoe/b10.jpg', ''),
(204, 11, 'Cowboy', 5, 'Black', 149, 'images/accessory/shoe/b11.jpg', ''),
(205, 11, 'Cowboy', 5, 'Black', 149, 'images/accessory/shoe/b12.jpg', ''),
(206, 11, 'Cowboy', 5, 'Black', 149, 'images/accessory/shoe/b13.jpg', ''),
(207, 11, 'Cowboy', 5, 'Black', 149, 'images/accessory/shoe/b14.jpg', ''),
(208, 11, 'Cowboy', 2, 'Black', 149, 'images/accessory/shoe/b15.jpg', ''),
(209, 12, 'Cowboy Hat', 3, 'Black', 79, 'images/accessory/hat/b6.jpg', ''),
(210, 12, 'Cowboy Hat', 3, 'Black', 79, 'images/accessory/hat/b7.jpg', ''),
(211, 12, 'Cowboy Hat', 3, 'Black', 79, 'images/accessory/hat/b8.jpg', ''),
(212, 12, 'Cowboy Hat', 3, 'Black', 79, 'images/accessory/hat/b9.jpg', ''),
(213, 12, 'Cowboy Hat', 3, 'Black', 79, 'images/accessory/hat/b10.jpg', ''),
(214, 12, 'Winter Hat', 5, 'Black', 79, 'images/accessory/hat/b11.jpg', ''),
(215, 12, 'Winter Hat', 5, 'Black', 79, 'images/accessory/hat/b12.jpg', ''),
(216, 12, 'Winter Hat', 5, 'Black', 79, 'images/accessory/hat/b13.jpg', ''),
(217, 12, 'Winter Hat', 5, 'Black', 79, 'images/accessory/hat/b14.jpg', ''),
(218, 12, 'Winter Hat', 5, 'Black', 79, 'images/accessory/hat/b15.jpg', ''),
(219, 13, 'Cross-over Bag', 2, 'Black', 200, 'images/accessory/bag/b6.jpg', ''),
(220, 13, 'Cross-over Bag', 5, 'Black', 200, 'images/accessory/bag/b7.jpg', ''),
(221, 13, 'Cross-over Bag', 5, 'Black', 200, 'images/accessory/bag/b8.jpg', ''),
(222, 13, 'Cross-over Bag', 5, 'Black', 200, 'images/accessory/bag/b9.jpg', ''),
(223, 13, 'Casual Day Bag', 5, 'Black', 200, 'images/accessory/bag/b10.jpg', ''),
(224, 13, 'Casual Day Bag', 5, 'Black', 200, 'images/accessory/bag/b11.jpg', ''),
(225, 13, 'Casual Day Bag', 5, 'Black', 200, 'images/accessory/bag/b12.jpg', ''),
(226, 13, 'Casual Day Bag', 5, 'Black', 200, 'images/accessory/bag/b13.jpg', ''),
(227, 13, 'Casual Day Bag', 5, 'Black', 200, 'images/accessory/bag/b14.jpg', ''),
(228, 13, 'Casual Day Bag', 3, 'Black', 200, 'images/accessory/bag/b15.jpg', ''),
(229, 14, 'Wrap-Scarves', 11, 'Black', 39, 'images/accessory/scarf/b6.jpg', ''),
(230, 14, 'Winter-Scarves', 11, 'Black', 39, 'images/accessory/scarf/b7.jpg', ''),
(231, 14, 'Winter-Scarves', 9, 'Black', 39, 'images/accessory/scarf/b8.jpg', ''),
(232, 14, 'Winter-Scarves', 11, 'Black', 39, 'images/accessory/scarf/b9.jpg', ''),
(233, 14, 'Winter-Scarves', 11, 'Black', 39, 'images/accessory/scarf/b10.jpg', ''),
(234, 14, 'Winter-Scarves', 11, 'Black', 39, 'images/accessory/scarf/b11.jpg', ''),
(235, 14, 'Sarong-Scarves', 11, 'Black', 39, 'images/accessory/scarf/b12.jpg', ''),
(236, 14, 'Sarong-Scarves', 11, 'Black', 39, 'images/accessory/scarf/b13.jpg', ''),
(237, 14, 'Sarong-Scarves', 11, 'Black', 39, 'images/accessory/scarf/b14.jpg', ''),
(238, 14, 'Sarong-Scarves', 11, 'Black', 39, 'images/accessory/scarf/b15.jpg', ''),
(239, 18, 'Long-Coat Winter', 1, 'Black', 499, 'images/coat/coat/b6.jpg', ''),
(240, 18, 'Long-Coat Winter', 1, 'Black', 499, 'images/coat/coat/b7.jpg', ''),
(241, 18, 'Long-Coat Winter', 1, 'Black', 499, 'images/coat/coat/b8.jpg', ''),
(242, 18, 'Long-Coat Winter', 1, 'Black', 499, 'images/coat/coat/b9.jpg', ''),
(243, 18, 'Long-Coat Winter', 1, 'Black', 499, 'images/coat/coat/b10.jpg', ''),
(244, 18, 'Hoody', 5, 'Black', 499, 'images/coat/coat/b11.jpg', ''),
(245, 18, 'Hoody', 5, 'Black', 499, 'images/coat/coat/b12.jpg', ''),
(246, 18, 'Hoody', 5, 'Black', 499, 'images/coat/coat/b13.jpg', ''),
(247, 18, 'Hoody', 5, 'Black', 499, 'images/coat/coat/b14.jpg', ''),
(248, 18, 'Hoody', 5, 'Black', 499, 'images/coat/coat/b15.jpg', ''),
(250, 20, 'newItem', 1, 'red', 99, 'images/b13.jpg', 'sjkdhs'),
(251, 20, 'newItem', 1, 'blue', 199, 'images/b9.jpg', ' mdsn,');

-- --------------------------------------------------------

--
-- Table structure for table `main_categories`
--

CREATE TABLE `main_categories` (
  `id` int(11) NOT NULL,
  `main_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_categories`
--

INSERT INTO `main_categories` (`id`, `main_category`) VALUES
(1, 'Top'),
(2, 'Trouser'),
(3, 'Dress'),
(4, 'Skirt'),
(5, 'Accessory'),
(6, 'Coat/Jacket');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) UNSIGNED DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) UNSIGNED DEFAULT NULL,
  `bill` int(11) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `customer_address`, `quantity`, `color`, `size`, `price`, `bill`, `date`) VALUES
(1, 'Long-Coat Winter', 'tajammulmustafa@gmail.com', 4, 'Blue', 'small', 499, 499, '2017-05-31'),
(2, 'Tides-Womenwar', 'tajammulmustafa@gmail.com', 3, 'Blue', 'small', 19, 57, '2017-05-31'),
(3, 'Tides-Womenwar', 'tajammulmustafa@gmail.com', 3, 'Blue', 'small', 19, 57, '2017-05-31'),
(4, 'Tides-Womenwar', 'tajammulmustafa@gmail.com', 3, 'Blue', 'small', 19, 57, '2017-05-31'),
(5, 'Tides-Womenwar', 'tajammulmustafa@gmail.com', 5, 'Blue', 'small', 19, 95, '2017-05-31'),
(6, 'Tides-Womenwar', 'tajammulmustafa@gmail.com', 5, 'Blue', 'small', 19, 95, '2017-05-31'),
(7, 'Tides-Womenwar', 'tajammulmustafa@gmail.com', 5, 'Blue', 'small', 19, 95, '2017-05-31'),
(8, 'Long-Coat Winter', 'sara@gmail.com', 2, 'Blue', 'small', 499, 998, '2017-05-31'),
(9, 'Dirndl Skirt', 'sara@gmail.com', 1, 'Blue', 'small', 12, 12, '2017-05-31'),
(10, 'Dirndl Skirt', 'sara@gmail.com', 1, 'Blue', 'small', 12, 12, '2017-05-31'),
(11, 'Dirndl Skirt', 'sara@gmail.com', 1, 'Blue', 'small', 12, 12, '2017-05-31'),
(12, 'Tides-Womenwar', 'tajammul@gmail.com', 7, 'Blue', 'small', 19, 133, '2017-06-01'),
(13, 'Tides-Womenwar', 'tajammul@gmail.com', 7, 'Blue', 'small', 19, 133, '2017-06-01'),
(14, 'Tides-Womenwar', 'tajammul@gmail.com', 7, 'Blue', 'small', 19, 133, '2017-06-01'),
(15, 'Tides-Womenwar', 'tajammul@gmail.com', 7, 'Blue', 'small', 19, 133, '2017-06-01'),
(16, 'Long-Coat Winter', 'tajammul@gmail.com', 1, 'Blue', 'small', 499, 499, '2017-06-01'),
(17, 'Plus Size Cocktail Dress', 'tajammul@gmail.com', 1, 'Blue', 'small', 30, 30, '2017-06-01'),
(18, 'EasyWear-Trouser', 'sara@gmail.com', 4, 'Blue', 'small', 19, 76, '2017-06-02'),
(19, 'EasyWear-Trouser', 'sara@gmail.com', 4, 'Blue', 'small', 19, 76, '2017-06-02'),
(20, 'EasyWear-Trouser', 'sara@gmail.com', 4, 'Blue', 'small', 19, 76, '2017-06-02'),
(21, 'EasyWear-Trouser', 'sara@gmail.com', 4, 'Blue', 'small', 19, 76, '2017-06-02'),
(22, 'EasyWear-Trouser', 'sara@gmail.com', 4, 'Blue', 'small', 19, 76, '2017-06-02'),
(23, 'EasyWear-Trouser', 'sara@gmail.com', 4, 'Blue', 'small', 19, 76, '2017-06-02'),
(24, 'EasyWear-Trouser', 'sara@gmail.com', 4, 'Blue', 'small', 19, 76, '2017-06-02'),
(25, 'EasyWear-Trouser', 'sara@gmail.com', 3, 'Blue', 'small', 19, 57, '2017-06-02'),
(26, 'EasyWear-Trouser', 'taj@gmail.com', 1, 'Blue', 'small', 19, 19, '2017-06-03'),
(27, 'EasyWear-Trouser', 'taj@gmail.com', 5, 'Blue', 'small', 19, 95, '2017-06-03'),
(28, 'EasyWear-Trouser', 'taj@gmail.com', 1, 'Blue', 'small', 19, 19, '2017-06-03'),
(29, 'EasyWear-Trouser', 'taj@gmail.com', 1, 'Blue', 'small', 19, 19, '2017-06-03'),
(30, 'EasyWear-Trouser', 'taj@gmail.com', 1, 'Blue', 'small', 19, 19, '2017-06-03'),
(31, 'EasyWear-Trouser', 'taj@gmail.com', 8, 'Blue', 'small', 19, 152, '2017-06-03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `main_categories`
--
ALTER TABLE `main_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;
--
-- AUTO_INCREMENT for table `main_categories`
--
ALTER TABLE `main_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `main_categories` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
