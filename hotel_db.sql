-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 17, 2015 at 11:37 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hotel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `adimn`
--

CREATE TABLE IF NOT EXISTS `adimn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `pin` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `adimn`
--

INSERT INTO `adimn` (`id`, `email`, `pin`) VALUES
(1, 'sim@gmail.com', 'e9064b74d28acc053231170bb8c858b3'),
(2, 'simonhotel@gmail.com', '30cdb883df54e66a7b54dcc4ad0d87fb');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `prefix` varchar(15) NOT NULL,
  `country` varchar(100) NOT NULL,
  `phone` int(15) NOT NULL,
  `email` varchar(15) NOT NULL,
  `checkin` varchar(15) NOT NULL,
  `checkout` varchar(15) NOT NULL,
  `adult` int(5) NOT NULL,
  `children` int(20) NOT NULL,
  `room` varchar(20) NOT NULL,
  `request` varchar(200) NOT NULL,
  `verification` varchar(15) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone_number` (`phone`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`user_id`, `first_name`, `last_name`, `prefix`, `country`, `phone`, `email`, `checkin`, `checkout`, `adult`, `children`, `room`, `request`, `verification`) VALUES
(4, 'Pacific', 'Mashami', 'Miss', 'Rwanda', 2147483647, 'pacific@gmail.c', '15 Janvier 2016', '25 Mars 2017', 5, 1, 'Executive twin', 'Prepare them !!!!!!!11', 'FSCZ'),
(5, 'simon', 'trimati', 'Mr', 'Congo', 810252050, 'simon@gmail.com', '14 december 201', '16december2015', 1, 1, 'Executive Deluxe', 'i eat a lot of fruits.', 'FSCZ ');

-- --------------------------------------------------------

--
-- Table structure for table `contact_tbl`
--

CREATE TABLE IF NOT EXISTS `contact_tbl` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `message` varchar(1000) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `contact_tbl`
--

INSERT INTO `contact_tbl` (`user_id`, `names`, `email`, `subject`, `message`) VALUES
(1, 'Patient', 'musafiri@gmail.com', 'Salutation', 'Hello'),
(2, 'Chris', 'chris@gmail.com', 'Warning', 'Don''t cry!!!!'),
(3, 'simon', 'simon@gmail.com', 'payment', 'hufgcbvfvi');
