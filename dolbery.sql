-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Mar 2025 pada 15.22
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dolbery`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dol`
--

CREATE TABLE `dol` (
  `NPM` varchar(10) NOT NULL,
  `NAMA` varchar(20) NOT NULL,
  `Tempat_lahir` varchar(15) NOT NULL,
  `Tanggal_lahir` date NOT NULL,
  `Jenis_kelamin` enum('L','P') DEFAULT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dol`
--

INSERT INTO `dol` (`NPM`, `NAMA`, `Tempat_lahir`, `Tanggal_lahir`, `Jenis_kelamin`, `no_hp`) VALUES
('2420506018', 'Hammam Al Rosyid Mud', 'Solo', '2004-11-13', 'L', '242423465'),
('2420506027', 'Muhammad Ramdhan', 'Temanggung', '2005-09-01', 'L', '2325325'),
('2420506028', 'Abdurrahman Wahid', 'Jakarta', '2006-04-12', 'L', '6554644'),
('2420506033', 'Lutfi Setyaji', 'Bandung', '2006-05-06', 'L', '999999');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dol`
--
ALTER TABLE `dol`
  ADD PRIMARY KEY (`NPM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
