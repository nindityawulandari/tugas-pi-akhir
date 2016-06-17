-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2016 at 10:02 AM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_config`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`) VALUES
(1, 'entertainment'),
(2, 'education'),
(3, 'other');

-- --------------------------------------------------------

--
-- Table structure for table `posting`
--

CREATE TABLE IF NOT EXISTS `posting` (
  `id` int(11) NOT NULL,
  `post_by` int(10) NOT NULL,
  `judul` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `tempat` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `htm` varchar(25) NOT NULL,
  `cp` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file` varchar(100) NOT NULL,
  `kategori` varchar(20) DEFAULT NULL,
  `namagambar` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posting`
--

INSERT INTO `posting` (`id`, `post_by`, `judul`, `tanggal`, `tempat`, `deskripsi`, `htm`, `cp`, `created_at`, `file`, `kategori`, `namagambar`) VALUES
(4, 10, 'askaska', '2016-06-10', 'ajskajs', 'lsjlaj', '7999989', 'haksahkshka', '2016-06-09 17:00:00', 'elgi.jpg', 'other', 'elgi'),
(5, 10, 'ajskajska', '2016-06-10', 'ajshja', 'jkjasksj', '727272', 'askahskah', '2016-06-09 17:00:00', 'fiqie.jpg', 'education', 'fuiq'),
(6, 10, 'amshjahs', '2016-06-10', 'asgja', 'ahsjahs', '7899', 'iqiuwiq', '2016-06-09 17:00:00', 'oyd4.jpg', 'entertainment', 'yuyuu'),
(7, 10, 'amshjahs', '2016-06-10', 'asgja', 'ahsjahs', '7899', 'iqiuwiq', '2016-06-09 17:00:00', 'oyd4.jpg', 'entertainment', 'ooq'),
(8, 10, 'hahsja', '2016-06-10', 'jsagjs', 'ahska', '672727', 'hashjahsj', '2016-06-09 17:00:00', 'profile_228713609_75sq_1391887840.jpg', 'entertainment', 'jasa');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `access_level` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_pass`, `access_level`) VALUES
(1, 'arnaz', 'arnazadiputra@gmail.com', '$2y$10$N4Uy8qOdTPOwhh5BtpgKEuKeAheC1wGHsQFPvTOOzOhyZPbSlqVMi', 0),
(2, 'doscom', 'doscom@mail.com', '$2y$10$Ncz2lMNeV192RAcm.o0.t.xoQ3txJW8Rb04sI1y/dawyt5ehJGU4C', 0),
(4, 'atho', 'athoil@maula.com', '$2y$10$J92yY2.cZ2wlFEfRjTftPOF57iNXhGMx.8sVdFTgxpndY4j4AH2nG', 0),
(9, 'admin', 'admin@mail.com', 'admin', 1),
(10, 'Budi', 'Budi@mail.com', '$2y$10$SxAN5vTkxJ3aMiLB1LxRle4122FgAUc43.atgaQcYyL7zNVcUXnjO', 0),
(12, 'fiqie', 'fiqie.panji@gmail.com', '7januari', 0),
(23, 'jalal', 'jalal@gmail.com', '$2y$10$NShtapU8eugu5nSrmUZ.Vu4UbBL0g24.NO32U80FP7J7SEYGIAmhi', 0),
(13, 'abdul', 'abdul@gmail.com', '$2y$10$xjNZb9/IgTeOqGtsKlrJJeyMFWrSpJFWsLXA5ftzPV7GUwhEr//g2', 0),
(14, 'fiqie13', 'fiqie@gmail.com', '$2y$10$dxI0jt.iI8JyJbRTCHC22.h8GfyIhoQ9pc62GAK/w/Z1DBb9Wox0O', 0),
(15, 'lala', 'saya@suka.com', '$2y$10$rdTSBLLdHlPiwgE8ORZ8heoKjI4w5VkXZb.IMDOCwDRi/hfSjz1rq', 0),
(16, 'nana', 'nana@gmail.com', '$2y$10$qcEbT0H.vdOuYqae3SFwfOfnmfskAUsb8hakXm.zT0P947hlTwy0S', 0),
(17, 'lia', 'lia@gmail.com', '$2y$10$GfHviy8keHmoJMbfBAfBT.ADLuI7w.RuhHmfwz6T/HoUbwV7WsxBq', 0),
(18, 'kaka', 'kaka@gmail.com', '$2y$10$AeoTF9urje5wG/xxNkj84.8z7vYnAdrFqF9YqWpMH9nPYXcziEhHa', 0),
(19, 'a', 'a@a.a', '$2y$10$ErmzZmfbvapwHd6HH00HxOpcb6nMPP2NeipyoUU9UjFSsQlJit9Na', 0),
(20, 'dika', 'lalala@gmail.com', '$2y$10$/jS0RI9IbRY552VC8eyGPuGS3RfFGhJ4DjzoacFtsue4T/Uh8d3K6', 0),
(21, 'abdul1234', 'abdul1234@gmail.com', '$2y$10$8Rj2DsA1Fc8kzClPg/C71OH6E50w1l9WbjI4Lbr4Pr/Z8AabBoiFK', 0),
(22, 'candra', 'candra@gmail.com', '$2y$10$kss2L/NvU/QkjRVNT/wIHuiFSojEl..0PeGGDIfa4CzXB5GKoQ3PC', 0),
(24, 'fiqiego', 'fiqie90@gmail.com', '$2y$10$xH.zsiyynHa0JtxBLhuoEexa4S.EHBHTLv6/lP4sWzgE5ObZojCqW', 0),
(25, 'fiqiego1', 'fiqiegogo@gmail.com', '$2y$10$d9g3rc1.Sw3OgkPH.1ePte5OQc89d8dmITr4KaS2XNihNbhb6Xex2', 0),
(26, 'fiqie123', 'fiqie123@gmail.com', '$2y$10$mu6hPZmEeUnsPZRC27nM9.zTr9vV57zecAseCnpv6wTDXAVFJRTam', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posting`
--
ALTER TABLE `posting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `user_name` (`user_name`), ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `posting`
--
ALTER TABLE `posting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
