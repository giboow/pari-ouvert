-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 19, 2013 at 08:56 PM
-- Server version: 5.5.31
-- PHP Version: 5.4.4-14+deb7u5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pariouvert`
--

-- --------------------------------------------------------

--
-- Table structure for table `pari_parking`
--

CREATE TABLE IF NOT EXISTS `pari_parking` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `parking_id` mediumint(8) unsigned NOT NULL,
  `nb_place_pari` mediumint(8) unsigned NOT NULL,
  `nb_place_reel` mediumint(8) unsigned NOT NULL,
  `gain` mediumint(8) unsigned NOT NULL,
  `mise` mediumint(8) unsigned NOT NULL,
  `date_pari` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_traite` timestamp NULL DEFAULT NULL,
  `date_create` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pari_parking`
--

INSERT INTO `pari_parking` (`id`, `user_id`, `parking_id`, `nb_place_pari`, `nb_place_reel`, `gain`, `mise`, `date_pari`, `date_traite`, `date_create`) VALUES
(1, 1, 2, 40, 0, 40, 20, '2013-10-19 18:33:01', '2013-10-19 18:33:01', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
