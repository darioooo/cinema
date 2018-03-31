-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 31, 2018 alle 16:09
-- Versione del server: 10.1.30-MariaDB
-- Versione PHP: 7.2.1

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
  `immagine` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `film`
--

INSERT INTO `film` (`id`, `titolo`, `data_inizio`, `data_fine`, `visualizzato`, `descrizione`, `immagine`) VALUES
(41, 'READY PLAYER ONE', '2018-03-31', '2018-04-07', 1, ' dsasmadk dsasmadk dsasmadk ', 'image/READYPLAYERONE.jpg'),
(42, 'READY PLAYER ONE', '2018-04-01', '2018-04-08', 1, ' dsasmadk dsasmadk dsasmadk ', 'image/READYPLAYERONE.jpg'),
(43, 'I, TONYA', '2018-03-31', '2018-04-03', 1, 'hbdnsja ', 'image/I,TONYA.jpg');

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
(146, '2018-03-31', '17.30 | ', 'sabato', 41),
(147, '2018-04-01', '17.00 | ', 'domenica', 41),
(148, '2018-04-02', '17.30 | ', 'lunedi', 41),
(149, '2018-04-03', '21.00 | ', 'martedi', 41),
(150, '2018-04-04', '21.00 | ', 'mercoledi', 41),
(151, '2018-04-06', '17.00 | ', 'venerdi', 41),
(152, '2018-04-01', '17.00 | ', 'domenica', 42),
(153, '2018-04-02', '17.30 | ', 'lunedi', 42),
(154, '2018-04-03', '21.00 | ', 'martedi', 42),
(155, '2018-04-04', '21.00 | ', 'mercoledi', 42),
(156, '2018-04-06', '17.00 | ', 'venerdi', 42),
(157, '2018-04-07', '17.30 | ', 'sabato', 42),
(158, '2018-04-01', '17.00 | ', 'domenica', 42),
(159, '2018-04-02', '17.30 | ', 'lunedi', 42),
(160, '2018-04-03', '21.00 | ', 'martedi', 42),
(161, '2018-04-04', '21.00 | ', 'mercoledi', 42),
(162, '2018-04-06', '17.00 | ', 'venerdi', 42),
(163, '2018-04-07', '17.30 | ', 'sabato', 42),
(164, '2018-03-31', '17.00 | ', 'sabato', 42),
(165, '2018-03-31', '17.30 | ', 'sabato', 42),
(166, '2018-04-01', '17.00 | ', 'domenica', 42),
(167, '2018-04-02', '17.00 | ', 'lunedi', 42),
(168, '2018-03-31', '17.30 | ', 'sabato', 43),
(169, '2018-04-01', '17.00 | ', 'domenica', 43),
(170, '2018-04-02', '17.00 | ', 'lunedi', 43);

-- --------------------------------------------------------

--
-- Struttura della tabella `scheda`
--

CREATE TABLE `scheda` (
  `id_scheda` int(11) NOT NULL,
  `regia` text NOT NULL,
  `attori` text NOT NULL,
  `durata` varchar(50) NOT NULL,
  `genere` text NOT NULL,
  `pese` text NOT NULL,
  `id_film` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `scheda`
--

INSERT INTO `scheda` (`id_scheda`, `regia`, `attori`, `durata`, `genere`, `pese`, `id_film`) VALUES
(133, ' dsasmadk dsasmadk dsasmadk dsasmadk ', 'dsasmadkdsasmadk dsasmadk dsasmadk dsasmadk dsasmadk dsasmadk dsasmadk dsasmadk dsasmadk ', '', '', '', 41),
(134, ' dsasmadk dsasmadk dsasmadk dsasmadk ', 'dsasmadkdsasmadk dsasmadk dsasmadk dsasmadk dsasmadk dsasmadk dsasmadk dsasmadk dsasmadk ', '', '', '', 42),
(135, ' dsasmadk dsasmadk dsasmadk dsasmadk ', 'dsasmadkdsasmadk dsasmadk dsasmadk dsasmadk dsasmadk dsasmadk dsasmadk dsasmadk dsasmadk ', '', '', '', 42),
(136, ' fsdfs', ' sd', '', '', '', 42),
(137, 'dshjk ', 'dagsbhj ', '', '', '', 42),
(138, 'dshjk ', 'dagsbhj ', ' 123', '', '', 43);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `film_orario`
--
ALTER TABLE `film_orario`
  ADD PRIMARY KEY (`id_orario`),
  ADD KEY `id_film` (`id_film`);

--
-- Indici per le tabelle `scheda`
--
ALTER TABLE `scheda`
  ADD PRIMARY KEY (`id_scheda`),
  ADD KEY `fk_id_film` (`id_film`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT per la tabella `film_orario`
--
ALTER TABLE `film_orario`
  MODIFY `id_orario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT per la tabella `scheda`
--
ALTER TABLE `scheda`
  MODIFY `id_scheda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `film_orario`
--
ALTER TABLE `film_orario`
  ADD CONSTRAINT `film_orario_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `scheda`
--
ALTER TABLE `scheda`
  ADD CONSTRAINT `fk_id_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
