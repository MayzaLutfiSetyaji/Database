-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Apr 2025 pada 11.19
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
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jurusan` varchar(20) NOT NULL,
  `tgl_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `jurusan`, `tgl_daftar`) VALUES
('2120506012', 'Achmad Cahya', 'Olahraga', '2021-05-06'),
('2320506025', 'Satriya Dwi Pangestu', 'Hukum', '2023-12-01'),
('2420506033', 'Mayza Lutfi Setyaji', 'Teknologi Informasi', '2024-06-17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `penerbit` varchar(50) DEFAULT NULL,
  `tahun_terbit` int(11) DEFAULT NULL,
  `id_penerbit` varchar(5) NOT NULL
) ;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penerbit`, `tahun_terbit`, `id_penerbit`) VALUES
('A001', 'Algoritma Pemrograman', 'Bentang Pustaka', 2005, 'P001'),
('A002', 'Butir-Butir Pancasila dan UUD 1945', 'Gramedia', 1995, 'P002'),
('A003', 'Pola Hidup Sehat ala Dr.Tirta', 'Hasta Mitra', 2023, 'P003'),
('A004', 'Dasar-dasar MySQL Untuk Pemula', 'Mizan Publika', 2018, 'P004'),
('A005', 'Gerakan Mahasiswa', 'Buku Kompas', 1998, 'P005'),
('A006', 'Basis Data', 'Komojoyo Press', 2015, 'P006'),
('A007', 'Cara Membangun Habits', 'Bentang Pustaka', 2012, 'P001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_anggota` varchar(10) DEFAULT NULL,
  `id_buku` varchar(10) DEFAULT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_pengembalian` date DEFAULT NULL,
  `denda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_pengembalian`, `denda`) VALUES
(1, '2420506033', 'A004', '2025-03-01', '2025-03-08', 0),
(2, '2320506025', 'A005', '2025-03-07', '2025-03-14', 0),
(3, '2120506012', 'A003', '2025-03-05', NULL, 10000),
(4, '2420506033', 'A001', '2025-03-08', NULL, NULL),
(5, '2420506033', 'A006', '2025-04-09', '2025-04-16', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` varchar(5) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL,
  `alamat` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `nama_penerbit`, `alamat`) VALUES
('P001', 'Bentang Pustaka', 'Jl. Pesanggrahan No.8, Kota Yogyakarta 55166'),
('P002', 'Gramedia', 'Jl. Palmerah Barat 29-37, Jakarta 10270'),
('P003', 'Hasta Mitra', 'Jl. Tebet Dalam IV No.25, Jakarta Selatan 12810'),
('P004', 'Mizan Publika', 'Jl. Cinambo No.135, Bandung 40294, Jawa barat'),
('P005', 'Buku Kompas', 'Jl. Palmerah Barat 29-37, Jakarta 10270'),
('P006', 'Komojoyo Press', 'Jl. Komojoyo 21A, Sleman, Yogyakarta');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_penerbit` (`id_penerbit`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbit` (`id_penerbit`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
