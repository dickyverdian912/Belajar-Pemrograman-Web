-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 10, 2020 at 03:55 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE IF NOT EXISTS `kendaraan` (
  `no plat` varchar(15) NOT NULL,
  `id type` varchar(15) NOT NULL,
  `tahun` year(4) DEFAULT NULL,
  `tarif` int(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`no plat`),
  UNIQUE KEY `id type` (`id type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`no plat`, `id type`, `tahun`, `tarif`, `status`) VALUES
('AA 1224 BB', '0001', 2013, 2000000, 'mobil baik, dan terawat'),
('H 3421 ACX', '0002', 2010, 300000, 'mobik baik dan terawat dan raj'),
('H 8361 AW', '0007', 2011, 250000, 'mobil rutin servis');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `no ktp` varchar(30) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  PRIMARY KEY (`no ktp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`no ktp`, `nama`, `alamat`, `telepon`) VALUES
('33223746387648334', 'derry laine', 'Jln. Sudirman, Solo', '62897832183453'),
('33223874537846387', 'Adit Sopo', 'Jln. Durian Runtuh', '62857834382'),
('33224856894589239', 'Beny Wijay', 'Jln. Diponegoro, Tembalang, Semarang', '62817348731'),
('33229213687216378', 'Andy Janc', 'Jln. selamat, Salatiga', '62852362153'),
('3328239132849314', 'Jepri Bagyo', 'Jln. Soepomo, Malang, Jawa Timur', '6285783213291'),
('332863984339234235', 'Hendra Kawulo', 'Jln. Soekarno-Hatta, Surabaya', '628789236812');

-- --------------------------------------------------------

--
-- Table structure for table `sopir`
--

CREATE TABLE IF NOT EXISTS `sopir` (
  `id sopir` int(20) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `sim` varchar(30) NOT NULL,
  `tarif` int(20) NOT NULL,
  PRIMARY KEY (`id sopir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sopir`
--

INSERT INTO `sopir` (`id sopir`, `nama`, `alamat`, `telepon`, `sim`, `tarif`) VALUES
(1001, 'Paijo', 'Jln. Mulawarman, Semarang, Jawa Tengah', '6289715235476', 'B1', 1000000),
(1002, 'Jono', 'Jln. Selatan, Salatiga', '6281474836470', 'B2', 1500000),
(1003, 'Budi', 'Jln. Gentan Raya, Kab.Semarang', '6287209871234', 'B2', 1500000),
(1004, 'Bery', 'Jln. Susukan, Semarang', '6284273827649', 'B1', 1000000),
(1005, 'Rendy', 'Jln. Selamat Jalan, Jakarta', '6289827839125', 'B2 Umum', 2000000),
(1006, 'Edo Slamet', 'Jln. Ahmad Yani, Bogor', '6285179254735', 'B1', 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `tipe kendaraan`
--

CREATE TABLE IF NOT EXISTS `tipe kendaraan` (
  `id type` varchar(15) NOT NULL,
  `type` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipe kendaraan`
--

INSERT INTO `tipe kendaraan` (`id type`, `type`) VALUES
('0001', 'Sedan'),
('0002', 'SUV'),
('0003', 'Convertible'),
('0004', 'Mobil Coupe'),
('0005', 'Mobil Hatcback'),
('0006', 'Mobil Minivan'),
('0007', 'Mobil Sport'),
('0008', 'Mobil Station Wagon');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `No transaksi` varchar(30) NOT NULL,
  `no plat` varchar(15) NOT NULL,
  `id sopir` int(20) NOT NULL,
  `no ktp` varchar(30) NOT NULL,
  `tanggal pesan` date NOT NULL,
  `tanggal pinjam` date NOT NULL,
  `tanggal kembali rencana` date NOT NULL,
  `jam kembali rencana` time NOT NULL,
  `tanggal kembali realisasi` date NOT NULL,
  `jam kembali realisasi` time NOT NULL,
  `denda` int(20) NOT NULL,
  `kilometer pinjam` int(20) NOT NULL,
  `kilometer kembali` int(20) NOT NULL,
  `bbm pinjam` int(20) NOT NULL,
  `bbm kembali` int(20) NOT NULL,
  `kondisi mobil pinjam` text NOT NULL,
  `kondisi mobil kembali` text NOT NULL,
  `kerusakan` text NOT NULL,
  `biaya kerusakan` int(30) NOT NULL,
  `biaya bbm` int(20) NOT NULL,
  UNIQUE KEY `no plat` (`no plat`,`id sopir`,`no ktp`),
  UNIQUE KEY `no ktp` (`no ktp`),
  KEY `id sopir` (`id sopir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`No transaksi`, `no plat`, `id sopir`, `no ktp`, `tanggal pesan`, `tanggal pinjam`, `tanggal kembali rencana`, `jam kembali rencana`, `tanggal kembali realisasi`, `jam kembali realisasi`, `denda`, `kilometer pinjam`, `kilometer kembali`, `bbm pinjam`, `bbm kembali`, `kondisi mobil pinjam`, `kondisi mobil kembali`, `kerusakan`, `biaya kerusakan`, `biaya bbm`) VALUES
('A0001', 'AA 1224 BB', 1002, '33223746387648334', '2020-04-07', '2020-04-08', '2020-04-23', '00:00:00', '2020-04-30', '00:00:12', 20000, 500000, 550000, 100, 50, 'baik, good', 'agak rusak', 'ban alus', 500000, 1000000),
('A0002', 'AA 1224 BB', 1004, '332863984339234235', '2020-04-01', '2020-04-02', '2020-04-10', '00:00:12', '2020-04-11', '00:00:13', 1000000, 3000, 5000, 200, 50, 'baiik baik saja', 'rusak parah', 'peok semua body', 100000000, 500000);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `kendaraan_ibfk_1` FOREIGN KEY (`id type`) REFERENCES `tipe kendaraan` (`id type`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id sopir`) REFERENCES `sopir` (`id sopir`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`no plat`) REFERENCES `kendaraan` (`no plat`),
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`no ktp`) REFERENCES `pelanggan` (`no ktp`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
