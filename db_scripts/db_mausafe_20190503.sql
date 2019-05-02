-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 02 Mai 2019 à 16:07
-- Version du serveur :  10.1.19-MariaDB
-- Version de PHP :  5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mausafe`
--

-- --------------------------------------------------------

--
-- Structure de la table `circle_details`
--

CREATE TABLE `circle_details` (
  `id` int(11) NOT NULL,
  `device_id` varchar(5000) NOT NULL,
  `contact_name` varchar(5000) NOT NULL,
  `contact_number` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `circle_details`
--

INSERT INTO `circle_details` (`id`, `device_id`, `contact_name`, `contact_number`) VALUES
(3, 'MMB29M-Lenovo Z90a40', 'Dad', '59807708'),
(4, 'R16NW-SM-G935F', 'Gui', '59807708');

-- --------------------------------------------------------

--
-- Structure de la table `help_request`
--

CREATE TABLE `help_request` (
  `id` int(11) NOT NULL,
  `name` varchar(5000) NOT NULL,
  `NIC` varchar(500) NOT NULL,
  `age` int(11) NOT NULL,
  `blood_group` varchar(1) NOT NULL,
  `special_conditions` varchar(5000) NOT NULL,
  `device_id` varchar(500) NOT NULL,
  `device_name` varchar(500) NOT NULL,
  `status` varchar(25) NOT NULL COMMENT 'PENDING, COMPLETED OR CANCELLED',
  `event_type` varchar(500) NOT NULL,
  `impact_type` varchar(500) DEFAULT NULL,
  `building_type` varchar(500) DEFAULT NULL,
  `no_floors` int(11) DEFAULT NULL,
  `samu_needed` tinyint(4) DEFAULT NULL,
  `person_trapped` tinyint(4) DEFAULT NULL,
  `video` longblob,
  `video_filename` varchar(1000) DEFAULT NULL,
  `is_witness` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `help_request`
--

INSERT INTO `help_request` (`id`, `name`, `NIC`, `age`, `blood_group`, `special_conditions`, `device_id`, `device_name`, `status`, `event_type`, `impact_type`, `building_type`, `no_floors`, `samu_needed`, `person_trapped`, `video`, `video_filename`, `is_witness`) VALUES
(3, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(10, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(17, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(18, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(27, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(28, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(29, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(30, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(31, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(32, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(33, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(34, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(35, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(36, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(37, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(38, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(39, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(40, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(41, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(42, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(43, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(44, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(45, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(46, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(47, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(48, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(49, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(50, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(51, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(52, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(53, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(54, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(55, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(56, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(57, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(58, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(59, 'Cedric Azemia', 'A140989310773F', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(60, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'N2G47H-Mi A1', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(61, 'Cedric Azemia', 'A140989310773F', 29, 'A', 'Astma, Cardiac', 'N2G47H-Mi A1', '', 'CANCELLED', 'Assault', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(65, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', '14', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(66, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(67, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(68, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(69, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(70, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(71, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(72, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(73, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(74, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'COMPLETED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(75, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'COMPLETED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(76, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'COMPLETED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(77, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'COMPLETED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(78, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(79, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(80, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(81, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(82, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(83, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(84, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(85, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(86, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(87, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(88, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(93, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', '12345', '', 'PENDING', 'Health', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(109, 'Cedric Azemia', 'A140989310773F', 29, 'A', 'Astma, Cardiac', 'PKQ1.180716.001-ONEPLUS A6013', '', 'CANCELLED', 'Fireman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `help_request_location`
--

CREATE TABLE `help_request_location` (
  `id` int(11) NOT NULL,
  `help_request_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `longitude` varchar(500) NOT NULL,
  `latitude` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `help_request_location`
--

INSERT INTO `help_request_location` (`id`, `help_request_id`, `date_time`, `longitude`, `latitude`) VALUES
(1, 1, '2018-06-30 18:35:15', '20.7889', '26.8889'),
(2, 2, '2018-06-30 18:36:53', '20.7889', '26.8889'),
(3, 3, '2018-07-01 10:49:37', '20.7889', '26.8889'),
(4, 4, '2018-07-01 10:49:53', '20.7889', '26.8889'),
(5, 5, '2018-07-01 10:50:28', '20.7889', '26.8889'),
(6, 6, '2018-07-01 10:52:27', '20.7889', '26.8889'),
(7, 7, '2018-07-01 10:52:44', '20.7889', '26.8889'),
(8, 8, '2018-07-01 10:59:08', '57.4628959', '-20.2353287'),
(9, 9, '2018-07-01 11:00:47', '57.4628959', '-20.2353287'),
(10, 10, '2018-07-01 11:02:26', '57.4628959', '-20.2353287'),
(11, 11, '2018-07-01 14:45:16', '57.4628959', '-20.2353287'),
(12, 11, '2018-07-02 20:16:48', '57.5715367', '-20.219888'),
(13, 11, '2018-07-02 20:17:50', '57.5715367', '-20.219888'),
(14, 11, '2018-07-02 20:18:50', '57.5715367', '-20.219888'),
(15, 11, '2018-07-02 20:19:01', '57.5715367', '-20.219888'),
(16, 11, '2018-07-02 20:19:20', '57.5715367', '-20.219888'),
(17, 11, '2018-07-02 20:22:25', '57.5715367', '-20.219888'),
(18, 11, '2018-07-02 20:22:48', '57.5715367', '-20.219888'),
(19, 11, '2018-07-02 20:23:50', '57.6727295', '-20.4308334'),
(20, 11, '2018-07-02 20:24:32', '57.6727295', '-20.4308334'),
(21, 11, '2018-07-02 20:25:13', '57.5642008', '-20.0116589'),
(22, 12, '2018-07-08 19:37:21', '57.45117040', '57.45117040'),
(23, 13, '2018-07-08 19:38:16', '57.45117030', '57.45117030'),
(24, 14, '2018-07-08 20:12:57', '57.45117010', '57.45117010'),
(25, 15, '2018-07-08 20:14:57', '57.45117400', '57.45117400'),
(26, 16, '2018-07-08 20:16:22', '57.45117410', '57.45117410'),
(27, 17, '2018-07-08 20:21:25', '57.45117410', '57.45117410'),
(28, 18, '2018-07-10 19:33:39', '57.45119550', '-20.23387780'),
(29, 19, '2018-07-11 18:32:58', '57.45117010', '-20.23393830'),
(30, 20, '2018-07-11 18:36:01', '57.45117070', '-20.23393890'),
(31, 21, '2018-07-11 18:42:43', '57.45117070', '-20.23393890'),
(32, 22, '2018-07-11 19:12:40', '57.45117030', '-20.23394730'),
(33, 23, '2018-07-11 20:53:50', '57.45117030', '-20.23393850'),
(34, 24, '2018-07-11 20:57:30', '57.45117090', '-20.23393910'),
(35, 25, '2018-07-11 20:58:46', '57.45117030', '-20.23393840'),
(36, 26, '2018-07-11 20:59:48', '57.45117020', '-20.23393820'),
(37, 27, '2018-07-11 21:03:16', '57.45117030', '-20.23394700'),
(38, 28, '2018-07-11 21:05:30', '57.45117040', '-20.23394280'),
(39, 29, '2018-07-11 21:07:05', '57.45117180', '-20.23393910'),
(40, 30, '2018-07-11 21:07:57', '57.45117400', '-20.23393900'),
(41, 31, '2018-07-12 21:05:37', '57.45117020', '-20.23393830'),
(42, 32, '2018-07-12 21:13:08', '57.45659600', '-20.23978200'),
(43, 33, '2018-07-13 20:30:39', '57.45123170', '-20.23392620'),
(44, 34, '2018-07-13 20:40:08', '57.45122720', '-20.23392920'),
(45, 35, '2018-07-13 20:42:33', '57.45123170', '-20.23392620'),
(46, 36, '2018-07-13 20:45:32', '57.45123170', '-20.23392630'),
(47, 37, '2018-07-13 20:46:40', '57.45123170', '-20.23392620'),
(48, 38, '2018-07-13 20:47:12', '57.45123170', '-20.23392620'),
(49, 39, '2018-07-13 20:49:13', '57.45123170', '-20.23392620'),
(50, 40, '2018-07-13 20:52:55', '57.45659600', '-20.23978200'),
(51, 41, '2018-07-13 20:53:38', '57.45659600', '-20.23978200'),
(52, 42, '2018-07-13 20:54:39', '57.45659600', '-20.23978200'),
(53, 43, '2018-07-13 20:55:41', '57.45659600', '-20.23978200'),
(54, 44, '2018-07-16 18:49:52', '57.45659600', '-20.23978200'),
(55, 45, '2018-07-16 18:51:47', '57.45659600', '-20.23978200'),
(56, 46, '2018-07-16 18:52:48', '57.45659600', '-20.23978200'),
(57, 47, '2018-07-16 18:53:35', '57.45659600', '-20.23978200'),
(58, 48, '2018-07-16 18:53:53', '57.45659600', '-20.23978200'),
(59, 49, '2018-07-16 18:54:39', '57.45659600', '-20.23978200'),
(60, 50, '2018-07-16 18:55:47', '57.45659600', '-20.23978200'),
(61, 51, '2018-07-16 18:56:14', '57.45659600', '-20.23978200'),
(62, 52, '2018-07-16 19:27:11', '57.45123170', '-20.23392630'),
(63, 53, '2018-07-16 19:31:34', '57.45123220', '-20.23392660'),
(64, 54, '2018-07-16 19:34:22', '57.45659600', '-20.23978200'),
(65, 55, '2018-07-17 19:19:06', '57.45123210', '-20.23392650'),
(66, 56, '2018-07-17 19:25:18', '57.45123200', '-20.23392650'),
(67, 57, '2018-07-17 19:31:54', '57.45132710', '-20.23388150'),
(68, 58, '2018-07-17 19:34:58', '57.45123190', '-20.23392630'),
(69, 59, '2018-07-17 19:36:55', '57.45123180', '-20.23392630'),
(70, 60, '2018-07-28 16:32:12', '57.45112770', '-20.23387560'),
(71, 61, '2018-07-28 16:40:11', '57.45112770', '-20.23385780'),
(72, 62, '2018-08-12 15:20:48', '57.45659600', '-20.23978200'),
(73, 63, '2018-08-12 15:22:28', '57.4628959', '-20.2353287'),
(74, 64, '2018-08-12 15:25:23', '57.4628959', '-20.2353287'),
(75, 65, '2018-08-12 15:27:18', '57.4628959', '-20.2353287'),
(76, 66, '2018-08-12 15:28:08', '57.45119280', '-20.23388100'),
(77, 67, '2018-08-12 15:28:23', '57.45119270', '-20.23388100'),
(78, 68, '2018-08-12 15:28:40', '57.45119270', '-20.23388100'),
(79, 69, '2018-08-12 15:29:33', '57.45119280', '-20.23388090'),
(80, 70, '2018-08-15 11:06:17', '57.45121380', '-20.23394230'),
(81, 71, '2018-08-15 11:11:40', '57.45121120', '-20.23389850'),
(82, 72, '2018-08-16 18:16:52', '57.45121360', '-20.23389270'),
(83, 73, '2018-08-16 18:19:55', '57.45121390', '-20.23393180'),
(84, 74, '2018-08-16 18:49:33', '57.45121780', '-20.23391720'),
(85, 75, '2018-08-16 18:54:03', '57.45121380', '-20.23393120'),
(86, 76, '2018-08-16 18:58:05', '57.45121390', '-20.23393110'),
(87, 77, '2018-08-16 18:59:20', '57.45121530', '-20.23392630'),
(88, 78, '2018-08-16 21:07:57', '57.45121380', '-20.23394220'),
(89, 79, '2018-08-17 19:18:57', '57.45121400', '-20.23391670'),
(90, 80, '2018-08-18 10:48:10', '57.45118760', '-20.23387460'),
(91, 81, '2018-08-18 10:54:15', '57.45115940', '-20.23377970'),
(92, 82, '2018-08-18 11:06:51', '57.45659600', '-20.23978200'),
(93, 83, '2018-08-18 11:23:45', '57.45098770', '-20.23309660'),
(94, 84, '2018-08-18 11:26:56', '57.45126130', '-20.23374460'),
(95, 85, '2018-08-18 11:31:23', '57.45099690', '-20.23369940'),
(96, 86, '2018-08-18 11:32:07', '57.45107250', '-20.23374660'),
(97, 87, '2018-08-18 11:42:24', '57.45119210', '-20.23387990'),
(98, 88, '2018-08-18 11:45:20', '57.45126470', '-20.23389380'),
(99, 89, '2018-08-18 14:11:06', '57.4628959', '-20.2353287'),
(100, 90, '2018-08-18 14:12:58', '57.4628959', '-20.2353287'),
(101, 91, '2018-08-18 14:13:46', '57.4628959', '-20.2353287'),
(102, 92, '2018-08-18 14:14:42', '57.4628959', '-20.2353287'),
(103, 93, '2018-08-18 14:26:46', '57.4628959', '-20.2353287'),
(104, 94, '2019-05-02 10:06:55', '20', '10'),
(105, 95, '2019-05-02 10:37:00', '57.48911640', '-20.25491720'),
(106, 96, '2019-05-02 11:01:18', '57.48911980', '-20.25491460'),
(107, 97, '2019-05-02 11:06:30', '57.48913230', '-20.25490610'),
(108, 98, '2019-05-02 11:38:52', '57.48901560', '-20.25486810'),
(109, 99, '2019-05-02 11:39:20', '57.48900960', '-20.25486680'),
(110, 100, '2019-05-02 11:49:45', '57.48900170', '-20.25486520'),
(111, 101, '2019-05-02 11:50:10', '57.48901620', '-20.25486820'),
(112, 102, '2019-05-02 11:53:13', '57.48901610', '-20.25486810'),
(113, 103, '2019-05-02 12:03:08', '57.48899760', '-20.25486440'),
(114, 104, '2019-05-02 12:03:52', '57.48902870', '-20.25487050'),
(115, 105, '2019-05-02 13:10:02', '57.48913790', '-20.25490770'),
(116, 106, '2019-05-02 13:11:22', '57.48912990', '-20.25490610'),
(117, 107, '2019-05-02 13:11:51', '57.48912040', '-20.25491440'),
(118, 108, '2019-05-02 13:13:11', '57.48913850', '-20.25490770'),
(119, 109, '2019-05-02 13:18:22', '57.48913900', '-20.25491100');

-- --------------------------------------------------------

--
-- Structure de la table `help_request_provider_need`
--

CREATE TABLE `help_request_provider_need` (
  `id` int(11) NOT NULL,
  `help_request_id` int(11) NOT NULL,
  `needed_provider_id` varchar(25) NOT NULL,
  `assignment_required` tinyint(4) NOT NULL DEFAULT '0',
  `assigned_station` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `help_request_provider_need`
--

INSERT INTO `help_request_provider_need` (`id`, `help_request_id`, `needed_provider_id`, `assignment_required`, `assigned_station`) VALUES
(1, 1, '0', 0, 0),
(2, 1, '0', 0, 0),
(3, 1, '0', 0, 0),
(4, 2, '0', 0, 0),
(5, 2, '0', 0, 0),
(6, 2, '0', 0, 0),
(7, 3, '0', 0, 0),
(8, 3, '0', 0, 0),
(9, 3, '0', 0, 0),
(10, 4, '0', 0, 0),
(11, 4, '0', 0, 0),
(12, 4, '0', 0, 0),
(13, 5, '0', 0, 0),
(14, 5, '0', 0, 0),
(15, 5, '0', 0, 0),
(16, 6, '0', 0, 0),
(17, 6, '0', 0, 0),
(18, 6, '0', 0, 0),
(19, 7, '0', 0, 0),
(20, 7, '0', 0, 0),
(21, 7, '0', 0, 0),
(22, 8, '0', 0, 0),
(23, 8, '0', 0, 0),
(24, 8, '0', 0, 0),
(25, 9, 'POLICE', 0, 0),
(26, 9, 'SAMU', 0, 0),
(27, 9, 'FIRE', 0, 0),
(28, 10, 'POLICE', 0, 0),
(29, 10, 'SAMU', 0, 0),
(30, 10, 'FIREMAN', 0, 0),
(31, 11, 'POLICE', 0, 0),
(32, 11, 'SAMU', 0, 0),
(33, 11, 'FIREMAN', 0, 0),
(34, 12, 'POLICE', 0, 0),
(35, 12, 'SAMU', 0, 0),
(36, 12, 'FIREMA', 0, 0),
(37, 13, 'POLICE', 0, 0),
(38, 13, 'SAMU', 0, 0),
(39, 13, 'FIREMA', 0, 0),
(40, 14, 'POLICE', 0, 0),
(41, 14, 'SAMU', 0, 0),
(42, 14, 'FIREMAN', 0, 0),
(43, 15, 'POLICE', 0, 0),
(44, 15, 'SAMU', 0, 0),
(45, 15, 'FIREMAN', 0, 0),
(46, 16, 'POLICE', 0, 0),
(47, 16, 'SAMU', 0, 0),
(48, 16, 'FIREMAN', 0, 0),
(49, 17, 'POLICE', 0, 0),
(50, 17, 'SAMU', 0, 0),
(51, 17, 'FIREMAN', 0, 0),
(52, 18, '', 0, 0),
(53, 19, '', 0, 0),
(54, 20, '', 0, 0),
(55, 21, 'POLICE', 0, 0),
(56, 21, 'SAMU', 0, 0),
(57, 22, 'POLICE', 0, 0),
(58, 22, 'SAMU', 0, 0),
(59, 23, 'POLICE', 0, 0),
(60, 23, 'SAMU', 0, 0),
(61, 24, 'POLICE', 0, 0),
(62, 24, 'SAMU', 0, 0),
(63, 25, 'POLICE', 0, 0),
(64, 25, 'SAMU', 0, 0),
(65, 26, 'POLICE', 0, 0),
(66, 26, 'SAMU', 0, 0),
(67, 27, 'POLICE', 0, 0),
(68, 27, 'SAMU', 0, 0),
(69, 28, 'POLICE', 0, 0),
(70, 28, 'SAMU', 0, 0),
(71, 29, 'POLICE', 0, 0),
(72, 29, 'SAMU', 0, 0),
(73, 30, 'POLICE', 0, 0),
(74, 30, 'SAMU', 0, 0),
(75, 31, 'POLICE', 0, 0),
(76, 31, 'SAMU', 0, 0),
(77, 32, 'POLICE', 0, 0),
(78, 32, 'SAMU', 0, 0),
(79, 33, 'POLICE', 0, 0),
(80, 33, 'SAMU', 0, 0),
(81, 34, 'POLICE', 0, 0),
(82, 34, 'SAMU', 0, 0),
(83, 35, 'POLICE', 0, 0),
(84, 35, 'SAMU', 0, 0),
(85, 36, 'POLICE', 0, 0),
(86, 36, 'SAMU', 0, 0),
(87, 37, 'POLICE', 0, 0),
(88, 37, 'SAMU', 0, 0),
(89, 38, 'POLICE', 0, 0),
(90, 38, 'SAMU', 0, 0),
(91, 39, 'POLICE', 0, 0),
(92, 39, 'SAMU', 0, 0),
(93, 40, 'POLICE', 0, 0),
(94, 40, 'SAMU', 0, 0),
(95, 41, 'POLICE', 0, 0),
(96, 41, 'SAMU', 0, 0),
(97, 42, 'POLICE', 0, 0),
(98, 42, 'SAMU', 0, 0),
(99, 43, 'POLICE', 0, 0),
(100, 43, 'SAMU', 0, 0),
(101, 44, 'POLICE', 0, 0),
(102, 44, 'SAMU', 0, 0),
(103, 45, 'POLICE', 0, 0),
(104, 45, 'SAMU', 0, 0),
(105, 46, 'POLICE', 0, 0),
(106, 46, 'SAMU', 0, 0),
(107, 47, 'POLICE', 0, 0),
(108, 47, 'SAMU', 0, 0),
(109, 48, 'POLICE', 0, 0),
(110, 48, 'SAMU', 0, 0),
(111, 49, 'POLICE', 0, 0),
(112, 49, 'SAMU', 0, 0),
(113, 50, 'POLICE', 0, 0),
(114, 50, 'SAMU', 0, 0),
(115, 51, 'POLICE', 0, 0),
(116, 51, 'SAMU', 0, 0),
(117, 52, 'POLICE', 0, 0),
(118, 52, 'SAMU', 0, 0),
(119, 53, 'POLICE', 0, 0),
(120, 53, 'SAMU', 0, 0),
(121, 54, 'POLICE', 0, 0),
(122, 54, 'SAMU', 0, 0),
(125, 54, 'FIREMAN', 0, 0),
(126, 55, 'POLICE', 0, 0),
(127, 55, 'SAMU', 0, 0),
(128, 56, 'POLICE', 0, 0),
(129, 56, 'SAMU', 0, 0),
(130, 57, 'POLICE', 0, 0),
(131, 57, 'SAMU', 0, 0),
(132, 58, 'POLICE', 0, 0),
(133, 58, 'SAMU', 0, 0),
(134, 59, 'POLICE', 0, 0),
(135, 59, 'SAMU', 0, 0),
(136, 60, 'POLICE', 0, 0),
(137, 60, 'SAMU', 0, 0),
(138, 61, 'FIREMAN', 0, 0),
(139, 61, 'SAMU', 0, 0),
(140, 62, 'SAMU', 0, 0),
(141, 63, 'POLICE', 0, 0),
(142, 63, 'SAMU', 0, 0),
(143, 63, 'FIREMA\n', 0, 0),
(144, 64, 'POLICE', 0, 0),
(145, 64, 'SAMU', 0, 0),
(146, 64, 'FIREMEN\n', 0, 0),
(147, 65, 'POLICE', 0, 0),
(148, 65, 'SAMU', 0, 0),
(149, 65, 'FIREMEN\n', 0, 0),
(150, 66, 'SAMU', 0, 0),
(151, 67, 'POLICE', 0, 0),
(152, 67, 'SAMU', 0, 0),
(153, 67, 'FIREMAN', 0, 0),
(154, 68, 'POLICE', 0, 0),
(155, 68, 'SAMU', 0, 0),
(156, 68, 'FIREMAN', 0, 0),
(157, 69, 'POLICE', 0, 0),
(158, 69, 'SAMU', 0, 0),
(159, 69, 'FIREMAN', 0, 0),
(160, 70, 'SAMU', 0, 0),
(161, 71, 'SAMU', 0, 0),
(162, 72, 'SAMU', 0, 0),
(163, 73, 'SAMU', 0, 0),
(164, 74, 'SAMU', 0, 0),
(165, 75, 'SAMU', 0, 0),
(166, 76, 'SAMU', 0, 0),
(167, 77, 'SAMU', 0, 0),
(168, 78, 'SAMU', 0, 0),
(169, 79, 'SAMU', 0, 0),
(170, 80, 'SAMU', 0, 0),
(171, 81, 'SAMU', 0, 0),
(172, 82, 'SAMU', 0, 0),
(173, 83, 'SAMU', 0, 0),
(174, 84, 'SAMU', 0, 0),
(175, 85, 'SAMU', 0, 0),
(176, 86, 'SAMU', 0, 0),
(177, 87, 'SAMU', 0, 0),
(178, 88, 'SAMU', 0, 0),
(179, 89, 'POLICE', 0, 0),
(180, 89, 'SAMU', 0, 0),
(181, 89, 'FIREMEN\n', 0, 0),
(182, 90, 'POLICE', 0, 0),
(183, 90, 'SAMU', 0, 0),
(184, 90, 'FIREMEN\n', 0, 0),
(185, 91, 'POLICE', 0, 0),
(186, 91, 'SAMU', 0, 0),
(187, 91, 'FIREMEN\n', 0, 0),
(188, 92, 'POLICE', 0, 0),
(189, 92, 'SAMU', 0, 0),
(190, 92, 'FIREMEN\n', 0, 0),
(191, 93, 'POLICE', 0, 0),
(192, 93, 'SAMU', 0, 0),
(193, 93, 'FIREMEN\n', 0, 0),
(194, 94, '', 0, 0),
(195, 95, 'FIREMAN', 0, 0),
(196, 96, 'FIREMAN', 0, 0),
(197, 97, 'FIREMAN', 0, 0),
(198, 98, 'SAMU', 0, 0),
(199, 99, 'FIREMAN', 0, 0),
(200, 100, 'FIREMAN', 0, 0),
(201, 101, 'FIREMAN', 0, 0),
(202, 101, 'SAMU', 0, 0),
(203, 102, 'FIREMAN', 0, 0),
(204, 102, 'SAMU', 0, 0),
(205, 102, 'SAMU', 0, 0),
(206, 103, 'FIREMAN', 0, 0),
(207, 103, 'SAMU', 0, 0),
(208, 103, 'SAMU', 0, 0),
(209, 103, 'SAMU', 0, 0),
(210, 103, 'SAMU', 0, 0),
(211, 104, 'FIREMAN', 0, 0),
(212, 104, 'SAMU', 0, 0),
(213, 104, 'SAMU', 0, 0),
(214, 104, 'SAMU', 0, 0),
(215, 104, 'SAMU', 0, 0),
(216, 105, 'FIREMAN', 0, 0),
(217, 106, 'FIREMAN', 0, 0),
(218, 107, 'FIREMAN', 0, 0),
(219, 107, 'SAMU', 0, 0),
(220, 108, 'FIREMAN', 0, 0),
(221, 109, 'FIREMAN', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `keys`
--

INSERT INTO `keys` (`id`, `key`, `level`, `ignore_limits`, `date_created`) VALUES
(1, '58eb50e1-f87b-44a7-a4be-dcccd71625eb', 1, 0, 20180701);

-- --------------------------------------------------------

--
-- Structure de la table `service_provider`
--

CREATE TABLE `service_provider` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service_provider`
--

INSERT INTO `service_provider` (`id`, `name`) VALUES
(1, 'SAMU'),
(2, 'POLICE'),
(3, 'FIREMAN');

-- --------------------------------------------------------

--
-- Structure de la table `service_provider_patrol`
--

CREATE TABLE `service_provider_patrol` (
  `id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `device_id` varchar(500) NOT NULL,
  `service_provider_id` varchar(500) NOT NULL,
  `token` varchar(1000) NOT NULL,
  `mobile_number` varchar(500) NOT NULL,
  `station_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service_provider_patrol`
--

INSERT INTO `service_provider_patrol` (`id`, `description`, `device_id`, `service_provider_id`, `token`, `mobile_number`, `station_id`) VALUES
(1, 'test_police', 'test_police', 'POLICE', 'TEST', '', 0),
(2, 'test_samu', 'test_samu', 'SAMU', 'd8DozVGRcGI:APA91bH5KohTrBn8U5-6aPyHq09Hal_L8NC6QqJu4RSsQg0zu_9v-60hWAm33DjaKda-RsvQRL_PM60lH9TbJgNk7TrcEma0a3RmtzDU_nfiaA4vOVSLEWZLKc13h-9ZbOCZj6_TanRdeNAtkqoykx9PYj88_NXtPQ', '', 0),
(3, 'test_firemen', 'test_firemen', 'FIREMEN', '', '', 0),
(4, 'API Test', 'TESTDEVICE', 'POLICE', 'qsdqsdqsddsq', '', 0),
(9, 'Trst', 'MMB29M-Lenovo Z90a40', 'SAMU', 'd8DozVGRcGI:APA91bH5KohTrBn8U5-6aPyHq09Hal_L8NC6QqJu4RSsQg0zu_9v-60hWAm33DjaKda-RsvQRL_PM60lH9TbJgNk7TrcEma0a3RmtzDU_nfiaA4vOVSLEWZLKc13h-9ZbOCZj6_TanRdeNAtkqoykx9PYj88_NXtPQ', '', 0),
(10, 'Mel phone', 'R16NW-SM-G935F', 'SAMU', 'fZr_b2trlVw:APA91bF9MHSnp1G_DPw46aKCLlwKswb36sFYwnp6WdBW_jnEHHta6u1w8NEOu-7Kdd5yw6Vq4sd8y2ajvYPkYI9Ri2KLLjPykNcx4fjoWvVmmVgfJLSMvwMggsaIOAmIdYLbCJaAlsS9OrpubayfPNnYw7KBZeiLRw', '57455371', 0);

-- --------------------------------------------------------

--
-- Structure de la table `service_provider_patrol_assignment`
--

CREATE TABLE `service_provider_patrol_assignment` (
  `id` int(11) NOT NULL,
  `help_request_id` varchar(11) NOT NULL,
  `patrol_id` varchar(11) NOT NULL,
  `ETA_min` varchar(50) DEFAULT NULL,
  `distance_km` varchar(50) DEFAULT NULL,
  `status` varchar(500) NOT NULL COMMENT 'TRANSIT, ARRIVED, CANCELLED',
  `service_provider_type` varchar(500) NOT NULL COMMENT 'POLICE, FIREMAN, SAMU...'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service_provider_patrol_assignment`
--

INSERT INTO `service_provider_patrol_assignment` (`id`, `help_request_id`, `patrol_id`, `ETA_min`, `distance_km`, `status`, `service_provider_type`) VALUES
(2, '11', '1', '57 mins', '41.4 km', 'CANCELLED', ''),
(3, '11', '1', '57 mins', '41.4 km', 'CANCELLED', ''),
(4, '11', '1', '57 mins', '41.4 km', 'CANCELLED', ''),
(5, '11', '1', '57 mins', '41.4 km', 'CANCELLED', ''),
(6, '11', '1', '57 mins', '41.4 km', 'CANCELLED', ''),
(7, '11', '1', '57 mins', '41.4 km', 'CANCELLED', ''),
(8, '11', '1', '57 mins', '41.4 km', 'CANCELLED', ''),
(9, '11', '1', '57 mins', '41.4 km', 'CANCELLED', ''),
(10, '19', '1', '18 mins', '9.1 km', 'CANCELLED', ''),
(11, '11', '1', '57 mins', '41.4 km', 'CANCELLED', ''),
(12, '11', '1', '57 mins', '41.4 km', 'CANCELLED', ''),
(13, '11', '1', '57 mins', '41.4 km', 'CANCELLED', ''),
(14, '11', '1', '57 mins', '41.4 km', 'CANCELLED', ''),
(15, '22', '1', '18 mins', '9.1 km', 'CANCELLED', 'POLICE'),
(16, '60', '1', '18 mins', '9.1 km', 'CANCELLED', 'SAMU'),
(23, '11', '1', '57 mins', '41.4 km', 'CANCELLED', 'SAMU'),
(27, '11', '1', '57 mins', '41.4 km', 'CANCELLED', 'SAMU'),
(31, '11', '1', '57 mins', '41.4 km', 'CANCELLED', 'SAMU'),
(32, '11', '1', '57 mins', '41.4 km', 'CANCELLED', 'SAMU'),
(33, '11', '1', '57 mins', '41.4 km', 'CANCELLED', 'SAMU'),
(34, '11', '1', '57 mins', '41.4 km', 'CANCELLED', 'SAMU'),
(35, '11', '1', '57 mins', '41.4 km', 'ARRIVED', 'FIREMAN'),
(36, '11', '1', '57 mins', '41.4 km', 'TRANSIT', 'POLICE'),
(39, '11', '9', '57 mins', '41.4 km', 'ARRIVED', 'SAMU'),
(40, '65', '9', '5 mins', '1.4 km', 'CANCELLED', 'SAMU'),
(41, '65', '9', '5 mins', '1.4 km', 'CANCELLED', 'SAMU'),
(42, '65', '9', '5 mins', '1.4 km', 'CANCELLED', 'SAMU'),
(43, '65', '9', '5 mins', '1.4 km', 'CANCELLED', 'SAMU'),
(44, '71', '9', '1 min', '1 m', 'ARRIVED', 'SAMU'),
(45, '65', '9', '5 mins', '1.4 km', 'CANCELLED', 'SAMU'),
(46, '72', '9', '1 min', '1 m', 'ARRIVED', 'SAMU'),
(47, '73', '9', '1 min', '1 m', 'ARRIVED', 'SAMU'),
(48, '74', '9', '1 min', '1 m', 'ARRIVED', 'SAMU'),
(49, '75', '9', '1 min', '1 m', 'ARRIVED', 'SAMU'),
(50, '76', '9', '1 min', '1 m', 'ARRIVED', 'SAMU'),
(51, '77', '9', '1 min', '1 m', 'ARRIVED', 'SAMU'),
(52, '79', '9', '1 min', '1 m', 'CANCELLED', 'SAMU'),
(53, '79', '9', '1 min', '1 m', 'CANCELLED', 'SAMU'),
(54, '79', '9', '1 min', '1 m', 'CANCELLED', 'SAMU'),
(55, '86', '9', '1 min', '37 m', 'TRANSIT', 'SAMU'),
(56, '87', '9', '1 min', '1 m', 'TRANSIT', 'SAMU'),
(57, '80', '10', '1 min', '1 m', 'CANCELLED', 'SAMU'),
(58, '80', '10', '1 min', '1 m', 'CANCELLED', 'SAMU');

-- --------------------------------------------------------

--
-- Structure de la table `service_provider_patrol_location`
--

CREATE TABLE `service_provider_patrol_location` (
  `id` int(11) NOT NULL,
  `patrol_id` varchar(11) NOT NULL,
  `longitude` varchar(500) NOT NULL,
  `latitude` varchar(500) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `service_provider_station`
--

CREATE TABLE `service_provider_station` (
  `id` int(11) NOT NULL,
  `station_name` varchar(1000) NOT NULL,
  `service_provider_id` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service_provider_station`
--

INSERT INTO `service_provider_station` (`id`, `station_name`, `service_provider_id`) VALUES
(1, 'Port-Louis', 'FIREMAN'),
(2, 'Rose-Hill', 'FIREMAN'),
(3, 'Plaisance', 'FIREMAN'),
(4, 'Goodlands', 'FIREMAN');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `circle_details`
--
ALTER TABLE `circle_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `help_request`
--
ALTER TABLE `help_request`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `help_request_location`
--
ALTER TABLE `help_request_location`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `help_request_provider_need`
--
ALTER TABLE `help_request_provider_need`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `service_provider`
--
ALTER TABLE `service_provider`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `service_provider_patrol`
--
ALTER TABLE `service_provider_patrol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `device_id` (`device_id`);

--
-- Index pour la table `service_provider_patrol_assignment`
--
ALTER TABLE `service_provider_patrol_assignment`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `service_provider_patrol_location`
--
ALTER TABLE `service_provider_patrol_location`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `service_provider_station`
--
ALTER TABLE `service_provider_station`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `circle_details`
--
ALTER TABLE `circle_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `help_request`
--
ALTER TABLE `help_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT pour la table `help_request_location`
--
ALTER TABLE `help_request_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT pour la table `help_request_provider_need`
--
ALTER TABLE `help_request_provider_need`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;
--
-- AUTO_INCREMENT pour la table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `service_provider`
--
ALTER TABLE `service_provider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `service_provider_patrol`
--
ALTER TABLE `service_provider_patrol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `service_provider_patrol_assignment`
--
ALTER TABLE `service_provider_patrol_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT pour la table `service_provider_patrol_location`
--
ALTER TABLE `service_provider_patrol_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;
--
-- AUTO_INCREMENT pour la table `service_provider_station`
--
ALTER TABLE `service_provider_station`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
