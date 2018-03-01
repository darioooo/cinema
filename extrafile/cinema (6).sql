-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Feb 17, 2018 alle 02:00
-- Versione del server: 10.1.21-MariaDB
-- Versione PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinema`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `titolo` text NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL,
  `visualizzato` tinyint(1) NOT NULL,
  `descrizione` text NOT NULL,
  `immagine` text NOT NULL,
  `id_scheda` int(11) NOT NULL,
  `id_film_orario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `film`
--

INSERT INTO `film` (`id`, `titolo`, `data_inizio`, `data_fine`, `visualizzato`, `descrizione`, `immagine`, `id_scheda`, `id_film_orario`) VALUES
(123, 'CINQUANTA SFUMATURE DI ROSSO', '2018-02-05', '2018-02-16', 1, ' ', 'image/CINQUANTASFUMATUREDIROSSO.jpg', 162, 49),
(124, 'RESET - STORIA DI UNA CREAZIONE', '2018-02-05', '2018-02-16', 1, ' ', 'image/RESET-STORIADIUNACREAZIONE.jpg', 163, 50),
(125, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 165, 50),
(126, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 166, 50),
(127, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 167, 50),
(128, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 168, 50),
(129, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 169, 50),
(130, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 170, 50),
(131, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 171, 50),
(132, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 172, 50),
(133, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 173, 50),
(134, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 174, 50),
(135, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 175, 50),
(136, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 176, 50),
(137, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 177, 50),
(138, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 178, 50),
(139, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 179, 50),
(140, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 180, 50),
(141, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 181, 50),
(142, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 182, 50),
(143, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 183, 50),
(144, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 184, 50),
(145, 'HANNAH', '2018-02-08', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 185, 50),
(146, 'HANNAH', '2018-02-08', '2018-02-18', 1, ' ', 'image/HANNAH.jpg', 186, 50),
(147, 'HANNAH', '2018-02-08', '2018-02-18', 1, ' ', 'image/HANNAH.jpg', 187, 50),
(148, 'HANNAH', '2018-02-08', '2018-02-18', 1, ' ', 'image/HANNAH.jpg', 188, 50),
(149, 'HANNAH', '2018-03-17', '2018-02-18', 1, ' ', 'image/HANNAH.jpg', 189, 50),
(150, 'HANNAH', '2018-03-08', '2018-02-09', 1, ' ', 'image/HANNAH.jpg', 190, 50),
(151, 'HANNAH', '2018-03-08', '2018-02-09', 1, ' ', 'image/HANNAH.jpg', 191, 50),
(152, 'HANNAH', '2018-03-08', '2018-02-09', 1, ' ', 'image/HANNAH.jpg', 192, 50),
(153, 'HANNAH', '2018-03-08', '2018-02-09', 1, ' ', 'image/HANNAH.jpg', 193, 50),
(154, 'HANNAH', '2018-03-08', '2018-02-09', 1, ' ', 'image/HANNAH.jpg', 194, 50),
(155, 'A CASA TUTTI BENE', '2018-02-08', '2018-02-22', 1, ' ', 'image/ACASATUTTIBENE.jpg', 195, 50),
(156, 'A CASA TUTTI BENE', '2018-02-08', '2018-02-22', 1, ' ', 'image/ACASATUTTIBENE.jpg', 196, 50),
(157, 'A CASA TUTTI BENE', '2018-02-08', '2018-02-22', 1, ' ', 'image/ACASATUTTIBENE.jpg', 197, 50),
(158, 'A CASA TUTTI BENE', '2018-02-08', '2018-02-22', 1, ' ', 'image/ACASATUTTIBENE.jpg', 198, 50),
(159, 'A CASA TUTTI BENE', '2018-02-08', '2018-02-22', 1, ' ', 'image/ACASATUTTIBENE.jpg', 199, 50),
(160, 'HANNAH', '2018-02-10', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 200, 56),
(161, 'HANNAH', '2018-02-10', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 201, 62),
(162, 'HANNAH', '2018-02-10', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 202, 68),
(163, 'HANNAH', '2018-02-09', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 203, 0),
(164, 'HANNAH', '2018-02-09', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 204, 0),
(165, 'HANNAH', '2018-02-09', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 205, 0),
(166, 'HANNAH', '2018-02-09', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 206, 0),
(167, 'HANNAH', '2018-02-09', '2018-02-17', 1, ' ', 'image/HANNAH.jpg', 207, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `film_orario`
--

CREATE TABLE `film_orario` (
  `id_orario` int(11) NOT NULL,
  `giorno` date NOT NULL,
  `ora` text NOT NULL,
  `giornosettimana` text NOT NULL,
  `id_film` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `film_orario`
--

INSERT INTO `film_orario` (`id_orario`, `giorno`, `ora`, `giornosettimana`, `id_film`) VALUES
(49, '0000-00-00', '', '0', 0),
(50, '0000-00-00', '', '0', 0),
(51, '0000-00-00', '', 'sabato', 0),
(52, '0000-00-00', '17.00 | ', 'lunedÃ¬', 0),
(53, '0000-00-00', '', 'martÃ¬ed', 0),
(54, '0000-00-00', '', 'mercoledÃ¬', 0),
(55, '0000-00-00', '', 'giovedÃ¬', 0),
(56, '0000-00-00', '', 'venerdÃ¬', 0),
(57, '0000-00-00', '', 'sabato', 0),
(58, '0000-00-00', '17.00 | ', 'lunedi', 0),
(59, '0000-00-00', '', 'martied', 0),
(60, '0000-00-00', '', 'mercoledi', 0),
(61, '0000-00-00', '', 'giovedi', 0),
(62, '0000-00-00', '', 'venerdi', 0),
(63, '2018-02-10', '', 'sabato', 0),
(64, '2018-02-12', '17.00 | ', 'lunedi', 0),
(65, '2018-02-13', '', 'martied', 0),
(66, '2018-02-14', '', 'mercoledi', 0),
(67, '2018-02-15', '', 'giovedi', 0),
(68, '2018-02-16', '', 'venerdi', 0),
(69, '2018-02-16', '', 'venerdi', 0),
(70, '2018-02-10', '', 'sabato', 0),
(71, '2018-02-12', '17.00 | ', 'lunedi', 0),
(72, '2018-02-13', '', 'martedi', 0),
(73, '2018-02-14', '', 'mercoledi', 0),
(74, '2018-02-15', '', 'giovedi', 0),
(75, '2018-02-16', '', 'venerdi', 0),
(76, '2018-02-10', '', 'sabato', 0),
(77, '2018-02-12', '17.00 | ', 'lunedi', 0),
(78, '2018-02-13', '', 'martedi', 0),
(79, '2018-02-14', '', 'mercoledi', 0),
(80, '2018-02-15', '', 'giovedi', 0),
(81, '2018-02-16', '', 'venerdi', 0),
(82, '2018-02-10', '', 'sabato', 0),
(83, '2018-02-12', '17.00 | ', 'lunedi', 0),
(84, '2018-02-13', '', 'martedi', 0),
(85, '2018-02-14', '', 'mercoledi', 0),
(86, '2018-02-15', '', 'giovedi', 0),
(87, '2018-02-16', '', 'venerdi', 166),
(88, '2018-02-10', '', 'sabato', 166),
(89, '2018-02-12', '17.00 | ', 'lunedi', 166),
(90, '2018-02-13', '', 'martedi', 166),
(91, '2018-02-14', '', 'mercoledi', 166),
(92, '2018-02-15', '', 'giovedi', 166),
(93, '2018-02-12', '17.00 | ', 'lunedi', 167);

-- --------------------------------------------------------

--
-- Struttura della tabella `scheda`
--

CREATE TABLE `scheda` (
  `regia` text NOT NULL,
  `attori` text NOT NULL,
  `durata` varchar(50) NOT NULL,
  `genere` text NOT NULL,
  `pese` text NOT NULL,
  `id_scheda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `scheda`
--

INSERT INTO `scheda` (`regia`, `attori`, `durata`, `genere`, `pese`, `id_scheda`) VALUES
(' ', ' ', '', '', '', 162),
(' ', ' ', '', '', '', 163),
(' ', ' ', '', '', '', 164),
(' ', ' ', '', '', '', 165),
(' ', ' ', '', '', '', 166),
(' ', ' ', '', '', '', 167),
(' ', ' ', '', '', '', 168),
(' ', ' ', '', '', '', 169),
(' ', ' ', '', '', '', 170),
(' ', ' ', '', '', '', 171),
(' ', ' ', '', '', '', 172),
(' ', ' ', '', '', '', 173),
(' ', ' ', '', '', '', 174),
(' ', ' ', '', '', '', 175),
(' ', ' ', '', '', '', 176),
(' ', ' ', '', '', '', 177),
(' ', ' ', '', '', '', 178),
(' ', ' ', '', '', '', 179),
(' ', ' ', '', '', '', 180),
(' ', ' ', '', '', '', 181),
(' ', ' ', '', '', '', 182),
(' ', ' ', '', '', '', 183),
(' ', ' ', '', '', '', 184),
(' ', ' ', '', '', '', 185),
(' ', ' ', '', '', '', 186),
(' ', ' ', '', '', '', 187),
(' ', ' ', '', '', '', 188),
(' ', ' ', '', '', '', 189),
(' ', ' ', '', '', '', 190),
(' ', ' ', '', '', '', 191),
(' ', ' ', '', '', '', 192),
(' ', ' ', '', '', '', 193),
(' ', ' ', '', '', '', 194),
(' ', ' ', '', '', '', 195),
(' ', ' ', '', '', '', 196),
(' ', ' ', '', '', '', 197),
(' ', ' ', '', '', '', 198),
(' ', ' ', '', '', '', 199),
(' ', ' ', '', '', '', 200),
(' ', ' ', '', '', '', 201),
(' ', ' ', '', '', '', 202),
(' ', ' ', '', '', '', 203),
(' ', ' ', '', '', '', 204),
(' ', ' ', '', '', '', 205),
(' ', ' ', '', '', '', 206),
(' ', ' ', '', '', '', 207);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_scheda` (`id_scheda`),
  ADD KEY `id_film_orario` (`id_film_orario`);

--
-- Indici per le tabelle `film_orario`
--
ALTER TABLE `film_orario`
  ADD PRIMARY KEY (`id_orario`);

--
-- Indici per le tabelle `scheda`
--
ALTER TABLE `scheda`
  ADD PRIMARY KEY (`id_scheda`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;
--
-- AUTO_INCREMENT per la tabella `film_orario`
--
ALTER TABLE `film_orario`
  MODIFY `id_orario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT per la tabella `scheda`
--
ALTER TABLE `scheda`
  MODIFY `id_scheda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
