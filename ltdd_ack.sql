-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2022 at 05:25 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ltdd_ack`
--

-- --------------------------------------------------------

--
-- Table structure for table `baiviets`
--

CREATE TABLE `baiviets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ID_NGUOIDANG` bigint(20) UNSIGNED NOT NULL,
  `ID_DIADANH` bigint(20) UNSIGNED NOT NULL,
  `NGAYDANG` datetime NOT NULL,
  `NOIDUNG` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `HINHANH` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `THICH` int(11) NOT NULL,
  `KHONGTHICH` int(11) NOT NULL,
  `TRANGTHAI` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `baiviets`
--

INSERT INTO `baiviets` (`id`, `ID_NGUOIDANG`, `ID_DIADANH`, `NGAYDANG`, `NOIDUNG`, `HINHANH`, `THICH`, `KHONGTHICH`, `TRANGTHAI`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2022-02-10 20:43:56', 'qua da', 'image_picker2188022966934231571.jpg', 0, 0, 0, NULL, NULL, NULL),
(2, 1, 2, '2022-02-10 20:54:15', 'lai di choi', 'image_picker835292737687877746.jpg', 20, 10, 0, NULL, NULL, NULL),
(3, 1, 2, '2022-02-10 21:15:57', 'khu du lich sinh thai', 'image_picker2230391549698504538.jpg', 11, 0, 1, NULL, NULL, NULL),
(4, 1, 1, '2022-02-10 21:16:39', 'di choi qua da', 'image_picker2747754361476249385.jpg', 1, 0, 0, NULL, NULL, NULL),
(5, 1, 2, '2022-02-12 00:04:33', 'qua da', 'image_picker1562427259058658444.jpg', 1, 0, 0, NULL, NULL, NULL),
(6, 1, 1, '2022-02-15 08:05:26', 'bai  viet moi', 'image_picker5655590940852228121.jpg', 1, 0, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `binhluans`
--

CREATE TABLE `binhluans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ID_NGUOIDANG` bigint(20) UNSIGNED NOT NULL,
  `ID_BAIVIET` bigint(20) UNSIGNED NOT NULL,
  `NOIDUNG` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRANGTHAI` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `binhluans`
--

INSERT INTO `binhluans` (`id`, `ID_NGUOIDANG`, `ID_BAIVIET`, `NOIDUNG`, `TRANGTHAI`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 6, 'ok', 1, NULL, NULL, NULL),
(2, 2, 6, 'ok ok\n', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `danhmucs`
--

CREATE TABLE `danhmucs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `TENDANHMUC` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HINHANH` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRANGTHAI` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `danhmucs`
--

INSERT INTO `danhmucs` (`id`, `TENDANHMUC`, `HINHANH`, `TRANGTHAI`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Du l???ch B??i bi???n', 'http://baoquangngai.vn/dataimages/201907/original/images2220216_DEANDULICH.jpg', 1, NULL, NULL, NULL),
(2, 'Du l???ch sinh th??i', 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/07/khu-sinh-thai-1.jpg', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `diadanhs`
--

CREATE TABLE `diadanhs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `TENDIADANH` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_TINHTHANH` bigint(20) UNSIGNED NOT NULL,
  `ID_DANHMUC` bigint(20) UNSIGNED NOT NULL,
  `KINHDO` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VIDO` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LUOTTHICH` int(11) NOT NULL,
  `MOTA` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `HINHANH` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRANGTHAI` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diadanhs`
--

INSERT INTO `diadanhs` (`id`, `TENDIADANH`, `ID_TINHTHANH`, `ID_DANHMUC`, `KINHDO`, `VIDO`, `LUOTTHICH`, `MOTA`, `HINHANH`, `TRANGTHAI`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'B??i bi???n Nha Trang', 30, 1, '100000', '99999', 3, 'B???n t??u du l???ch C???u ???? (ph?????ng V??nh Nguy??n, Tp. Nha Trang) lu??n trong t??nh tr???ng ch???t k??n kh??ch; c??c t??u ph???i ch???y h???t c??ng su???t m???i ????? s???c ph???c v??? nhu c???u c???a kh??ch.', 'https://baokhanhhoa.vn/dataimages/201904/original/images5361854_1_DSCF1042_001.JPG', 1, NULL, NULL, NULL),
(2, 'Khu du l???ch sinh th??i Madagui', 45, 2, '99999', '66666', 2, '?????n v???i khu sinh th??i Madagui, b???n s??? ???????c kh??m ph?? n??i r???ng T??y Nguy??n v???i nh???ng c??nh r???ng xanh tr???i d??i, b???u kh??ng kh?? trong l??nh, hoang s?? m?? v???n l??ng m???n, bay b???ng.', 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/07/leo-deo-noi-suoi.jpg', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `luotkhongthiches`
--

CREATE TABLE `luotkhongthiches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ID_NGUOIKHONGTHICH` bigint(20) UNSIGNED NOT NULL,
  `ID_BAIVIET` bigint(20) UNSIGNED NOT NULL,
  `TRANGTHAI` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `luotthiches`
--

CREATE TABLE `luotthiches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ID_NGUOITHICH` bigint(20) UNSIGNED NOT NULL,
  `ID_BAIVIET` bigint(20) UNSIGNED NOT NULL,
  `TRANGTHAI` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `luotthiches`
--

INSERT INTO `luotthiches` (`id`, `ID_NGUOITHICH`, `ID_BAIVIET`, `TRANGTHAI`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 1, 4, 1, NULL, NULL, NULL),
(3, 1, 3, 0, NULL, NULL, NULL),
(4, 2, 3, 1, NULL, NULL, NULL),
(5, 1, 5, 1, NULL, NULL, NULL),
(6, 1, 6, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `miens`
--

CREATE TABLE `miens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `TENMIEN` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRANGTHAI` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `miens`
--

INSERT INTO `miens` (`id`, `TENMIEN`, `TRANGTHAI`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nam B???', 1, NULL, NULL, NULL),
(2, 'B???c B???', 1, NULL, NULL, NULL),
(3, 'Trung B???', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_21_043118_create_taikhoans_table', 1),
(6, '2022_01_21_044500_create_miens_table', 1),
(7, '2022_01_21_044802_create_tinhthanhs_table', 1),
(8, '2022_01_21_045341_create_foreign_keys', 1),
(9, '2022_01_21_045820_create_diadanhs_table', 1),
(10, '2022_01_21_050901_create_danhmucs_table', 1),
(11, '2022_01_21_051255_create_foreig_keys_dia_danh', 1),
(12, '2022_01_21_051401_create_baiviets_table', 1),
(13, '2022_01_21_052356_create_binhluans_table', 1),
(14, '2022_01_21_052759_create_foreign_keys_bai_viet', 1),
(15, '2022_01_21_053041_create_foreign_keys_binh_luan', 1),
(16, '2022_01_21_053233_create_luotthiches_table', 1),
(17, '2022_01_21_053529_create_luotkhongthiches_table', 1),
(18, '2022_01_21_053713_create_foreign_keys_thich', 1),
(19, '2022_01_21_054041_create_foreign_keys_khong_thich', 1),
(20, '2022_02_10_130610_create_yeuthiches_table', 1),
(21, '2022_02_10_130836_createforeignkeysyeuthich', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taikhoans`
--

CREATE TABLE `taikhoans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `HOTEN` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DIACHI` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SDT` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PHAI` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HINHANH` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MATKHAU` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PHANQUYEN` int(11) NOT NULL,
  `TRANGTHAI` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taikhoans`
--

INSERT INTO `taikhoans` (`id`, `HOTEN`, `DIACHI`, `SDT`, `PHAI`, `HINHANH`, `EMAIL`, `MATKHAU`, `PHANQUYEN`, `TRANGTHAI`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'khang', 'nha be', '0924944509', 'Nam', 'image_picker1521604217491865625.jpg', 'khang@gmail.com', '123', 2, 1, NULL, NULL, NULL),
(2, 'an', 'long an', '0123456798', 'Nam', 'noimage.jpg', 'an@gmail.com', '123', 2, 1, NULL, NULL, NULL),
(3, 'khang', 'nha be', '0565423542', 'Nam', 'noimage.jpg', 'khang1@gmail.com', '123', 2, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tinhthanhs`
--

CREATE TABLE `tinhthanhs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `TENTINHTHANH` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_MIEN` bigint(20) UNSIGNED NOT NULL,
  `TRANGTHAI` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tinhthanhs`
--

INSERT INTO `tinhthanhs` (`id`, `TENTINHTHANH`, `ID_MIEN`, `TRANGTHAI`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'B?? R???a-V??ng T??u', 1, 1, NULL, NULL, NULL),
(2, '??i???n Bi??n', 2, 1, NULL, NULL, NULL),
(3, 'H??a B??nh', 2, 1, NULL, NULL, NULL),
(4, 'Lai Ch??u', 2, 1, NULL, NULL, NULL),
(5, 'L??o Cai', 2, 1, NULL, NULL, NULL),
(6, 'S??n La', 2, 1, NULL, NULL, NULL),
(7, 'Y??n B??i', 2, 1, NULL, NULL, NULL),
(8, 'B???c Giang', 2, 1, NULL, NULL, NULL),
(9, 'B???c K???n', 2, 1, NULL, NULL, NULL),
(10, 'Cao B???ng', 2, 1, NULL, NULL, NULL),
(11, 'H?? Giang', 2, 1, NULL, NULL, NULL),
(12, 'L???ng S??n', 2, 1, NULL, NULL, NULL),
(13, 'Ph?? Th???', 2, 1, NULL, NULL, NULL),
(14, 'Qu???ng Ninh', 2, 1, NULL, NULL, NULL),
(15, 'Th??i Nguy??n', 2, 1, NULL, NULL, NULL),
(16, 'Tuy??n Quang', 2, 1, NULL, NULL, NULL),
(17, 'B???c Ninh', 2, 1, NULL, NULL, NULL),
(18, 'H?? Nam', 2, 1, NULL, NULL, NULL),
(19, 'Th??nh ph??? H?? N???i', 2, 1, NULL, NULL, NULL),
(20, 'H???i D????ng\r\n', 2, 1, NULL, NULL, NULL),
(21, 'Th??nh ph??? H???i Ph??ng\r\n', 2, 1, NULL, NULL, NULL),
(22, 'H??ng Y??n', 2, 1, NULL, NULL, NULL),
(23, 'Nam ?????nh', 2, 1, NULL, NULL, NULL),
(24, 'Ninh B??nh', 2, 1, NULL, NULL, NULL),
(25, 'Th??i B??nh', 2, 1, NULL, NULL, NULL),
(26, 'V??nh Ph??c', 2, 1, NULL, NULL, NULL),
(27, 'B??nh ?????nh', 3, 1, NULL, NULL, NULL),
(28, 'B??nh Thu???n', 3, 1, NULL, NULL, NULL),
(29, 'Th??nh ph??? ???? N???ng', 3, 1, NULL, NULL, NULL),
(30, 'Kh??nh H??a', 3, 1, NULL, NULL, NULL),
(31, 'Ninh Thu???n', 3, 1, NULL, NULL, NULL),
(32, 'Ph?? Y??n', 3, 1, NULL, NULL, NULL),
(33, 'Qu???ng Nam', 3, 1, NULL, NULL, NULL),
(34, 'Qu???ng Ng??i', 3, 1, NULL, NULL, NULL),
(35, 'H?? T??nh', 3, 1, NULL, NULL, NULL),
(36, 'Ngh??? An', 3, 1, NULL, NULL, NULL),
(37, 'Qu???ng B??nh', 3, 1, NULL, NULL, NULL),
(38, 'Qu???ng Tr???', 3, 1, NULL, NULL, NULL),
(39, 'Thanh H??a', 3, 1, NULL, NULL, NULL),
(40, 'Th???a Thi??n Hu???', 3, 1, NULL, NULL, NULL),
(41, '?????k L???k', 3, 1, NULL, NULL, NULL),
(42, '?????k N??ng', 3, 1, NULL, NULL, NULL),
(43, 'Gia Lai', 3, 1, NULL, NULL, NULL),
(44, 'Kon Tum', 3, 1, NULL, NULL, NULL),
(45, 'L??m ?????ng', 3, 1, NULL, NULL, NULL),
(46, 'B??nh D????ng', 1, 1, NULL, NULL, NULL),
(47, 'B??nh Ph?????c', 1, 1, NULL, NULL, NULL),
(48, '?????ng Nai', 1, 1, NULL, NULL, NULL),
(49, 'Th??nh ph??? H??? Ch?? Minh', 1, 1, NULL, NULL, NULL),
(50, 'T??y Ninh', 1, 1, NULL, NULL, NULL),
(51, 'An Giang', 1, 1, NULL, NULL, NULL),
(52, 'B???c Li??u', 1, 1, NULL, NULL, NULL),
(53, 'B???n Tre', 1, 1, NULL, NULL, NULL),
(54, 'C?? Mau', 1, 1, NULL, NULL, NULL),
(55, 'C???n Th??', 1, 1, NULL, NULL, NULL),
(56, '?????ng Th??p', 1, 1, NULL, NULL, NULL),
(57, 'H???u Giang\r\n', 1, 1, NULL, NULL, NULL),
(58, 'Ki??n Giang', 1, 1, NULL, NULL, NULL),
(59, 'Long An', 1, 1, NULL, NULL, NULL),
(60, 'S??c Tr??ng', 1, 1, NULL, NULL, NULL),
(61, 'Ti???n Giang', 1, 1, NULL, NULL, NULL),
(62, 'Tr?? Vinh', 1, 1, NULL, NULL, NULL),
(63, 'V??nh Long', 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yeuthiches`
--

CREATE TABLE `yeuthiches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ID_NGUOIYEUTHICH` bigint(20) UNSIGNED NOT NULL,
  `ID_DIADANHYEUTHICH` bigint(20) UNSIGNED NOT NULL,
  `TRANGTHAI` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yeuthiches`
--

INSERT INTO `yeuthiches` (`id`, `ID_NGUOIYEUTHICH`, `ID_DIADANHYEUTHICH`, `TRANGTHAI`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 1, NULL, NULL, NULL),
(2, 1, 1, 0, NULL, NULL, NULL),
(3, 2, 2, 1, NULL, NULL, NULL),
(4, 2, 1, 1, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baiviets`
--
ALTER TABLE `baiviets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `baiviets_id_nguoidang_foreign` (`ID_NGUOIDANG`),
  ADD KEY `baiviets_id_diadanh_foreign` (`ID_DIADANH`);

--
-- Indexes for table `binhluans`
--
ALTER TABLE `binhluans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binhluans_id_nguoidang_foreign` (`ID_NGUOIDANG`),
  ADD KEY `binhluans_id_baiviet_foreign` (`ID_BAIVIET`);

--
-- Indexes for table `danhmucs`
--
ALTER TABLE `danhmucs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diadanhs`
--
ALTER TABLE `diadanhs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diadanhs_id_danhmuc_foreign` (`ID_DANHMUC`),
  ADD KEY `diadanhs_id_tinhthanh_foreign` (`ID_TINHTHANH`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `luotkhongthiches`
--
ALTER TABLE `luotkhongthiches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `luotkhongthiches_id_nguoikhongthich_foreign` (`ID_NGUOIKHONGTHICH`),
  ADD KEY `luotkhongthiches_id_baiviet_foreign` (`ID_BAIVIET`);

--
-- Indexes for table `luotthiches`
--
ALTER TABLE `luotthiches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `luotthiches_id_nguoithich_foreign` (`ID_NGUOITHICH`),
  ADD KEY `luotthiches_id_baiviet_foreign` (`ID_BAIVIET`);

--
-- Indexes for table `miens`
--
ALTER TABLE `miens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `taikhoans`
--
ALTER TABLE `taikhoans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tinhthanhs`
--
ALTER TABLE `tinhthanhs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tinhthanhs_id_mien_foreign` (`ID_MIEN`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `yeuthiches`
--
ALTER TABLE `yeuthiches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `yeuthiches_id_nguoiyeuthich_foreign` (`ID_NGUOIYEUTHICH`),
  ADD KEY `yeuthiches_id_diadanhyeuthich_foreign` (`ID_DIADANHYEUTHICH`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `baiviets`
--
ALTER TABLE `baiviets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `binhluans`
--
ALTER TABLE `binhluans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `danhmucs`
--
ALTER TABLE `danhmucs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `diadanhs`
--
ALTER TABLE `diadanhs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `luotkhongthiches`
--
ALTER TABLE `luotkhongthiches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `luotthiches`
--
ALTER TABLE `luotthiches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `miens`
--
ALTER TABLE `miens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taikhoans`
--
ALTER TABLE `taikhoans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tinhthanhs`
--
ALTER TABLE `tinhthanhs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `yeuthiches`
--
ALTER TABLE `yeuthiches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `baiviets`
--
ALTER TABLE `baiviets`
  ADD CONSTRAINT `baiviets_id_diadanh_foreign` FOREIGN KEY (`ID_DIADANH`) REFERENCES `diadanhs` (`id`),
  ADD CONSTRAINT `baiviets_id_nguoidang_foreign` FOREIGN KEY (`ID_NGUOIDANG`) REFERENCES `taikhoans` (`id`);

--
-- Constraints for table `binhluans`
--
ALTER TABLE `binhluans`
  ADD CONSTRAINT `binhluans_id_baiviet_foreign` FOREIGN KEY (`ID_BAIVIET`) REFERENCES `baiviets` (`id`),
  ADD CONSTRAINT `binhluans_id_nguoidang_foreign` FOREIGN KEY (`ID_NGUOIDANG`) REFERENCES `taikhoans` (`id`);

--
-- Constraints for table `diadanhs`
--
ALTER TABLE `diadanhs`
  ADD CONSTRAINT `diadanhs_id_danhmuc_foreign` FOREIGN KEY (`ID_DANHMUC`) REFERENCES `danhmucs` (`id`),
  ADD CONSTRAINT `diadanhs_id_tinhthanh_foreign` FOREIGN KEY (`ID_TINHTHANH`) REFERENCES `tinhthanhs` (`id`);

--
-- Constraints for table `luotkhongthiches`
--
ALTER TABLE `luotkhongthiches`
  ADD CONSTRAINT `luotkhongthiches_id_baiviet_foreign` FOREIGN KEY (`ID_BAIVIET`) REFERENCES `baiviets` (`id`),
  ADD CONSTRAINT `luotkhongthiches_id_nguoikhongthich_foreign` FOREIGN KEY (`ID_NGUOIKHONGTHICH`) REFERENCES `taikhoans` (`id`);

--
-- Constraints for table `luotthiches`
--
ALTER TABLE `luotthiches`
  ADD CONSTRAINT `luotthiches_id_baiviet_foreign` FOREIGN KEY (`ID_BAIVIET`) REFERENCES `baiviets` (`id`),
  ADD CONSTRAINT `luotthiches_id_nguoithich_foreign` FOREIGN KEY (`ID_NGUOITHICH`) REFERENCES `taikhoans` (`id`);

--
-- Constraints for table `tinhthanhs`
--
ALTER TABLE `tinhthanhs`
  ADD CONSTRAINT `tinhthanhs_id_mien_foreign` FOREIGN KEY (`ID_MIEN`) REFERENCES `miens` (`id`);

--
-- Constraints for table `yeuthiches`
--
ALTER TABLE `yeuthiches`
  ADD CONSTRAINT `yeuthiches_id_diadanhyeuthich_foreign` FOREIGN KEY (`ID_DIADANHYEUTHICH`) REFERENCES `diadanhs` (`id`),
  ADD CONSTRAINT `yeuthiches_id_nguoiyeuthich_foreign` FOREIGN KEY (`ID_NGUOIYEUTHICH`) REFERENCES `taikhoans` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
