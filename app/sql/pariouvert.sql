-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 19, 2013 at 09:12 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `pari_traffic`
--

CREATE TABLE IF NOT EXISTS `pari_traffic` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `troncon_id` mediumint(8) unsigned NOT NULL,
  `tps_trajet_pari` mediumint(8) unsigned NOT NULL,
  `tps_trajet_reel` mediumint(8) unsigned NOT NULL,
  `gain` mediumint(8) unsigned NOT NULL,
  `mise` mediumint(8) unsigned NOT NULL,
  `date_pari` datetime NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_traite` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `parking`
--

CREATE TABLE IF NOT EXISTS `parking` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `adress` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `parking`
--

INSERT INTO `parking` (`id`, `name`, `size`, `adress`) VALUES
(2, 'DECRE-BOUFFAY', 530, ''),
(3, 'TOUR DE BRETAGNE', 645, ''),
(4, 'GRASLIN', 508, ''),
(5, 'ARISTIDE BRIAND', 0, ''),
(6, 'MEDIATHEQUE', 439, ''),
(7, 'COMMERCE', 534, ''),
(8, 'TALENSAC', 365, ''),
(9, 'CITE INT DES CONGRES', 430, ''),
(10, 'CATHEDRALE', 387, ''),
(11, 'LES MACHINES', 622, ''),
(14, 'GLORIETTE 1', 170, ''),
(15, 'HOTEL DIEU', 100, ''),
(16, 'GARE SUD 2 LIMITE 1 HEURE', 32, ''),
(17, 'C.H.U', 145, ''),
(21, 'GARE NORD', 578, ''),
(25, 'GARE SUD 1', 268, ''),
(26, 'GARE SUD 2', 222, ''),
(27, 'GARE SUD 3', 327, ''),
(29, 'BELLAMY', 76, ''),
(30, 'CHATEAU', 108, ''),
(31, 'VIVIANI', 117, ''),
(34, 'GARE SUD 4', 386, ''),
(35, 'BACO-LU 1', 111, ''),
(36, 'BACO-LU 2', 118, ''),
(37, 'GLORIETTE 2', 97, ''),
(39, 'CHANTIERS NAVALS', 102, '');

-- --------------------------------------------------------

--
-- Table structure for table `troncon`
--

CREATE TABLE IF NOT EXISTS `troncon` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adress_start` varchar(255) NOT NULL,
  `adress_stop` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(255) NOT NULL DEFAULT '',
  `roles` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `time_created` int(11) NOT NULL DEFAULT '0',
  `gain` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `salt`, `roles`, `name`, `time_created`, `gain`) VALUES
(1, 'philippe.gibert@gmail.com', 'GGDvjyl/hEc9L/89OlWqrGlHOfmu17WW8/UXoEnlzPUYoLArRrnizk38HwT6VmVvMLjJQJObL1XOKKBF9Bp6ag==', 'j4e87tf7hlkcogscw0c84g8s04w8c4c', 'ROLE_USER', 'Philou', 1382194783, 80);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
