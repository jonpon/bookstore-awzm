-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Värd: localhost
-- Tid vid skapande: 04 dec 2014 kl 12:28
-- Serverversion: 5.6.20
-- PHP-version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `db_awzm`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `Author`
--

CREATE TABLE IF NOT EXISTS `Author` (
  `author_id` int(255) NOT NULL,
  `author_fname` varchar(255) DEFAULT NULL,
  `author_lname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `Books`
--

CREATE TABLE IF NOT EXISTS `Books` (
  `isbn` int(25) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author_id` int(255) NOT NULL,
  `shelf_id` varchar(5) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sale_factor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `Delivery`
--

CREATE TABLE IF NOT EXISTS `Delivery` (
  `delivery_id` int(25) NOT NULL DEFAULT '0',
  `deliv_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isbn` int(25) NOT NULL,
  `f_price` float DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `Sales`
--

CREATE TABLE IF NOT EXISTS `Sales` (
  `sale_id` int(25) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isbn` int(25) NOT NULL,
  `sale_price` float DEFAULT NULL,
  `shelf_id` varchar(5) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `Shelf`
--

CREATE TABLE IF NOT EXISTS `Shelf` (
  `shelf_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `Author`
--
ALTER TABLE `Author`
 ADD PRIMARY KEY (`author_id`);

--
-- Index för tabell `Books`
--
ALTER TABLE `Books`
 ADD PRIMARY KEY (`isbn`), ADD KEY `shelf_id` (`shelf_id`), ADD KEY `author_id` (`author_id`);

--
-- Index för tabell `Delivery`
--
ALTER TABLE `Delivery`
 ADD PRIMARY KEY (`delivery_id`), ADD KEY `isbn` (`isbn`);

--
-- Index för tabell `Sales`
--
ALTER TABLE `Sales`
 ADD PRIMARY KEY (`sale_id`), ADD KEY `isbn` (`isbn`), ADD KEY `shelf_id` (`shelf_id`);

--
-- Index för tabell `Shelf`
--
ALTER TABLE `Shelf`
 ADD PRIMARY KEY (`shelf_id`);

--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `Books`
--
ALTER TABLE `Books`
ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`shelf_id`) REFERENCES `Shelf` (`shelf_id`),
ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `Author` (`author_id`);

--
-- Restriktioner för tabell `Delivery`
--
ALTER TABLE `Delivery`
ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `Books` (`isbn`);

--
-- Restriktioner för tabell `Sales`
--
ALTER TABLE `Sales`
ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `Books` (`isbn`),
ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`shelf_id`) REFERENCES `Shelf` (`shelf_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
