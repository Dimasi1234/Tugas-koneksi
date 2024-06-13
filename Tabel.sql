-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jun 2024 pada 05.26
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uts_312310221`
--

DELIMITER $$
--
-- Fungsi
--
CREATE DEFINER=`root`@`localhost` FUNCTION `HitungTotalSaldo` (`input_ID_anggota` INT) RETURNS DECIMAL(15,2)  begin
declare total_simpanan decimal (15,2);
declare total_pinjaman decimal (15,2);
declare total_saldo decimal (15,2);
select ifnull(sum(jumlah_simpanan), 0) into total_simpanan
from simpanan
where ID_anggota = input_ID_anggota;
select ifnull(sum(jumlah_pinjaman), 0) into total_pinjaman
from pinjaman
where ID_anggota = input_ID_anggota;
set total_saldo = total_simpanan - total_pinjaman;
return total_saldo;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `ID_anggota` int(10) NOT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `Alamat` varchar(200) DEFAULT NULL,
  `Tanggal_lahir` date DEFAULT NULL,
  `Nomor_telepon` varchar(15) DEFAULT NULL,
  `status_keanggotaan` varchar(50) DEFAULT NULL,
  `Tanggal_bergabung` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`ID_anggota`, `Nama`, `Alamat`, `Tanggal_lahir`, `Nomor_telepon`, `status_keanggotaan`, `Tanggal_bergabung`) VALUES
(100101, 'Agung', 'Jl. Nangka', '1996-02-14', '081212131415', 'aktif', '2020-03-14'),
(100102, 'Sinta', 'Jl. Semangka', '2000-05-12', '081239495262', 'aktif', '2020-03-14'),
(100103, 'Jamal', 'Jl. Jambu', '1998-05-20', '085252678987', 'aktif', '2020-03-14'),
(100104, 'Nur', 'Jl. Sirsak', '1999-11-07', '081222135243', 'aktif', '2020-03-14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_pinjaman`
--

CREATE TABLE `jenis_pinjaman` (
  `ID_jenis_pinjaman` int(10) NOT NULL,
  `Nama_jenis_pinjaman` varchar(150) DEFAULT NULL,
  `Bunga` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jenis_pinjaman`
--

INSERT INTO `jenis_pinjaman` (`ID_jenis_pinjaman`, `Nama_jenis_pinjaman`, `Bunga`) VALUES
(400401, 'Modal usaha', 200000.00),
(400402, 'pinjaman pendidikan', 200000.00),
(400403, 'Modal usaha', 200000.00),
(400404, 'pinjaman pendidikan', 200000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keanggotaan`
--

CREATE TABLE `keanggotaan` (
  `ID_keanggotaan` int(10) NOT NULL,
  `ID_anggota` int(11) DEFAULT NULL,
  `Status_keanggotaan` varchar(50) DEFAULT NULL,
  `Tanggal_bergabung` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `keanggotaan`
--

INSERT INTO `keanggotaan` (`ID_keanggotaan`, `ID_anggota`, `Status_keanggotaan`, `Tanggal_bergabung`) VALUES
(101, 100101, 'aktif', '2020-03-14'),
(202, 100102, 'aktif', '2022-08-20'),
(303, 100103, 'aktif', '2020-05-15'),
(404, 100104, 'aktif', '2021-02-14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `ID_pegawai` int(10) NOT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `Jabatan` varchar(50) DEFAULT NULL,
  `Nomor_telepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`ID_pegawai`, `Nama`, `Jabatan`, `Nomor_telepon`) VALUES
(200201, 'Ahmad', 'Staf 1', '081239495262'),
(200202, 'Yanti', 'Staf 2', '081252453424'),
(200203, 'Sadam', 'Staf 3', '085212325443'),
(200204, 'Aya', 'Staf 4', '081249562772');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjaman`
--

CREATE TABLE `pinjaman` (
  `ID_pinjaman` int(10) NOT NULL,
  `ID_anggota` int(11) DEFAULT NULL,
  `ID_pegawai` int(11) DEFAULT NULL,
  `ID_jenis_pinjaman` int(11) DEFAULT NULL,
  `Tanggal_pinjaman` date DEFAULT NULL,
  `Jumlah_pinjaman` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pinjaman`
--

INSERT INTO `pinjaman` (`ID_pinjaman`, `ID_anggota`, `ID_pegawai`, `ID_jenis_pinjaman`, `Tanggal_pinjaman`, `Jumlah_pinjaman`) VALUES
(1, 100101, 200201, 400401, '2024-03-14', 5000000.00),
(2, 100102, 200202, 400402, '2024-01-18', 3000000.00),
(3, 100103, 200203, 400403, '2024-05-07', 5000000.00),
(4, 100104, 200204, 400404, '2024-01-20', 4000000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `simpanan`
--

CREATE TABLE `simpanan` (
  `ID_simpanan` int(10) NOT NULL,
  `ID_anggota` int(11) DEFAULT NULL,
  `ID_pegawai` int(11) DEFAULT NULL,
  `Tanggal_simpanan` date DEFAULT NULL,
  `Jumlah_simpanan` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `simpanan`
--

INSERT INTO `simpanan` (`ID_simpanan`, `ID_anggota`, `ID_pegawai`, `Tanggal_simpanan`, `Jumlah_simpanan`) VALUES
(300301, 100101, 200201, '2021-05-15', 10000000.00),
(300302, 100102, 200202, '2023-11-10', 5000000.00),
(300303, 100103, 200203, '2021-07-14', 8500000.00),
(300304, 100104, 200204, '2022-04-20', 6000000.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`ID_anggota`);

--
-- Indeks untuk tabel `jenis_pinjaman`
--
ALTER TABLE `jenis_pinjaman`
  ADD PRIMARY KEY (`ID_jenis_pinjaman`);

--
-- Indeks untuk tabel `keanggotaan`
--
ALTER TABLE `keanggotaan`
  ADD PRIMARY KEY (`ID_keanggotaan`),
  ADD KEY `ID_anggota` (`ID_anggota`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`ID_pegawai`);

--
-- Indeks untuk tabel `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`ID_pinjaman`),
  ADD KEY `ID_anggota` (`ID_anggota`),
  ADD KEY `ID_pegawai` (`ID_pegawai`),
  ADD KEY `ID_jenis_pinjaman` (`ID_jenis_pinjaman`);

--
-- Indeks untuk tabel `simpanan`
--
ALTER TABLE `simpanan`
  ADD PRIMARY KEY (`ID_simpanan`),
  ADD KEY `ID_anggota` (`ID_anggota`),
  ADD KEY `ID_pegawai` (`ID_pegawai`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `keanggotaan`
--
ALTER TABLE `keanggotaan`
  ADD CONSTRAINT `keanggotaan_ibfk_1` FOREIGN KEY (`ID_anggota`) REFERENCES `anggota` (`ID_anggota`);

--
-- Ketidakleluasaan untuk tabel `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD CONSTRAINT `pinjaman_ibfk_1` FOREIGN KEY (`ID_anggota`) REFERENCES `anggota` (`ID_anggota`),
  ADD CONSTRAINT `pinjaman_ibfk_2` FOREIGN KEY (`ID_pegawai`) REFERENCES `pegawai` (`ID_pegawai`),
  ADD CONSTRAINT `pinjaman_ibfk_3` FOREIGN KEY (`ID_jenis_pinjaman`) REFERENCES `jenis_pinjaman` (`ID_jenis_pinjaman`);

--
-- Ketidakleluasaan untuk tabel `simpanan`
--
ALTER TABLE `simpanan`
  ADD CONSTRAINT `simpanan_ibfk_1` FOREIGN KEY (`ID_anggota`) REFERENCES `anggota` (`ID_anggota`),
  ADD CONSTRAINT `simpanan_ibfk_2` FOREIGN KEY (`ID_pegawai`) REFERENCES `pegawai` (`ID_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
