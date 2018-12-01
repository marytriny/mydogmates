-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 01, 2018 at 06:34 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydogmate`
--

-- --------------------------------------------------------

--
-- Table structure for table `dog`
--

DROP TABLE IF EXISTS `dog`;
CREATE TABLE IF NOT EXISTS `dog` (
  `dogid` int(4) NOT NULL,
  `name` varchar(32) NOT NULL,
  `breed` varchar(32) NOT NULL,
  `size` varchar(15) NOT NULL,
  `neutered` tinyint(1) NOT NULL,
  `DOB` date NOT NULL,
  `age` varchar(32) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `playful` tinyint(1) NOT NULL,
  `trained` tinyint(1) NOT NULL,
  `people friendly` tinyint(1) NOT NULL,
  `obedient` tinyint(1) NOT NULL,
  `indoors` tinyint(1) NOT NULL,
  `Adoption Fee` int(11) NOT NULL,
  `Color` varchar(15) NOT NULL,
  `cat friendly` tinyint(1) NOT NULL,
  `dog friendly` tinyint(1) NOT NULL,
  `kid friendly` tinyint(1) NOT NULL,
  PRIMARY KEY (`dogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `sheltern` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subject` varchar(50) NOT NULL,
  `content` text NOT NULL,
  KEY `sheltern` (`sheltern`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shelter`
--

DROP TABLE IF EXISTS `shelter`;
CREATE TABLE IF NOT EXISTS `shelter` (
  `dogid` int(4) NOT NULL,
  `sheltern` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(15) NOT NULL,
  `location` text NOT NULL,
  `rating` text NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`sheltern`),
  KEY `dog tags` (`dogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(15) NOT NULL,
  `d breed` varchar(32) NOT NULL,
  `d size` int(11) NOT NULL,
  `d neutered` tinyint(1) NOT NULL,
  `d age` int(11) NOT NULL,
  `d sex` tinyint(1) NOT NULL,
  `d playful` tinyint(1) NOT NULL,
  `d trained` tinyint(1) NOT NULL,
  `d indoors` tinyint(1) NOT NULL,
  `d obedient` tinyint(1) NOT NULL,
  `d shy` tinyint(1) NOT NULL,
  `d friendly` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_sheltern` FOREIGN KEY (`sheltern`) REFERENCES `shelter` (`sheltern`),
  ADD CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `shelter`
--
ALTER TABLE `shelter`
  ADD CONSTRAINT `shelter_ibfk_1` FOREIGN KEY (`dogid`) REFERENCES `dog` (`dogid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
