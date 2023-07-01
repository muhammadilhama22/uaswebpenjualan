-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Jul 2023 pada 13.51
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `melokal`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_about`
--

CREATE TABLE `tb_about` (
  `id` int(10) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `isi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_about`
--

INSERT INTO `tb_about` (`id`, `judul`, `isi`) VALUES
(52, 'Tentang ', 'kami adalah Reseller resmi dari brand brand ternama seperti Gucci Balenciaga dan Uniqlo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_artikel`
--

CREATE TABLE `tb_artikel` (
  `id` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `isi` longtext NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_penulis` int(11) NOT NULL,
  `id_merek` int(11) NOT NULL,
  `gambar` varchar(20) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_artikel`
--

INSERT INTO `tb_artikel` (`id`, `judul`, `isi`, `id_kategori`, `id_penulis`, `id_merek`, `gambar`, `created_at`) VALUES
(1, 'Balenciaga New Edition', 'Pada hari kemarin 15 juni brand balenciaga resmi merilis sepatu baru yang siap untuk menjadi buruan para kolektor barang-barang branded yang limited edition untuk di koleksi tanpa memandang harga karena untuk sebuah fashion baru kita tidak bolehpelit kepada diri kita sendiri bukan ? ', 9, 4, 4, 'Artikel 1.jpg', '2023-06-12'),
(2, 'Balenciaga HAT only 10', 'sederhana dan mewah itulah kata kata yang terucapkan untuk topi baru dari balenciaga ini', 8, 4, 4, 'Artikel 2.jpg', '2023-06-29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ekspedisi`
--

CREATE TABLE `tb_ekspedisi` (
  `id` int(11) NOT NULL,
  `nama_ekspedisi` varchar(20) NOT NULL,
  `harga_ekspedisi` int(20) NOT NULL,
  `gambar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_ekspedisi`
--

INSERT INTO `tb_ekspedisi` (`id`, `nama_ekspedisi`, `harga_ekspedisi`, `gambar`) VALUES
(3, 'JNE', 20000, 'JNE.png'),
(4, 'Anteraja', 30000, 'Anteraja.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(20) NOT NULL,
  `gambar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`id`, `nama_kategori`, `gambar`) VALUES
(5, 'Baju', 'Baju.jpg'),
(6, 'Celana', 'Celana.jpg'),
(7, 'Jaket', 'Jaket.jpg'),
(8, 'Topi', 'Topi.jpg'),
(9, 'Sepatu', 'Sepatu.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_merek`
--

CREATE TABLE `tb_merek` (
  `id` int(11) NOT NULL,
  `nama_merek` varchar(20) NOT NULL,
  `gambar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_merek`
--

INSERT INTO `tb_merek` (`id`, `nama_merek`, `gambar`) VALUES
(3, 'Gucci', 'Gucci.jpg'),
(4, 'Balenciaga', 'Balenciaga.jpg'),
(5, 'Uniqlo', 'Uniqlo.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_payment`
--

CREATE TABLE `tb_payment` (
  `id` int(11) NOT NULL,
  `nama_payment` varchar(20) NOT NULL,
  `harga_payment` int(20) NOT NULL,
  `gambar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_payment`
--

INSERT INTO `tb_payment` (`id`, `nama_payment`, `harga_payment`, `gambar`) VALUES
(3, 'OVO', 2500, 'OVO.png'),
(4, 'Dana', 2000, 'Dana.png'),
(5, 'BRI', 3000, 'BRI.png'),
(6, 'BNI', 2500, 'BNI.png'),
(7, 'BCA', 3500, 'BCA.png'),
(8, 'Mandiri', 4000, 'Mandiri.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_ekspedisi` int(11) NOT NULL,
  `id_payment` int(11) NOT NULL,
  `jumlah_pesan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`id`, `id_user`, `id_produk`, `id_ekspedisi`, `id_payment`, `jumlah_pesan`) VALUES
(4, 4, 14, 4, 5, 2);

--
-- Trigger `tb_penjualan`
--
DELIMITER $$
CREATE TRIGGER `beli_produk` AFTER INSERT ON `tb_penjualan` FOR EACH ROW update tb_produk set tb_produk.stok = tb_produk.stok - new.jumlah_pesan where tb_produk.id = tb_produk.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penulis`
--

CREATE TABLE `tb_penulis` (
  `id` int(11) NOT NULL,
  `nama_penulis` varchar(20) NOT NULL,
  `gambar` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_penulis`
--

INSERT INTO `tb_penulis` (`id`, `nama_penulis`, `gambar`) VALUES
(4, 'Muhammad Ilham', 'Ilham.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `deskripsi` longtext NOT NULL,
  `stok` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  `id_merek` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_warna` int(11) NOT NULL,
  `id_ukuran` int(11) NOT NULL,
  `gambar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_produk`
--

INSERT INTO `tb_produk` (`id`, `nama_produk`, `deskripsi`, `stok`, `harga_beli`, `harga_jual`, `diskon`, `id_merek`, `id_kategori`, `id_warna`, `id_ukuran`, `gambar`) VALUES
(4, 'Tshirt GUCCI Logo', 'Kaos dengan logo Gucci', 53, 0, 550000, 0, 3, 5, 5, 5, 'TshirtGucci1'),
(5, 'Cotton Pants', 'Celana Bahan untuk acara formal', 53, 0, 600000, 0, 3, 6, 8, 6, 'Cottonpants.jpg'),
(6, 'Retro Tweed Jacket with Embroidery', 'Jaket dengan gaya Retro', 53, 0, 1300000, 0, 3, 7, 6, 7, 'RetroTweed2.jpg'),
(7, 'GUCCI Pattern Hat', 'Topi dengan corak Gucco', 53, 0, 450000, 0, 3, 8, 8, 4, 'Guccipattern2.jpg'),
(8, 'Men\'s Lace Up Shoes', 'Sepatu bahan kulit yang elegan', 53, 0, 4500000, 30, 3, 9, 6, 5, 'Laceshoes2.jpg'),
(9, 'Tshirt BALENCIAGA', 'Kaos dengan font Balenciaga di sudut dada kiri serta dibelakangnya', 53, 0, 545000, 0, 4, 5, 8, 5, 'TshirtBalenciaga2'),
(10, 'Wol Long Pants', 'celana dengan bahan wol', 53, 0, 500000, 0, 4, 6, 5, 6, 'wollongpants2.jpg'),
(13, 'Bomber Jacket', 'jaket bomber dengan bahan kulit', 53, 0, 1050000, 25, 4, 7, 6, 7, 'Bomber2.jpg'),
(14, 'BALENCIAGA Hat\'s', 'topi yang cocok digunakan di segala musim', 53, 0, 400000, 0, 4, 8, 5, 5, 'Balenciagahat2.jpg'),
(15, 'Running Shoes ', 'sepatu lari dengan bahan yang nyaman', 53, 0, 4375000, 10, 4, 9, 8, 5, 'Running2.jpg'),
(16, 'Plain Tshirt', 'kaos polos', 53, 0, 350000, 0, 5, 5, 7, 6, 'Plain Tshirt 1.jpg'),
(17, 'Cotton Pants Uniqlo', 'Celana Bahan untuk acara formal', 53, 0, 300000, 0, 5, 6, 6, 8, 'Cottonpants Uniqlo 1'),
(18, 'ZipperHoody', 'Jaket yg nyaman digunakan di segala cuaca', 53, 0, 400000, 0, 5, 7, 5, 4, 'ZipperHoody 1.jpg'),
(19, 'Bucket Hat\'s', 'topi berbentuk mangkok yang unik', 53, 0, 375000, 0, 5, 8, 6, 5, 'Bucket Hat\'s 1.jpg'),
(20, 'Classic Low Shoes', 'sepatu casual untuk hang out', 53, 0, 750000, 20, 5, 9, 6, 4, 'Classic Low Shoes 1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ukuran_a`
--

CREATE TABLE `tb_ukuran_a` (
  `id` int(11) NOT NULL,
  `nama_ukuran` varchar(20) NOT NULL,
  `keterangan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_ukuran_a`
--

INSERT INTO `tb_ukuran_a` (`id`, `nama_ukuran`, `keterangan`) VALUES
(4, 'S', 'Small'),
(5, 'M', 'Medium'),
(6, 'L', 'Large'),
(7, 'XL', 'Xtra Large'),
(8, 'XXL', 'Double Extra Large');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ukuran_b`
--

CREATE TABLE `tb_ukuran_b` (
  `id` int(11) NOT NULL,
  `nama_ukuran` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_ukuran_b`
--

INSERT INTO `tb_ukuran_b` (`id`, `nama_ukuran`) VALUES
(3, '36'),
(4, '37'),
(5, '38'),
(6, '39'),
(7, '40'),
(8, '41'),
(9, '42'),
(10, '43'),
(11, '44'),
(12, '45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(20) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `no_telp` int(20) NOT NULL,
  `alamat` longtext NOT NULL,
  `username` varchar(20) NOT NULL,
  `col_password` varchar(10) NOT NULL,
  `col_status` varchar(10) NOT NULL,
  `gambar` varchar(20) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_users`
--

INSERT INTO `tb_users` (`id`, `nama_lengkap`, `no_telp`, `alamat`, `username`, `col_password`, `col_status`, `gambar`, `created_at`) VALUES
(4, 'Aditainsancy Umar Sidik', 628775528, 'Cimalaka sumedang ', 'Adit02', 'Adit123', 'Menikah', 'Adit.png', '2023-07-01'),
(5, 'Rio Oktavian ', 628228228, 'Situraja Sumedang', 'Rio05', 'Rio345', 'Menikah', 'Rio.png', '2023-05-17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_warna`
--

CREATE TABLE `tb_warna` (
  `id` int(11) NOT NULL,
  `nama_warna` varchar(20) NOT NULL,
  `gambar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_warna`
--

INSERT INTO `tb_warna` (`id`, `nama_warna`, `gambar`) VALUES
(5, 'Putih', 'Putih.jpg'),
(6, 'Hitam ', 'Hitam.jpg'),
(7, 'Abu-abu', 'Abu-abu.jpg'),
(8, 'Cokelat', 'Cokelat.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_about`
--
ALTER TABLE `tb_about`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_artikel`
--
ALTER TABLE `tb_artikel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_merek` (`id_merek`),
  ADD KEY `id_penulis` (`id_penulis`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `tb_ekspedisi`
--
ALTER TABLE `tb_ekspedisi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_merek`
--
ALTER TABLE `tb_merek`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_payment`
--
ALTER TABLE `tb_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_ekspedisi` (`id_ekspedisi`),
  ADD KEY `id_payment` (`id_payment`);

--
-- Indeks untuk tabel `tb_penulis`
--
ALTER TABLE `tb_penulis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_merek` (`id_merek`),
  ADD KEY `id_ukuran` (`id_ukuran`),
  ADD KEY `id_warna` (`id_warna`);

--
-- Indeks untuk tabel `tb_ukuran_a`
--
ALTER TABLE `tb_ukuran_a`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_ukuran_b`
--
ALTER TABLE `tb_ukuran_b`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_warna`
--
ALTER TABLE `tb_warna`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_about`
--
ALTER TABLE `tb_about`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `tb_artikel`
--
ALTER TABLE `tb_artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_ekspedisi`
--
ALTER TABLE `tb_ekspedisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_merek`
--
ALTER TABLE `tb_merek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_payment`
--
ALTER TABLE `tb_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_penulis`
--
ALTER TABLE `tb_penulis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `tb_ukuran_a`
--
ALTER TABLE `tb_ukuran_a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_ukuran_b`
--
ALTER TABLE `tb_ukuran_b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_warna`
--
ALTER TABLE `tb_warna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_artikel`
--
ALTER TABLE `tb_artikel`
  ADD CONSTRAINT `tb_artikel_ibfk_1` FOREIGN KEY (`id_penulis`) REFERENCES `tb_penulis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_artikel_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_artikel_ibfk_3` FOREIGN KEY (`id_merek`) REFERENCES `tb_merek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_penjualan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `tb_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_penjualan_ibfk_3` FOREIGN KEY (`id_ekspedisi`) REFERENCES `tb_ekspedisi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_penjualan_ibfk_4` FOREIGN KEY (`id_payment`) REFERENCES `tb_payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD CONSTRAINT `tb_produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_produk_ibfk_2` FOREIGN KEY (`id_merek`) REFERENCES `tb_merek` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_produk_ibfk_3` FOREIGN KEY (`id_ukuran`) REFERENCES `tb_ukuran_a` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_produk_ibfk_5` FOREIGN KEY (`id_warna`) REFERENCES `tb_warna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
