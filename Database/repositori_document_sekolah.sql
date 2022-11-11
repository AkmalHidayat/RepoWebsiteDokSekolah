-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2022 at 02:40 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `repositori_document_sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `no` varchar(50) NOT NULL,
  `nama_document` varchar(255) NOT NULL,
  `kategori` enum('Surat Masuk','Surat Keluar') NOT NULL,
  `sifat_document` enum('umum','rahasia') NOT NULL,
  `file_document` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inmails`
--

CREATE TABLE `inmails` (
  `no` varchar(50) NOT NULL,
  `kategori` enum('Surat Masuk') NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `judul_surat` varchar(255) NOT NULL,
  `file_surat` varchar(255) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `outmails`
--

CREATE TABLE `outmails` (
  `no` varchar(50) NOT NULL,
  `kategori` enum('Surat Keluar') NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `judul_surat` varchar(255) NOT NULL,
  `file_surat` varchar(255) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
