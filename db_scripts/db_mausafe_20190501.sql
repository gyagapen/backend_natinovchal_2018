-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 01 Mai 2019 à 17:47
-- Version du serveur :  10.1.13-MariaDB
-- Version de PHP :  5.6.23

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
  `video` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `help_request`
--

INSERT INTO `help_request` (`id`, `name`, `NIC`, `age`, `blood_group`, `special_conditions`, `device_id`, `device_name`, `status`, `event_type`, `impact_type`, `building_type`, `no_floors`, `samu_needed`, `person_trapped`, `video`) VALUES
(2, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'FG688998TGY', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', '', NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'Cedric Azemia', 'A140989310773F', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'N2G47H-Mi A1', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'Cedric Azemia', 'A140989310773F', 29, 'A', 'Astma, Cardiac', 'N2G47H-Mi A1', '', 'CANCELLED', 'Assault', NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', '14', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Accident', NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(71, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'COMPLETED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(75, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'COMPLETED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'COMPLETED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'COMPLETED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(80, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'MMB29M-Lenovo Z90a40', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(83, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(85, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(86, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(87, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(88, 'Cedric Azemia', '', 29, 'A', 'Astma, Cardiac', 'R16NW-SM-G935F', '', 'CANCELLED', 'Health', NULL, NULL, NULL, NULL, NULL, NULL),
(93, 'Cedric Azémia', '', 29, 'A', 'Astma, cardiac', 'MMB29M-Lenovo Z90a40', '', 'PENDING', 'Health', NULL, NULL, NULL, NULL, NULL, NULL);

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
(103, 93, '2018-08-18 14:26:46', '57.4628959', '-20.2353287');

-- --------------------------------------------------------

--
-- Structure de la table `help_request_provider_need`
--

CREATE TABLE `help_request_provider_need` (
  `id` int(11) NOT NULL,
  `help_request_id` int(11) NOT NULL,
  `needed_provider_id` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `help_request_provider_need`
--

INSERT INTO `help_request_provider_need` (`id`, `help_request_id`, `needed_provider_id`) VALUES
(1, 1, '0'),
(2, 1, '0'),
(3, 1, '0'),
(4, 2, '0'),
(5, 2, '0'),
(6, 2, '0'),
(7, 3, '0'),
(8, 3, '0'),
(9, 3, '0'),
(10, 4, '0'),
(11, 4, '0'),
(12, 4, '0'),
(13, 5, '0'),
(14, 5, '0'),
(15, 5, '0'),
(16, 6, '0'),
(17, 6, '0'),
(18, 6, '0'),
(19, 7, '0'),
(20, 7, '0'),
(21, 7, '0'),
(22, 8, '0'),
(23, 8, '0'),
(24, 8, '0'),
(25, 9, 'POLICE'),
(26, 9, 'SAMU'),
(27, 9, 'FIRE'),
(28, 10, 'POLICE'),
(29, 10, 'SAMU'),
(30, 10, 'FIREMAN'),
(31, 11, 'POLICE'),
(32, 11, 'SAMU'),
(33, 11, 'FIREMAN'),
(34, 12, 'POLICE'),
(35, 12, 'SAMU'),
(36, 12, 'FIREMA'),
(37, 13, 'POLICE'),
(38, 13, 'SAMU'),
(39, 13, 'FIREMA'),
(40, 14, 'POLICE'),
(41, 14, 'SAMU'),
(42, 14, 'FIREMAN'),
(43, 15, 'POLICE'),
(44, 15, 'SAMU'),
(45, 15, 'FIREMAN'),
(46, 16, 'POLICE'),
(47, 16, 'SAMU'),
(48, 16, 'FIREMAN'),
(49, 17, 'POLICE'),
(50, 17, 'SAMU'),
(51, 17, 'FIREMAN'),
(52, 18, ''),
(53, 19, ''),
(54, 20, ''),
(55, 21, 'POLICE'),
(56, 21, 'SAMU'),
(57, 22, 'POLICE'),
(58, 22, 'SAMU'),
(59, 23, 'POLICE'),
(60, 23, 'SAMU'),
(61, 24, 'POLICE'),
(62, 24, 'SAMU'),
(63, 25, 'POLICE'),
(64, 25, 'SAMU'),
(65, 26, 'POLICE'),
(66, 26, 'SAMU'),
(67, 27, 'POLICE'),
(68, 27, 'SAMU'),
(69, 28, 'POLICE'),
(70, 28, 'SAMU'),
(71, 29, 'POLICE'),
(72, 29, 'SAMU'),
(73, 30, 'POLICE'),
(74, 30, 'SAMU'),
(75, 31, 'POLICE'),
(76, 31, 'SAMU'),
(77, 32, 'POLICE'),
(78, 32, 'SAMU'),
(79, 33, 'POLICE'),
(80, 33, 'SAMU'),
(81, 34, 'POLICE'),
(82, 34, 'SAMU'),
(83, 35, 'POLICE'),
(84, 35, 'SAMU'),
(85, 36, 'POLICE'),
(86, 36, 'SAMU'),
(87, 37, 'POLICE'),
(88, 37, 'SAMU'),
(89, 38, 'POLICE'),
(90, 38, 'SAMU'),
(91, 39, 'POLICE'),
(92, 39, 'SAMU'),
(93, 40, 'POLICE'),
(94, 40, 'SAMU'),
(95, 41, 'POLICE'),
(96, 41, 'SAMU'),
(97, 42, 'POLICE'),
(98, 42, 'SAMU'),
(99, 43, 'POLICE'),
(100, 43, 'SAMU'),
(101, 44, 'POLICE'),
(102, 44, 'SAMU'),
(103, 45, 'POLICE'),
(104, 45, 'SAMU'),
(105, 46, 'POLICE'),
(106, 46, 'SAMU'),
(107, 47, 'POLICE'),
(108, 47, 'SAMU'),
(109, 48, 'POLICE'),
(110, 48, 'SAMU'),
(111, 49, 'POLICE'),
(112, 49, 'SAMU'),
(113, 50, 'POLICE'),
(114, 50, 'SAMU'),
(115, 51, 'POLICE'),
(116, 51, 'SAMU'),
(117, 52, 'POLICE'),
(118, 52, 'SAMU'),
(119, 53, 'POLICE'),
(120, 53, 'SAMU'),
(121, 54, 'POLICE'),
(122, 54, 'SAMU'),
(125, 54, 'FIREMAN'),
(126, 55, 'POLICE'),
(127, 55, 'SAMU'),
(128, 56, 'POLICE'),
(129, 56, 'SAMU'),
(130, 57, 'POLICE'),
(131, 57, 'SAMU'),
(132, 58, 'POLICE'),
(133, 58, 'SAMU'),
(134, 59, 'POLICE'),
(135, 59, 'SAMU'),
(136, 60, 'POLICE'),
(137, 60, 'SAMU'),
(138, 61, 'FIREMAN'),
(139, 61, 'SAMU'),
(140, 62, 'SAMU'),
(141, 63, 'POLICE'),
(142, 63, 'SAMU'),
(143, 63, 'FIREMA\n'),
(144, 64, 'POLICE'),
(145, 64, 'SAMU'),
(146, 64, 'FIREMEN\n'),
(147, 65, 'POLICE'),
(148, 65, 'SAMU'),
(149, 65, 'FIREMEN\n'),
(150, 66, 'SAMU'),
(151, 67, 'POLICE'),
(152, 67, 'SAMU'),
(153, 67, 'FIREMAN'),
(154, 68, 'POLICE'),
(155, 68, 'SAMU'),
(156, 68, 'FIREMAN'),
(157, 69, 'POLICE'),
(158, 69, 'SAMU'),
(159, 69, 'FIREMAN'),
(160, 70, 'SAMU'),
(161, 71, 'SAMU'),
(162, 72, 'SAMU'),
(163, 73, 'SAMU'),
(164, 74, 'SAMU'),
(165, 75, 'SAMU'),
(166, 76, 'SAMU'),
(167, 77, 'SAMU'),
(168, 78, 'SAMU'),
(169, 79, 'SAMU'),
(170, 80, 'SAMU'),
(171, 81, 'SAMU'),
(172, 82, 'SAMU'),
(173, 83, 'SAMU'),
(174, 84, 'SAMU'),
(175, 85, 'SAMU'),
(176, 86, 'SAMU'),
(177, 87, 'SAMU'),
(178, 88, 'SAMU'),
(179, 89, 'POLICE'),
(180, 89, 'SAMU'),
(181, 89, 'FIREMEN\n'),
(182, 90, 'POLICE'),
(183, 90, 'SAMU'),
(184, 90, 'FIREMEN\n'),
(185, 91, 'POLICE'),
(186, 91, 'SAMU'),
(187, 91, 'FIREMEN\n'),
(188, 92, 'POLICE'),
(189, 92, 'SAMU'),
(190, 92, 'FIREMEN\n'),
(191, 93, 'POLICE'),
(192, 93, 'SAMU'),
(193, 93, 'FIREMEN\n');

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
  `mobile_number` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service_provider_patrol`
--

INSERT INTO `service_provider_patrol` (`id`, `description`, `device_id`, `service_provider_id`, `token`, `mobile_number`) VALUES
(1, 'test_police', 'test_police', 'POLICE', 'TEST', ''),
(2, 'test_samu', 'test_samu', 'SAMU', 'd8DozVGRcGI:APA91bH5KohTrBn8U5-6aPyHq09Hal_L8NC6QqJu4RSsQg0zu_9v-60hWAm33DjaKda-RsvQRL_PM60lH9TbJgNk7TrcEma0a3RmtzDU_nfiaA4vOVSLEWZLKc13h-9ZbOCZj6_TanRdeNAtkqoykx9PYj88_NXtPQ', ''),
(3, 'test_firemen', 'test_firemen', 'FIREMEN', '', ''),
(4, 'API Test', 'TESTDEVICE', 'POLICE', 'qsdqsdqsddsq', ''),
(9, 'Trst', 'MMB29M-Lenovo Z90a40', 'SAMU', 'd8DozVGRcGI:APA91bH5KohTrBn8U5-6aPyHq09Hal_L8NC6QqJu4RSsQg0zu_9v-60hWAm33DjaKda-RsvQRL_PM60lH9TbJgNk7TrcEma0a3RmtzDU_nfiaA4vOVSLEWZLKc13h-9ZbOCZj6_TanRdeNAtkqoykx9PYj88_NXtPQ', ''),
(10, 'Mel phone', 'R16NW-SM-G935F', 'SAMU', 'fZr_b2trlVw:APA91bF9MHSnp1G_DPw46aKCLlwKswb36sFYwnp6WdBW_jnEHHta6u1w8NEOu-7Kdd5yw6Vq4sd8y2ajvYPkYI9Ri2KLLjPykNcx4fjoWvVmmVgfJLSMvwMggsaIOAmIdYLbCJaAlsS9OrpubayfPNnYw7KBZeiLRw', '57455371');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT pour la table `help_request_location`
--
ALTER TABLE `help_request_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT pour la table `help_request_provider_need`
--
ALTER TABLE `help_request_provider_need`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;
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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
