-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2020 at 03:26 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoku`
--
CREATE DATABASE IF NOT EXISTS `tokoku` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tokoku`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detail_pembelian`
--

CREATE TABLE `tbl_detail_pembelian` (
  `id_detail_pembelian` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `kode_produk` char(3) NOT NULL,
  `jml_beli` mediumint(9) NOT NULL,
  `keterangan` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_detail_pembelian`
--

INSERT INTO `tbl_detail_pembelian` (`id_detail_pembelian`, `id_pembelian`, `kode_produk`, `jml_beli`, `keterangan`) VALUES
(5, 4, 'P04', 1, 'warna iem'),
(6, 5, 'P05', 4, '');

--
-- Triggers `tbl_detail_pembelian`
--
DELIMITER $$
CREATE TRIGGER `kurangi_stok` AFTER INSERT ON `tbl_detail_pembelian` FOR EACH ROW BEGIN
	UPDATE tbl_produk SET tbl_produk.jml_beli=tbl_produk.jml_beli-new.jml_beli WHERE tbl_produk.kode_produk=new.kode_produk;	
    end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inbox`
--

CREATE TABLE `tbl_inbox` (
  `id_inbox` int(11) NOT NULL,
  `nama_pengirim` varchar(100) NOT NULL,
  `email_pengirim` varchar(150) NOT NULL,
  `waktu_kirim` datetime NOT NULL,
  `isi_pesan` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_inbox`
--

INSERT INTO `tbl_inbox` (`id_inbox`, `nama_pengirim`, `email_pengirim`, `waktu_kirim`, `isi_pesan`) VALUES
(1, 'dicky', 'dicky@gmail.com', '2020-07-10 20:24:36', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_konfirmasi`
--

CREATE TABLE `tbl_konfirmasi` (
  `id_pembelian` int(11) NOT NULL,
  `waktu_konfirmasi` datetime NOT NULL,
  `bukti_pembayaran` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_konfirmasi`
--

INSERT INTO `tbl_konfirmasi` (`id_pembelian`, `waktu_konfirmasi`, `bukti_pembayaran`) VALUES
(4, '2020-07-10 19:51:14', '4-Desert.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembelian`
--

CREATE TABLE `tbl_pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `tanggal_pembelian` datetime NOT NULL,
  `email` varchar(200) NOT NULL,
  `status_pembelian` enum('selesai','pending') NOT NULL DEFAULT 'pending',
  `rek_tujuan` tinyint(4) NOT NULL,
  `jasa_kurir` tinyint(4) NOT NULL,
  `alamat_tujuan` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pembelian`
--

INSERT INTO `tbl_pembelian` (`id_pembelian`, `tanggal_pembelian`, `email`, `status_pembelian`, `rek_tujuan`, `jasa_kurir`, `alamat_tujuan`) VALUES
(4, '2020-07-10 19:50:04', 'dicky@gmail.com', 'selesai', 1, 1, 'Jalan jalan'),
(5, '2020-07-10 20:25:11', 'dicky@gmail.com', 'pending', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `kode_produk` char(3) NOT NULL,
  `nama_produk` varchar(150) NOT NULL,
  `merk` varchar(100) NOT NULL,
  `tgl_beli` date NOT NULL,
  `harga_beli` mediumint(9) NOT NULL,
  `harga_jual` mediumint(9) NOT NULL,
  `jml_beli` mediumint(9) NOT NULL,
  `photo_produk` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_produk`
--

INSERT INTO `tbl_produk` (`kode_produk`, `nama_produk`, `merk`, `tgl_beli`, `harga_beli`, `harga_jual`, `jml_beli`, `photo_produk`) VALUES
('P01', 'Kanzu dress', 'Dress', '2020-05-22', 100000, 130000, 15, 'P01.jpeg'),
('P02', 'Khadijah Dress', 'Dress', '2020-05-29', 130000, 150000, 10, 'P02.jpeg'),
('P03', 'Helwa Dress', 'Dress', '2020-01-10', 110000, 120000, 23, 'P03.jpeg'),
('P04', 'Saudah series', 'Dress', '2020-06-02', 100000, 150000, 9, 'P04.jpeg'),
('P05', 'Polka Dress', 'Dress', '2020-07-01', 100000, 120000, 30, 'P05.jpeg'),
('P06', 'Aisyah Series ', 'Dress', '2020-07-01', 120000, 130000, 20, 'P06.jpeg'),
('P07', 'Saudah serie Dress', 'Dress', '2020-06-10', 120000, 135000, 20, 'P07.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `email` varchar(200) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `password` char(32) NOT NULL,
  `alamat` mediumtext NOT NULL,
  `handphone` varchar(20) NOT NULL,
  `waktu_daftar` datetime NOT NULL,
  `level` enum('administrator','member') NOT NULL DEFAULT 'member'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`email`, `nama_lengkap`, `password`, `alamat`, `handphone`, `waktu_daftar`, `level`) VALUES
('admin@admin.com', 'Dicky Verdiansyah', '202cb962ac59075b964b07152d234b70', 'Semarang', '', '2020-01-12 04:59:35', 'administrator'),
('dicky@gmail.com', 'dicky', '827ccb0eea8a706c4c34a16891f84e7b', 'Jalan jalan', '', '2020-07-10 19:49:33', 'member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_detail_pembelian`
--
ALTER TABLE `tbl_detail_pembelian`
  ADD PRIMARY KEY (`id_detail_pembelian`);

--
-- Indexes for table `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  ADD PRIMARY KEY (`id_inbox`);

--
-- Indexes for table `tbl_konfirmasi`
--
ALTER TABLE `tbl_konfirmasi`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `tbl_pembelian`
--
ALTER TABLE `tbl_pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`kode_produk`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_detail_pembelian`
--
ALTER TABLE `tbl_detail_pembelian`
  MODIFY `id_detail_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  MODIFY `id_inbox` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_pembelian`
--
ALTER TABLE `tbl_pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
