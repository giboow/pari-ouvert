/*
SQLyog Community v9.63
MySQL - 5.6.13 : Database - pariouvert
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pariouvert` /*!40100 DEFAULT CHARACTER SET latin1 */;

/*Table structure for table `pari_parking` */

DROP TABLE IF EXISTS `pari_parking`;

CREATE TABLE `pari_parking` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `parking_id` mediumint(8) unsigned NOT NULL,
  `nb_place_pari` mediumint(8) unsigned NOT NULL,
  `nb_place_reel` mediumint(8) unsigned NOT NULL,
  `mise` mediumint(8) unsigned NOT NULL,
  `date_pari` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_traite` timestamp NULL DEFAULT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pari_parking` */

/*Table structure for table `pari_traffic` */

DROP TABLE IF EXISTS `pari_traffic`;

CREATE TABLE `pari_traffic` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `troncon_id` mediumint(8) unsigned NOT NULL,
  `tps_trajet_pari` mediumint(8) unsigned NOT NULL,
  `tps_trajet_reel` mediumint(8) unsigned NOT NULL,
  `mise` mediumint(8) unsigned NOT NULL,
  `date_pari` datetime NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_traite` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pari_traffic` */

/*Table structure for table `parking` */

DROP TABLE IF EXISTS `parking`;

CREATE TABLE `parking` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `adress` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `parking` */

/*Table structure for table `troncon` */

DROP TABLE IF EXISTS `troncon`;

CREATE TABLE `troncon` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adress_start` varchar(255) NOT NULL,
  `adress_stop` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `troncon` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`password`,`salt`,`roles`,`name`,`time_created`,`gain`) values (1,'philippe.gibert@gmail.com','GGDvjyl/hEc9L/89OlWqrGlHOfmu17WW8/UXoEnlzPUYoLArRrnizk38HwT6VmVvMLjJQJObL1XOKKBF9Bp6ag==','j4e87tf7hlkcogscw0c84g8s04w8c4c','ROLE_USER','Philou',1382194783,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
