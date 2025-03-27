-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Mar 2025 pada 06.27
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
-- Database: `basis_data_6`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ambil_matkul`
--

CREATE TABLE `ambil_matkul` (
  `nim` char(3) NOT NULL,
  `kode_matkul` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ambil_matkul`
--

INSERT INTO `ambil_matkul` (`nim`, `kode_matkul`) VALUES
('101', 'PTI447'),
('103', 'TIK333'),
('104', 'PTI333'),
('104', 'PTI777'),
('105', 'PTI123'),
('107', 'PTI777');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `kode_dosen` char(2) NOT NULL,
  `nama_dosen` varchar(15) NOT NULL,
  `alamat_dosen` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`kode_dosen`, `nama_dosen`, `alamat_dosen`) VALUES
('10', 'Suharto', 'Jl.Jombang'),
('11', 'Martono', 'Jl.Kalpataru'),
('12', 'Rahmawati', 'Jl.Jakarta'),
('13', 'Bambang', 'Jl.Bandung'),
('14', 'Nurul', 'Jl.Raya Tidar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jurusan` char(5) NOT NULL,
  `nama_jurusan` varchar(20) NOT NULL,
  `kode_dosen` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `nama_jurusan`, `kode_dosen`) VALUES
('TE', 'Teknik Elektro', '10'),
('TM', 'Teknik Mesin', '13'),
('TS', 'Teknik Sipil', '13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(3) NOT NULL,
  `nama` varchar(10) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jenis_kelamin`, `alamat`) VALUES
('101', 'Arif', 'L', 'Jl.Kenangan'),
('102', 'Budi', 'L', 'Jl.Jombang'),
('103', 'Wati', 'P', 'Jl.Surabaya'),
('104', 'Ika', 'P', 'Jl.Jombang'),
('105', 'Tono', 'L', 'Jl.Jakarta'),
('106', 'Iwan', 'L', 'Jl.Bandung'),
('107', 'Sari', 'P', 'Jl.Malang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kode_matkul` char(6) NOT NULL,
  `nama_matkul` varchar(25) NOT NULL,
  `sks` char(1) NOT NULL,
  `semester` char(1) NOT NULL,
  `kode_dosen` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kode_matkul`, `nama_matkul`, `sks`, `semester`, `kode_dosen`) VALUES
('PTI123', 'Grafika Multimedia', '3', '5', '12'),
('PTI333', 'Basis Data Terdistribusi', '3', '5', '10'),
('PTI447', 'Praktikum Basis Data', '1', '3', '11'),
('PTI777', 'Sistem Informasi', '2', '3', '14'),
('TIK123', 'Jaringan Komputer', '2', '5', '13'),
('TIK333', 'Sistem Operasi', '3', '5', '10'),
('TIK342', 'Praktikum Basis Data', '1', '3', '11');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ambil_matkul`
--
ALTER TABLE `ambil_matkul`
  ADD KEY `nim` (`nim`),
  ADD KEY `kode_matkul` (`kode_matkul`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kode_dosen`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jurusan`),
  ADD KEY `kode_dosen` (`kode_dosen`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kode_matkul`),
  ADD KEY `kode_dosen` (`kode_dosen`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ambil_matkul`
--
ALTER TABLE `ambil_matkul`
  ADD CONSTRAINT `ambil_matkul_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `ambil_matkul_ibfk_2` FOREIGN KEY (`kode_matkul`) REFERENCES `mata_kuliah` (`kode_matkul`);

--
-- Ketidakleluasaan untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`kode_dosen`) REFERENCES `dosen` (`kode_dosen`);

--
-- Ketidakleluasaan untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `mata_kuliah_ibfk_1` FOREIGN KEY (`kode_dosen`) REFERENCES `dosen` (`kode_dosen`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
