-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 02 mars 2022 à 19:06
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP :  7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cancam`
--

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE `payment` (
  `startDate` datetime NOT NULL,
  `expirationDate` datetime NOT NULL,
  `amount` float NOT NULL,
  `id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`startDate`, `expirationDate`, `amount`, `id`, `subscription_id`) VALUES
('2022-03-01 07:00:00', '2022-03-31 07:00:00', 10000, 1, 3),
('2022-03-01 07:00:00', '2022-03-31 07:00:00', 10000, 2, 3),
('2022-03-01 07:00:00', '2022-03-15 07:00:00', 20000, 3, 5),
('2022-03-01 07:00:00', '2022-03-15 07:00:00', 20000, 4, 4),
('2022-03-01 07:00:00', '2022-03-20 07:00:00', 30000, 5, 6),
('2022-03-01 06:00:00', '2022-03-10 08:00:00', 30000, 6, 7),
('2022-04-01 06:00:00', '2022-04-30 08:00:00', 40000, 7, 8),
('2022-03-01 05:00:00', '2022-03-31 08:00:00', 40000, 8, 8),
('2011-10-06 19:00:02', '2011-10-06 19:00:02', 20000, 10, 3);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id`, `name`) VALUES
(1, 'Netflix'),
(2, 'Eneo'),
(3, 'Camwater'),
(4, 'Canal plus'),
(5, 'google cloud'),
(6, 'Azure microsoft');

-- --------------------------------------------------------

--
-- Structure de la table `subscription`
--

CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `subscription`
--

INSERT INTO `subscription` (`id`, `service_id`, `user_id`) VALUES
(3, 2, 1),
(4, 5, 1),
(5, 6, 2),
(6, 3, 2),
(7, 1, 3),
(8, 4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `name` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`name`, `email`, `password`, `id`) VALUES
('rolande', 'rolande@gmail.com', '2424b7b37e66bcf2a79b95dc0a66a8e0', 1),
('hermann', 'hermann@gmail.com', 'd7d9553f02ebca0a5273bc430c054853', 2),
('virginie', 'virginie@gmail.com', '907f3a3084544b93965fa0222b0d56aa', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subsciption_contrante` (`subscription_id`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_contrainte` (`user_id`),
  ADD KEY `service_contrainte` (`service_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `subsciption_contrante` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`);

--
-- Contraintes pour la table `subscription`
--
ALTER TABLE `subscription`
  ADD CONSTRAINT `service_contrainte` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  ADD CONSTRAINT `user_contrainte` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
