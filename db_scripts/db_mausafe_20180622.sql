-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 22 Juin 2018 à 14:34
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
-- Structure de la table `help_request`
--

CREATE TABLE `help_request` (
  `id` int(11) NOT NULL,
  `name` varchar(5000) NOT NULL,
  `age` int(11) NOT NULL,
  `blood_group` varchar(1) NOT NULL,
  `special_conditions` varchar(5000) NOT NULL,
  `device_id` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Structure de la table `help_request_provider_need`
--

CREATE TABLE `help_request_provider_need` (
  `id` int(11) NOT NULL,
  `help_request_id` int(11) NOT NULL,
  `needed_provider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'samu'),
(2, 'police'),
(3, 'firemen');

-- --------------------------------------------------------

--
-- Structure de la table `service_provider_patrol`
--

CREATE TABLE `service_provider_patrol` (
  `id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `device_id` varchar(500) NOT NULL,
  `service_provider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service_provider_patrol`
--

INSERT INTO `service_provider_patrol` (`id`, `description`, `device_id`, `service_provider_id`) VALUES
(1, 'test_police', 'test_police', 2),
(2, 'test_samu', 'test_samu', 1),
(3, 'test_firemen', 'test_firemen', 3);

-- --------------------------------------------------------

--
-- Structure de la table `service_provider_patrol_assignment`
--

CREATE TABLE `service_provider_patrol_assignment` (
  `id` int(11) NOT NULL,
  `help_request_id` int(11) NOT NULL,
  `patrol_id` int(11) NOT NULL,
  `ETA_min` int(11) DEFAULT NULL,
  `distance_km` int(11) DEFAULT NULL,
  `status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `service_provider_patrol_location`
--

CREATE TABLE `service_provider_patrol_location` (
  `id` int(11) NOT NULL,
  `patrol_id` int(11) NOT NULL,
  `longitude` varchar(500) NOT NULL,
  `latitude` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

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
-- AUTO_INCREMENT pour la table `help_request`
--
ALTER TABLE `help_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `help_request_location`
--
ALTER TABLE `help_request_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `help_request_provider_need`
--
ALTER TABLE `help_request_provider_need`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `service_provider`
--
ALTER TABLE `service_provider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `service_provider_patrol`
--
ALTER TABLE `service_provider_patrol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `service_provider_patrol_assignment`
--
ALTER TABLE `service_provider_patrol_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `service_provider_patrol_location`
--
ALTER TABLE `service_provider_patrol_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
