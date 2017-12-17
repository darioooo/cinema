-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Dic 17, 2017 alle 16:14
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
  `id_scheda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `film_orario`
--

CREATE TABLE `film_orario` (
  `id_film` int(11) NOT NULL,
  `id_orario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `orario`
--

CREATE TABLE `orario` (
  `ora` varchar(10) NOT NULL,
  `id_orario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_scheda` (`id_scheda`);

--
-- Indici per le tabelle `orario`
--
ALTER TABLE `orario`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `orario`
--
ALTER TABLE `orario`
  MODIFY `id_orario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `scheda`
--
ALTER TABLE `scheda`
  MODIFY `id_scheda` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
