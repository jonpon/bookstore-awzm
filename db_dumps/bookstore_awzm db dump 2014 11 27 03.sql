-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 27, 2014 at 02:13 PM
-- Server version: 5.6.20
-- PHP Version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bookstore_awzm`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`fname`, `lname`, `author_id`) VALUES
('Arthur', 'Conan Doyle', 1),
('Neil', 'Gaiman', 2),
('Terry', 'Pratchett', 3),
('J.R.R', 'Tolkien', 4);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `isbn` bigint(13) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `book_author_id` int(11) DEFAULT NULL,
  `f_price` int(11) DEFAULT NULL,
  `shelf` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`isbn`, `title`, `description`, `book_author_id`, `f_price`, `shelf`) VALUES
(9780060012359, 'The Amazing Maurice and His Educated Rodents', 'Theyd have been really amazed if theyd ever found out that the rats and the piper met up with a cat somewhere outside of town and solemnly counted out the money.', 3, 75, 'C4'),
(9780261102378, 'The Return of the King', 'This is the final part of Tolkiens epic masterpiece.', 4, 240, 'C4'),
(9780380807345, 'Coraline 10th Anniversary Edition', 'Coraline discovered the door a little while after they moved into the house. . . .', 2, 200, 'B2'),
(9781840224009, 'The Hound of the Baskervilles & The Valley of Fear', 'The Hound of the Baskervilles is the classic detective chiller.', 1, 110, 'A3');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE IF NOT EXISTS `delivery` (
  `delivery_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `delivery_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isbn` bigint(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `price_history`
--

CREATE TABLE IF NOT EXISTS `price_history` (
  `price_id` int(11) NOT NULL,
  `isbn` bigint(13) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `change_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `sale_id` int(11) NOT NULL,
  `isbn` bigint(13) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `sale_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `isbn`, `qty`, `sale_date`) VALUES
(3, 9781840224009, 4, '2014-11-27 14:04:07');

-- --------------------------------------------------------

--
-- Table structure for table `shelves`
--

CREATE TABLE IF NOT EXISTS `shelves` (
  `shelf_id` varchar(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
 ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
 ADD PRIMARY KEY (`isbn`), ADD UNIQUE KEY `book_author_id` (`book_author_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
 ADD PRIMARY KEY (`delivery_id`), ADD KEY `isbn` (`isbn`);

--
-- Indexes for table `price_history`
--
ALTER TABLE `price_history`
 ADD PRIMARY KEY (`price_id`), ADD KEY `isbn` (`isbn`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
 ADD PRIMARY KEY (`sale_id`), ADD UNIQUE KEY `isbn` (`isbn`);

--
-- Indexes for table `shelves`
--
ALTER TABLE `shelves`
 ADD PRIMARY KEY (`shelf_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authors`
--
ALTER TABLE `authors`
ADD CONSTRAINT `authors_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `books` (`book_author_id`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`book_author_id`) REFERENCES `authors` (`author_id`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`);

--
-- Constraints for table `price_history`
--
ALTER TABLE `price_history`
ADD CONSTRAINT `price_history_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`),
ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
