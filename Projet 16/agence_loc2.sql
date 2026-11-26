-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 26 Novembre 2026 à 10:58
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `agence_loc2`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `numero_permis` varchar(20) NOT NULL,
  `date_permis` date NOT NULL,
  `code_postal` varchar(5) DEFAULT NULL,
  `Motif` text NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `numero_permis` (`numero_permis`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `prenom`, `date_naissance`, `email`, `telephone`, `ville`, `numero_permis`, `date_permis`, `code_postal`, `Motif`) VALUES
(1, 'Benali', 'Karim', '1990-04-12', 'k.benali@exemple.fr', '+33 6 01 02 03 04', 'Paris', '12AB34567', '2010-06-20', '75011', 'format international'),
(2, 'Martin', 'Sophie', '1985-09-30', 's.martin@exemple.fr', '0611223344', 'Versailles', '23CD45678', '2005-03-14', '78000', ''),
(3, 'Haddad', 'Yasmine', '1998-01-15', 'y.haddad@exemple.fr', '0622334455', 'Rueil-Malmaison', '34EF56789', '2017-09-02', '92500', 'déménagement'),
(4, 'Dubois', 'Lucas', '2001-07-08', 'l.dubois@exemple.fr', '0633445566', 'Saint-Denis', '45GH67890', '2020-01-27', '93200', '');

-- --------------------------------------------------------

--
-- Structure de la table `garages`
--

CREATE TABLE IF NOT EXISTS `garages` (
  `id_garage` int(11) NOT NULL DEFAULT '0',
  `nom` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  PRIMARY KEY (`id_garage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `garages`
--

INSERT INTO `garages` (`id_garage`, `nom`, `ville`, `telephone`) VALUES
(0, 'Garage Central', ' Paris', '0140000001'),
(1, ' Auto Vitre Plus', 'Nanterre', '0140000002'),
(3, ' Pneus Express', 'Nanterre', '0140000002');

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id_location` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_voiture` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `km_depart` int(11) NOT NULL,
  `km_retour` int(11) DEFAULT NULL,
  `montant_total` decimal(8,2) NOT NULL,
  `Motif` text NOT NULL,
  PRIMARY KEY (`id_location`),
  KEY `id_client` (`id_client`),
  KEY `id_voiture` (`id_voiture`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `locations`
--

INSERT INTO `locations` (`id_location`, `id_client`, `id_voiture`, `date_debut`, `date_fin`, `km_depart`, `km_retour`, `montant_total`, `Motif`) VALUES
(1, 1, 1, '2026-09-01', '2026-09-05', 37800, 38200, 159.60, '0'),
(2, 2, 2, '2026-09-10', '2026-09-18', 51200, 51900, 280.00, 'prolongation d''un jour'),
(3, 3, 4, '2026-10-02', '2026-10-04', 28500, 28800, 90.00, '0'),
(4, 4, 3, '2026-11-14', '2026-11-21', 21000, 21480, 483.00, 'la voiture est rendue\r\n\r\n'),
(5, 1, 5, '2026-10-20', '2026-10-23', 73500, 73900, 127.50, '0');

-- --------------------------------------------------------

--
-- Structure de la table `reparations`
--

CREATE TABLE IF NOT EXISTS `reparations` (
  `id_reparation` int(11) NOT NULL AUTO_INCREMENT,
  `id_voiture` int(11) NOT NULL,
  `date_reparation` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `cout` decimal(8,2) NOT NULL,
  `id_garage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_reparation`),
  KEY `id_voiture` (`id_voiture`),
  KEY `id_garage` (`id_garage`),
  KEY `id_garage_2` (`id_garage`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `reparations`
--

INSERT INTO `reparations` (`id_reparation`, `id_voiture`, `date_reparation`, `description`, `cout`, `id_garage`) VALUES
(1, 2, '2026-02-10', 'Remplacement des plaquettes de frein', 180.00, NULL),
(2, 5, '2026-03-18', 'Vidange et changement des filtres', 120.50, NULL),
(3, 3, '2026-05-05', 'Remplacement du pare-brise', 450.00, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type_voitures`
--

CREATE TABLE IF NOT EXISTS `type_voitures` (
  `id_type` int(11) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `Utilitaire` int(11) NOT NULL,
  `luxe` text NOT NULL,
  `tourisme` int(11) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `type_voitures`
--

INSERT INTO `type_voitures` (`id_type`, `designation`, `Utilitaire`, `luxe`, `tourisme`) VALUES
(0, '', 0, '0', 0);

-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE IF NOT EXISTS `voitures` (
  `id_voiture` int(11) NOT NULL AUTO_INCREMENT,
  `immatriculation` varchar(10) NOT NULL,
  `marque` varchar(30) NOT NULL,
  `modele` varchar(30) NOT NULL,
  `annee_circulation` smallint(11) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `carburant` varchar(20) NOT NULL,
  `tarif_jour` decimal(6,2) NOT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT '1',
  `type_voiture` varchar(11) NOT NULL,
  `nombre_places` tinyint(5) NOT NULL,
  `boite_vitesse` varchar(10) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_voiture`),
  UNIQUE KEY `immatriculation` (`immatriculation`),
  KEY `id_type` (`id_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `voitures`
--

INSERT INTO `voitures` (`id_voiture`, `immatriculation`, `marque`, `modele`, `annee_circulation`, `kilometrage`, `carburant`, `tarif_jour`, `disponible`, `type_voiture`, `nombre_places`, `boite_vitesse`, `id_type`) VALUES
(1, 'AB-123-CD', 'Peugeot', '208', 2022, 38500, 'Essence', 39.90, 1, '0', 0, 'Manuelle', NULL),
(2, 'EF-456-GH', 'Renault', 'Clio', 2021, 52650, 'Diesel', 35.00, 1, '0', 0, 'Manuelle', NULL),
(3, 'IJ-789-KL', 'Mercedes', 'Classe A', 2023, 21480, 'Hybride', 69.00, 1, '0', 0, 'Auto', NULL),
(4, 'MN-012-OP', 'Renault', 'Zoé', 2022, 29000, 'Électrique', 45.00, 1, '0', 0, 'Auto', NULL),
(5, 'QR-345-ST', 'Peugeot', '308', 2020, 74000, 'Diesel', 44.50, 1, '0', 0, 'Manuelle', NULL);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON UPDATE CASCADE,
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`id_voiture`) REFERENCES `voitures` (`id_voiture`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `reparations`
--
ALTER TABLE `reparations`
  ADD CONSTRAINT `reparations_ibfk_2` FOREIGN KEY (`id_garage`) REFERENCES `garages` (`id_garage`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reparations_ibfk_1` FOREIGN KEY (`id_voiture`) REFERENCES `voitures` (`id_voiture`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `voitures`
--
ALTER TABLE `voitures`
  ADD CONSTRAINT `voitures_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_voitures` (`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;
