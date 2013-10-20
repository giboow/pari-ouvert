-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 20, 2013 at 10:47 AM
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
-- Table structure for table `bicloo`
--

CREATE TABLE IF NOT EXISTS `bicloo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `adress` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `bicloo`
--

INSERT INTO `bicloo` (`id`, `name`, `size`, `adress`) VALUES
(1, '00001-PREFECTURE', 25, 'PREFECTURE_-_5_QUAI_CEINERAY'),
(2, '00002-HOTEL_DE_VILLE', 20, 'HOTEL_DE_VILLE_-_FACE_AU_29_RUE_DE_STRASBOURG'),
(3, '00003-STRASBOURG', 15, 'STRASBOURG_-_PLACE_TIRANT_LO_BLANC'),
(4, '00004-MOULIN', 13, 'MOULIN_-_FACE_AU_18_RUE_DU_MOULIN'),
(5, '00005-BROSSARD', 15, 'BROSSARD_-_25_RUE_ARMAND_BROSSARD'),
(6, '00006-PLACE_DU_CIRQUE', 15, 'PLACE_DU_CIRQUE_-_7_ALLEE_DUQUESNE'),
(7, '00007-_BARILLERIE', 15, 'BARILLERIE_-_2_ALLEE_PENTHIEVRE'),
(8, '00008-BOUCHERIE', 19, 'BOUCHERIE_-_FACE_AU_4_RUE_DE_LA_BOUCHERIE'),
(9, '00009-GUEPIN', 14, 'GUEPIN_-_8_RUE_DE_L_ARCHE_SECHE'),
(10, '00010-_PICASSO', 28, 'PICASSO_-_RUE_PABLO_PICASSO'),
(11, '00011-CALVAIRE', 15, 'CALVAIRE_-_PL_DES_VOLONTAIRES_DE_LA_DEFENSE_PASSIVE'),
(12, '00012-PLACE_DELORME', 20, 'PLACE_DELORME'),
(13, '00013-BRETAGNE_SUD', 20, 'BRETAGNE_SUD_-_1_RUE_PIERRE_CHEREAU'),
(14, '00014-SAINT_FELIX', 15, 'Saint_Felix_-_42_Boulevard_Amiral_Courbet'),
(15, '00015-PLACE_ARISTIDE_BRIAND', 17, 'PLACE_ARISTIDE_BRIAND'),
(16, '00016-PLACE_EDOUARD_NORMAND', 15, 'PLACE_EDOUARD_NORMAND_-_FACE_AU_7_PLACE_EDOUARD_NORMAND'),
(17, '00017-SAINTE_ELISABETH', 14, 'SAINTE_ELISABTEH_-_3_PLACE_STE_ELISABETH'),
(18, '00018-PLACE_VIARME', 14, 'PLACE_VIARME_-_23_PLACE_VIARME'),
(19, '00019-SAINT_SIMILIEN', 15, 'SAINT_SIMILIEN_-_1_PLACE_SAINT_SIMILIEN'),
(20, '00020-BELLAMY', 15, 'BELLAMY_-_50_RUE_PAUL_BELLAMY'),
(21, '00021-MARCHE_TALENSAC_SUD', 16, 'MARCHE_TALENSAC_SUD_-_6_RUE_TALENSAC'),
(22, '00022-MOQUECHIEN', 16, 'MOQUECHIEN_-_8_RUE_MOQUECHIEN'),
(23, '00023-BUAT', 11, 'BUAT_-_118_RUE_DE_COULMIERS'),
(24, '00024-VERSAILLES', 15, 'VERSAILLES_-_FACE_AU_25_QUAI_DE_VERSAILLES'),
(25, '00025-DALBY', 15, 'DALBY-_61_BD_ERNEST_DALBY_FACE_STATION_SERVICE'),
(26, '00026-GUIST_HAU_SUD', 15, 'GUIST_HAU_SUD_-_26_BOULEVARD_GUIST_HAU'),
(27, '00027-GUIST_HAU_NORD', 15, 'GUIST_HAU_NORD_-_42_BD_GUIST_HAU'),
(28, '00028-_PLACE_DE_L_EDIT_NANTES', 13, 'PLACE_DE_L_EDIT_DE_NANTES'),
(29, '00029-DUGUAY_TROUIN', 15, 'DUGUAY_TROUIN_-_7_ALLEE_DUGUAY_TROUIN'),
(30, '00030-COMMERCE', 39, 'COMMERCE_-_FACE_PLACE_DU_COMMERCE'),
(31, '00031-BOURSE', 16, 'BOURSE_-_SQUARE_DE_LA_BOURSE'),
(32, '00032-RUBENS', 13, 'RUBENS_-_17_RUE_RUBENS'),
(33, '00033-RACINE', 15, 'RACINE_-_4_RUE_RACINE'),
(34, '00034-MEDIATHEQUE', 20, 'MEDIATHEQUE_-_24_QUAI_DE_LA_FOSSE'),
(35, '00035-JEAN_V', 15, 'JEAN_V_-_2_PLACE_JEAN_V'),
(36, '00036-ALGER', 15, 'ALGER_-_5_RUE_D_ALGER'),
(37, '00037-FEYDEAU', 21, 'FEYDEAU_-_1_ALLEE_ILE_GLORIETTE'),
(38, '00038-PLACE_RICORDEAU', 40, 'PLACE_RICORDEAU'),
(39, '00039-QUAI_MONCOUSU', 19, 'QUAI_MONCOUSU_-_11_QUAI_MONCOUSU'),
(40, '00040-MADELEINE', 15, 'MADELEINE_-_2_QUAI_MONCOUSU'),
(41, '00041-CHANTIER_NAVAL', 15, 'CHANTIER_NAVAL_-_87_QUAI_DE_LA_FOSSE'),
(42, '00042-GARE_MARITIME', 25, 'GARE_MARITIME_-_PLACE_JACKSONVILLE'),
(43, '00043_-_MACHINE_DE_L_ILE', 30, 'MACHINE_DE_L_ILE_-_3_BD_LEON_BUREAU'),
(44, '00044-PALAIS_DE_JUSTICE', 25, 'PALAIS_DE_JUSTICE_-_19_QUAI_FRANCOIS_MITTERAND'),
(45, '00045-PRAIRIE_AU_DUC', 13, 'PRAIRIE_AU_DUC_-_40_BOULEVARD_DE_LA_PRAIRIE_AU_DUC'),
(46, '00046-PLACE_REPUBLIQUE', 20, 'PLACE_DE_LA_REPUBLIQUE_-_3_PLACE_DE_LA_REPUBLIQUE'),
(47, '00047-_MARTYRS_NANTAIS', 15, 'MARTYRS_NANTAIS_-_1_BD_DES_MARTYRS_NANTAIS'),
(48, '00048-VERDUN', 14, 'VERDUN_-_15_RUE_DE_VERDUN'),
(49, '00049-DUCHESSE_ANNE', 15, 'DUCHESSE_ANNE_-_2_PLACE_DE_LA_DUCHESSE_ANNE'),
(50, '00050-CHATEAU', 16, 'CHATEAU_-_2_RUE_DES_ETATS'),
(51, '00051-TABARLY', 20, 'AVENUE_DE_BERLIN_DEVANT_MAISON_DE_QUARTIER'),
(52, '00052-BACO', 15, 'BACO_-_FACE_AU_8_ALLEE_BACO'),
(53, '00053-OLIVETTES', 15, 'OLIVETTES_-_10_RUE_DES_OLIVETTES'),
(54, '00054-_CITE_INTERNATIONALE_DES_CONGRES', 30, 'CITE_INTERNATIONAL_DES_CONGRES_-_2_RUE_DE_JEMMAPES'),
(55, '00055-MAGELLAN', 15, 'MAGELLAN_-_11_RUE_DE_BELFORT'),
(56, '00056-VINCENT_GACHE', 15, 'VINCENT_GACHE_-_9_RUE_FRANCOIS_ALBERT'),
(57, '00057-GAETAN_RONDEAU', 20, 'GAETAN_RONDEAU_-_20_RUE_GAETAN_RONDEAU'),
(58, '00058-PALAIS_DES_SPORTS', 15, 'PALAIS_DES_SPORTS_-_21_RUE_RENE_VIVIANI'),
(59, '00059-STADE_SAUPIN', 15, 'STADE_SAUPIN_-_35_QUAI_MALAKOFF'),
(60, '00060-GARE_SUD', 40, 'GARE_SUD_-_FACE_12_RUE_LOURMEL'),
(61, '00061-LU_-_LIEU_UNIQUE', 15, 'LIEU_UNIQUE_-_FACE_23_QUAI_FERDINAND_FAVRE'),
(62, '00062-GARE_NORD', 40, 'GARE_NORD_-_1_PLACE_CHARLES_LE_ROUX'),
(63, '00063-JARDIN_DES_PLANTES', 15, 'JARDIN_DES_PLANTES_-_6_RUE_STANILAS_BAUDRY'),
(64, '00064-SAINT_CLEMENT', 15, 'SAINT_CLEMENT_-_FACE_AU_37_RUE_DU_MARECHAL_JOFFRE'),
(65, '00065-COURS_SULLY', 15, 'COURS_SULLY_-_FACE_AU_9_COURS_SULLY'),
(66, '00066-CHANZY', 15, 'CHANZY_-_FACE_AU_23_AVENUE_DE_CHANZY'),
(67, '00067-PLACE_WALDECK_ROUSSEAU', 19, 'PLACE_WALDECK_ROUSSEAU'),
(68, '00068-LIVET', 15, 'LIVET_-_FACE_AU_65_RUE_DU_FOUR'),
(69, '00069_-_MANUFACTURE', 15, 'MANUFACTURE_-_11_BIS_BD_STALINGRAD'),
(70, '00070-GARE_SUD_2', 30, 'Quai_Malakoff_-_cote_canal_st_Felix'),
(71, '00071-MARCHE_TALENSAC_NORD', 14, 'MARCHE_TALENSAC_NORD_-_18_RUE_TALENSAC'),
(72, '00072-BELLAMY-GUE_MOREAU', 15, 'Bellamy-Gue_Moreau-138_rue_Paul_Bellamy'),
(73, '00073-SARRADIN', 13, 'SARRADIN_-_FACE_AU_4_PLACE_SARRADIN'),
(74, '00074-CANCLAUX', 15, 'CANCLAUX_-_8_PLACE_CANCLAUX'),
(75, '00075-LAMORICIERE', 18, 'LAMORICIERE_-_PLACE_BEAUMANOIR'),
(76, '00076-PLACE_RENE_BOUHIER', 15, 'PLACE_RENE_BOUHIER_-_8_PLACE_RENE_BOUHIER'),
(77, '00077-ECOLE_D_ARCHITECTURE', 25, 'ECOLE_D_ARCHITECTURE_-_QUAI_F_MITTERRAND'),
(78, '00078-DE_GAULLE', 15, 'DE_GAULLE_-_PONT_A__BRIAND___BD_DE_GAULLE'),
(79, '00079-MALAKOFF', 15, 'MALAKOFF_-_15_QUAI_MALAKOFF'),
(80, '00080_-_VICTOR_HUGO', 15, 'VICTOR_HUGO_-_BD_VICTOR_HUGO'),
(81, '00081_-_MANGIN', 14, 'MANGIN_-_DEV_8_PLACE_MANGIN'),
(82, '00082-SEBILLEAU', 16, 'SEBILLEAU_-_9_RUE_GAETAN_RONDEAU'),
(83, '00083-MILLERAND', 14, 'MILLERAND_-_9_BD_ALEXANDRE_MILLERAND'),
(84, '00084-REGION', 19, 'REGION_-_RUE_DE_LA_LOIRE'),
(85, '00085-BEL_AIR', 14, 'BEL_AIR_-_102_RUE_PAUL_BELLAMY'),
(86, '00086-HAUTS_PAVES', 16, 'HAUT_PAVES_-_ANGLE_RUE_DE_BERRY_RUE_DES_HAUTS_PAVES'),
(87, '00087-ANATOLE_FRANCE', 15, 'ANATOLE_FRANCE_-_41_RUE_ALEXANDRE_DUMAS'),
(88, '00088-MELLINET', 15, 'MELLINET_-_1_BD_ALLARD'),
(89, '00089-SAINT-AIGNAN', 14, 'SAINT_AIGNAN_-_65_BD_ST_AIGNAN'),
(90, '00090-PROCE', 15, 'PROCE_-_ANGLE_BD_G__SERPETTE_and_BD_A__PAGEOT'),
(91, '00091-RD_PT_VANNES', 18, 'RD_PT_VANNES_-_65_BD_LE_LASSEUR'),
(92, '00092-DT_PT_RENNES', 20, 'RD_PT_RENNES_-_ANGLE_BD_LE_LASSEUR_and_RUE_PAUL_BELLAMY'),
(93, '00093-FACULTES', 40, 'FACULTES_-_ANGLE_ROUTE_DE_LA_JONELIERE_and_BD_G__MOLLET'),
(94, '00094-PETIT_PORT', 20, 'PETIT_PORT_-_BD_DU_PETIT_PORT'),
(95, '00095-MICHELET', 25, 'MICHELET_-_BD_MICHELET'),
(96, '00096-TORTIERE', 16, 'TORTIERE_-_BD_EUGENE_ORIEUX'),
(97, '00097-SAINT_DONATIEN', 20, 'SAINT_DONATIEN_-_PLACE_DU_51eme_RIMA'),
(98, '00098-HUIT_MAI', 15, 'HUIT_MAI_-_AVENUE_DE_LA_LIBERATION_-_REZE'),
(99, '00099-ST_JACQUES', 15, 'ST_JACQUES_-_RUE_ST_JACQUES'),
(100, '00100_-_GRENERAIE', 20, 'GRENERAIE_-_PARC_DE_LA_GRENERAIE'),
(101, '00101_-_PIRMIL', 28, 'PIRMIL_-_RUE_ESNOUL_DES_CHATELETS'),
(102, '00102-GARE_PT_ROUSSEAU', 20, 'GARE_PONT_ROUSSEAU_-_RUE_DE_LA_GARE_-_REZE'),
(103, '00103_-_STATION_MOBILE', 15, 'ILE_DE_NANTES_PARC_DES_CHANTIERS_A_COTE_DU_CARROUSEL___Station_mobile_');

-- --------------------------------------------------------

--
-- Table structure for table `pari_bicloo`
--

CREATE TABLE IF NOT EXISTS `pari_bicloo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `bicloo_id` mediumint(8) unsigned NOT NULL,
  `nb_place_pari` mediumint(8) unsigned NOT NULL,
  `nb_place_reel` mediumint(8) unsigned NOT NULL,
  `gain` mediumint(8) unsigned NOT NULL,
  `mise` mediumint(8) unsigned NOT NULL,
  `date_pari` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_traite` timestamp NULL DEFAULT NULL,
  `date_create` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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
  `date_traite` timestamp NULL DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=423 ;

--
-- Dumping data for table `troncon`
--

INSERT INTO `troncon` (`id`, `nom`, `adress_start`, `adress_stop`) VALUES
(11, '', 'Prairie de Mauves', 'PCE NEPTUNE'),
(12, '', 'Prairie de Mauves', 'SAUPIN'),
(21, '', 'Cote St Sébastien', 'NANTES CENTRE VIA PIRMIL'),
(22, '', 'Cote St Sébastien', 'NANTES CENTRE VIA CLEMENCEAU'),
(31, '', 'St Jean (Rezé)', 'NANTES CENTRE VIA CLEMENCEAU'),
(32, '', 'St Jean (Rezé)', 'NANTES CENTRE VIA PIRMIL'),
(41, '', 'Rue Jean Jaurès (Rezé)', 'NANTES CENTRE VIA PIRMIL'),
(42, '', 'Rue Jean Jaurès (Rezé)', 'NANTES CENTRE VIA 3 CONTINENTS'),
(51, '', 'Pce Renaissance (Rezé)', 'NANTES CENTRE VIA PIRMIL'),
(52, '', 'Pce Renaissance (Rezé)', 'NANTES CENTRE VIA 3 CONTINENTS'),
(61, '', 'Bd De Gaulle (Rezé)', 'NANTES CENTRE VIA PIRMIL'),
(62, '', 'Bd De Gaulle (Rezé)', 'Bd De Gaulle (Rezé)'),
(71, '', 'Rte de Pornic', 'NANTES CENTRE VIA PIRMIL'),
(72, '', 'Rte de Pornic', 'NANTES CENTRE VIA 3 CONTINENTS'),
(81, '', 'Pont Clémenceau', 'PCE NEPTUNE'),
(82, '', 'Pont Clémenceau', 'PCE RICORDEAU'),
(91, '', 'Bd Allende', 'PCE HOLLANDE'),
(92, '', 'Bd Allende', 'PCE REPUBLIQUE'),
(111, '', 'Bd Jules Verne', 'PCE FOCH'),
(112, '', 'Bd Jules Verne', 'PCE PONT MORAND'),
(121, '', 'Rte Ste Luce', 'PCE NEPTUNE'),
(122, '', 'Rte Ste Luce', 'PCE FOCH'),
(141, '', 'Avenue Carnot', 'PTE SORINIERES VIA BEAULIEU'),
(142, '', 'Avenue Carnot', 'PTE SORINIERES VIA MALAKOFF'),
(161, '', 'Bd Guy Mollet', 'PCE PONT MORAND'),
(162, '', 'Bd Guy Mollet', 'PCE BRETAGNE'),
(171, '', 'Bd Schuman', 'PCE PONT MORAND'),
(172, '', 'Bd Schuman', 'PCE BRETAGNE'),
(181, '', 'Rue Bellamy', 'PTE RENNES'),
(182, '', 'Rue Bellamy', 'PTE LA CHAPELLE'),
(191, '', 'Rte de Vannes', 'PCE BRETAGNE'),
(192, '', 'Rte de Vannes', 'PCE DELORME'),
(201, '', 'Rue Paul Chabas', 'PCE DELORME'),
(202, '', 'Rue Paul Chabas', 'PCE BRETAGNE'),
(211, '', 'Bd Léon Jouhaux', 'PCE HOLLANDE'),
(212, '', 'Bd Léon Jouhaux', 'PCE REPUBLIQUE'),
(221, '', 'Quai Ernest Renaud', 'PCE HOLLANDE'),
(222, '', 'Quai Ernest Renaud', 'PCE REPUBLIQUE'),
(261, '', 'Bd Victor Hugo', 'PTE BOUGUENAIS'),
(271, '', 'Pont des Bourdonnières', 'NANTES CENTRE VIA CLEMENCEAU'),
(272, '', 'Pont des Bourdonnières', 'NANTES CENTRE VIA PIRMIL'),
(311, '', 'Bd Chevreul', 'PCE HOLLANDE'),
(312, '', 'Bd Chevreul', 'PCE REPUBLIQUE'),
(331, '', 'Rte de St Joseph', 'PCEPONT MORAND'),
(332, '', 'Rte de St Joseph', 'PCE FOCH'),
(361, '', 'Rue Général Buat', 'PTE CARQUEFOU'),
(362, '', 'Rue Général Buat', 'PTE BEAUJOIRE'),
(371, '', 'Rue du Coudray', 'PTE BEAUJOIRE'),
(372, '', 'Rue du Coudray', 'PTE CARQUEFOU'),
(381, '', 'Bd Amiral Courbet', 'PTE LA CHAPELLE'),
(411, '', 'Pont des 3 Continents', 'PCE RICORDEAU'),
(412, '', 'Pont des 3 Continents', 'PCE HOLLANDE'),
(421, '', 'Pont de Pirmil', 'PCE RICORDEAU'),
(422, '', 'Pont de Pirmil', 'PCE HOLLANDE');

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
