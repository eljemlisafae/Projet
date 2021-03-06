-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mer 11 Décembre 2019 à 09:58
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `stage2`
--

-- --------------------------------------------------------

--
-- Structure de la table `accompagnant`
--

CREATE TABLE `accompagnant` (
  `idAccompagnant` int(20) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `pieceIdentite` varchar(25) NOT NULL,
  `age` int(5) NOT NULL,
  `idClient` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `idChambre` int(20) NOT NULL,
  `nomCode` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `descriptif` varchar(50) COLLATE utf8_bin NOT NULL,
  `statut` int(5) NOT NULL DEFAULT '1',
  `capacity` int(11) NOT NULL,
  `idtypechambre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `chambre`
--

INSERT INTO `chambre` (`idChambre`, `nomCode`, `descriptif`, `statut`, `capacity`, `idtypechambre`) VALUES
(8, 'chambre1', '1er etage', 1, 2, 4),
(9, 'cham3', '2eme etage', 1, 3, 6),
(10, 'cham2', '1er etage', 1, 2, 5);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `idClient` int(20) NOT NULL,
  `nom` varchar(20) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(20) COLLATE utf8_bin NOT NULL,
  `age` int(11) NOT NULL,
  `sexe` varchar(20) COLLATE utf8_bin NOT NULL,
  `pieceIdentite` varchar(20) COLLATE utf8_bin NOT NULL,
  `nationalite` varchar(25) COLLATE utf8_bin NOT NULL,
  `numTel` int(20) NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `situationFamiliale` varchar(20) COLLATE utf8_bin NOT NULL,
  `statut` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`idClient`, `nom`, `prenom`, `age`, `sexe`, `pieceIdentite`, `nationalite`, `numTel`, `email`, `situationFamiliale`, `statut`) VALUES
(11, 'ssaa', 'aaaaaa', 50, 'Homme', 'ee44356', 'egypte', 645432345, 'hoy@hhh', 'Celibataire', 1),
(13, 'uuuuuuuuuu', 'uiuiu', 44, 'Femme', 'yyyy', 'maroc', 654333, 'wsdf@ff', 'Celibataire', 1);

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `datelogin` datetime NOT NULL,
  `type` int(11) NOT NULL,
  `iduser` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `journale`
--

CREATE TABLE `journale` (
  `id` int(20) NOT NULL,
  `datemodification` datetime NOT NULL,
  `newval` varchar(500) NOT NULL,
  `oldval` varchar(500) NOT NULL,
  `typedaction` varchar(50) NOT NULL,
  `page` varchar(50) NOT NULL,
  `iduser` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `journale`
--

INSERT INTO `journale` (`id`, `datemodification`, `newval`, `oldval`, `typedaction`, `page`, `iduser`) VALUES
(11, '2019-12-04 16:56:06', 'nom= sofi prenom= sofi', 'nom= ssssss prenom= eeeee', 'modification', 'client', 7),
(12, '2019-12-04 17:03:02', ' age= safae', ' age= 54', 'modification', 'client', 7),
(13, '2019-12-04 17:04:20', ' age= safae', ' age= 66', 'modification', 'client', 7),
(14, '2019-12-04 17:05:03', ' age= uiuiu', ' age= 44', 'modification', 'client', 7),
(15, '2019-12-04 17:06:07', ' age= eeeee', ' age= eeeee', 'modification', 'client', 7),
(16, '2019-12-09 09:51:48', 'nom= Femme cin= eert tel= 987654 nationalitÃ©= hhhhh email= dfghjkl@ggg', 'nom= Homme cin= ee44356 tel= 0645432345 nationalitÃ©= egypte email= hoy@hhh', 'modification', 'client', 1),
(17, '2019-12-09 11:25:05', 'nomref= test3', 'nomref= tesr', 'modification', 'reference', 1),
(18, '2019-12-09 11:25:48', ' couleur= #55aa7d', ' couleur= #05fa6d', 'modification', 'reference', 1),
(22, '2019-12-09 14:02:51', 'type= rtrrvv couleur= #01feeb', 'type= ttt couleur= ', 'modification', 'typereservation', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reference`
--

CREATE TABLE `reference` (
  `id` int(20) NOT NULL,
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  `couleur` varchar(50) COLLATE utf8_bin NOT NULL,
  `statut` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `reference`
--

INSERT INTO `reference` (`id`, `nom`, `couleur`, `statut`) VALUES
(10, 'Direct', '#37c86d', 1),
(11, 'Expedia', '#5ba4a0', 1),
(16, 'rouge', '#ff0000', 1),
(17, 'tesr', '#05fa6d', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `idReservation` int(20) NOT NULL,
  `code` varchar(20) COLLATE utf8_bin NOT NULL,
  `dateRes` date NOT NULL,
  `dateArrivee` date NOT NULL,
  `dateDepart` date NOT NULL,
  `nbreNuits` int(6) NOT NULL,
  `nbrePax` int(5) NOT NULL,
  `observation` varchar(70) COLLATE utf8_bin NOT NULL,
  `idType` int(20) NOT NULL,
  `idReference` int(20) NOT NULL,
  `idchambre` int(11) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `reserver`
--

CREATE TABLE `reserver` (
  `idReserver` int(20) NOT NULL,
  `idReservation` int(20) NOT NULL,
  `idClient` int(20) NOT NULL,
  `idChambre` int(20) NOT NULL,
  `idfacture` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `typechambre`
--

CREATE TABLE `typechambre` (
  `idTc` int(20) NOT NULL,
  `type` varchar(20) COLLATE utf8_bin NOT NULL,
  `nbrChambre` int(25) NOT NULL DEFAULT '0',
  `nbreMaxPax` int(20) NOT NULL DEFAULT '0',
  `statut` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `typechambre`
--

INSERT INTO `typechambre` (`idTc`, `type`, `nbrChambre`, `nbreMaxPax`, `statut`) VALUES
(4, 'double', 4, 2, 1),
(5, 'single', 2, 1, 1),
(6, 'triple', 6, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `typereservation`
--

CREATE TABLE `typereservation` (
  `id` int(20) NOT NULL,
  `type` varchar(50) COLLATE utf8_bin NOT NULL,
  `couleur` varchar(30) COLLATE utf8_bin NOT NULL,
  `statut` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `typereservation`
--

INSERT INTO `typereservation` (`id`, `type`, `couleur`, `statut`) VALUES
(2, 'typeres5', '', 1),
(3, 'Typereservation', '#ecdb40', 1),
(4, 'ttt', '#0086ff', 1),
(5, 'uuuuu', '#e2e089', 1),
(6, 'ooooooooooooooooooooo', '#c8eeec', 1),
(7, 'tttttt', '#13a451', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `type` int(20) NOT NULL DEFAULT '0',
  `pwd` varchar(300) COLLATE utf8_bin NOT NULL,
  `nom_complet` varchar(30) COLLATE utf8_bin NOT NULL,
  `tel` int(20) NOT NULL,
  `img` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `blocked` int(11) NOT NULL DEFAULT '0',
  `admin` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `type`, `pwd`, `nom_complet`, `tel`, `img`, `blocked`, `admin`) VALUES
(1, 'safa', 'safae@gmail.com', 1, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', 'Safae aa', 675765432, NULL, 0, 1),
(7, 'badr', 'badr@gmail.com', 0, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', 'badr', 98765432, '0', 0, 1),
(8, 'test', 'test@test', 0, 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', 'test', 123456, '0', 0, 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `accompagnant`
--
ALTER TABLE `accompagnant`
  ADD PRIMARY KEY (`idAccompagnant`),
  ADD KEY `fk_acc_cli` (`idClient`);

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`idChambre`),
  ADD KEY `idtypechambre` (`idtypechambre`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`idClient`);

--
-- Index pour la table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iduser` (`iduser`),
  ADD KEY `iduser_2` (`iduser`);

--
-- Index pour la table `journale`
--
ALTER TABLE `journale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iduser` (`iduser`);

--
-- Index pour la table `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`idReservation`),
  ADD KEY `fk_res_ref` (`idReference`),
  ADD KEY `fk_res_type` (`idType`),
  ADD KEY `idchambre` (`idchambre`),
  ADD KEY `iduser` (`iduser`);

--
-- Index pour la table `reserver`
--
ALTER TABLE `reserver`
  ADD PRIMARY KEY (`idReserver`),
  ADD KEY `fk_res_rese` (`idReservation`),
  ADD KEY `fk_res_fact` (`idfacture`),
  ADD KEY `fk_res_cli` (`idClient`),
  ADD KEY `fk_res_chbre` (`idChambre`);

--
-- Index pour la table `typechambre`
--
ALTER TABLE `typechambre`
  ADD PRIMARY KEY (`idTc`);

--
-- Index pour la table `typereservation`
--
ALTER TABLE `typereservation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `idChambre` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `idClient` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `journale`
--
ALTER TABLE `journale`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `reference`
--
ALTER TABLE `reference`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `idReservation` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `reserver`
--
ALTER TABLE `reserver`
  MODIFY `idReserver` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `typechambre`
--
ALTER TABLE `typechambre`
  MODIFY `idTc` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `typereservation`
--
ALTER TABLE `typereservation`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `accompagnant`
--
ALTER TABLE `accompagnant`
  ADD CONSTRAINT `fk_acc_cli` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`);

--
-- Contraintes pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `chambre_ibfk_1` FOREIGN KEY (`idtypechambre`) REFERENCES `typechambre` (`idTc`);

--
-- Contraintes pour la table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `journale`
--
ALTER TABLE `journale`
  ADD CONSTRAINT `journale_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `fk_res_ref` FOREIGN KEY (`idReference`) REFERENCES `reference` (`id`),
  ADD CONSTRAINT `fk_res_type` FOREIGN KEY (`idType`) REFERENCES `typereservation` (`id`),
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`idchambre`) REFERENCES `chambre` (`idChambre`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `reserver`
--
ALTER TABLE `reserver`
  ADD CONSTRAINT `fk_res_1` FOREIGN KEY (`idfacture`) REFERENCES `facture` (`idFacture`),
  ADD CONSTRAINT `fk_res_cli` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`),
  ADD CONSTRAINT `fk_res_fact` FOREIGN KEY (`idfacture`) REFERENCES `facture` (`idFacture`),
  ADD CONSTRAINT `fk_res_rese` FOREIGN KEY (`idReservation`) REFERENCES `reservations` (`idReservation`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
