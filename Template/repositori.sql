-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2022 at 05:21 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `repositori`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDocumentStatus` (IN `status` INT(1))  SELECT * FROM documents_view WHERE documents_view.sifat_dokumen = status$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getInmailStatus` (IN `statusInmail` INT(1))  SELECT * FROM inmails_view WHERE inmails_view.status = statusInmail$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getOutmailStatus` (IN `statusOutmail` INT(1))  SELECT * FROM outmails_view WHERE outmails_view.status = statusOutmail$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserPeran` (IN `peran` INT(1))  SELECT * FROM users WHERE users.role = peran$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `getDocumentGroupName` (`type_id` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 BEGIN
DECLARE jenis VARCHAR(255);
SELECT document_groups.nama_kelompok_dokumen INTO jenis FROM document_groups WHERE document_groups.id = type_id;
RETURN jenis;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getDocumentTypeName` (`type_id` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 BEGIN
DECLARE jenis VARCHAR(255);
SELECT nama_jenis_dokumen INTO jenis FROM document_types WHERE document_types.id = type_id;
RETURN jenis;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getMailTypeName` (`type_id` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 BEGIN
DECLARE jenis VARCHAR(255);
SELECT nama_jenis_surat INTO jenis FROM mail_types WHERE mail_types.id = type_id;
RETURN jenis;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getSectionName` (`sec_id` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 BEGIN
DECLARE nama VARCHAR(255);
SELECT nama_bagian INTO nama FROM sections WHERE sections.id = sec_id;
RETURN nama;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `disposition_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `disposition_no`, `section_id`, `created_at`, `updated_at`) VALUES
(1, 'd1/panpel-cc/2/2022', 3, '2022-05-10 19:46:15', '2022-05-10 19:46:15'),
(2, 'd1/panpel-cc/2/2022', 11, '2022-05-10 18:15:30', '2022-05-10 18:15:30'),
(3, 'd2/panpel-kt/2/2022', 3, '2022-05-10 18:24:32', '2022-05-10 18:24:32'),
(4, 'd2/panpel-kt/2/2022', 11, '2022-05-10 18:25:05', '2022-05-10 18:25:05'),
(5, 'd3/panpel-kt/3/2022', 3, '2022-05-10 20:38:17', '2022-05-10 20:38:17'),
(6, 'd3/panpel-kt/3/2022', 11, '2022-05-10 20:38:45', '2022-05-10 20:38:45'),
(7, 'd4/panpel-po/4/2022', 3, '2022-05-10 20:46:16', '2022-05-10 20:46:16'),
(8, 'd4/panpel-po/4/2022', 11, '2022-05-10 20:46:40', '2022-05-10 20:46:40'),
(9, 'd4/panpel-po/4/2022', 4, '2022-05-10 20:46:56', '2022-05-10 20:46:56'),
(12, 'd7/panpel-lp/6/2022', 3, '2022-05-11 17:14:11', '2022-05-11 17:14:11'),
(13, 'd7/panpel-lp/6/2022', 11, '2022-05-11 17:14:52', '2022-05-11 17:14:52'),
(18, 'd02/02/SMA-IF/2021', 3, '2022-05-11 18:01:11', '2022-05-11 18:01:11'),
(19, 'd02/02/SMA-IF/2021', 2, '2022-05-11 18:01:35', '2022-05-11 18:01:35'),
(20, 'd02/02/SMA-IF/2021', 5, '2022-05-11 18:01:56', '2022-05-11 18:01:56'),
(21, 'd02/02/SMA-IF/2021', 6, '2022-05-11 18:02:16', '2022-05-11 18:02:16'),
(22, 'd03/03/SMA-IA/2021', 3, '2022-05-11 18:09:58', '2022-05-11 18:09:58'),
(23, 'd03/03/SMA-IA/2021', 2, '2022-05-11 18:10:16', '2022-05-11 18:10:16'),
(24, 'd03/03/SMA-IA/2021', 5, '2022-05-11 18:10:31', '2022-05-11 18:10:31'),
(25, 'd03/03/SMA-IA/2021', 6, '2022-05-11 18:10:45', '2022-05-11 18:10:45'),
(26, 'd04/04/SMA-TH/2021', 3, '2022-05-11 18:17:20', '2022-05-11 18:17:20'),
(27, 'd04/04/SMA-TH/2021', 2, '2022-05-11 18:17:47', '2022-05-11 18:17:47'),
(28, 'd04/04/SMA-TH/2021', 5, '2022-05-11 18:18:03', '2022-05-11 18:18:03'),
(29, 'd04/04/SMA-TH/2021', 6, '2022-05-12 18:18:21', '2022-05-11 18:18:21'),
(30, 'd05/05/SMA-TH/2021', 3, '2022-05-11 18:25:19', '2022-05-11 18:25:19'),
(31, 'd05/05/SMA-TH/2021', 2, '2022-05-11 18:25:42', '2022-05-11 18:25:42'),
(32, 'd05/05/SMA-TH/2021', 5, '2022-05-11 18:26:00', '2022-05-11 18:26:00'),
(33, 'd05/05/SMA-TH/2021', 6, '2022-05-11 18:26:18', '2022-05-11 18:26:18'),
(34, 'd01/bnn-s/1/2022', 3, '2022-05-11 23:53:44', '2022-05-11 23:53:44'),
(35, 'd02/mo-s/1/2022', 3, '2022-05-12 00:10:50', '2022-05-12 00:10:50'),
(36, 'd03/qy-s/1/2022', 3, '2022-05-12 00:24:53', '2022-05-12 00:24:53'),
(37, 'd04/rb-s/4/2022', 3, '2022-05-12 00:56:22', '2022-05-12 00:56:22'),
(38, 'd05/ce-s/5/2022', 3, '2022-05-12 01:25:56', '2022-05-12 01:25:56'),
(39, 'd06/us-s/6/2022', 2, '2022-05-12 01:41:47', '2022-05-12 01:41:47'),
(40, 'd01/DPK-P/1/2021', 11, '2022-05-12 10:43:15', '2022-05-12 10:43:15'),
(41, 'd02/DPK-P/2/2020', 11, '2022-05-12 10:48:51', '2022-05-12 10:48:51'),
(42, 'd03/DPK-P/3/2019', 11, '2022-05-12 10:53:00', '2022-05-12 10:53:00'),
(43, 'd04/DPK-P/4/2018', 11, '2022-05-12 11:00:56', '2022-05-12 11:00:56'),
(44, 'd05/DPK-P/5/2017', 11, '2022-05-12 11:10:02', '2022-05-12 11:10:02'),
(45, 'd06/DPK-P/6/2016', 11, '2022-05-12 11:46:50', '2022-05-12 11:46:50'),
(46, 'd07/DPK-PH/7/2021', 11, '2022-05-12 11:57:19', '2022-05-12 11:57:19'),
(47, 'd08/DPK-PH/8/2020', 11, '2022-05-12 12:02:44', '2022-05-12 12:02:44'),
(48, 'd09/DPK-PH/9/2019', 11, '2022-05-12 12:10:05', '2022-05-12 12:10:05'),
(49, 'd10/DPK-PH/10/2018', 11, '2022-05-12 12:14:32', '2022-05-12 12:14:32'),
(50, 'd11/DPK-PH/11/2017', 11, '2022-05-12 12:19:02', '2022-05-12 12:19:02'),
(51, 'd12/DPK-PH/12/2016', 11, '2022-05-12 12:23:50', '2022-05-12 12:23:50'),
(67, 'd01/01/SMA-IM/2021', 2, '2022-05-13 07:49:58', '2022-05-13 07:49:58'),
(68, 'd01/01/SMA-IM/2021', 3, '2022-05-13 07:49:58', '2022-05-13 07:49:58'),
(69, 'd01/01/SMA-IM/2021', 5, '2022-05-13 07:49:58', '2022-05-13 07:49:58'),
(70, 'd01/01/SMA-IM/2021', 6, '2022-05-13 07:49:58', '2022-05-13 07:49:58');

--
-- Triggers `destinations`
--
DELIMITER $$
CREATE TRIGGER `cekHapusDitujukan` BEFORE DELETE ON `destinations` FOR EACH ROW BEGIN
DECLARE dituju integer(20);
SELECT COUNT(*) INTO dituju FROM destinations WHERE destinations.disposition_no = old.disposition_no GROUP BY disposition_no;
IF dituju < 1 THEN
DELETE FROM dispositions WHERE dispositions.no = old.disposition_no;
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cekUpdateDitujukan` BEFORE UPDATE ON `destinations` FOR EACH ROW BEGIN
IF new.disposition_no <> old.disposition_no THEN BEGIN
DECLARE dituju integer(20);
SELECT COUNT(*) INTO dituju FROM destinations WHERE destinations.disposition_no = old.disposition_no GROUP BY disposition_no;
IF dituju < 1 THEN
DELETE FROM dispositions WHERE dispositions.no = old.disposition_no;
END IF;
END;
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deleteDitujukan` AFTER DELETE ON `destinations` FOR EACH ROW INSERT INTO `log_destinations`( `jenis_transaksi`, `no_disposisi`, `new_ditujukan`, `old_ditujukan`, `created_at`, `updated_at`) VALUES ( 3, old.disposition_no, NULL, old.section_id, NOW(), NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertDitujukan` AFTER INSERT ON `destinations` FOR EACH ROW INSERT INTO `log_destinations`( `jenis_transaksi`, `no_disposisi`, `new_ditujukan`, `old_ditujukan`, `created_at`, `updated_at`) VALUES ( 1, new.disposition_no, new.section_id, NULL, NOW(), NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateDitujukan` AFTER UPDATE ON `destinations` FOR EACH ROW INSERT INTO `log_destinations`(`jenis_transaksi`, `no_disposisi`, `new_ditujukan`, `old_ditujukan`, `created_at`, `updated_at`) VALUES ( 2, new.disposition_no, new.section_id, old.section_id, NOW(), NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `destinations_view`
-- (See below for the actual view)
--
CREATE TABLE `destinations_view` (
`disposition_no` varchar(50)
,`bagian` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `dispositions`
--

CREATE TABLE `dispositions` (
  `no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inmail_no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_disposisi` date NOT NULL,
  `isi_disposisi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('unread','read') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dispositions`
--

INSERT INTO `dispositions` (`no`, `inmail_no`, `tanggal_disposisi`, `isi_disposisi`, `status`, `created_at`, `updated_at`) VALUES
('d01/01/SMA-IM/2021', '01/01/SMA-IM/2021', '2021-01-08', 'Dimohon kepada Bapak dan Ibu untuk menghadiri Acara Memperingati Isra\' Mi\'raj di SMA Negeri 2 Lhokseumawe', 'read', '2022-05-11 17:45:11', '2022-05-13 07:49:58'),
('d01/bnn-s/1/2022', '01/bnn-s/1/2022', '2022-01-04', 'Berhubungan adanya seminar yang diadakan oleh BNN, diharapkan Ibu/Bapak untuk memberikan izin siswa untuk mengikuti seminar tersebut', 'unread', '2022-05-11 23:51:51', '2022-05-11 23:51:51'),
('d01/DPK-P/1/2021', '01/DPK-P/1/2021', '2022-08-16', 'Dalam rangka memeriahkan Pawai untuk memperingati HUT RI ke-74, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 3 siswa/i', 'unread', '2022-05-12 10:41:03', '2022-05-12 10:41:03'),
('d02/02/SMA-IF/2021', '02/02/SMA-IF/2021', '2021-05-24', 'Dimohon kepada Ibu/Bapak untuk menghadiri Acara Halal Bihalal Idul Fitri 1442 H di SMA Negeri 2 Lhokseumawe', 'unread', '2022-05-11 17:59:27', '2022-05-11 17:59:27'),
('d02/DPK-P/2/2020', '02/DPK-P/2/2020', '2020-08-16', 'Dalam rangka memeriahkan Pawai untuk memperingati HUT RI ke-75, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 3 siswa/i', 'unread', '2022-05-12 10:47:44', '2022-05-12 10:47:44'),
('d02/mo-s/1/2022', '02/mo-s/1/2022', '2022-01-11', 'Berhubungan dengan adanya seminar yang akan dilakukan, diharapkan Bapak/Ibu memberikan izin kepada siswa untuk mengikuti seminar tersebut', 'unread', '2022-05-12 00:06:16', '2022-05-12 00:06:16'),
('d03/03/SMA-IA/2021', '03/03/SMA-IA/2021', '2021-07-19', 'Dimohon kepada Bapak/Ibu untuk menghadiri Acara Peringatan Idul Adha di SMA Negeri 2 Lhokseumawe', 'unread', '2022-05-11 18:08:12', '2022-05-11 18:08:12'),
('d03/DPK-P/3/2019', '03/DPK-P/3/2019', '2020-08-16', 'Dalam rangka memeriahkan Pawai untuk memperingati HUT RI ke-74, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 3 siswa/i', 'unread', '2022-05-12 10:51:56', '2022-05-12 10:51:56'),
('d03/qy-s/1/2022', '03/qy-s/1/2022', '2022-01-18', 'Berhubungan dengan adanya seminar yang akan dilakukan, diharapkan Bapak/Ibu memberikan izin kepada siswa untuk mengikuti seminar tersebut', 'unread', '2022-05-12 00:23:59', '2022-05-12 00:23:59'),
('d04/04/SMA-TH/2021', '04/04/SMA-TH/2021', '2021-09-08', 'Dimohon kepada Bapak/Ibu untuk menghadiri Acara Peringatan Tahun Baru Hijriah 1443 H di SMA Negeri 2 Lhokseumawe', 'read', '2022-05-11 18:15:20', '2022-05-13 05:10:40'),
('d04/DPK-P/4/2018', '04/DPK-P/4/2018', '2018-08-16', 'Dalam rangka memeriahkan Pawai untuk memperingati HUT RI ke-74, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 3 siswa/i', 'unread', '2022-05-12 10:59:02', '2022-05-12 10:59:02'),
('d04/rb-s/4/2022', '04/rb-s/4/2022	', '2022-01-25', 'Berhubungan dengan adanya seminar yang akan dilakukan, diharapkan Bapak/Ibu memberikan izin kepada siswa untuk mengikuti seminar tersebut', 'unread', '2022-05-12 00:55:14', '2022-05-12 00:55:14'),
('d05/05/SMA-TH/2021', '05/05/SMA-TH/2021', '2021-10-20', 'Dimohon kepada Bapak/Ibu untuk menghadiri Acara Peringatan Maulid Nabi Muhammad SAW di SMA Negeri 2 Lhokseumawe', 'unread', '2022-05-11 18:23:41', '2022-05-11 18:23:41'),
('d05/ce-s/5/2022', '05/ce-s/5/2022', '2022-02-04', 'Berhubungan dengan adanya seminar yang akan dilakukan, diharapkan Bapak/Ibu memberikan izin kepada siswa untuk mengikuti seminar tersebut', 'unread', '2022-05-12 01:24:27', '2022-05-12 01:24:27'),
('d05/DPK-P/5/2017', '05/DPK-P/5/2017', '2017-08-16', 'Dalam rangka memeriahkan Pawai untuk memperingati HUT RI ke-72, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 3 siswa/i', 'unread', '2022-05-12 11:08:24', '2022-05-12 11:08:24'),
('d06/DPK-P/6/2016', '06/DPK-P/6/2016', '2016-08-16', 'Dalam rangka memeriahkan Pawai untuk memperingati HUT RI ke-71, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 3 siswa/i', 'unread', '2022-05-12 11:45:34', '2022-05-12 11:45:34'),
('d06/us-s/6/2022', '06/us-s/6/2022', '2022-02-11', 'Berhubungan dengan adanya seminar yang akan dilakukan, diharapkan Bapak/Ibu memberikan izin kepada siswa untuk mengikuti seminar tersebut', 'unread', '2022-05-12 01:40:25', '2022-05-12 01:40:25'),
('d07/DPK-PH/7/2021', '07/DPK-PH/7/2021', '2021-08-08', 'Dalam rangka memeriahkan Pawai Obor dalam Rangka Tahun Baru 1443 H, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 2 siswa/i', 'unread', '2022-05-12 11:55:47', '2022-05-12 11:55:47'),
('d08/DPK-PH/8/2020', '08/DPK-PH/8/2020', '2020-08-20', 'Dalam rangka memeriahkan Pawai Obor dalam Rangka Tahun Baru 1442 H, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 2 siswa/i', 'unread', '2022-05-12 12:01:21', '2022-05-12 12:01:21'),
('d09/DPK-PH/9/2019', '09/DPK-PH/9/2019', '2019-08-26', 'Dalam rangka memeriahkan Pawai Obor dalam Rangka Tahun Baru 1441 H, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 2 siswa/i', 'unread', '2022-05-12 12:06:44', '2022-05-12 12:06:44'),
('d1/panpel-cc/2/2022', '1/panpel-cc/2/2022', '2022-01-02', 'Segera lakukan seleksi untuk mengikuti kegiatan cerdas cermat di SMA Negeri 2 Lhkseumawe', 'read', '2022-05-10 13:27:49', '2022-05-13 08:18:47'),
('d10/DPK-PH/10/2018', '10/DPK-PH/10/2018', '2018-09-03', 'Dalam rangka memeriahkan Pawai Obor dalam Rangka Tahun Baru 1440 H, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 2 siswa/i', 'unread', '2022-05-12 12:13:35', '2022-05-12 12:13:35'),
('d11/DPK-PH/11/2017', '11/DPK-PH/11/2017', '2017-09-16', 'Dalam rangka memeriahkan Pawai Obor dalam Rangka Tahun Baru 1439 H, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 2 siswa/i', 'unread', '2022-05-12 12:18:02', '2022-05-12 12:18:02'),
('d12/DPK-PH/12/2016', '12/DPK-PH/12/2016', '2016-09-28', 'Dalam rangka memeriahkan Pawai Obor dalam Rangka Tahun Baru 1438 H, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 2 siswa/i', 'unread', '2022-05-12 12:22:52', '2022-05-12 12:22:52'),
('d2/panpel-kt/2/2022', '2/panpel-kt/2/2022', '2022-01-09', 'Segera persiapkan perwakilan siswa untuk mengikuti kegiatan tersebut', 'unread', '2022-05-10 18:23:19', '2022-05-10 18:23:19'),
('d3/panpel-kt/3/2022', '3/panpel-kt/3/2022', '2022-01-16', 'Segera persiapkan perwakilan siswa untuk mengikuti kegiatan tersebut', 'unread', '2022-05-10 20:37:30', '2022-05-10 20:37:30'),
('d4/panpel-po/4/2022', '4/panpel-po/4/2022', '2022-08-18', 'Segera persiapkan perwakilan siswa untuk mengikuti kegiatan tersebut', 'unread', '2022-05-10 20:45:04', '2022-05-10 20:45:04'),
('d7/panpel-lp/6/2022', '7/panpel-lp/6/2022', '2022-02-15', 'Segera persiapkan perwakilan siswa untuk mengikuti kegiatan tersebut', 'unread', '2022-05-11 17:12:29', '2022-05-11 17:12:29');

--
-- Triggers `dispositions`
--
DELIMITER $$
CREATE TRIGGER `cekHapusDisposisi` BEFORE DELETE ON `dispositions` FOR EACH ROW UPDATE inmails SET inmails.disposisi = 2 WHERE inmails.no = old.inmail_no
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cekInsertDisposisi` BEFORE INSERT ON `dispositions` FOR EACH ROW BEGIN
IF EXISTS (SELECT no FROM dispositions WHERE inmail_no = new.inmail_no) THEN
SIGNAL SQLSTATE 'U0042'
SET MESSAGE_TEXT = 'Disposisi untuk surat tersebut sudah ada';
END IF;
UPDATE inmails SET inmails.disposisi = 1 WHERE inmails.no = new.inmail_no; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cekUpdateDisposisi` BEFORE UPDATE ON `dispositions` FOR EACH ROW BEGIN
IF new.inmail_no <> old.inmail_no THEN
IF EXISTS (SELECT no FROM dispositions WHERE inmail_no = new.inmail_no) THEN
SIGNAL SQLSTATE 'U0042'
SET MESSAGE_TEXT = 'Disposisi untuk surat tersebut sudah ada';
END IF;
UPDATE inmails SET inmails.disposisi = 2 WHERE inmails.no = old.inmail_no;
UPDATE inmails SET inmails.disposisi = 1 WHERE inmails.no = new.inmail_no;
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deleteDisposisi` AFTER DELETE ON `dispositions` FOR EACH ROW INSERT INTO `log_dispositions`( `jenis_transaksi`, `no_disposisi`, `no_surat`, `new_tanggal_disposisi`, `old_tanggal_disposisi`, `new_isi_disposisi`, `old_isi_disposisi`, `new_status`, `old_status`, `created_at`, `updated_at`) VALUES ( 3, old.no, old.inmail_no, NULL, old.tanggal_disposisi, NULL, old.isi_disposisi, NULL, old.status, NOW(), NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertDisposisi` AFTER INSERT ON `dispositions` FOR EACH ROW INSERT INTO `log_dispositions`( `jenis_transaksi`, `no_disposisi`, `no_surat`, `new_tanggal_disposisi`, `old_tanggal_disposisi`, `new_isi_disposisi`, `old_isi_disposisi`, `new_status`, `old_status`, `created_at`, `updated_at`) VALUES (1, new.no, new.inmail_no, new.tanggal_disposisi, NULL, new.isi_disposisi, NULL, new.status, NULL, NOW(), NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateDisposisi` AFTER UPDATE ON `dispositions` FOR EACH ROW INSERT INTO `log_dispositions`( `jenis_transaksi`, `no_disposisi`, `no_surat`, `new_tanggal_disposisi`, `old_tanggal_disposisi`, `new_isi_disposisi`, `old_isi_disposisi`, `new_status`, `old_status`, `created_at`, `updated_at`) VALUES (2, new.no, new.inmail_no, new.tanggal_disposisi, old.tanggal_disposisi, new.isi_disposisi, old.isi_disposisi, new.status, old.status, NOW(), NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_type_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `sifat_dokumen` enum('umum','rahasia') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_terbit` date NOT NULL,
  `perihal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`no`, `nama_dokumen`, `document_type_id`, `section_id`, `sifat_dokumen`, `tanggal_terbit`, `perihal`, `file_dokumen`, `created_at`, `updated_at`) VALUES
('DAT1', 'Nama Siswa Baru TP 2021-2022', 10, 1, 'umum', '2021-06-23', 'Nama Siswa Baru TP 2021-2022', 'Data_Siswa Baru_2021-2022.pdf', '2022-05-12 17:51:45', '2022-05-13 08:12:46'),
('DAT2', 'Nama Siswa Baru TP 2020-2021', 10, 1, 'umum', '2020-06-17', 'Nama Siswa Baru TP 2020-2021', 'Data_Siswa Baru_2020-2021.pdf', '2022-05-12 17:53:19', '2022-05-12 17:53:19'),
('DAT3', 'Nama Siswa Baru TP 2019-2020', 10, 1, 'umum', '2019-06-15', 'Nama Siswa Baru TP 2019-2020', 'Data_Siswa Baru_2019-2020.pdf', '2022-05-12 17:59:43', '2022-05-12 17:59:43'),
('DAT4', 'Nama Siswa Baru TP 2018-2019', 10, 1, 'umum', '2018-06-21', 'Nama Siswa Baru TP 2021-2022', 'Data_Siswa Baru_2018-2019.pdf', '2022-05-12 18:03:01', '2022-05-12 18:03:01'),
('DAT5', 'Nama Siswa IPS Baru TP 2021-2022', 11, 1, 'umum', '2021-06-23', 'Nama Siswa IPS Baru TP 2021-2022', 'Data_Siswa Baru_IPS_2021-2022.pdf', '2022-05-12 18:09:27', '2022-05-12 18:09:27'),
('DAT6', 'Nama Siswa IPS Baru TP 2020-2021', 11, 1, 'umum', '2020-06-16', 'Nama Siswa IPS Baru TP 2021-2022', 'Data_Siswa Baru_IPS_2020-2021.pdf', '2022-05-12 18:13:03', '2022-05-12 18:13:03'),
('DAT7', 'Nama Siswa IPS Baru TP 2019-2020', 11, 1, 'umum', '2019-06-14', 'Nama Siswa IPS Baru TP 2021-2022', 'Data_Siswa Baru_IPS_2019-2020.pdf', '2022-05-12 18:15:26', '2022-05-12 18:15:26'),
('DAT8', 'Nama Siswa IPS Baru TP 2018-2019', 11, 1, 'umum', '2018-06-21', 'Nama Siswa IPS Baru TP 2018-2019', 'Data_Siswa Baru_IPS_2018-2019.pdf', '2022-05-12 18:19:07', '2022-05-12 18:19:07'),
('KD1', 'KD Matematika Kelas X', 13, 3, 'umum', '2021-06-28', 'KD Matematika Kelas X', 'Matematika X.pdf', '2022-05-12 18:51:54', '2022-05-12 18:51:54'),
('KD2', 'KD Matematika Kelas XI', 13, 3, 'umum', '2021-06-27', 'KD Matematika Kelas XI', 'Matematika XI.pdf', '2022-05-12 18:53:23', '2022-05-12 18:53:23'),
('KD3', 'KD Matematika Kelas XII', 13, 3, 'umum', '2021-06-23', 'KD Matematika Kelas XII', 'Matematika XII.pdf', '2022-05-12 18:54:37', '2022-05-12 18:54:37'),
('KD4', 'KD Fisika Kelas X', 13, 3, 'umum', '2021-06-24', 'KD Fisika Kelas X', 'Fisika X.pdf', '2022-05-12 18:57:26', '2022-05-12 18:57:26'),
('KD5', 'KD Fisika Kelas XI', 13, 3, 'umum', '2021-06-24', 'KD Fisika Kelas X', 'Fisika XI.pdf', '2022-05-12 18:58:26', '2022-05-12 18:58:26'),
('KD6', 'KD Fisika Kelas XII', 13, 3, 'umum', '2021-06-24', 'KD Fisika Kelas XII', 'Fisika XII.pdf', '2022-05-12 19:28:07', '2022-05-12 19:28:07'),
('NIL1', 'Buku Penilaian Kinerja Guru', 12, 3, 'rahasia', '2021-07-17', 'Buku Penilaian Kinerja Guru', 'Overview_PKG_v01.pdf', '2022-05-12 18:45:00', '2022-05-12 18:45:00'),
('PER1', 'Tata Tertib Siswa Tahun Ajaran 2021-2022', 1, 2, 'umum', '2021-06-21', 'Tata Tertib Siswa Tahun Ajaran 2021-2022', 'Tata Tertib_Siswa_2021-2022.pdf', '2022-05-12 18:38:32', '2022-05-12 18:38:32'),
('PRO1', 'PROSEDUR OPERASIONAL STANDAR BELAJAR TATAP MUKA TAHUN 2020\r\n', 7, 2, 'umum', '2020-02-24', 'Prosedur Melakukan PTM Selama Masa Pandemi Covid-19', 'Prosedur_PTM_2020.pdf', '2022-05-12 13:24:15', '2022-05-12 13:24:15'),
('PRO2', 'PROSEDUR OPERASIONAL STANDAR BELAJAR TATAP MUKA TAHUN 2021', 7, 2, 'umum', '2021-02-15', 'Prosedur PTM Selama Masa Pandemi Covid-19', 'Prosedur_PTM_2021.pdf', '2022-05-12 13:27:58', '2022-05-12 13:27:58'),
('PRO3', 'PROSEDUR OPERASIONAL STANDAR BELAJAR TATAP MUKA TAHUN 2022', 7, 2, 'umum', '2022-02-16', 'Prosedur PTM Selama Masa Pandemi Covid-19', 'Prosedur_PTM_2022.pdf', '2022-05-12 13:29:24', '2022-05-12 13:29:24'),
('PRO4', 'PROSEDUR OPERASIONAL STANDAR PEMANTAUAN DAN PELAPORAN PENGANTAR-PENJEMPUT SISWA TAHUN 2020\r\n', 8, 2, 'umum', '2020-06-14', 'Prosedur Penjemputan dan Pengantaran Siswa pada Masa Pandemi Covid-19', 'Prosedur_Antar-Jemput Siswa_2020.pdf', '2022-05-12 15:01:20', '2022-05-12 15:01:20'),
('PRO5', 'PROSEDUR OPERASIONAL STANDAR PEMANTAUAN DAN PELAPORAN PENGANTAR-PENJEMPUT SISWA TAHUN 2021', 8, 2, 'umum', '2021-06-17', 'Prosedur Penjemputan dan Pengantaran Siswa pada Masa Pandemi Covid-19', 'Prosedur_Antar-Jemput Siswa_2021.pdf', '2022-05-12 15:05:19', '2022-05-12 15:05:19'),
('PRO6', 'PROSEDUR OPERASIONAL STANDAR PEMANTAUAN DAN PELAPORAN PENGANTAR-PENJEMPUT SISWA TAHUN 2022', 8, 2, 'umum', '2022-06-23', 'Prosedur Penjemputan dan Pengantaran Siswa pada Masa Pandemi Covid-19', 'Prosedur_Antar-Jemput Siswa_2022.pdf', '2022-05-12 15:07:26', '2022-05-12 15:07:26'),
('PRO7', 'STANDAR OPERASIONAL PROSEDUR PEMANTAUAN DAN PELAPORAN KESEHATAN WARGA SEKOLAH SELAMA PANDEMI COVID-19 TAHUN 2020', 9, 7, 'umum', '2020-05-13', 'Prosedur Pemantaun dan Pelaporan Warga Sekolah pada Masa Pandemi Covid-19', 'Prosedur_Pemantauan dan Pelaporan Kesehatan_2020.pdf', '2022-05-12 15:22:32', '2022-05-12 15:22:32'),
('PRO8', 'STANDAR OPERASIONAL PROSEDUR PEMANTAUAN DAN PELAPORAN KESEHATAN WARGA SEKOLAH SELAMA PANDEMI COVID-19 TAHUN 2021', 9, 7, 'umum', '2021-07-03', 'Prosedur Pemantaun dan Pelaporan Warga Sekolah pada Masa Pandemi Covid-19', 'Prosedur_Pemantauan dan Pelaporan Kesehatan_2021.pdf', '2022-05-12 15:25:40', '2022-05-12 15:25:40'),
('PRO9', 'STANDAR OPERASIONAL PROSEDUR PEMANTAUAN DAN PELAPORAN KESEHATAN WARGA SEKOLAH SELAMA PANDEMI COVID-19 TAHUN 2022', 9, 7, 'umum', '2022-07-07', 'Prosedur Pemantaun dan Pelaporan Warga Sekolah pada Masa Pandemi Covid-19\r\n', 'Prosedur_Pemantauan dan Pelaporan Kesehatan_2022.pdf', '2022-05-12 15:30:42', '2022-05-12 15:30:42'),
('ROS1', 'Roster Mengajar Semester Ganjil Tahun Ajaran 2021/2022', 5, 3, 'umum', '2021-06-01', 'Roster Mengajar Semester Ganjil Tahun Ajaran 2021/2022', 'Roster Mengajar_Ganjil_2021-2022.pdf', '2022-04-22 19:01:16', '2022-05-01 07:53:02'),
('ROS2', 'Roster Mengajar Semester Ganjil Tahun Ajaran 2020/2021', 5, 3, 'umum', '2020-06-01', 'Roster Mengajar Semester Ganjil Tahun Ajaran 2020/2021', 'Roster Mengajar_Ganjil_2020-2021.pdf', '2022-05-12 12:59:02', '2022-05-12 12:59:02'),
('ROS3', 'Roster Mengajar Semester Ganjil Tahun Ajaran 2019/2020', 5, 3, 'umum', '2019-06-01', 'Roster Mengajar Semester Ganjil Tahun Ajaran 2019/2020', 'Roster Mengajar_Ganjil_2019-2020.pdf', '2022-05-12 13:01:29', '2022-05-12 13:01:29'),
('ROS4', 'Roster Mengajar Semester Genap Tahun Ajaran 2019/2020\r\n', 6, 3, 'umum', '2020-01-01', 'Roster Mengajar Semester Genap Tahun Ajaran 2019/2020', 'Roster Mengajar_Genap_2019-2020.pdf', '2022-05-12 13:04:34', '2022-05-12 13:04:34'),
('ROS5', 'Roster Mengajar Semester Genap Tahun Ajaran 2020/2021\r\n', 6, 3, 'umum', '2021-01-01', 'Roster Mengajar Semester Genap Tahun Ajaran 2021/2022\r\n', 'Roster Mengajar_Genap_2020-2021.pdf', '2022-05-12 13:10:18', '2022-05-12 13:10:18'),
('ROS6', 'Roster Mengajar Semester Genap Tahun Ajaran 2021/2022\r\n', 6, 3, 'umum', '2022-01-01', 'Roster Mengajar Semester Genap Tahun Ajaran 2021/2022\r\n', 'Roster Mengajar_Genap_2021-2022.pdf', '2022-05-12 13:11:57', '2022-05-12 13:11:57');

--
-- Triggers `documents`
--
DELIMITER $$
CREATE TRIGGER `deleteDokumen` AFTER DELETE ON `documents` FOR EACH ROW INSERT INTO `log_documents`( `jenis_transaksi`, `no_dokumen`, `new_nama_dokumen`, `old_nama_dokumen`, `new_jenis_dokumen`, `old_jenis_dokumen`, `new_pemilik`, `old_pemilik`, `new_sifat_dokumen`, `old_sifat_dokumen`, `new_tanggal_terbit`, `old_tanggal_terbit`, `new_perihal`, `old_perihal`, `new_file_dokumen`, `old_file_dokumen`, `created_at`, `updated_at`) VALUES (3 , old.no, NULL, old.nama_dokumen, NULL, old.document_type_id, NULL, old.section_id, NULL, old.sifat_dokumen, NULL, old.tanggal_terbit, NULL, old.perihal, NULL, old.file_dokumen, NOW(), NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertDokumen` AFTER INSERT ON `documents` FOR EACH ROW INSERT INTO `log_documents`( `jenis_transaksi`, `no_dokumen`, `new_nama_dokumen`, `old_nama_dokumen`, `new_jenis_dokumen`, `old_jenis_dokumen`, `new_pemilik`, `old_pemilik`, `new_sifat_dokumen`, `old_sifat_dokumen`, `new_tanggal_terbit`, `old_tanggal_terbit`, `new_perihal`, `old_perihal`, `new_file_dokumen`, `old_file_dokumen`, `created_at`, `updated_at`) VALUES (1 , new.no, new.nama_dokumen, NULL, new.document_type_id, NULL, new.section_id, NULL, new.sifat_dokumen, NULL, new.tanggal_terbit, NULL, new.perihal, NULL, new.file_dokumen, NULL, NOW(), NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateDokumen` AFTER UPDATE ON `documents` FOR EACH ROW INSERT INTO `log_documents`( `jenis_transaksi`, `no_dokumen`, `new_nama_dokumen`, `old_nama_dokumen`, `new_jenis_dokumen`, `old_jenis_dokumen`, `new_pemilik`, `old_pemilik`, `new_sifat_dokumen`, `old_sifat_dokumen`, `new_tanggal_terbit`, `old_tanggal_terbit`, `new_perihal`, `old_perihal`, `new_file_dokumen`, `old_file_dokumen`, `created_at`, `updated_at`) VALUES (2 , new.no, new.nama_dokumen, old.nama_dokumen, new.document_type_id, old.document_type_id, new.section_id, old.section_id, new.sifat_dokumen, old.sifat_dokumen, new.tanggal_terbit, old.tanggal_terbit, new.perihal, old.perihal, new.file_dokumen, old.file_dokumen, NOW(), NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `documents_view`
-- (See below for the actual view)
--
CREATE TABLE `documents_view` (
`no` varchar(50)
,`nama_dokumen` varchar(255)
,`jenis_dokumen` varchar(255)
,`pemilik` varchar(255)
,`sifat_dokumen` enum('umum','rahasia')
,`tanggal_terbit` date
,`perihal` varchar(255)
,`file_dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `document_groups`
--

CREATE TABLE `document_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kelompok_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_groups`
--

INSERT INTO `document_groups` (`id`, `nama_kelompok_dokumen`, `created_at`, `updated_at`) VALUES
(1, 'Jadwal', '2022-04-22 19:01:16', '2022-05-13 07:12:51'),
(2, 'Tata Tertib', '2022-04-22 19:01:16', '2022-05-01 07:22:57'),
(3, 'Prosedur', '2022-04-22 19:01:16', '2022-04-22 19:01:16'),
(4, 'Data Siswa Baru', '2022-04-22 19:01:16', '2022-04-22 19:01:16'),
(5, 'Kurikulum', '2022-04-22 19:01:16', '2022-04-22 19:01:16'),
(6, 'Penilaian', '2022-04-22 19:01:16', '2022-05-13 05:01:42');

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_jenis_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_group_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`id`, `nama_jenis_dokumen`, `document_group_id`, `created_at`, `updated_at`) VALUES
(1, 'Tata Tertib Siswa', 2, '2022-04-22 19:01:16', '2022-05-12 20:34:59'),
(5, 'Roster Mengajar Semester Ganjil', 1, '2022-04-22 19:01:16', '2022-04-22 19:01:16'),
(6, 'Roster Mengajar Semester Genap', 1, '2022-04-22 19:01:16', '2022-04-22 19:01:16'),
(7, 'Belajar Tatap Muka', 3, '2022-04-22 19:01:16', '2022-04-22 19:01:16'),
(8, 'Antar-Jemput Siswa', 3, '2022-04-22 19:01:16', '2022-04-22 19:01:16'),
(9, 'Pelaporan dan Pemantauan Kesehatan', 3, '2022-04-22 19:01:16', '2022-04-22 19:01:16'),
(10, 'Data Siswa Baru Jurusan IPA ', 4, '2022-04-22 19:01:16', '2022-04-22 19:01:16'),
(11, 'Data Siswa Baru Jurusan IPS', 4, '2022-05-01 07:37:00', '2022-05-01 07:37:00'),
(12, 'Penilaian Kinerja Guru', 6, '2022-05-01 07:42:24', '2022-05-05 06:00:21'),
(13, 'Kompetensi Dasar', 5, '2022-05-12 18:49:13', '2022-05-13 05:02:01');

-- --------------------------------------------------------

--
-- Stand-in structure for view `document_types_view`
-- (See below for the actual view)
--
CREATE TABLE `document_types_view` (
`nama_jenis_dokumen` varchar(255)
,`kelompok_dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inmails`
--

CREATE TABLE `inmails` (
  `no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_type_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `perihal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disposisi` enum('Y','T') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pokok_masalah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('unread','read') COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_surat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inmails`
--

INSERT INTO `inmails` (`no`, `mail_type_id`, `section_id`, `tanggal_masuk`, `perihal`, `disposisi`, `pokok_masalah`, `status`, `file_surat`, `created_at`, `updated_at`) VALUES
('01/01/SMA-IM/2021', 2, 1, '2021-03-08', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'Y', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'read', 'Surat Undangan_08032021.pdf', '2022-05-11 17:42:22', '2022-05-13 07:49:47'),
('01/bnn-s/1/2022', 3, 2, '2022-01-03', 'Permohonan mengadakan seminar oleh BNN ', 'Y', 'Oleh karena bertambahnya kasus pemakaian narkoba di kalangan remaja, BNN meminta izn untuk mengadakan seminar', 'read', 'Surat Permohonan Mengadakan Seminar_03012022.pdf', '2022-05-11 23:47:37', '2022-05-12 21:45:21'),
('01/DPK-P/1/2021', 5, 2, '2021-08-16', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-76', 'Y', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-76', 'unread', 'Surat Perintah_16082021.pdf', '2022-05-12 10:37:24', '2022-05-12 10:37:24'),
('02/02/SMA-IF/2021', 2, 1, '2021-05-24', 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', 'Y', 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', 'unread', 'Surat Undangan_25052021.pdf', '2022-05-11 17:56:51', '2022-05-11 17:56:51'),
('02/DPK-P/2/2020', 5, 2, '2020-08-16', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-75', 'Y', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-75', 'unread', 'Surat Perintah_16082020.pdf', '2022-05-12 10:46:13', '2022-05-12 10:46:13'),
('02/mo-s/1/2022', 3, 2, '2022-01-10', 'Permohonan Mengadakan Seminar oleh Malikussaleh Operation', 'Y', 'Berhubungan sudah dekatnya waktu UN, Malikussaleh Operation meminta izin untuk mengadakan seminar terkait UN', 'unread', 'Surat Permohonan Mengadakan Seminar_1001022.pdf', '2022-05-12 00:02:40', '2022-05-12 00:02:40'),
('03/03/SMA-IA/2021', 2, 1, '2021-07-19', 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', 'Y', 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', 'unread', 'Surat Undangan_19072021.pdf', '2022-05-11 18:06:25', '2022-05-11 18:06:25'),
('03/DPK-P/3/2019', 5, 2, '2019-08-16', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-74', 'Y', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-74', 'unread', 'Surat Perintah_16082019.pdf', '2022-05-12 10:50:14', '2022-05-12 10:50:14'),
('03/qy-s/1/2022', 3, 2, '2022-01-17', 'Permohonan Mengadakan Seminar oleh Quippy', 'Y', 'Berhubungan sudah dekatnya waktu UN, Quippy meminta izin untuk mengadakan seminar terkait menghadapi UN', 'unread', 'Surat Permohonan Mengadakan Seminar_17012022.pdf', '2022-05-12 00:21:36', '2022-05-12 00:21:36'),
('04/04/SMA-TH/2021', 2, 1, '2021-09-08', 'Undangan untuk menghadari Acara Peringatan Tahun Baru Hijiah 1443 H di SMA Negeri 2 Lhokseumawe', 'Y', 'Undangan untuk menghadari Acara Peringatan Tahun Baru Hijiah 1443 H di SMA Negeri 2 Lhokseumawe', 'unread', 'Surat Undangan_08092021.pdf', '2022-05-11 18:13:37', '2022-05-11 18:13:37'),
('04/DPK-P/4/2018', 5, 2, '2018-08-16', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-73', 'Y', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-76', 'unread', 'Surat Perintah_16082018.pdf', '2022-05-12 10:57:23', '2022-05-12 10:57:23'),
('04/rb-s/4/2022	', 3, 2, '2022-01-24', 'Permohonan Mengadakan Seminar oleh Ruang Belajar', 'Y', 'Berhubungan sudah dekatnya waktu UN, Ruang Belajar meminta izin untuk mengadakan seminar terkait UN', 'unread', 'Surat Permohonan Mengadakan Seminar_24012022.pdf', '2022-05-12 00:51:27', '2022-05-12 00:51:27'),
('05/05/SMA-TH/2021', 2, 1, '2021-10-18', 'Undangan untuk menghadari Acara Peringatan Maulid Nabi Muhammad SAW di SMA Negeri 2 Lhokseumawe', 'Y', 'Undangan untuk menghadari Acara Peringatan Maulid Nabi Muhammad SAW di SMA Negeri 2 Lhokseumawe', 'unread', 'Surat Undangan_18102021.pdf', '2022-05-11 18:21:25', '2022-05-11 18:21:25'),
('05/ce-s/5/2022', 3, 2, '2022-02-03', 'Permohonan Mengadakan Seminar oleh Ruang Belajar', 'Y', 'Berhubungan sudah dekatnya waktu UN, Ruang Belajar meminta izin untuk mengadakan seminar terkait UN', 'unread', 'Surat Permohonan Mengadakan Seminar_03022022.pdf', '2022-05-12 01:22:30', '2022-05-12 01:22:30'),
('05/DPK-P/5/2017', 5, 2, '2017-08-16', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-72', 'Y', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-72', 'unread', 'Surat Perintah_16082017.pdf', '2022-05-12 11:06:31', '2022-05-12 11:06:31'),
('06/DPK-P/6/2016', 5, 2, '2016-08-16', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-71', 'Y', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-71', 'unread', 'Surat Perintah_16082016.pdf', '2022-05-12 11:42:35', '2022-05-12 11:42:35'),
('06/us-s/6/2022', 3, 2, '2022-02-10', 'Permohonan Mengadakan Seminar oleh Unsyiah', 'Y', 'Berhubungan sudah dekatnya waktu SNMPT, UNSYIAH meminta izin untuk mengadakan seminar terkait sosialisasi kampus', 'unread', 'Surat Permohonan Mengadakan Seminar_1002022.pdf', '2022-05-12 01:37:21', '2022-05-12 01:37:21'),
('07/DPK-PH/7/2021', 5, 2, '2021-08-07', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1443 H', 'Y', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1443 H', 'unread', 'Surat Perintah_07082021.pdf', '2022-05-12 11:52:51', '2022-05-12 11:52:51'),
('08/DPK-PH/8/2020', 5, 2, '2021-08-20', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1442 H', 'Y', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1442 H', 'unread', 'Surat Perintah_20082020.pdf', '2022-05-12 11:59:55', '2022-05-12 11:59:55'),
('09/DPK-PH/9/2019', 5, 2, '2019-08-25', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1441 H', 'Y', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1441 H', 'unread', 'Surat Perintah_25082019.pdf', '2022-05-12 12:05:08', '2022-05-12 12:05:08'),
('1/panpel-cc/2/2022', 3, 2, '2022-01-01', 'Surat Pemberitahuan untuk Ikut Serta Kegiatan Cerdas Cermat', 'Y', 'Permintaan perwakilan dari siswa untuk mengikuti kegiatan cerdas cermat', 'unread', 'Surat Permohonan Mengikuti Kegiatan_01012022.pdf', '2022-05-10 18:08:08', '2022-05-10 18:08:08'),
('10/DPK-PH/10/2018', 5, 2, '2018-09-02', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1440 H', 'Y', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1440 H', 'unread', 'Surat Perintah_02092018.pdf', '2022-05-12 12:12:21', '2022-05-12 12:12:21'),
('11/DPK-PH/11/2017', 5, 2, '2017-09-15', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1439 H', 'Y', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1439 H', 'unread', 'Surat Perintah_15092017.pdf', '2022-05-12 12:16:17', '2022-05-12 12:16:17'),
('12/DPK-PH/12/2016', 5, 2, '2016-09-27', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1438 H', 'Y', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1438 H', 'unread', 'Surat Perintah_29092016.pdf', '2022-05-12 12:20:52', '2022-05-12 12:20:52'),
('2/panpel-kt/2/2022', 3, 2, '2022-01-08', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Karya Tulis Ilmiah di SMA Negeri 2 Lhokseumawe', 'Y', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Karya Tulis Ilmiah di SMA Negeri 2 Lhokseumawe', 'unread', 'Surat Permohonan Mengikuti Kegiatan_08012022.pdf', '2022-05-10 19:01:16', '2022-05-10 12:28:25'),
('3/panpel-kt/3/2022', 3, 2, '2022-01-15', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Debat Bahasa Inggris yang diadakan oleh SMA Negerei 2 Lhokseumawe', 'Y', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Debat Bahasa Inggris di SMA Negeri 2 Lhokseumawe', 'unread', 'Surat Permohonan Mengikuti Kegiatan_15012022.pdf', '2022-05-10 20:35:02', '2022-05-10 20:35:02'),
('4/panpel-po/4/2022', 3, 2, '2022-08-16', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Pekan Olah Raga di SMA Negeri 2 Lhokseumawe', 'Y', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Pekan Olah Raga di SMA Negeri 2 Lhokseumawe', 'unread', 'Surat Permohonan Mengikuti Kegiatan_16082022.pdf', '2022-05-10 20:42:48', '2022-05-10 20:42:48'),
('5/panpel-bp/5/2022', 3, 2, '2022-02-01', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Baca Puisi di SMA Negeri 2 Lhokseumawe', 'T', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Baca Puisi di SMA Negeri 2 Lhokseumawe', 'unread', 'Surat Permohonan Mengikuti Kegiatan_01022022.pdf', '2022-05-10 20:51:43', '2022-05-10 20:51:43'),
('6/panpel-gd/6/2022', 3, 4, '2022-02-08', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Gathering Day di SMA Negeri 2 Lhookseumawe', 'T', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Gathering Day di SMA Negeri 2 Lhookseumawe', 'unread', 'Surat Permohonan Mengikuti Kegiatan_08022022.pdf', '2022-05-10 21:00:12', '2022-05-10 21:00:12'),
('7/panpel-lp/6/2022', 3, 2, '2022-02-15', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Pidato di SMA Negeri 2 Lhokseumawe', 'Y', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Pidato di SMA Negeri 2 Lhokseumawe', 'unread', 'Surat Permohonan Mengikuti Kegiatan_15022022.pdf', '2022-05-11 17:09:34', '2022-05-11 17:09:34');

--
-- Triggers `inmails`
--
DELIMITER $$
CREATE TRIGGER `deleteInmail` AFTER DELETE ON `inmails` FOR EACH ROW INSERT INTO `log_inmails`( `jenis_transaksi`, `no_surat`, `new_jenis_surat`, `old_jenis_surat`, `new_bagian`, `old_bagian`, `new_tanggal_masuk`, `old_tanggal_masuk`, `new_perihal`, `old_perihal`, `new_disposisi`, `old_disposisi`, `new_pokok_masalah`, `old_pokok_masalah`, `new_status`, `old_status`, `new_file_surat`, `old_file_surat`, `created_at`, `updated_at`) VALUES (3 , old.no, NULL, old.mail_type_id, NULL, old.section_id, NULL, old.tanggal_masuk, NULL, old.perihal, NULL, old.disposisi, NULL, old.pokok_masalah, NULL, old.status, NULL, old.file_surat, NOW(), NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertInmail` AFTER INSERT ON `inmails` FOR EACH ROW INSERT INTO `log_inmails`( `jenis_transaksi`, `no_surat`, `new_jenis_surat`, `old_jenis_surat`, `new_bagian`, `old_bagian`, `new_tanggal_masuk`, `old_tanggal_masuk`, `new_perihal`, `old_perihal`, `new_disposisi`, `old_disposisi`, `new_pokok_masalah`, `old_pokok_masalah`, `new_status`, `old_status`, `new_file_surat`, `old_file_surat`, `created_at`, `updated_at`) VALUES (1 , new.no, new.mail_type_id, NULL, new.section_id, NULL, new.tanggal_masuk, NULL, new.perihal, NULL, new.disposisi, NULL, new.pokok_masalah, NULL, new.status, NULL, new.file_surat, NULL, NOW(), NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateInmail` AFTER UPDATE ON `inmails` FOR EACH ROW INSERT INTO `log_inmails`( `jenis_transaksi`, `no_surat`, `new_jenis_surat`, `old_jenis_surat`, `new_bagian`, `old_bagian`, `new_tanggal_masuk`, `old_tanggal_masuk`, `new_perihal`, `old_perihal`, `new_disposisi`, `old_disposisi`, `new_pokok_masalah`, `old_pokok_masalah`, `new_status`, `old_status`, `new_file_surat`, `old_file_surat`, `created_at`, `updated_at`) VALUES (2 , new.no, new.mail_type_id, old.mail_type_id, new.section_id, old.section_id, new.tanggal_masuk, old.tanggal_masuk, new.perihal, old.perihal, new.disposisi, old.disposisi, new.pokok_masalah, old.pokok_masalah, new.status, old.status, new.file_surat, old.file_surat, NOW(), NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `inmails_view`
-- (See below for the actual view)
--
CREATE TABLE `inmails_view` (
`no` varchar(50)
,`jenis_surat` varchar(255)
,`bagian` varchar(255)
,`tanggal_masuk` date
,`perihal` varchar(255)
,`disposisi` varchar(50)
,`pokok_masalah` varchar(255)
,`status` enum('unread','read')
,`file_surat` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `log_destinations`
--

CREATE TABLE `log_destinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_transaksi` enum('Insert','Update','Delete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_disposisi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_ditujukan` bigint(20) UNSIGNED DEFAULT NULL,
  `old_ditujukan` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_destinations`
--

INSERT INTO `log_destinations` (`id`, `jenis_transaksi`, `no_disposisi`, `new_ditujukan`, `old_ditujukan`, `created_at`, `updated_at`) VALUES
(1, 'Insert', 'd1/panpel-cc/2/2022', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(2, 'Insert', 'd1/panpel-cc/2/2022', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(3, 'Insert', 'd2/panpel-kt/2/2022', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(4, 'Insert', 'd2/panpel-kt/2/2022', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(5, 'Insert', 'd3/panpel-kt/3/2022', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(6, 'Insert', 'd3/panpel-kt/3/2022', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(7, 'Insert', 'd4/panpel-po/4/2022', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(8, 'Insert', 'd4/panpel-po/4/2022', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(9, 'Insert', 'd4/panpel-po/4/2022', 4, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(10, 'Insert', 'd7/panpel-lp/6/2022', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(11, 'Insert', 'd7/panpel-lp/6/2022', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(12, 'Insert', 'd02/02/SMA-IF/2021', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(13, 'Insert', 'd02/02/SMA-IF/2021', 2, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(14, 'Insert', 'd02/02/SMA-IF/2021', 5, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(15, 'Insert', 'd02/02/SMA-IF/2021', 6, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(16, 'Insert', 'd03/03/SMA-IA/2021', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(17, 'Insert', 'd03/03/SMA-IA/2021', 2, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(18, 'Insert', 'd03/03/SMA-IA/2021', 5, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(19, 'Insert', 'd03/03/SMA-IA/2021', 6, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(20, 'Insert', 'd04/04/SMA-TH/2021', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(21, 'Insert', 'd04/04/SMA-TH/2021', 2, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(22, 'Insert', 'd04/04/SMA-TH/2021', 5, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(23, 'Insert', 'd04/04/SMA-TH/2021', 6, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(24, 'Insert', 'd05/05/SMA-TH/2021', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(25, 'Insert', 'd05/05/SMA-TH/2021', 2, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(26, 'Insert', 'd05/05/SMA-TH/2021', 5, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(27, 'Insert', 'd05/05/SMA-TH/2021', 6, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(28, 'Insert', 'd01/bnn-s/1/2022', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(29, 'Insert', 'd02/mo-s/1/2022', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(30, 'Insert', 'd03/qy-s/1/2022', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(31, 'Insert', 'd04/rb-s/4/2022', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(32, 'Insert', 'd05/ce-s/5/2022', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(33, 'Insert', 'd06/us-s/6/2022', 2, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(34, 'Insert', 'd01/DPK-P/1/2021', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(35, 'Insert', 'd02/DPK-P/2/2020', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(36, 'Insert', 'd03/DPK-P/3/2019', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(37, 'Insert', 'd04/DPK-P/4/2018', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(38, 'Insert', 'd05/DPK-P/5/2017', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(39, 'Insert', 'd06/DPK-P/6/2016', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(40, 'Insert', 'd07/DPK-PH/7/2021', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(41, 'Insert', 'd08/DPK-PH/8/2020', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(42, 'Insert', 'd09/DPK-PH/9/2019', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(43, 'Insert', 'd10/DPK-PH/10/2018', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(44, 'Insert', 'd11/DPK-PH/11/2017', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(45, 'Insert', 'd12/DPK-PH/12/2016', 11, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(46, 'Insert', 'd01/01/SMA-IM/2021', 2, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(47, 'Insert', 'd01/01/SMA-IM/2021', 3, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(48, 'Insert', 'd01/01/SMA-IM/2021', 5, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(49, 'Insert', 'd01/01/SMA-IM/2021', 6, NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(50, 'Insert', '213', 3, NULL, '2022-05-13 12:05:02', '2022-05-13 12:05:02'),
(51, 'Insert', '213', 5, NULL, '2022-05-13 12:05:02', '2022-05-13 12:05:02'),
(52, 'Delete', '213/12', NULL, 3, '2022-05-13 12:05:19', '2022-05-13 12:05:19'),
(53, 'Delete', '213/12', NULL, 5, '2022-05-13 12:05:19', '2022-05-13 12:05:19'),
(54, 'Insert', '213/12', 3, NULL, '2022-05-13 12:05:19', '2022-05-13 12:05:19'),
(55, 'Insert', '213/12', 5, NULL, '2022-05-13 12:05:19', '2022-05-13 12:05:19'),
(56, 'Delete', '213/12', NULL, 3, '2022-05-13 12:11:16', '2022-05-13 12:11:16'),
(57, 'Delete', '213/12', NULL, 5, '2022-05-13 12:11:16', '2022-05-13 12:11:16'),
(58, 'Insert', '213/12', 3, NULL, '2022-05-13 12:11:16', '2022-05-13 12:11:16'),
(59, 'Insert', '213/12', 5, NULL, '2022-05-13 12:11:16', '2022-05-13 12:11:16'),
(60, 'Delete', 'd01/01/SMA-IM/2021', NULL, 2, '2022-05-13 14:04:59', '2022-05-13 14:04:59'),
(61, 'Delete', 'd01/01/SMA-IM/2021', NULL, 3, '2022-05-13 14:04:59', '2022-05-13 14:04:59'),
(62, 'Delete', 'd01/01/SMA-IM/2021', NULL, 5, '2022-05-13 14:04:59', '2022-05-13 14:04:59'),
(63, 'Delete', 'd01/01/SMA-IM/2021', NULL, 6, '2022-05-13 14:04:59', '2022-05-13 14:04:59'),
(64, 'Insert', 'd01/01/SMA-IM/2021', 2, NULL, '2022-05-13 14:04:59', '2022-05-13 14:04:59'),
(65, 'Insert', 'd01/01/SMA-IM/2021', 3, NULL, '2022-05-13 14:04:59', '2022-05-13 14:04:59'),
(66, 'Insert', 'd01/01/SMA-IM/2021', 5, NULL, '2022-05-13 14:04:59', '2022-05-13 14:04:59'),
(67, 'Insert', 'd01/01/SMA-IM/2021', 6, NULL, '2022-05-13 14:04:59', '2022-05-13 14:04:59'),
(68, 'Insert', 'ewddd', 3, NULL, '2022-05-13 14:15:51', '2022-05-13 14:15:51'),
(69, 'Delete', 'd01/01/SMA-IM/2021', NULL, 2, '2022-05-13 14:49:58', '2022-05-13 14:49:58'),
(70, 'Delete', 'd01/01/SMA-IM/2021', NULL, 3, '2022-05-13 14:49:58', '2022-05-13 14:49:58'),
(71, 'Delete', 'd01/01/SMA-IM/2021', NULL, 5, '2022-05-13 14:49:58', '2022-05-13 14:49:58'),
(72, 'Delete', 'd01/01/SMA-IM/2021', NULL, 6, '2022-05-13 14:49:58', '2022-05-13 14:49:58'),
(73, 'Insert', 'd01/01/SMA-IM/2021', 2, NULL, '2022-05-13 14:49:58', '2022-05-13 14:49:58'),
(74, 'Insert', 'd01/01/SMA-IM/2021', 3, NULL, '2022-05-13 14:49:58', '2022-05-13 14:49:58'),
(75, 'Insert', 'd01/01/SMA-IM/2021', 5, NULL, '2022-05-13 14:49:58', '2022-05-13 14:49:58'),
(76, 'Insert', 'd01/01/SMA-IM/2021', 6, NULL, '2022-05-13 14:49:58', '2022-05-13 14:49:58');

--
-- Triggers `log_destinations`
--
DELIMITER $$
CREATE TRIGGER `janganHapusDitujukan` BEFORE DELETE ON `log_destinations` FOR EACH ROW SIGNAL SQLSTATE 'U0041'
SET MESSAGE_TEXT = 'Log Transaksi Tidak Boleh Dihapus'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `janganUpdateDitujukan` BEFORE UPDATE ON `log_destinations` FOR EACH ROW SIGNAL SQLSTATE 'U0040'
SET MESSAGE_TEXT = 'Log Transaksi Tidak Boleh Diubah'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_dispositions`
--

CREATE TABLE `log_dispositions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_transaksi` enum('Insert','Update','Delete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_disposisi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_surat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_tanggal_disposisi` date DEFAULT NULL,
  `old_tanggal_disposisi` date DEFAULT NULL,
  `new_isi_disposisi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_isi_disposisi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_dispositions`
--

INSERT INTO `log_dispositions` (`id`, `jenis_transaksi`, `no_disposisi`, `no_surat`, `new_tanggal_disposisi`, `old_tanggal_disposisi`, `new_isi_disposisi`, `old_isi_disposisi`, `new_status`, `old_status`, `created_at`, `updated_at`) VALUES
(1, 'Insert', 'd01/01/SMA-IM/2021', '01/01/SMA-IM/2021', '2021-02-08', NULL, 'Dimohon kepada Bapak dan Ibu untuk menghadiri Acara Memperingati Isra\' Mi\'raj di SMA Negeri 2 Lhokseumawe', NULL, 'read', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(2, 'Insert', 'd01/bnn-s/1/2022', '01/bnn-s/1/2022', '2022-01-04', NULL, 'Berhubungan adanya seminar yang diadakan oleh BNN, diharapkan Ibu/Bapak untuk memberikan izin siswa untuk mengikuti seminar tersebut', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(3, 'Insert', 'd01/DPK-P/1/2021', '01/DPK-P/1/2021', '2022-08-16', NULL, 'Dalam rangka memeriahkan Pawai untuk memperingati HUT RI ke-74, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 3 siswa/i', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(4, 'Insert', 'd02/02/SMA-IF/2021', '02/02/SMA-IF/2021', '2021-05-24', NULL, 'Dimohon kepada Ibu/Bapak untuk menghadiri Acara Halal Bihalal Idul Fitri 1442 H di SMA Negeri 2 Lhokseumawe', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(5, 'Insert', 'd02/DPK-P/2/2020', '02/DPK-P/2/2020', '2020-08-16', NULL, 'Dalam rangka memeriahkan Pawai untuk memperingati HUT RI ke-75, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 3 siswa/i', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(6, 'Insert', 'd02/mo-s/1/2022', '02/mo-s/1/2022', '2022-01-11', NULL, 'Berhubungan dengan adanya seminar yang akan dilakukan, diharapkan Bapak/Ibu memberikan izin kepada siswa untuk mengikuti seminar tersebut', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(7, 'Insert', 'd03/03/SMA-IA/2021', '03/03/SMA-IA/2021', '2021-07-19', NULL, 'Dimohon kepada Bapak/Ibu untuk menghadiri Acara Peringatan Idul Adha di SMA Negeri 2 Lhokseumawe', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(8, 'Insert', 'd03/DPK-P/3/2019', '03/DPK-P/3/2019', '2020-08-16', NULL, 'Dalam rangka memeriahkan Pawai untuk memperingati HUT RI ke-74, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 3 siswa/i', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(9, 'Insert', 'd03/qy-s/1/2022', '03/qy-s/1/2022', '2022-01-18', NULL, 'Berhubungan dengan adanya seminar yang akan dilakukan, diharapkan Bapak/Ibu memberikan izin kepada siswa untuk mengikuti seminar tersebut', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(10, 'Insert', 'd04/04/SMA-TH/2021', '04/04/SMA-TH/2021', '2021-09-08', NULL, 'Dimohon kepada Bapak/Ibu untuk menghadiri Acara Peringatan Tahun Baru Hijriah 1443 H di SMA Negeri 2 Lhokseumawe', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(11, 'Insert', 'd04/DPK-P/4/2018', '04/DPK-P/4/2018', '2018-08-16', NULL, 'Dalam rangka memeriahkan Pawai untuk memperingati HUT RI ke-74, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 3 siswa/i', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(12, 'Insert', 'd04/rb-s/4/2022', '04/rb-s/4/2022	', '2022-01-25', NULL, 'Berhubungan dengan adanya seminar yang akan dilakukan, diharapkan Bapak/Ibu memberikan izin kepada siswa untuk mengikuti seminar tersebut', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(13, 'Insert', 'd05/05/SMA-TH/2021', '05/05/SMA-TH/2021', '2021-10-20', NULL, 'Dimohon kepada Bapak/Ibu untuk menghadiri Acara Peringatan Maulid Nabi Muhammad SAW di SMA Negeri 2 Lhokseumawe', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(14, 'Insert', 'd05/ce-s/5/2022', '05/ce-s/5/2022', '2022-02-04', NULL, 'Berhubungan dengan adanya seminar yang akan dilakukan, diharapkan Bapak/Ibu memberikan izin kepada siswa untuk mengikuti seminar tersebut', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(15, 'Insert', 'd05/DPK-P/5/2017', '05/DPK-P/5/2017', '2017-08-16', NULL, 'Dalam rangka memeriahkan Pawai untuk memperingati HUT RI ke-72, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 3 siswa/i', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(16, 'Insert', 'd06/DPK-P/6/2016', '06/DPK-P/6/2016', '2016-08-16', NULL, 'Dalam rangka memeriahkan Pawai untuk memperingati HUT RI ke-71, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 3 siswa/i', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(17, 'Insert', 'd06/us-s/6/2022', '06/us-s/6/2022', '2022-02-11', NULL, 'Berhubungan dengan adanya seminar yang akan dilakukan, diharapkan Bapak/Ibu memberikan izin kepada siswa untuk mengikuti seminar tersebut', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(18, 'Insert', 'd07/DPK-PH/7/2021', '07/DPK-PH/7/2021', '2021-08-08', NULL, 'Dalam rangka memeriahkan Pawai Obor dalam Rangka Tahun Baru 1443 H, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 2 siswa/i', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(19, 'Insert', 'd08/DPK-PH/8/2020', '08/DPK-PH/8/2020', '2020-08-20', NULL, 'Dalam rangka memeriahkan Pawai Obor dalam Rangka Tahun Baru 1442 H, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 2 siswa/i', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(20, 'Insert', 'd09/DPK-PH/9/2019', '09/DPK-PH/9/2019', '2019-08-26', NULL, 'Dalam rangka memeriahkan Pawai Obor dalam Rangka Tahun Baru 1441 H, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 2 siswa/i', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(21, 'Insert', 'd1/panpel-cc/2/2022', '1/panpel-cc/2/2022', '2022-01-02', NULL, 'Segera lakukan seleksi untuk mengikuti kegiatan cerdas cermat di SMA Negeri 2 Lhkseumawe', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(22, 'Insert', 'd10/DPK-PH/10/2018', '10/DPK-PH/10/2018', '2018-09-03', NULL, 'Dalam rangka memeriahkan Pawai Obor dalam Rangka Tahun Baru 1440 H, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 2 siswa/i', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(23, 'Insert', 'd11/DPK-PH/11/2017', '11/DPK-PH/11/2017', '2017-09-16', NULL, 'Dalam rangka memeriahkan Pawai Obor dalam Rangka Tahun Baru 1439 H, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 2 siswa/i', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(24, 'Insert', 'd12/DPK-PH/12/2016', '12/DPK-PH/12/2016', '2016-09-28', NULL, 'Dalam rangka memeriahkan Pawai Obor dalam Rangka Tahun Baru 1438 H, diharapkan bapak/ibu wali kelas dapat memilih siswa/i dari masing-masing kelasnya 2 siswa/i', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(25, 'Insert', 'd2/panpel-kt/2/2022', '2/panpel-kt/2/2022', '2022-01-09', NULL, 'Segera persiapkan perwakilan siswa untuk mengikuti kegiatan tersebut', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(26, 'Insert', 'd3/panpel-kt/3/2022', '3/panpel-kt/3/2022', '2022-01-16', NULL, 'Segera persiapkan perwakilan siswa untuk mengikuti kegiatan tersebut', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(27, 'Insert', 'd4/panpel-po/4/2022', '4/panpel-po/4/2022', '2022-08-18', NULL, 'Segera persiapkan perwakilan siswa untuk mengikuti kegiatan tersebut', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(28, 'Insert', 'd7/panpel-lp/6/2022', '7/panpel-lp/6/2022', '2022-02-15', NULL, 'Segera persiapkan perwakilan siswa untuk mengikuti kegiatan tersebut', NULL, 'unread', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(29, 'Insert', '213', 'try/12', '2021-01-01', NULL, 'sdas', NULL, 'unread', NULL, '2022-05-13 12:05:02', '2022-05-13 12:05:02'),
(30, 'Update', '213/12', 'try/12', '2021-01-01', '2021-01-01', 'sdas', 'sdas', 'unread', 'unread', '2022-05-13 12:05:19', '2022-05-13 12:05:19'),
(31, 'Update', 'd04/04/SMA-TH/2021', '04/04/SMA-TH/2021', '2021-09-08', '2021-09-08', 'Dimohon kepada Bapak/Ibu untuk menghadiri Acara Peringatan Tahun Baru Hijriah 1443 H di SMA Negeri 2 Lhokseumawe', 'Dimohon kepada Bapak/Ibu untuk menghadiri Acara Peringatan Tahun Baru Hijriah 1443 H di SMA Negeri 2 Lhokseumawe', 'read', 'unread', '2022-05-13 12:10:40', '2022-05-13 12:10:40'),
(32, 'Update', '213/12', 'try/12', '2021-01-01', '2021-01-01', 'sdas', 'sdas', 'unread', 'unread', '2022-05-13 12:11:16', '2022-05-13 12:11:16'),
(33, 'Delete', '213/12', 'try/12', NULL, '2021-01-01', NULL, 'sdas', NULL, 'unread', '2022-05-13 12:11:19', '2022-05-13 12:11:19'),
(34, 'Update', 'd01/01/SMA-IM/2021', '01/01/SMA-IM/2021', '2021-02-08', '2021-02-08', 'Dimohon kepada Bapak dan Ibu untuk menghadiri Acara Memperingati Isra\' Mi\'raj di SMA Negeri 2 Lhokseumawe', 'Dimohon kepada Bapak dan Ibu untuk menghadiri Acara Memperingati Isra\' Mi\'raj di SMA Negeri 2 Lhokseumawe', 'read', 'read', '2022-05-13 14:04:59', '2022-05-13 14:04:59'),
(35, 'Insert', 'ewddd', '1212/ww', '2021-01-01', NULL, 'ewdsdadddawd', NULL, 'unread', NULL, '2022-05-13 14:15:51', '2022-05-13 14:15:51'),
(36, 'Delete', 'ewddd', '1212/ww', NULL, '2021-01-01', NULL, 'ewdsdadddawd', NULL, 'unread', '2022-05-13 14:16:45', '2022-05-13 14:16:45'),
(37, 'Update', 'd01/01/SMA-IM/2021', '01/01/SMA-IM/2021', '2021-01-08', '2021-02-08', 'Dimohon kepada Bapak dan Ibu untuk menghadiri Acara Memperingati Isra\' Mi\'raj di SMA Negeri 2 Lhokseumawe', 'Dimohon kepada Bapak dan Ibu untuk menghadiri Acara Memperingati Isra\' Mi\'raj di SMA Negeri 2 Lhokseumawe', 'read', 'read', '2022-05-13 14:49:58', '2022-05-13 14:49:58'),
(38, 'Update', 'd1/panpel-cc/2/2022', '1/panpel-cc/2/2022', '2022-01-02', '2022-01-02', 'Segera lakukan seleksi untuk mengikuti kegiatan cerdas cermat di SMA Negeri 2 Lhkseumawe', 'Segera lakukan seleksi untuk mengikuti kegiatan cerdas cermat di SMA Negeri 2 Lhkseumawe', 'read', 'unread', '2022-05-13 15:18:47', '2022-05-13 15:18:47');

--
-- Triggers `log_dispositions`
--
DELIMITER $$
CREATE TRIGGER `janganHapusDisposisi` BEFORE DELETE ON `log_dispositions` FOR EACH ROW SIGNAL SQLSTATE 'U0041'
SET MESSAGE_TEXT = 'Log Transaksi Tidak Boleh Dihapus'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `janganUpdateDisposisi` BEFORE UPDATE ON `log_dispositions` FOR EACH ROW SIGNAL SQLSTATE 'U0040'
SET MESSAGE_TEXT = 'Log Transaksi Tidak Boleh Diubah'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_documents`
--

CREATE TABLE `log_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_transaksi` enum('Insert','Update','Delete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_dokumen` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_nama_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_nama_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_jenis_dokumen` bigint(20) UNSIGNED DEFAULT NULL,
  `old_jenis_dokumen` bigint(20) UNSIGNED DEFAULT NULL,
  `new_pemilik` bigint(20) UNSIGNED DEFAULT NULL,
  `old_pemilik` bigint(20) UNSIGNED DEFAULT NULL,
  `new_sifat_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_sifat_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_tanggal_terbit` date DEFAULT NULL,
  `old_tanggal_terbit` date DEFAULT NULL,
  `new_perihal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_perihal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_file_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_file_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_documents`
--

INSERT INTO `log_documents` (`id`, `jenis_transaksi`, `no_dokumen`, `new_nama_dokumen`, `old_nama_dokumen`, `new_jenis_dokumen`, `old_jenis_dokumen`, `new_pemilik`, `old_pemilik`, `new_sifat_dokumen`, `old_sifat_dokumen`, `new_tanggal_terbit`, `old_tanggal_terbit`, `new_perihal`, `old_perihal`, `new_file_dokumen`, `old_file_dokumen`, `created_at`, `updated_at`) VALUES
(1, 'Insert', 'DAT1', 'Nama Siswa Baru TP 2021-2022', NULL, 10, NULL, 1, NULL, 'umum', NULL, '2021-06-23', NULL, 'Nama Siswa Baru TP 2021-2022', NULL, 'Data_Siswa Baru_2021-2022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(2, 'Insert', 'DAT2', 'Nama Siswa Baru TP 2020-2021', NULL, 10, NULL, 1, NULL, 'umum', NULL, '2020-06-17', NULL, 'Nama Siswa Baru TP 2020-2021', NULL, 'Data_Siswa Baru_2020-2021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(3, 'Insert', 'DAT3', 'Nama Siswa Baru TP 2019-2020', NULL, 10, NULL, 1, NULL, 'umum', NULL, '2019-06-15', NULL, 'Nama Siswa Baru TP 2019-2020', NULL, 'Data_Siswa Baru_2019-2020.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(4, 'Insert', 'DAT4', 'Nama Siswa Baru TP 2018-2019', NULL, 10, NULL, 1, NULL, 'umum', NULL, '2018-06-21', NULL, 'Nama Siswa Baru TP 2021-2022', NULL, 'Data_Siswa Baru_2018-2019.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(5, 'Insert', 'DAT5', 'Nama Siswa IPS Baru TP 2021-2022', NULL, 11, NULL, 1, NULL, 'umum', NULL, '2021-06-23', NULL, 'Nama Siswa IPS Baru TP 2021-2022', NULL, 'Data_Siswa Baru_IPS_2021-2022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(6, 'Insert', 'DAT6', 'Nama Siswa IPS Baru TP 2020-2021', NULL, 11, NULL, 1, NULL, 'umum', NULL, '2020-06-16', NULL, 'Nama Siswa IPS Baru TP 2021-2022', NULL, 'Data_Siswa Baru_IPS_2020-2021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(7, 'Insert', 'DAT7', 'Nama Siswa IPS Baru TP 2019-2020', NULL, 11, NULL, 1, NULL, 'umum', NULL, '2019-06-14', NULL, 'Nama Siswa IPS Baru TP 2021-2022', NULL, 'Data_Siswa Baru_IPS_2019-2020.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(8, 'Insert', 'DAT8', 'Nama Siswa IPS Baru TP 2018-2019', NULL, 11, NULL, 1, NULL, 'umum', NULL, '2018-06-21', NULL, 'Nama Siswa IPS Baru TP 2018-2019', NULL, 'Data_Siswa Baru_IPS_2018-2019.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(9, 'Insert', 'KD1', 'KD Matematika Kelas X', NULL, 13, NULL, 3, NULL, 'umum', NULL, '2021-06-28', NULL, 'KD Matematika Kelas X', NULL, 'Matematika X.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(10, 'Insert', 'KD2', 'KD Matematika Kelas XI', NULL, 13, NULL, 3, NULL, 'umum', NULL, '2021-06-27', NULL, 'KD Matematika Kelas XI', NULL, 'Matematika XI.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(11, 'Insert', 'KD3', 'KD Matematika Kelas XII', NULL, 13, NULL, 3, NULL, 'umum', NULL, '2021-06-23', NULL, 'KD Matematika Kelas XII', NULL, 'Matematika XII.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(12, 'Insert', 'KD4', 'KD Fisika Kelas X', NULL, 13, NULL, 3, NULL, 'umum', NULL, '2021-06-24', NULL, 'KD Fisika Kelas X', NULL, 'Fisika X.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(13, 'Insert', 'KD5', 'KD Fisika Kelas XI', NULL, 13, NULL, 3, NULL, 'umum', NULL, '2021-06-24', NULL, 'KD Fisika Kelas X', NULL, 'Fisika XI.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(14, 'Insert', 'KD6', 'KD Fisika Kelas XII', NULL, 13, NULL, 3, NULL, 'umum', NULL, '2021-06-24', NULL, 'KD Fisika Kelas XII', NULL, 'Fisika XII.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(15, 'Insert', 'NIL1', 'Buku Penilaian Kinerja Guru', NULL, 12, NULL, 3, NULL, 'rahasia', NULL, '2021-07-17', NULL, 'Buku Penilaian Kinerja Guru', NULL, 'Overview_PKG_v01.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(16, 'Insert', 'PER1', 'Tata Tertib Siswa Tahun Ajaran 2021-2022', NULL, 1, NULL, 2, NULL, 'umum', NULL, '2021-06-21', NULL, 'Tata Tertib Siswa Tahun Ajaran 2021-2022', NULL, 'Tata Tertib_Siswa_2021-2022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(17, 'Insert', 'PRO1', 'PROSEDUR OPERASIONAL STANDAR BELAJAR TATAP MUKA TAHUN 2020\r\n', NULL, 7, NULL, 2, NULL, 'umum', NULL, '2020-02-24', NULL, 'Prosedur Melakukan PTM Selama Masa Pandemi Covid-19', NULL, 'Prosedur_PTM_2020.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(18, 'Insert', 'PRO2', 'PROSEDUR OPERASIONAL STANDAR BELAJAR TATAP MUKA TAHUN 2021', NULL, 7, NULL, 2, NULL, 'umum', NULL, '2021-02-15', NULL, 'Prosedur PTM Selama Masa Pandemi Covid-19', NULL, 'Prosedur_PTM_2021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(19, 'Insert', 'PRO3', 'PROSEDUR OPERASIONAL STANDAR BELAJAR TATAP MUKA TAHUN 2022', NULL, 7, NULL, 2, NULL, 'umum', NULL, '2022-02-16', NULL, 'Prosedur PTM Selama Masa Pandemi Covid-19', NULL, 'Prosedur_PTM_2022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(20, 'Insert', 'PRO4', 'PROSEDUR OPERASIONAL STANDAR PEMANTAUAN DAN PELAPORAN PENGANTAR-PENJEMPUT SISWA TAHUN 2020\r\n', NULL, 8, NULL, 2, NULL, 'umum', NULL, '2020-06-14', NULL, 'Prosedur Penjemputan dan Pengantaran Siswa pada Masa Pandemi Covid-19', NULL, 'Prosedur_Antar-Jemput Siswa_2020.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(21, 'Insert', 'PRO5', 'PROSEDUR OPERASIONAL STANDAR PEMANTAUAN DAN PELAPORAN PENGANTAR-PENJEMPUT SISWA TAHUN 2021', NULL, 8, NULL, 2, NULL, 'umum', NULL, '2021-06-17', NULL, 'Prosedur Penjemputan dan Pengantaran Siswa pada Masa Pandemi Covid-19', NULL, 'Prosedur_Antar-Jemput Siswa_2021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(22, 'Insert', 'PRO6', 'PROSEDUR OPERASIONAL STANDAR PEMANTAUAN DAN PELAPORAN PENGANTAR-PENJEMPUT SISWA TAHUN 2022', NULL, 8, NULL, 2, NULL, 'umum', NULL, '2022-06-23', NULL, 'Prosedur Penjemputan dan Pengantaran Siswa pada Masa Pandemi Covid-19', NULL, 'Prosedur_Antar-Jemput Siswa_2022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(23, 'Insert', 'PRO7', 'STANDAR OPERASIONAL PROSEDUR PEMANTAUAN DAN PELAPORAN KESEHATAN WARGA SEKOLAH SELAMA PANDEMI COVID-19 TAHUN 2020', NULL, 9, NULL, 7, NULL, 'umum', NULL, '2020-05-13', NULL, 'Prosedur Pemantaun dan Pelaporan Warga Sekolah pada Masa Pandemi Covid-19', NULL, 'Prosedur_Pemantauan dan Pelaporan Kesehatan_2020.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(24, 'Insert', 'PRO8', 'STANDAR OPERASIONAL PROSEDUR PEMANTAUAN DAN PELAPORAN KESEHATAN WARGA SEKOLAH SELAMA PANDEMI COVID-19 TAHUN 2021', NULL, 9, NULL, 7, NULL, 'umum', NULL, '2021-07-03', NULL, 'Prosedur Pemantaun dan Pelaporan Warga Sekolah pada Masa Pandemi Covid-19', NULL, 'Prosedur_Pemantauan dan Pelaporan Kesehatan_2021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(25, 'Insert', 'PRO9', 'STANDAR OPERASIONAL PROSEDUR PEMANTAUAN DAN PELAPORAN KESEHATAN WARGA SEKOLAH SELAMA PANDEMI COVID-19 TAHUN 2022', NULL, 9, NULL, 7, NULL, 'umum', NULL, '2022-07-07', NULL, 'Prosedur Pemantaun dan Pelaporan Warga Sekolah pada Masa Pandemi Covid-19\r\n', NULL, 'Prosedur_Pemantauan dan Pelaporan Kesehatan_2022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(26, 'Insert', 'ROS1', 'Roster Mengajar Semester Ganjil Tahun Ajaran 2021/2022', NULL, 5, NULL, 3, NULL, 'umum', NULL, '2021-06-01', NULL, 'Roster Mengajar Semester Ganjil Tahun Ajaran 2021/2022', NULL, 'Roster Mengajar_Ganjil_2021-2022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(27, 'Insert', 'ROS2', 'Roster Mengajar Semester Ganjil Tahun Ajaran 2020/2021', NULL, 5, NULL, 3, NULL, 'umum', NULL, '2020-06-01', NULL, 'Roster Mengajar Semester Ganjil Tahun Ajaran 2020/2021', NULL, 'Roster Mengajar_Ganjil_2020-2021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(28, 'Insert', 'ROS3', 'Roster Mengajar Semester Ganjil Tahun Ajaran 2019/2020', NULL, 5, NULL, 3, NULL, 'umum', NULL, '2019-06-01', NULL, 'Roster Mengajar Semester Ganjil Tahun Ajaran 2019/2020', NULL, 'Roster Mengajar_Ganjil_2019-2020.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(29, 'Insert', 'ROS4', 'Roster Mengajar Semester Genap Tahun Ajaran 2019/2020\r\n', NULL, 6, NULL, 3, NULL, 'umum', NULL, '2020-01-01', NULL, 'Roster Mengajar Semester Genap Tahun Ajaran 2019/2020', NULL, 'Roster Mengajar_Genap_2019-2020.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(30, 'Insert', 'ROS5', 'Roster Mengajar Semester Genap Tahun Ajaran 2020/2021\r\n', NULL, 6, NULL, 3, NULL, 'umum', NULL, '2021-01-01', NULL, 'Roster Mengajar Semester Genap Tahun Ajaran 2021/2022\r\n', NULL, 'Roster Mengajar_Genap_2020-2021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(31, 'Insert', 'ROS6', 'Roster Mengajar Semester Genap Tahun Ajaran 2021/2022\r\n', NULL, 6, NULL, 3, NULL, 'umum', NULL, '2022-01-01', NULL, 'Roster Mengajar Semester Genap Tahun Ajaran 2021/2022\r\n', NULL, 'Roster Mengajar_Genap_2021-2022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(32, 'Insert', 'DAT10/3', 'edsad', NULL, 8, NULL, 2, NULL, 'rahasia', NULL, '2021-01-01', NULL, 'sdadad', NULL, '13052022_120342_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', NULL, '2022-05-13 12:03:43', '2022-05-13 12:03:43'),
(33, 'Update', 'DAT10/3', 'edsad', 'edsad', 8, 8, 2, 2, 'umum', 'rahasia', '2021-01-01', '2021-01-01', 'sdadad', 'sdadad', '13052022_120342_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', '13052022_120342_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', '2022-05-13 12:03:59', '2022-05-13 12:03:59'),
(34, 'Delete', 'DAT10/3', NULL, 'edsad', NULL, 8, NULL, 2, NULL, 'umum', NULL, '2021-01-01', NULL, 'sdadad', NULL, '13052022_120342_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', '2022-05-13 12:04:17', '2022-05-13 12:04:17'),
(35, 'Update', 'DAT1', 'Nama Siswa Baru TP 2021-2022', 'Nama Siswa Baru TP 2021-2022', 10, 10, 1, 1, 'umum', 'umum', '2021-06-23', '2021-06-23', 'Nama Siswa Baru TP 2021-2022', 'Nama Siswa Baru TP 2021-2022', 'Data_Siswa Baru_2021-2022.pdf', 'Data_Siswa Baru_2021-2022.pdf', '2022-05-13 12:19:41', '2022-05-13 12:19:41'),
(36, 'Update', 'DAT1', 'Nama Siswa Baru TP 2021-2022', 'Nama Siswa Baru TP 2021-2022', 10, 10, 1, 1, 'rahasia', 'umum', '2021-06-23', '2021-06-23', 'Nama Siswa Baru TP 2021-2022', 'Nama Siswa Baru TP 2021-2022', 'Data_Siswa Baru_2021-2022.pdf', 'Data_Siswa Baru_2021-2022.pdf', '2022-05-13 15:12:37', '2022-05-13 15:12:37'),
(37, 'Update', 'DAT1', 'Nama Siswa Baru TP 2021-2022', 'Nama Siswa Baru TP 2021-2022', 10, 10, 1, 1, 'umum', 'rahasia', '2021-06-23', '2021-06-23', 'Nama Siswa Baru TP 2021-2022', 'Nama Siswa Baru TP 2021-2022', 'Data_Siswa Baru_2021-2022.pdf', 'Data_Siswa Baru_2021-2022.pdf', '2022-05-13 15:12:46', '2022-05-13 15:12:46');

--
-- Triggers `log_documents`
--
DELIMITER $$
CREATE TRIGGER `janganHapusDokumen` BEFORE DELETE ON `log_documents` FOR EACH ROW SIGNAL SQLSTATE 'U0041'
SET MESSAGE_TEXT = 'Log Transaksi Tidak Boleh Dihapus'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `janganUpdateDokumen` BEFORE UPDATE ON `log_documents` FOR EACH ROW SIGNAL SQLSTATE 'U0040'
SET MESSAGE_TEXT = 'Log Transaksi Tidak Boleh Diubah'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_inmails`
--

CREATE TABLE `log_inmails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_transaksi` enum('Insert','Update','Delete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_surat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_jenis_surat` bigint(20) UNSIGNED DEFAULT NULL,
  `old_jenis_surat` bigint(20) UNSIGNED DEFAULT NULL,
  `new_bagian` bigint(20) UNSIGNED DEFAULT NULL,
  `old_bagian` bigint(20) UNSIGNED DEFAULT NULL,
  `new_tanggal_masuk` date DEFAULT NULL,
  `old_tanggal_masuk` date DEFAULT NULL,
  `new_perihal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_perihal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_disposisi` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_disposisi` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_pokok_masalah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_pokok_masalah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_file_surat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_file_surat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_inmails`
--

INSERT INTO `log_inmails` (`id`, `jenis_transaksi`, `no_surat`, `new_jenis_surat`, `old_jenis_surat`, `new_bagian`, `old_bagian`, `new_tanggal_masuk`, `old_tanggal_masuk`, `new_perihal`, `old_perihal`, `new_disposisi`, `old_disposisi`, `new_pokok_masalah`, `old_pokok_masalah`, `new_status`, `old_status`, `new_file_surat`, `old_file_surat`, `created_at`, `updated_at`) VALUES
(1, 'Insert', '01/01/SMA-IM/2021', 2, NULL, 1, NULL, '2021-03-08', NULL, 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', NULL, 'Y', NULL, 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', NULL, 'read', NULL, 'Surat Undangan_08032021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(2, 'Insert', '01/bnn-s/1/2022', 3, NULL, 2, NULL, '2022-01-03', NULL, 'Permohonan mengadakan seminar oleh BNN ', NULL, 'Y', NULL, 'Oleh karena bertambahnya kasus pemakaian narkoba di kalangan remaja, BNN meminta izn untuk mengadakan seminar', NULL, 'read', NULL, 'Surat Permohonan Mengadakan Seminar_03012022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(3, 'Insert', '01/DPK-P/1/2021', 5, NULL, 2, NULL, '2021-08-16', NULL, 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-76', NULL, 'Y', NULL, 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-76', NULL, 'unread', NULL, 'Surat Perintah_16082021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(4, 'Insert', '02/02/SMA-IF/2021', 2, NULL, 1, NULL, '2021-05-24', NULL, 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', NULL, 'Y', NULL, 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', NULL, 'unread', NULL, 'Surat Undangan_25052021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(5, 'Insert', '02/DPK-P/2/2020', 5, NULL, 2, NULL, '2020-08-16', NULL, 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-75', NULL, 'Y', NULL, 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-75', NULL, 'unread', NULL, 'Surat Perintah_16082020.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(6, 'Insert', '02/mo-s/1/2022', 3, NULL, 2, NULL, '2022-01-10', NULL, 'Permohonan Mengadakan Seminar oleh Malikussaleh Operation', NULL, 'Y', NULL, 'Berhubungan sudah dekatnya waktu UN, Malikussaleh Operation meminta izin untuk mengadakan seminar terkait UN', NULL, 'unread', NULL, 'Surat Permohonan Mengadakan Seminar_1001022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(7, 'Insert', '03/03/SMA-IA/2021', 2, NULL, 1, NULL, '2021-07-19', NULL, 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', NULL, 'Y', NULL, 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', NULL, 'unread', NULL, 'Surat Undangan_19072021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(8, 'Insert', '03/DPK-P/3/2019', 5, NULL, 2, NULL, '2019-08-16', NULL, 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-74', NULL, 'Y', NULL, 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-74', NULL, 'unread', NULL, 'Surat Perintah_16082019.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(9, 'Insert', '03/qy-s/1/2022', 3, NULL, 2, NULL, '2022-01-17', NULL, 'Permohonan Mengadakan Seminar oleh Quippy', NULL, 'Y', NULL, 'Berhubungan sudah dekatnya waktu UN, Quippy meminta izin untuk mengadakan seminar terkait menghadapi UN', NULL, 'unread', NULL, 'Surat Permohonan Mengadakan Seminar_17012022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(10, 'Insert', '04/04/SMA-TH/2021', 2, NULL, 1, NULL, '2021-09-08', NULL, 'Undangan untuk menghadari Acara Peringatan Tahun Baru Hijiah 1443 H di SMA Negeri 2 Lhokseumawe', NULL, 'Y', NULL, 'Undangan untuk menghadari Acara Peringatan Tahun Baru Hijiah 1443 H di SMA Negeri 2 Lhokseumawe', NULL, 'unread', NULL, 'Surat Undangan_08092021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(11, 'Insert', '04/DPK-P/4/2018', 5, NULL, 2, NULL, '2018-08-16', NULL, 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-73', NULL, 'Y', NULL, 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-76', NULL, 'unread', NULL, 'Surat Perintah_16082018.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(12, 'Insert', '04/rb-s/4/2022	', 3, NULL, 2, NULL, '2022-01-24', NULL, 'Permohonan Mengadakan Seminar oleh Ruang Belajar', NULL, 'Y', NULL, 'Berhubungan sudah dekatnya waktu UN, Ruang Belajar meminta izin untuk mengadakan seminar terkait UN', NULL, 'unread', NULL, 'Surat Permohonan Mengadakan Seminar_24012022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(13, 'Insert', '05/05/SMA-TH/2021', 2, NULL, 1, NULL, '2021-10-18', NULL, 'Undangan untuk menghadari Acara Peringatan Maulid Nabi Muhammad SAW di SMA Negeri 2 Lhokseumawe', NULL, 'Y', NULL, 'Undangan untuk menghadari Acara Peringatan Maulid Nabi Muhammad SAW di SMA Negeri 2 Lhokseumawe', NULL, 'unread', NULL, 'Surat Undangan_18102021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(14, 'Insert', '05/ce-s/5/2022', 3, NULL, 2, NULL, '2022-02-03', NULL, 'Permohonan Mengadakan Seminar oleh Ruang Belajar', NULL, 'Y', NULL, 'Berhubungan sudah dekatnya waktu UN, Ruang Belajar meminta izin untuk mengadakan seminar terkait UN', NULL, 'unread', NULL, 'Surat Permohonan Mengadakan Seminar_03022022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(15, 'Insert', '05/DPK-P/5/2017', 5, NULL, 2, NULL, '2017-08-16', NULL, 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-72', NULL, 'Y', NULL, 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-72', NULL, 'unread', NULL, 'Surat Perintah_16082017.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(16, 'Insert', '06/DPK-P/6/2016', 5, NULL, 2, NULL, '2016-08-16', NULL, 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-71', NULL, 'Y', NULL, 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-71', NULL, 'unread', NULL, 'Surat Perintah_16082016.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(17, 'Insert', '06/us-s/6/2022', 3, NULL, 2, NULL, '2022-02-10', NULL, 'Permohonan Mengadakan Seminar oleh Unsyiah', NULL, 'Y', NULL, 'Berhubungan sudah dekatnya waktu SNMPT, UNSYIAH meminta izin untuk mengadakan seminar terkait sosialisasi kampus', NULL, 'unread', NULL, 'Surat Permohonan Mengadakan Seminar_1002022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(18, 'Insert', '07/DPK-PH/7/2021', 5, NULL, 2, NULL, '2021-08-07', NULL, 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1443 H', NULL, 'Y', NULL, 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1443 H', NULL, 'unread', NULL, 'Surat Perintah_07082021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(19, 'Insert', '08/DPK-PH/8/2020', 5, NULL, 2, NULL, '2021-08-20', NULL, 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1442 H', NULL, 'Y', NULL, 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1442 H', NULL, 'unread', NULL, 'Surat Perintah_20082020.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(20, 'Insert', '09/DPK-PH/9/2019', 5, NULL, 2, NULL, '2019-08-25', NULL, 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1441 H', NULL, 'Y', NULL, 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1441 H', NULL, 'unread', NULL, 'Surat Perintah_25082019.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(21, 'Insert', '1/panpel-cc/2/2022', 3, NULL, 2, NULL, '2022-01-01', NULL, 'Surat Pemberitahuan untuk Ikut Serta Kegiatan Cerdas Cermat', NULL, 'Y', NULL, 'Permintaan perwakilan dari siswa untuk mengikuti kegiatan cerdas cermat', NULL, 'unread', NULL, 'Surat Permohonan Mengikuti Kegiatan_01012022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(22, 'Insert', '10/DPK-PH/10/2018', 5, NULL, 2, NULL, '2018-09-02', NULL, 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1440 H', NULL, 'Y', NULL, 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1440 H', NULL, 'unread', NULL, 'Surat Perintah_02092018.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(23, 'Insert', '11/DPK-PH/11/2017', 5, NULL, 2, NULL, '2017-09-15', NULL, 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1439 H', NULL, 'Y', NULL, 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1439 H', NULL, 'unread', NULL, 'Surat Perintah_15092017.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(24, 'Insert', '12/DPK-PH/12/2016', 5, NULL, 2, NULL, '2016-09-27', NULL, 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1438 H', NULL, 'Y', NULL, 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1438 H', NULL, 'unread', NULL, 'Surat Perintah_29092016.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(25, 'Insert', '2/panpel-kt/2/2022', 3, NULL, 2, NULL, '2022-01-08', NULL, 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Karya Tulis Ilmiah di SMA Negeri 2 Lhokseumawe', NULL, 'Y', NULL, 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Karya Tulis Ilmiah di SMA Negeri 2 Lhokseumawe', NULL, 'unread', NULL, 'Surat Permohonan Mengikuti Kegiatan_08012022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(26, 'Insert', '3/panpel-kt/3/2022', 3, NULL, 2, NULL, '2022-01-15', NULL, 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Debat Bahasa Inggris yang diadakan oleh SMA Negerei 2 Lhokseumawe', NULL, 'Y', NULL, 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Debat Bahasa Inggris di SMA Negeri 2 Lhokseumawe', NULL, 'unread', NULL, 'Surat Permohonan Mengikuti Kegiatan_15012022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(27, 'Insert', '4/panpel-po/4/2022', 3, NULL, 2, NULL, '2022-08-16', NULL, 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Pekan Olah Raga di SMA Negeri 2 Lhokseumawe', NULL, 'Y', NULL, 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Pekan Olah Raga di SMA Negeri 2 Lhokseumawe', NULL, 'unread', NULL, 'Surat Permohonan Mengikuti Kegiatan_16082022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(28, 'Insert', '5/panpel-bp/5/2022', 3, NULL, 2, NULL, '2022-02-01', NULL, 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Baca Puisi di SMA Negeri 2 Lhokseumawe', NULL, 'T', NULL, 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Baca Puisi di SMA Negeri 2 Lhokseumawe', NULL, 'unread', NULL, 'Surat Permohonan Mengikuti Kegiatan_01022022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(29, 'Insert', '6/panpel-gd/6/2022', 3, NULL, 4, NULL, '2022-02-08', NULL, 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Gathering Day di SMA Negeri 2 Lhookseumawe', NULL, 'T', NULL, 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Gathering Day di SMA Negeri 2 Lhookseumawe', NULL, 'unread', NULL, 'Surat Permohonan Mengikuti Kegiatan_08022022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(30, 'Insert', '7/panpel-lp/6/2022', 3, NULL, 2, NULL, '2022-02-15', NULL, 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Pidato di SMA Negeri 2 Lhokseumawe', NULL, 'Y', NULL, 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Pidato di SMA Negeri 2 Lhokseumawe', NULL, 'unread', NULL, 'Surat Permohonan Mengikuti Kegiatan_15022022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(31, 'Update', '01/01/SMA-IM/2021', 2, 2, 1, 1, '2021-03-08', '2021-03-08', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'Y', 'Y', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'read', 'read', 'Surat Undangan_08032021.pdf', 'Surat Undangan_08032021.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(32, 'Update', '01/bnn-s/1/2022', 3, 3, 2, 2, '2022-01-03', '2022-01-03', 'Permohonan mengadakan seminar oleh BNN ', 'Permohonan mengadakan seminar oleh BNN ', 'Y', 'Y', 'Oleh karena bertambahnya kasus pemakaian narkoba di kalangan remaja, BNN meminta izn untuk mengadakan seminar', 'Oleh karena bertambahnya kasus pemakaian narkoba di kalangan remaja, BNN meminta izn untuk mengadakan seminar', 'read', 'read', 'Surat Permohonan Mengadakan Seminar_03012022.pdf', 'Surat Permohonan Mengadakan Seminar_03012022.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(33, 'Update', '01/DPK-P/1/2021', 5, 5, 2, 2, '2021-08-16', '2021-08-16', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-76', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-76', 'Y', 'Y', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-76', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-76', 'unread', 'unread', 'Surat Perintah_16082021.pdf', 'Surat Perintah_16082021.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(34, 'Update', '02/02/SMA-IF/2021', 2, 2, 1, 1, '2021-05-24', '2021-05-24', 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', 'Y', 'Y', 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', 'unread', 'unread', 'Surat Undangan_25052021.pdf', 'Surat Undangan_25052021.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(35, 'Update', '02/DPK-P/2/2020', 5, 5, 2, 2, '2020-08-16', '2020-08-16', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-75', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-75', 'Y', 'Y', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-75', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-75', 'unread', 'unread', 'Surat Perintah_16082020.pdf', 'Surat Perintah_16082020.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(36, 'Update', '02/mo-s/1/2022', 3, 3, 2, 2, '2022-01-10', '2022-01-10', 'Permohonan Mengadakan Seminar oleh Malikussaleh Operation', 'Permohonan Mengadakan Seminar oleh Malikussaleh Operation', 'Y', 'Y', 'Berhubungan sudah dekatnya waktu UN, Malikussaleh Operation meminta izin untuk mengadakan seminar terkait UN', 'Berhubungan sudah dekatnya waktu UN, Malikussaleh Operation meminta izin untuk mengadakan seminar terkait UN', 'unread', 'unread', 'Surat Permohonan Mengadakan Seminar_1001022.pdf', 'Surat Permohonan Mengadakan Seminar_1001022.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(37, 'Update', '03/03/SMA-IA/2021', 2, 2, 1, 1, '2021-07-19', '2021-07-19', 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', 'Y', 'Y', 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', 'Undangan untuk menghadari Acara Halal Bihalal di SMA Negeri 2 Lhokseumawe', 'unread', 'unread', 'Surat Undangan_19072021.pdf', 'Surat Undangan_19072021.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(38, 'Update', '03/DPK-P/3/2019', 5, 5, 2, 2, '2019-08-16', '2019-08-16', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-74', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-74', 'Y', 'Y', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-74', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-74', 'unread', 'unread', 'Surat Perintah_16082019.pdf', 'Surat Perintah_16082019.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(39, 'Update', '03/qy-s/1/2022', 3, 3, 2, 2, '2022-01-17', '2022-01-17', 'Permohonan Mengadakan Seminar oleh Quippy', 'Permohonan Mengadakan Seminar oleh Quippy', 'Y', 'Y', 'Berhubungan sudah dekatnya waktu UN, Quippy meminta izin untuk mengadakan seminar terkait menghadapi UN', 'Berhubungan sudah dekatnya waktu UN, Quippy meminta izin untuk mengadakan seminar terkait menghadapi UN', 'unread', 'unread', 'Surat Permohonan Mengadakan Seminar_17012022.pdf', 'Surat Permohonan Mengadakan Seminar_17012022.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(40, 'Update', '04/04/SMA-TH/2021', 2, 2, 1, 1, '2021-09-08', '2021-09-08', 'Undangan untuk menghadari Acara Peringatan Tahun Baru Hijiah 1443 H di SMA Negeri 2 Lhokseumawe', 'Undangan untuk menghadari Acara Peringatan Tahun Baru Hijiah 1443 H di SMA Negeri 2 Lhokseumawe', 'Y', 'Y', 'Undangan untuk menghadari Acara Peringatan Tahun Baru Hijiah 1443 H di SMA Negeri 2 Lhokseumawe', 'Undangan untuk menghadari Acara Peringatan Tahun Baru Hijiah 1443 H di SMA Negeri 2 Lhokseumawe', 'unread', 'unread', 'Surat Undangan_08092021.pdf', 'Surat Undangan_08092021.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(41, 'Update', '04/DPK-P/4/2018', 5, 5, 2, 2, '2018-08-16', '2018-08-16', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-73', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-73', 'Y', 'Y', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-76', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-76', 'unread', 'unread', 'Surat Perintah_16082018.pdf', 'Surat Perintah_16082018.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(42, 'Update', '04/rb-s/4/2022	', 3, 3, 2, 2, '2022-01-24', '2022-01-24', 'Permohonan Mengadakan Seminar oleh Ruang Belajar', 'Permohonan Mengadakan Seminar oleh Ruang Belajar', 'Y', 'Y', 'Berhubungan sudah dekatnya waktu UN, Ruang Belajar meminta izin untuk mengadakan seminar terkait UN', 'Berhubungan sudah dekatnya waktu UN, Ruang Belajar meminta izin untuk mengadakan seminar terkait UN', 'unread', 'unread', 'Surat Permohonan Mengadakan Seminar_24012022.pdf', 'Surat Permohonan Mengadakan Seminar_24012022.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(43, 'Update', '05/05/SMA-TH/2021', 2, 2, 1, 1, '2021-10-18', '2021-10-18', 'Undangan untuk menghadari Acara Peringatan Maulid Nabi Muhammad SAW di SMA Negeri 2 Lhokseumawe', 'Undangan untuk menghadari Acara Peringatan Maulid Nabi Muhammad SAW di SMA Negeri 2 Lhokseumawe', 'Y', 'Y', 'Undangan untuk menghadari Acara Peringatan Maulid Nabi Muhammad SAW di SMA Negeri 2 Lhokseumawe', 'Undangan untuk menghadari Acara Peringatan Maulid Nabi Muhammad SAW di SMA Negeri 2 Lhokseumawe', 'unread', 'unread', 'Surat Undangan_18102021.pdf', 'Surat Undangan_18102021.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(44, 'Update', '05/ce-s/5/2022', 3, 3, 2, 2, '2022-02-03', '2022-02-03', 'Permohonan Mengadakan Seminar oleh Ruang Belajar', 'Permohonan Mengadakan Seminar oleh Ruang Belajar', 'Y', 'Y', 'Berhubungan sudah dekatnya waktu UN, Ruang Belajar meminta izin untuk mengadakan seminar terkait UN', 'Berhubungan sudah dekatnya waktu UN, Ruang Belajar meminta izin untuk mengadakan seminar terkait UN', 'unread', 'unread', 'Surat Permohonan Mengadakan Seminar_03022022.pdf', 'Surat Permohonan Mengadakan Seminar_03022022.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(45, 'Update', '05/DPK-P/5/2017', 5, 5, 2, 2, '2017-08-16', '2017-08-16', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-72', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-72', 'Y', 'Y', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-72', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-72', 'unread', 'unread', 'Surat Perintah_16082017.pdf', 'Surat Perintah_16082017.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(46, 'Update', '06/DPK-P/6/2016', 5, 5, 2, 2, '2016-08-16', '2016-08-16', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-71', 'Surat Perintah Memeriahkan Kegiatan Pawai dalam Rangka HUT RI ke-71', 'Y', 'Y', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-71', 'Meminta Perwakilan sebanyak 60 siswa/i untuk memeriahkan kegiatan Pawai dalam Rangka HUT RI ke-71', 'unread', 'unread', 'Surat Perintah_16082016.pdf', 'Surat Perintah_16082016.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(47, 'Update', '06/us-s/6/2022', 3, 3, 2, 2, '2022-02-10', '2022-02-10', 'Permohonan Mengadakan Seminar oleh Unsyiah', 'Permohonan Mengadakan Seminar oleh Unsyiah', 'Y', 'Y', 'Berhubungan sudah dekatnya waktu SNMPT, UNSYIAH meminta izin untuk mengadakan seminar terkait sosialisasi kampus', 'Berhubungan sudah dekatnya waktu SNMPT, UNSYIAH meminta izin untuk mengadakan seminar terkait sosialisasi kampus', 'unread', 'unread', 'Surat Permohonan Mengadakan Seminar_1002022.pdf', 'Surat Permohonan Mengadakan Seminar_1002022.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(48, 'Update', '07/DPK-PH/7/2021', 5, 5, 2, 2, '2021-08-07', '2021-08-07', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1443 H', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1443 H', 'Y', 'Y', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1443 H', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1443 H', 'unread', 'unread', 'Surat Perintah_07082021.pdf', 'Surat Perintah_07082021.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(49, 'Update', '08/DPK-PH/8/2020', 5, 5, 2, 2, '2021-08-20', '2021-08-20', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1442 H', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1442 H', 'Y', 'Y', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1442 H', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1442 H', 'unread', 'unread', 'Surat Perintah_20082020.pdf', 'Surat Perintah_20082020.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(50, 'Update', '09/DPK-PH/9/2019', 5, 5, 2, 2, '2019-08-25', '2019-08-25', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1441 H', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1441 H', 'Y', 'Y', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1441 H', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1441 H', 'unread', 'unread', 'Surat Perintah_25082019.pdf', 'Surat Perintah_25082019.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(51, 'Update', '1/panpel-cc/2/2022', 3, 3, 2, 2, '2022-01-01', '2022-01-01', 'Surat Pemberitahuan untuk Ikut Serta Kegiatan Cerdas Cermat', 'Surat Pemberitahuan untuk Ikut Serta Kegiatan Cerdas Cermat', 'Y', 'Y', 'Permintaan perwakilan dari siswa untuk mengikuti kegiatan cerdas cermat', 'Permintaan perwakilan dari siswa untuk mengikuti kegiatan cerdas cermat', 'unread', 'unread', 'Surat Permohonan Mengikuti Kegiatan_01012022.pdf', 'Surat Permohonan Mengikuti Kegiatan_01012022.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(52, 'Update', '10/DPK-PH/10/2018', 5, 5, 2, 2, '2018-09-02', '2018-09-02', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1440 H', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1440 H', 'Y', 'Y', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1440 H', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1440 H', 'unread', 'unread', 'Surat Perintah_02092018.pdf', 'Surat Perintah_02092018.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(53, 'Update', '11/DPK-PH/11/2017', 5, 5, 2, 2, '2017-09-15', '2017-09-15', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1439 H', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1439 H', 'Y', 'Y', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1439 H', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1439 H', 'unread', 'unread', 'Surat Perintah_15092017.pdf', 'Surat Perintah_15092017.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(54, 'Update', '12/DPK-PH/12/2016', 5, 5, 2, 2, '2016-09-27', '2016-09-27', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1438 H', 'Surat Perintah Memeriahkan Kegiatan Pawai Obor dalam Rangka Tahun Baru 1438 H', 'Y', 'Y', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1438 H', 'Meminta Perwakilan sebanyak 40 siswa/i untuk memeriahkan kegiatan Pawai Obor dalam Rangka Tahun Baru 1438 H', 'unread', 'unread', 'Surat Perintah_29092016.pdf', 'Surat Perintah_29092016.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(55, 'Update', '2/panpel-kt/2/2022', 3, 3, 2, 2, '2022-01-08', '2022-01-08', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Karya Tulis Ilmiah di SMA Negeri 2 Lhokseumawe', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Karya Tulis Ilmiah di SMA Negeri 2 Lhokseumawe', 'Y', 'Y', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Karya Tulis Ilmiah di SMA Negeri 2 Lhokseumawe', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Karya Tulis Ilmiah di SMA Negeri 2 Lhokseumawe', 'unread', 'unread', 'Surat Permohonan Mengikuti Kegiatan_08012022.pdf', 'Surat Permohonan Mengikuti Kegiatan_08012022.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(56, 'Update', '3/panpel-kt/3/2022', 3, 3, 2, 2, '2022-01-15', '2022-01-15', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Debat Bahasa Inggris yang diadakan oleh SMA Negerei 2 Lhokseumawe', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Debat Bahasa Inggris yang diadakan oleh SMA Negerei 2 Lhokseumawe', 'Y', 'Y', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Debat Bahasa Inggris di SMA Negeri 2 Lhokseumawe', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Debat Bahasa Inggris di SMA Negeri 2 Lhokseumawe', 'unread', 'unread', 'Surat Permohonan Mengikuti Kegiatan_15012022.pdf', 'Surat Permohonan Mengikuti Kegiatan_15012022.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(57, 'Update', '4/panpel-po/4/2022', 3, 3, 2, 2, '2022-08-16', '2022-08-16', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Pekan Olah Raga di SMA Negeri 2 Lhokseumawe', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Pekan Olah Raga di SMA Negeri 2 Lhokseumawe', 'Y', 'Y', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Pekan Olah Raga di SMA Negeri 2 Lhokseumawe', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Pekan Olah Raga di SMA Negeri 2 Lhokseumawe', 'unread', 'unread', 'Surat Permohonan Mengikuti Kegiatan_16082022.pdf', 'Surat Permohonan Mengikuti Kegiatan_16082022.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(58, 'Update', '7/panpel-lp/6/2022', 3, 3, 2, 2, '2022-02-15', '2022-02-15', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Pidato di SMA Negeri 2 Lhokseumawe', 'Surat Permohonan untuk Ikut Serta Mengikuti Kegiatan Lomba Pidato di SMA Negeri 2 Lhokseumawe', 'Y', 'Y', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Pidato di SMA Negeri 2 Lhokseumawe', 'Permintaan untuk mengirimkan perwakilan siswa untuk mengikuti Lomba Pidato di SMA Negeri 2 Lhokseumawe', 'unread', 'unread', 'Surat Permohonan Mengikuti Kegiatan_15022022.pdf', 'Surat Permohonan Mengikuti Kegiatan_15022022.pdf', '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(59, 'Insert', 'try/12', 3, NULL, 3, NULL, '2021-02-02', NULL, 'dsad', NULL, 'T', NULL, 'adadads', NULL, 'unread', NULL, '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', NULL, '2022-05-13 12:04:50', '2022-05-13 12:04:50'),
(60, 'Update', 'try/12', 3, 3, 3, 3, '2021-02-02', '2021-02-02', 'dsad', 'dsad', 'Y', 'T', 'adadads', 'adadads', 'unread', 'unread', '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', '2022-05-13 12:05:02', '2022-05-13 12:05:02'),
(61, 'Update', 'try/12', 3, 3, 3, 3, '2021-02-02', '2021-02-02', 'dsad', 'dsad', 'Y', 'Y', 'adadads', 'adadads', 'read', 'unread', '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', '2022-05-13 12:05:12', '2022-05-13 12:05:12'),
(62, 'Update', 'try/12', 3, 3, 3, 3, '2021-02-02', '2021-02-02', 'dsad', 'dsad', 'Y', 'Y', 'adadads', 'adadads', 'unread', 'read', '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', '2022-05-13 12:10:11', '2022-05-13 12:10:11'),
(63, 'Update', 'try/12', 3, 3, 3, 3, '2021-02-02', '2021-02-02', 'dsad', 'dsad', 'Y', 'Y', 'adadads', 'adadads', 'read', 'unread', '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', '2022-05-13 12:10:15', '2022-05-13 12:10:15'),
(64, 'Update', 'try/12', 3, 3, 3, 3, '2021-02-02', '2021-02-02', 'dsad', 'dsad', 'T', 'Y', 'adadads', 'adadads', 'read', 'read', '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', '2022-05-13 12:11:19', '2022-05-13 12:11:19'),
(65, 'Update', 'try/12', 3, 3, 3, 3, '2021-02-02', '2021-02-02', 'dsads', 'dsad', 'T', 'T', 'adadads', 'adadads', 'read', 'read', '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', '2022-05-13 12:11:31', '2022-05-13 12:11:31'),
(66, 'Delete', 'try/12', NULL, 3, NULL, 3, NULL, '2021-02-02', NULL, 'dsads', NULL, 'T', NULL, 'adadads', NULL, 'read', NULL, '13052022_120450_201402052_LevinaGunawan_Tugas1.pdf', '2022-05-13 12:11:42', '2022-05-13 12:11:42'),
(67, 'Insert', '2313', 1, NULL, 1, NULL, '2021-01-01', NULL, 'wsa', NULL, 'T', NULL, 's', NULL, 'unread', NULL, '13052022_121202_201402052_LevinaGunawan_uts_komA.pdf', NULL, '2022-05-13 12:12:02', '2022-05-13 12:12:02'),
(68, 'Delete', '2313', NULL, 1, NULL, 1, NULL, '2021-01-01', NULL, 'wsa', NULL, 'T', NULL, 's', NULL, 'unread', NULL, '13052022_121202_201402052_LevinaGunawan_uts_komA.pdf', '2022-05-13 12:12:31', '2022-05-13 12:12:31'),
(69, 'Update', '01/01/SMA-IM/2021', 2, 2, 1, 1, '2021-03-08', '2021-03-08', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'Y', 'Y', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'read', 'read', 'Surat Undangan_08032021.pdf', 'Surat Undangan_08032021.pdf', '2022-05-13 14:04:53', '2022-05-13 14:04:53'),
(70, 'Insert', '1212/ww', 1, NULL, 1, NULL, '2021-01-01', NULL, 'wddwa', NULL, 'T', NULL, 'wdwdad', NULL, 'unread', NULL, '13052022_141532_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', NULL, '2022-05-13 14:15:32', '2022-05-13 14:15:32'),
(71, 'Update', '1212/ww', 1, 1, 1, 1, '2021-01-01', '2021-01-01', 'wddwa', 'wddwa', 'Y', 'T', 'wdwdad', 'wdwdad', 'unread', 'unread', '13052022_141532_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', '13052022_141532_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', '2022-05-13 14:15:51', '2022-05-13 14:15:51'),
(72, 'Update', '1212/ww', 1, 1, 1, 1, '2021-01-01', '2021-01-01', 'wddwa', 'wddwa', 'T', 'Y', 'wdwdad', 'wdwdad', 'unread', 'unread', '13052022_141532_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', '13052022_141532_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', '2022-05-13 14:16:45', '2022-05-13 14:16:45'),
(73, 'Update', '1212/ww', 1, 1, 1, 1, '2021-01-01', '2021-01-01', 'wddwa', 'wddwa', 'T', 'T', 'wdwdad', 'wdwdad', 'read', 'unread', '13052022_141532_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', '13052022_141532_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', '2022-05-13 14:16:48', '2022-05-13 14:16:48'),
(74, 'Delete', '1212/ww', NULL, 1, NULL, 1, NULL, '2021-01-01', NULL, 'wddwa', NULL, 'T', NULL, 'wdwdad', NULL, 'read', NULL, '13052022_141532_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', '2022-05-13 14:16:56', '2022-05-13 14:16:56'),
(75, 'Update', '01/01/SMA-IM/2021', 2, 2, 1, 1, '2021-03-08', '2021-03-08', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'Y', 'Y', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'Undangan Menghadiri Acara Memperingati Acara Isra\' Mi\'raj', 'read', 'read', 'Surat Undangan_08032021.pdf', 'Surat Undangan_08032021.pdf', '2022-05-13 14:49:47', '2022-05-13 14:49:47');

--
-- Triggers `log_inmails`
--
DELIMITER $$
CREATE TRIGGER `janganHapusInmail` BEFORE DELETE ON `log_inmails` FOR EACH ROW SIGNAL SQLSTATE 'U0041'
SET MESSAGE_TEXT = 'Log Transaksi Tidak Boleh Dihapus'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `janganUpdateInmail` BEFORE UPDATE ON `log_inmails` FOR EACH ROW SIGNAL SQLSTATE 'U0040'
SET MESSAGE_TEXT = 'Log Transaksi Tidak Boleh Diubah'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_outmails`
--

CREATE TABLE `log_outmails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_transaksi` enum('Insert','Update','Delete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_surat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_jenis_surat` bigint(20) UNSIGNED DEFAULT NULL,
  `old_jenis_surat` bigint(20) UNSIGNED DEFAULT NULL,
  `new_bagian` bigint(20) UNSIGNED DEFAULT NULL,
  `old_bagian` bigint(20) UNSIGNED DEFAULT NULL,
  `new_tanggal_keluar` date DEFAULT NULL,
  `old_tanggal_keluar` date DEFAULT NULL,
  `new_perihal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_perihal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_pokok_masalah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_pokok_masalah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_file_surat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_file_surat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_outmails`
--

INSERT INTO `log_outmails` (`id`, `jenis_transaksi`, `no_surat`, `new_jenis_surat`, `old_jenis_surat`, `new_bagian`, `old_bagian`, `new_tanggal_keluar`, `old_tanggal_keluar`, `new_perihal`, `old_perihal`, `new_pokok_masalah`, `old_pokok_masalah`, `new_status`, `old_status`, `new_file_surat`, `old_file_surat`, `created_at`, `updated_at`) VALUES
(1, 'Insert', ' 025/panpel-gd/2/2021', 3, NULL, 4, NULL, '2021-09-23', NULL, 'Surat Permohonan Pengiriman Utusan Kegiatan Lomba Pidato', NULL, 'Surat Permohonan Pengiriman Utusan Kegiatan Lomba Pidato', NULL, 'unread', NULL, 'Surat Permohonan Mengikuti Kegiatan_25092021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(2, 'Insert', ' R/03/KP.03/VI/2022', 1, NULL, 1, NULL, '2022-05-16', NULL, 'Surat Persetujuan Mengikuti Study Tour', NULL, 'Permintaan izin kepada orang tua untuk mengizinkan siswa mengikuti study tour', NULL, 'unread', NULL, 'Surat Persetujuan Study Tour_18052022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(3, 'Insert', ': R/03/KP.03/VI/2022', 1, NULL, 1, NULL, '2022-09-10', NULL, 'Surat Persetujuan Mengikuti Study Tour', NULL, 'Permintaan izin kepada orang tua untuk mengizinkan siswa mengikuti study tour', NULL, 'unread', NULL, 'Surat Persetujuan Study Tour_14092022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(4, 'Insert', ': R/03/KP.03/VII/2022', 1, NULL, 1, NULL, '2022-07-25', NULL, 'Surat Persetujuan Mengikuti Study Tour', NULL, 'Permintaan izin kepada orang tua untuk mengizinkan siswa mengikuti studt tour', NULL, 'read', NULL, 'Surat Persetujuan Study Tour_27072022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(5, 'Insert', '023/panpel-gd/1/2021', 3, NULL, 4, NULL, '2021-06-23', NULL, 'Surat Permohonan Pengiriman Utusan Kegiatan Gathering Day', NULL, 'Surat Permohonan Pengiriman Utusan Kegiatan Gathering Day', NULL, 'read', NULL, 'Surat Permohonan Mengikuti Kegiatan_25062021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(6, 'Insert', '024/panpel-gd/2/2021', 3, NULL, 4, NULL, '2021-07-06', NULL, 'Surat Permohonan Pengiriman Utusan Kegiatan Cerdas Cermat', NULL, 'Surat Permohonan Pengiriman Utusan Kegiatan Cerdas Cermat', NULL, 'read', NULL, 'Surat Permohonan Mengikuti Kegiatan_080721.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(7, 'Insert', '026/panpel-gd/1/2021', 3, NULL, 4, NULL, '2021-10-11', NULL, 'Surat Permohonan Pengiriman Utusan Lomba Debat Bahasa Inggris', NULL, 'Surat Permohonan Pengiriman Utusan Lomba Debat Bahasa Inggris', NULL, 'unread', NULL, 'Surat Permohonan Mengikuti Kegiatan_111021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(8, 'Insert', '027/panpel-gd/2/2021', 3, NULL, 4, NULL, '2021-11-17', NULL, 'Surat Permohonan Pengiriman Utusan Kegiatan Lomba Membaca Puisi', NULL, 'Surat Permohonan Pengiriman Utusan Kegiatan Lomba Membaca Puisi', NULL, 'unread', NULL, 'Surat Permohonan Mengikuti Kegiatan_191121.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(9, 'Insert', '030/panpel-gd/2/2021', 3, NULL, 4, NULL, '2021-12-08', NULL, 'Surat Permohonan Pengiriman Utusan Kegiatan Lomba Karya Tulis Ilmiah', NULL, 'Surat Permohonan Pengiriman Utusan Kegiatan Lomba Karya Tulis Ilmiah', NULL, 'unread', NULL, 'Surat Permohonan Mengikuti Kegiatan_101221.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(10, 'Insert', '031/panpel-gd/2/2021', 3, NULL, 4, NULL, '2021-07-15', NULL, 'Surat Permohonan Pengiriman Utusan Kegiatan Pekan Olahraga', NULL, 'Dalam rangka memperingati HUT RI ke-76, OSIS SMA Negeri 1 Lhokseumawe menyelenggarakan Pekan Olahraga yang diharapkan diiukuti oleh siswa-siswa dari sekolah lainnya di Kecamatan Banda Sakti', NULL, 'unread', NULL, 'Surat Permohonan Mengikuti Kegiatan_180821.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(11, 'Insert', '040/4/LL/2018', 4, NULL, 2, NULL, '2018-06-08', NULL, 'Surat Pemberitahuan Libur Lebaran 1439 H', NULL, 'Pemberitahuan Libur Lebaran 1439 H', NULL, 'unread', NULL, 'Surat Pemberitahuan Libur Lebaran_08062018.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(12, 'Insert', '0412/432/SMA.IV/2022', 2, NULL, 2, NULL, '2022-01-02', NULL, 'Undangan Sosialisasi Kegiatan Wajib Pramuka untuk Wali Siswa', NULL, 'Sosialisasi ini bertujuan agar wali siswa menyetujui siswa untuk mengikuti kegiatan wajib pramuka', NULL, 'unread', NULL, 'Surat Undangan Sosialisasi_02012022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(13, 'Insert', '042/3/LL/2022', 4, NULL, 2, NULL, '2022-04-27', NULL, 'Pemberitahuan Libur Lebaran 1443 H', NULL, 'Pemberitahuan Libur Lebaran 1443 H', NULL, 'unread', NULL, 'Surat Pemberitahuan Libur Lebaran_27042022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(14, 'Insert', '0425/477/SMA.IV/2021', 2, NULL, 2, NULL, '2021-06-15', NULL, 'Surat Undangan Rapat Siswa Baru', NULL, 'Mensosialisasikan kegiatan sekolah serta pemberitahuan tentang peraturan-peraturan sekolah', NULL, 'read', NULL, 'Surat Undangan Rapat_16012021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(15, 'Insert', '0426/477/SMA.V/2021', 2, NULL, 2, NULL, '2021-02-03', NULL, 'Undangan Rapat Orang Tua Siswa Kelas XI', NULL, 'Rapat mengenai kegiatan study tour siswa kelas XI', NULL, 'unread', NULL, 'Surat Undangan Rapat_05022021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(16, 'Insert', '0427/478/SMA.V/2021', 2, NULL, 2, NULL, '2021-03-15', NULL, 'Surat Undangan Rapat Orang Tua Siswa Kelas XII', NULL, 'Rapat mengenai pelaksanaan UN', NULL, 'read', NULL, 'Surat Undangan Rapat_16032021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(17, 'Insert', '0428/480/SMA.V/2021', 2, NULL, 2, NULL, '2021-04-23', NULL, 'Surat Undangan Rapat Orang Tua Mengenai Iuran Sekolah', NULL, 'Rapat mengenai sosialisasi penggunaan iuran sekolah ', NULL, 'unread', NULL, 'Surat Undangan Rapat_25042021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(18, 'Insert', '0430/472/SMA.IV/2022', 2, NULL, 2, NULL, '2022-04-05', NULL, 'Undangan Rapat Wali Siswa Mengenai Kegiatan Perpisahan', NULL, 'Rapat anatara panitian perpisahan dengan wali siswa mnegenai kegiatan perpisahan', NULL, 'unread', NULL, 'Surat Undangan Rapat_05042022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(19, 'Insert', '0430/480/SMA.III/2021', 2, NULL, 2, NULL, '2021-05-10', NULL, 'Surat Rapat Orang Tua Mengenai Vaksinasi Dosis 1 ', NULL, 'Sehubungan dilaksanakan PTM terbatas, sekolah melakukan program vaksinasi dosis I agar kegiatan tersebut terlaksana', NULL, 'unread', NULL, 'Surat Undangan Rapat_10052021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(20, 'Insert', '0431/480/SMA.III/2021', 2, NULL, 2, NULL, '2021-11-13', NULL, 'Surat Undangan Rapat Mengenai Vaksinasi Dosis II', NULL, 'Sehubungan akan dilaksanakan PTM penuh, sekolah melaksanakan program vaksinasi dosis II', NULL, 'unread', NULL, 'Surat Undangan Rapat_15112021.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(21, 'Insert', '079/421.1/SMA.III/2021', 2, NULL, 3, NULL, '2021-06-14', NULL, 'Surat Undangan Pengambilan Rapor Semester Genap Tahun Ajaran 2020/2021', NULL, 'Surat Undangan Pengambilan Rapor Semester Genap Tahun Ajaran 2020/2021', NULL, 'unread', NULL, 'Surat Undangan Pengambilan Rapor_2021_Genap_X.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(22, 'Insert', '079/421.2/SMA.IV/2022', 2, NULL, 3, NULL, '2021-12-28', NULL, 'Surat Undangan Pengambilan Rapor Semester Ganjil Tahun Ajaran 2020/2021', NULL, 'Surat Undangan Pengambilan Rapor Semester Ganjil Tahun Ajaran 2020/2021', NULL, 'read', NULL, 'Surat Undangan Pengambilan Rapor_2021_Ganjil_X.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(23, 'Insert', '079/421.4/SMA.III/2021', 2, NULL, 3, NULL, '2021-06-14', NULL, 'Surat Undangan Pengambilan Rapor Semester Genap Tahun Ajaran 2020/2021', NULL, 'Surat Undangan Pengambilan Rapor Semester Genap Tahun Ajaran 2020/2021', NULL, 'read', NULL, 'Surat Undangan Pengambilan Rapor_2021_Genap_XI.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(24, 'Insert', '079/421.6/SMA.IV/2021', 2, NULL, 3, NULL, '2022-12-28', NULL, 'Surat Undangan Pengambilan Rapor Semester Ganjil Tahun Ajaran 2021/2022', NULL, 'Surat Undangan Pengambilan Rapor Semester Ganjil Tahun Ajaran 2021/2022', NULL, 'unread', NULL, 'Surat Undangan Pengambilan Rapor_2021_Ganjil_XI.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(25, 'Insert', '080/421.3/SMA.IV/2021', 2, NULL, 3, NULL, '2021-06-14', NULL, 'Surat Undangan Pengambilan Rapor Semester Genap Tahun Ajaran 2020/2021', NULL, 'Surat Undangan Pengambilan Rapor Semester Genap Tahun Ajaran 2020/2021', NULL, 'unread', NULL, 'Surat Undangan Pengambilan Rapor_2021_Genap_XII.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(26, 'Insert', '081/421.5/SMA.IV/2021', 2, NULL, 3, NULL, '2021-12-28', NULL, 'Surat Undangan Pengambilan Rapor Semester Ganjil Tahun Ajaran 2020/2021', NULL, 'Surat Undangan Pengambilan Rapor Semester Ganjil Tahun Ajaran 2020/2021', NULL, 'unread', NULL, 'Surat Undangan Pengambilan Rapor_2021_Ganjil_XII.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(27, 'Insert', 'P/01/KP.02/VI/2022', 1, NULL, 1, NULL, '2022-07-05', NULL, 'Surat Persetujuan Wali Siswa untuk Mengizinkan Siswa Mengikuti Wajib Pramuka', NULL, 'Permintaan izin wali siswa untuk mengizinkan kegiatan wajib pramuka', NULL, 'unread', NULL, 'Surat Persetujuan Wajib Pramuka_05072022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(28, 'Insert', 'R/01/KP.01/VI/2022', 1, NULL, 1, NULL, '2022-12-14', NULL, 'Surat Persetujuan Study Tour', NULL, 'Permintaan izin orang tua untuk mengizinkan siswa mengikuti study tour', NULL, 'unread', NULL, 'Surat Persetujuan Study Tour_17122022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(29, 'Insert', 'R/02/KP.02/VI/2022', 1, NULL, 1, NULL, '2022-01-10', NULL, 'Surat Persetujuan Mengikuti Study Tour', NULL, 'Permintaan izin orang tua untuk mengizinkan siswa mengikuti study tour', NULL, 'unread', NULL, 'Surat Persetujuan Study Tour_12012022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(30, 'Insert', 'R/02/KP.02/VII/2022', 1, NULL, 1, NULL, '2022-03-06', NULL, 'Surat Persetujuan Mengikuti Study Tour', NULL, 'Permintaan izin orang tua untuk mengizinkan siswa mengikuti study tour', NULL, 'read', NULL, 'Surat Persetujuan Study Tour_09032022.pdf', NULL, '2022-05-13 12:01:10', '2022-05-13 12:01:10'),
(31, 'Insert', '12/12', 3, NULL, 1, NULL, '2021-01-01', NULL, 'dsad', NULL, 'dsad', NULL, 'unread', NULL, '13052022_120553_201402052_LevinaGunawan_uts_komA.pdf', NULL, '2022-05-13 12:05:53', '2022-05-13 12:05:53'),
(32, 'Update', '12/12', 3, 3, 1, 1, '2021-01-01', '2021-01-01', 'dsad', 'dsad', 'dsad', 'dsad', 'read', 'unread', '13052022_120553_201402052_LevinaGunawan_uts_komA.pdf', '13052022_120553_201402052_LevinaGunawan_uts_komA.pdf', '2022-05-13 12:06:13', '2022-05-13 12:06:13'),
(33, 'Update', '12/12', 3, 3, 6, 1, '2021-01-01', '2021-01-01', 'dsad', 'dsad', 'dsad', 'dsad', 'read', 'read', '13052022_120553_201402052_LevinaGunawan_uts_komA.pdf', '13052022_120553_201402052_LevinaGunawan_uts_komA.pdf', '2022-05-13 12:06:26', '2022-05-13 12:06:26'),
(34, 'Update', '12/12', 3, 3, 6, 6, '2021-01-01', '2021-01-01', 'dsad', 'dsad', 'dsad', 'dsad', 'read', 'read', '13052022_120553_201402052_LevinaGunawan_uts_komA.pdf', '13052022_120553_201402052_LevinaGunawan_uts_komA.pdf', '2022-05-13 12:06:43', '2022-05-13 12:06:43'),
(35, 'Update', '12/12', 3, 3, 6, 6, '2021-01-01', '2021-01-01', 'dsad', 'dsad', 'dsad', 'dsad', 'read', 'read', '13052022_120643_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', '13052022_120553_201402052_LevinaGunawan_uts_komA.pdf', '2022-05-13 12:06:43', '2022-05-13 12:06:43'),
(36, 'Delete', '12/12', NULL, 3, NULL, 6, NULL, '2021-01-01', NULL, 'dsad', NULL, 'dsad', NULL, 'read', NULL, '13052022_120643_201402052_LevinaGunawan_EtikaProfesiKomA.pdf', '2022-05-13 12:06:56', '2022-05-13 12:06:56');

--
-- Triggers `log_outmails`
--
DELIMITER $$
CREATE TRIGGER `janganHapusOutmail` BEFORE DELETE ON `log_outmails` FOR EACH ROW SIGNAL SQLSTATE 'U0041'
SET MESSAGE_TEXT = 'Log Transaksi Tidak Boleh Dihapus'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `janganUpdateOutmail` BEFORE UPDATE ON `log_outmails` FOR EACH ROW SIGNAL SQLSTATE 'U0040'
SET MESSAGE_TEXT = 'Log Transaksi Tidak Boleh Diubah'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_users`
--

CREATE TABLE `log_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_transaksi` enum('Insert','Update','Delete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `new_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_tanggal_lahir` date DEFAULT NULL,
  `old_tanggal_lahir` date DEFAULT NULL,
  `new_alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_section_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_section_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_users`
--

INSERT INTO `log_users` (`id`, `jenis_transaksi`, `user_id`, `new_name`, `old_name`, `new_username`, `old_username`, `new_email`, `old_email`, `new_tanggal_lahir`, `old_tanggal_lahir`, `new_alamat`, `old_alamat`, `new_no_hp`, `old_no_hp`, `new_role`, `old_role`, `new_section_id`, `old_section_id`, `created_at`, `updated_at`) VALUES
(1, 'Insert', 1, 'Admin', NULL, 'admin', NULL, 'admin@gmail.com', NULL, '1987-05-16', NULL, 'Jln. Admin', NULL, '085112345678', NULL, 'admin', NULL, '1', NULL, '2022-05-13 11:57:28', '2022-05-13 11:57:28'),
(2, 'Insert', 2, 'Kepala Sekolah', NULL, 'kepsek', NULL, 'kepsek@gmail.com', NULL, '1988-10-27', NULL, 'Jln. Kepsek', NULL, '085112345678', NULL, 'kepala sekolah', NULL, '2', NULL, '2022-05-13 11:57:28', '2022-05-13 11:57:28'),
(3, 'Insert', 3, 'Guru', NULL, 'guru', NULL, 'guru@gmail.com', NULL, '1987-07-16', NULL, 'Jln. Guru', NULL, '085112345678', NULL, 'lainnya', NULL, '3', NULL, '2022-05-13 11:57:28', '2022-05-13 11:57:28'),
(4, 'Insert', 4, 'Osis', NULL, 'osis', NULL, 'osis@gmail.com', NULL, '1986-06-19', NULL, 'Jln. Osis', NULL, '085112345678', NULL, 'lainnya', NULL, '4', NULL, '2022-05-13 11:57:28', '2022-05-13 11:57:28'),
(5, 'Insert', 5, 'Komite', NULL, 'komite', NULL, 'komite@gmail.com', NULL, '1985-01-28', NULL, 'Jln. Komite', NULL, '085112345678', NULL, 'lainnya', NULL, '5', NULL, '2022-05-13 11:57:28', '2022-05-13 11:57:28'),
(6, 'Insert', 6, 'Wakil Kepala Sekolah', NULL, 'wakasek', NULL, 'wakasek@gmail.com', NULL, '1984-05-07', NULL, 'Jln. Wakasek', NULL, '085112345678', NULL, 'lainnya', NULL, '6', NULL, '2022-05-13 11:57:28', '2022-05-13 11:57:28'),
(7, 'Insert', 7, 'Satgas Covid 19 Sekolah', NULL, 'satgas', NULL, 'satgas@gmail.com', NULL, '1983-02-07', NULL, 'Jln. Satgas', NULL, '085112345678', NULL, 'lainnya', NULL, '7', NULL, '2022-05-13 11:57:28', '2022-05-13 11:57:28'),
(8, 'Insert', 8, 'Wali Kelas', NULL, 'wake', NULL, 'wake@gmail.com', NULL, '1980-01-01', NULL, 'Jln. Wake', NULL, '08123456789', NULL, 'lainnya', NULL, '11', NULL, '2022-05-13 12:07:44', '2022-05-13 12:07:44'),
(9, 'Update', 8, 'Wali Kelas', 'Wali Kelas', 'wake', 'wake', 'wake@gmail.com', 'wake@gmail.com', '1980-01-02', '1980-01-01', 'Jln. Wake', 'Jln. Wake', '08123456789', '08123456789', 'lainnya', 'lainnya', '11', '11', '2022-05-13 12:07:53', '2022-05-13 12:07:53'),
(10, 'Delete', 8, NULL, 'Wali Kelas', NULL, 'wake', NULL, 'wake@gmail.com', NULL, '1980-01-02', NULL, 'Jln. Wake', NULL, '08123456789', NULL, 'lainnya', NULL, '11', '2022-05-13 12:07:58', '2022-05-13 12:07:58'),
(11, 'Update', 1, 'Admin', 'Admin', 'admin', 'admin', 'admin@gmail.com', 'admin@gmail.com', '1985-05-16', '1987-05-16', 'Jln. Admin', 'Jln. Admin', '085112345678', '085112345678', 'admin', 'admin', '1', '1', '2022-05-13 12:08:11', '2022-05-13 12:08:11'),
(12, 'Update', 7, 'Satgas Covid 19 Sekolah', 'Satgas Covid 19 Sekolah', 'satgas', 'satgas', 'satgas@gmail.com', 'satgas@gmail.com', '1983-02-07', '1983-02-07', 'Jln. Satgas', 'Jln. Satgas', '085112345678', '085112345678', 'lainnya', 'lainnya', '7', '7', '2022-05-13 12:12:53', '2022-05-13 12:12:53'),
(13, 'Update', 7, 'Satgas Covid 19 Sekolah', 'Satgas Covid 19 Sekolah', 'satgas', 'satgas', 'satgas@gmail.com', 'satgas@gmail.com', '1983-02-07', '1983-02-07', 'Jln. Satgas', 'Jln. Satgas', '085112345678', '085112345678', 'lainnya', 'lainnya', '7', '7', '2022-05-13 12:12:53', '2022-05-13 12:12:53'),
(14, 'Update', 7, 'Satgas Covid 19 Sekolah', 'Satgas Covid 19 Sekolah', 'satgas', 'satgas', 'satgas@gmail.com', 'satgas@gmail.com', '1983-02-07', '1983-02-07', 'Jln. Satgas', 'Jln. Satgas', '085112345678', '085112345678', 'lainnya', 'lainnya', '7', '7', '2022-05-13 12:13:59', '2022-05-13 12:13:59'),
(15, 'Update', 7, 'Satgas Covid 19 Sekolah', 'Satgas Covid 19 Sekolah', 'satgas', 'satgas', 'satgas@gmail.com', 'satgas@gmail.com', '1983-02-07', '1983-02-07', 'Jln. Satgas', 'Jln. Satgas', '085112345678', '085112345678', 'lainnya', 'lainnya', '7', '7', '2022-05-13 12:13:59', '2022-05-13 12:13:59'),
(16, 'Insert', 9, 'Wali Kelas', NULL, 'wake', NULL, 'wake@gmail.com', NULL, '1979-01-02', NULL, 'Jln. Wake', NULL, '08123456789', NULL, 'lainnya', NULL, '11', NULL, '2022-05-13 15:17:54', '2022-05-13 15:17:54');

--
-- Triggers `log_users`
--
DELIMITER $$
CREATE TRIGGER `janganHapusUser` BEFORE DELETE ON `log_users` FOR EACH ROW SIGNAL SQLSTATE 'U0041'
SET MESSAGE_TEXT = 'Log Transaksi Tidak Boleh Dihapus'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `janganUpdateUser` BEFORE DELETE ON `log_users` FOR EACH ROW SIGNAL SQLSTATE 'U0040'
SET MESSAGE_TEXT = 'Log Transaksi Tidak Boleh Diubah'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mail_types`
--

CREATE TABLE `mail_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_jenis_surat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_types`
--

INSERT INTO `mail_types` (`id`, `nama_jenis_surat`, `created_at`, `updated_at`) VALUES
(1, 'Persetujuan', '2022-04-22 19:01:16', '2022-05-12 20:35:23'),
(2, 'Undangan', '2022-04-22 19:01:16', '2022-05-01 07:44:15'),
(3, 'Permohonan', '2022-04-22 19:01:16', '2022-04-22 19:01:16'),
(4, 'Pemberitahuan', '2022-04-22 19:01:16', '2022-04-22 19:01:16'),
(5, 'Perintah', '2022-04-22 19:01:16', '2022-05-13 05:02:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(172, '2014_10_12_000000_create_sections_table', 1),
(173, '2014_10_12_000000_create_users_table', 1),
(174, '2014_10_12_100000_create_password_resets_table', 1),
(175, '2019_08_19_000000_create_failed_jobs_table', 1),
(176, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(177, '2022_04_20_024057_create_mail_types_table', 1),
(178, '2022_04_20_024137_create_document_groups_table', 1),
(179, '2022_04_20_024157_create_document_types_table', 1),
(180, '2022_04_20_024323_create_documents_table', 1),
(181, '2022_04_20_025246_create_outmails_table', 1),
(182, '2022_04_20_025850_create_inmails_table', 1),
(183, '2022_04_20_030727_create_dispositions_table', 1),
(184, '2022_04_20_032342_create_destinations_table', 1),
(185, '2022_04_20_040821_create_log_users_table', 1),
(186, '2022_04_20_041410_create_log_documents_table', 1),
(187, '2022_04_20_041904_create_log_inmails_table', 1),
(188, '2022_04_20_043311_create_log_outmails_table', 1),
(189, '2022_04_20_043602_create_log_dispositions_table', 1),
(190, '2022_04_20_043844_create_log_destinations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `outmails`
--

CREATE TABLE `outmails` (
  `no` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_type_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `perihal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pokok_masalah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('unread','read') COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_surat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `outmails`
--

INSERT INTO `outmails` (`no`, `mail_type_id`, `section_id`, `tanggal_keluar`, `perihal`, `pokok_masalah`, `status`, `file_surat`, `created_at`, `updated_at`) VALUES
(' 025/panpel-gd/2/2021', 3, 4, '2021-09-23', 'Surat Permohonan Pengiriman Utusan Kegiatan Lomba Pidato', 'Surat Permohonan Pengiriman Utusan Kegiatan Lomba Pidato', 'unread', 'Surat Permohonan Mengikuti Kegiatan_25092021.pdf', '2022-05-10 11:51:58', '2022-05-10 11:51:58'),
(' R/03/KP.03/VI/2022', 1, 1, '2022-05-16', 'Surat Persetujuan Mengikuti Study Tour', 'Permintaan izin kepada orang tua untuk mengizinkan siswa mengikuti study tour', 'unread', 'Surat Persetujuan Study Tour_18052022.pdf', '2022-05-10 01:05:29', '2022-05-10 01:05:29'),
(': R/03/KP.03/VI/2022', 1, 1, '2022-09-10', 'Surat Persetujuan Mengikuti Study Tour', 'Permintaan izin kepada orang tua untuk mengizinkan siswa mengikuti study tour', 'unread', 'Surat Persetujuan Study Tour_14092022.pdf', '2022-05-10 01:16:02', '2022-05-10 01:16:02'),
(': R/03/KP.03/VII/2022', 1, 1, '2022-07-25', 'Surat Persetujuan Mengikuti Study Tour', 'Permintaan izin kepada orang tua untuk mengizinkan siswa mengikuti studt tour', 'read', 'Surat Persetujuan Study Tour_27072022.pdf', '2022-05-10 01:07:31', '2022-05-10 01:07:31'),
('023/panpel-gd/1/2021', 3, 4, '2021-06-23', 'Surat Permohonan Pengiriman Utusan Kegiatan Gathering Day', 'Surat Permohonan Pengiriman Utusan Kegiatan Gathering Day', 'read', 'Surat Permohonan Mengikuti Kegiatan_25062021.pdf', '2022-05-10 11:38:12', '2022-05-12 21:36:59'),
('024/panpel-gd/2/2021', 3, 4, '2021-07-06', 'Surat Permohonan Pengiriman Utusan Kegiatan Cerdas Cermat', 'Surat Permohonan Pengiriman Utusan Kegiatan Cerdas Cermat', 'read', 'Surat Permohonan Mengikuti Kegiatan_080721.pdf', '2022-05-10 11:44:30', '2022-05-10 11:44:30'),
('026/panpel-gd/1/2021', 3, 4, '2021-10-11', 'Surat Permohonan Pengiriman Utusan Lomba Debat Bahasa Inggris', 'Surat Permohonan Pengiriman Utusan Lomba Debat Bahasa Inggris', 'unread', 'Surat Permohonan Mengikuti Kegiatan_111021.pdf', '2022-05-10 12:02:47', '2022-05-10 12:02:47'),
('027/panpel-gd/2/2021', 3, 4, '2021-11-17', 'Surat Permohonan Pengiriman Utusan Kegiatan Lomba Membaca Puisi', 'Surat Permohonan Pengiriman Utusan Kegiatan Lomba Membaca Puisi', 'unread', 'Surat Permohonan Mengikuti Kegiatan_191121.pdf', '2022-05-10 12:08:04', '2022-05-10 12:08:04'),
('030/panpel-gd/2/2021', 3, 4, '2021-12-08', 'Surat Permohonan Pengiriman Utusan Kegiatan Lomba Karya Tulis Ilmiah', 'Surat Permohonan Pengiriman Utusan Kegiatan Lomba Karya Tulis Ilmiah', 'unread', 'Surat Permohonan Mengikuti Kegiatan_101221.pdf', '2022-05-10 12:12:48', '2022-05-10 12:12:48'),
('031/panpel-gd/2/2021', 3, 4, '2021-07-15', 'Surat Permohonan Pengiriman Utusan Kegiatan Pekan Olahraga', 'Dalam rangka memperingati HUT RI ke-76, OSIS SMA Negeri 1 Lhokseumawe menyelenggarakan Pekan Olahraga yang diharapkan diiukuti oleh siswa-siswa dari sekolah lainnya di Kecamatan Banda Sakti', 'unread', 'Surat Permohonan Mengikuti Kegiatan_180821.pdf', '2022-05-10 14:22:46', '2022-05-10 14:22:46'),
('040/4/LL/2018', 4, 2, '2018-06-08', 'Surat Pemberitahuan Libur Lebaran 1439 H', 'Pemberitahuan Libur Lebaran 1439 H', 'unread', 'Surat Pemberitahuan Libur Lebaran_08062018.pdf', '2022-05-10 15:23:38', '2022-05-10 15:23:38'),
('0412/432/SMA.IV/2022', 2, 2, '2022-01-02', 'Undangan Sosialisasi Kegiatan Wajib Pramuka untuk Wali Siswa', 'Sosialisasi ini bertujuan agar wali siswa menyetujui siswa untuk mengikuti kegiatan wajib pramuka', 'unread', 'Surat Undangan Sosialisasi_02012022.pdf', '2022-05-10 14:59:53', '2022-05-10 14:59:53'),
('042/3/LL/2022', 4, 2, '2022-04-27', 'Pemberitahuan Libur Lebaran 1443 H', 'Pemberitahuan Libur Lebaran 1443 H', 'unread', 'Surat Pemberitahuan Libur Lebaran_27042022.pdf', '2022-05-10 15:30:29', '2022-05-10 15:30:29'),
('0425/477/SMA.IV/2021', 2, 2, '2021-06-15', 'Surat Undangan Rapat Siswa Baru', 'Mensosialisasikan kegiatan sekolah serta pemberitahuan tentang peraturan-peraturan sekolah', 'read', 'Surat Undangan Rapat_16012021.pdf', '2022-05-10 06:05:04', '2022-05-10 06:05:04'),
('0426/477/SMA.V/2021', 2, 2, '2021-02-03', 'Undangan Rapat Orang Tua Siswa Kelas XI', 'Rapat mengenai kegiatan study tour siswa kelas XI', 'unread', 'Surat Undangan Rapat_05022021.pdf', '2022-05-10 09:53:40', '2022-05-10 09:53:40'),
('0427/478/SMA.V/2021', 2, 2, '2021-03-15', 'Surat Undangan Rapat Orang Tua Siswa Kelas XII', 'Rapat mengenai pelaksanaan UN', 'read', 'Surat Undangan Rapat_16032021.pdf', '2022-05-10 09:58:52', '2022-05-10 09:58:52'),
('0428/480/SMA.V/2021', 2, 2, '2021-04-23', 'Surat Undangan Rapat Orang Tua Mengenai Iuran Sekolah', 'Rapat mengenai sosialisasi penggunaan iuran sekolah ', 'unread', 'Surat Undangan Rapat_25042021.pdf', '2022-05-10 10:04:20', '2022-05-10 10:04:20'),
('0430/472/SMA.IV/2022', 2, 2, '2022-04-05', 'Undangan Rapat Wali Siswa Mengenai Kegiatan Perpisahan', 'Rapat anatara panitian perpisahan dengan wali siswa mnegenai kegiatan perpisahan', 'unread', 'Surat Undangan Rapat_05042022.pdf', '2022-05-10 14:52:14', '2022-05-10 14:52:14'),
('0430/480/SMA.III/2021', 2, 2, '2021-05-10', 'Surat Rapat Orang Tua Mengenai Vaksinasi Dosis 1 ', 'Sehubungan dilaksanakan PTM terbatas, sekolah melakukan program vaksinasi dosis I agar kegiatan tersebut terlaksana', 'unread', 'Surat Undangan Rapat_10052021.pdf', '2022-05-10 10:12:46', '2022-05-10 10:12:46'),
('0431/480/SMA.III/2021', 2, 2, '2021-11-13', 'Surat Undangan Rapat Mengenai Vaksinasi Dosis II', 'Sehubungan akan dilaksanakan PTM penuh, sekolah melaksanakan program vaksinasi dosis II', 'unread', 'Surat Undangan Rapat_15112021.pdf', '2022-05-10 10:19:01', '2022-05-10 10:19:01'),
('079/421.1/SMA.III/2021', 2, 3, '2021-06-14', 'Surat Undangan Pengambilan Rapor Semester Genap Tahun Ajaran 2020/2021', 'Surat Undangan Pengambilan Rapor Semester Genap Tahun Ajaran 2020/2021', 'unread', 'Surat Undangan Pengambilan Rapor_2021_Genap_X.pdf', '2022-05-10 04:09:46', '2022-05-10 04:09:46'),
('079/421.2/SMA.IV/2022', 2, 3, '2021-12-28', 'Surat Undangan Pengambilan Rapor Semester Ganjil Tahun Ajaran 2020/2021', 'Surat Undangan Pengambilan Rapor Semester Ganjil Tahun Ajaran 2020/2021', 'read', 'Surat Undangan Pengambilan Rapor_2021_Ganjil_X.pdf', '2022-05-10 04:16:37', '2022-05-10 04:16:37'),
('079/421.4/SMA.III/2021', 2, 3, '2021-06-14', 'Surat Undangan Pengambilan Rapor Semester Genap Tahun Ajaran 2020/2021', 'Surat Undangan Pengambilan Rapor Semester Genap Tahun Ajaran 2020/2021', 'read', 'Surat Undangan Pengambilan Rapor_2021_Genap_XI.pdf', '2022-05-10 04:35:12', '2022-05-10 04:35:12'),
('079/421.6/SMA.IV/2021', 2, 3, '2022-12-28', 'Surat Undangan Pengambilan Rapor Semester Ganjil Tahun Ajaran 2021/2022', 'Surat Undangan Pengambilan Rapor Semester Ganjil Tahun Ajaran 2021/2022', 'unread', 'Surat Undangan Pengambilan Rapor_2021_Ganjil_XI.pdf', '2022-05-10 04:38:30', '2022-05-10 04:38:30'),
('080/421.3/SMA.IV/2021', 2, 3, '2021-06-14', 'Surat Undangan Pengambilan Rapor Semester Genap Tahun Ajaran 2020/2021', 'Surat Undangan Pengambilan Rapor Semester Genap Tahun Ajaran 2020/2021', 'unread', 'Surat Undangan Pengambilan Rapor_2021_Genap_XII.pdf', '2022-05-10 04:42:44', '2022-05-10 04:42:45'),
('081/421.5/SMA.IV/2021', 2, 3, '2021-12-28', 'Surat Undangan Pengambilan Rapor Semester Ganjil Tahun Ajaran 2020/2021', 'Surat Undangan Pengambilan Rapor Semester Ganjil Tahun Ajaran 2020/2021', 'unread', 'Surat Undangan Pengambilan Rapor_2021_Ganjil_XII.pdf', '2022-05-10 04:46:06', '2022-05-10 04:46:06'),
('P/01/KP.02/VI/2022', 1, 1, '2022-07-05', 'Surat Persetujuan Wali Siswa untuk Mengizinkan Siswa Mengikuti Wajib Pramuka', 'Permintaan izin wali siswa untuk mengizinkan kegiatan wajib pramuka', 'unread', 'Surat Persetujuan Wajib Pramuka_05072022.pdf', '2022-05-10 14:31:44', '2022-05-10 14:31:44'),
('R/01/KP.01/VI/2022', 1, 1, '2022-12-14', 'Surat Persetujuan Study Tour', 'Permintaan izin orang tua untuk mengizinkan siswa mengikuti study tour', 'unread', 'Surat Persetujuan Study Tour_17122022.pdf', '2022-04-22 19:01:16', '2022-04-22 19:01:16'),
('R/02/KP.02/VI/2022', 1, 1, '2022-01-10', 'Surat Persetujuan Mengikuti Study Tour', 'Permintaan izin orang tua untuk mengizinkan siswa mengikuti study tour', 'unread', 'Surat Persetujuan Study Tour_12012022.pdf', '2022-04-22 19:01:16', '2022-04-22 19:01:16'),
('R/02/KP.02/VII/2022', 1, 1, '2022-03-06', 'Surat Persetujuan Mengikuti Study Tour', 'Permintaan izin orang tua untuk mengizinkan siswa mengikuti study tour', 'read', 'Surat Persetujuan Study Tour_09032022.pdf', '2022-04-23 17:29:11', '2022-04-23 17:49:55');

--
-- Triggers `outmails`
--
DELIMITER $$
CREATE TRIGGER `deleteOutmail` AFTER DELETE ON `outmails` FOR EACH ROW INSERT INTO `log_outmails`(`jenis_transaksi`, `no_surat`, `new_jenis_surat`, `old_jenis_surat`, `new_bagian`, `old_bagian`, `new_tanggal_keluar`, `old_tanggal_keluar`, `new_perihal`, `old_perihal`, `new_pokok_masalah`, `old_pokok_masalah`, `new_status`, `old_status`, `new_file_surat`, `old_file_surat`, `created_at`, `updated_at`) VALUES (3 , old.no, NULL, old.mail_type_id, NULL, old.section_id, NULL, old.tanggal_keluar, NULL, old.perihal, NULL, old.pokok_masalah, NULL, old.status, NULL, old.file_surat, NOW(), NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertOutmail` AFTER INSERT ON `outmails` FOR EACH ROW INSERT INTO `log_outmails`( `jenis_transaksi`, `no_surat`, `new_jenis_surat`, `old_jenis_surat`, `new_bagian`, `old_bagian`, `new_tanggal_keluar`, `old_tanggal_keluar`, `new_perihal`, `old_perihal`, `new_pokok_masalah`, `old_pokok_masalah`, `new_status`, `old_status`, `new_file_surat`, `old_file_surat`, `created_at`, `updated_at`) VALUES (1 , new.no, new.mail_type_id, NULL, new.section_id, NULL, new.tanggal_keluar, NULL, new.perihal, NULL, new.pokok_masalah, NULL, new.status, NULL, new.file_surat, NULL, NOW(), NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateOutmail` AFTER UPDATE ON `outmails` FOR EACH ROW INSERT INTO `log_outmails`( `jenis_transaksi`, `no_surat`, `new_jenis_surat`, `old_jenis_surat`, `new_bagian`, `old_bagian`, `new_tanggal_keluar`, `old_tanggal_keluar`, `new_perihal`, `old_perihal`, `new_pokok_masalah`, `old_pokok_masalah`, `new_status`, `old_status`, `new_file_surat`, `old_file_surat`, `created_at`, `updated_at`) VALUES (2 , new.no, new.mail_type_id, old.mail_type_id, new.section_id, old.section_id, new.tanggal_keluar, old.tanggal_keluar, new.perihal, old.perihal, new.pokok_masalah, old.pokok_masalah, new.status, old.status, new.file_surat, old.file_surat, NOW(), NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `outmails_view`
-- (See below for the actual view)
--
CREATE TABLE `outmails_view` (
`no` varchar(50)
,`jenis_surat` varchar(255)
,`bagian` varchar(255)
,`tanggal_keluar` date
,`perihal` varchar(255)
,`pokok_masalah` varchar(255)
,`status` enum('unread','read')
,`file_surat` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_bagian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `nama_bagian`, `created_at`, `updated_at`) VALUES
(1, 'TU', '2022-04-22 19:01:15', '2022-05-12 20:35:43'),
(2, 'Kepsek', '2022-04-22 19:01:15', '2022-04-22 19:01:15'),
(3, 'Guru', '2022-04-22 19:01:15', '2022-04-22 19:01:15'),
(4, 'OSIS', '2022-04-22 19:01:15', '2022-05-01 07:51:42'),
(5, 'Komite', '2022-04-22 19:01:15', '2022-04-22 19:01:15'),
(6, 'Wakasek', '2022-04-22 19:01:15', '2022-04-22 19:01:15'),
(7, 'Satgas Covid-19 Sekolah', '2022-04-22 19:01:15', '2022-04-22 19:01:15'),
(11, 'Wali Kelas', '2022-05-01 07:52:07', '2022-05-13 05:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','kepala sekolah','lainnya') COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `tanggal_lahir`, `alamat`, `no_hp`, `role`, `section_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', NULL, '$2y$10$BgLzF6Z2qyvVbaOYh8UwNeRMi6LT2H1MCa7ImIdoohmQV5b3hv7qq', '1985-05-16', 'Jln. Admin', '085112345678', 'admin', 1, NULL, '2022-05-12 19:59:09', '2022-05-13 05:08:11'),
(2, 'Kepala Sekolah', 'kepsek', 'kepsek@gmail.com', NULL, '$2y$10$16WqYXnufBad.tRcWhISJO5N1KT9VQ.np1c32UCXwTS79SiC47zRG', '1988-10-27', 'Jln. Kepsek', '085112345678', 'kepala sekolah', 2, NULL, '2022-05-12 19:59:09', '2022-05-12 19:59:09'),
(3, 'Guru', 'guru', 'guru@gmail.com', NULL, '$2y$10$3gOPgoMB3fniG1F3sLiiIexiw2Y3VoxaMyYSJCHOgbndhruF1CVda', '1987-07-16', 'Jln. Guru', '085112345678', 'lainnya', 3, NULL, '2022-05-12 19:59:10', '2022-05-12 21:20:03'),
(4, 'Osis', 'osis', 'osis@gmail.com', NULL, '$2y$10$tIYxKEP/Yu0oeKDErHf3leog9J4EBKWz5pBR9s9SrZN4.pr3Xo7Pe', '1986-06-19', 'Jln. Osis', '085112345678', 'lainnya', 4, NULL, '2022-05-12 19:59:10', '2022-05-12 19:59:10'),
(5, 'Komite', 'komite', 'komite@gmail.com', NULL, '$2y$10$FXGO7TPBoUTqWkLc6e9bb.z0ETdSEF07MgyEbtTlOCbDenf2gUFou', '1985-01-28', 'Jln. Komite', '085112345678', 'lainnya', 5, NULL, '2022-05-12 19:59:10', '2022-05-12 19:59:10'),
(6, 'Wakil Kepala Sekolah', 'wakasek', 'wakasek@gmail.com', NULL, '$2y$10$KqrjlNIA8EaMkqA//9rvAOmyWqu5Guytxi7Uw1VUUtON7.M/kRcPe', '1984-05-07', 'Jln. Wakasek', '085112345678', 'lainnya', 6, NULL, '2022-05-12 19:59:10', '2022-05-12 19:59:10'),
(7, 'Satgas Covid 19 Sekolah', 'satgas', 'satgas@gmail.com', NULL, '$2y$10$g2ZsRkYdOydkjajWh3M5v.Dg7NbU5LsC0hGgH8VyZdzi4R90Wr1X6', '1983-02-07', 'Jln. Satgas', '085112345678', 'lainnya', 7, NULL, '2022-05-12 19:59:10', '2022-05-13 05:13:59'),
(9, 'Wali Kelas', 'wake', 'wake@gmail.com', NULL, '$2y$10$qNrLhxYw2UV.Ryqse5SdPef92/rN6.1SUFVbuBcQ0HJze3tth.OTm', '1979-01-02', 'Jln. Wake', '08123456789', 'lainnya', 11, NULL, '2022-05-13 08:17:54', '2022-05-13 08:17:54');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `deleteUser` AFTER DELETE ON `users` FOR EACH ROW INSERT INTO `log_users`(`jenis_transaksi`, `user_id`, `new_name`, `old_name`, `new_username`, `old_username`, `new_email`, `old_email`, `new_tanggal_lahir`, `old_tanggal_lahir`, `new_alamat`, `old_alamat`, `new_no_hp`, `old_no_hp`, `new_role`, `old_role`, `new_section_id`, `old_section_id`, `created_at`, `updated_at`) VALUES (3 , old.id, NULL, old.name, NULL, old.username, NULL, old.email, NULL, old.tanggal_lahir, NULL, old.alamat, NULL, old.no_hp, NULL, old.role, NULL, old.section_id, NOW(), NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertUser` AFTER INSERT ON `users` FOR EACH ROW INSERT INTO `log_users`(`jenis_transaksi`, `user_id`, `new_name`, `old_name`, `new_username`, `old_username`, `new_email`, `old_email`, `new_tanggal_lahir`, `old_tanggal_lahir`, `new_alamat`, `old_alamat`, `new_no_hp`, `old_no_hp`, `new_role`, `old_role`, `new_section_id`, `old_section_id`, `created_at`, `updated_at`) VALUES (1 , new.id, new.name, NULL, new.username, NULL, new.email, NULL, new.tanggal_lahir, NULL, new.alamat, NULL, new.no_hp, NULL, new.role, NULL, new.section_id, NULL, NOW(), NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateUser` AFTER UPDATE ON `users` FOR EACH ROW INSERT INTO `log_users`( `jenis_transaksi`, `user_id`, `new_name`, `old_name`, `new_username`, `old_username`, `new_email`, `old_email`, `new_tanggal_lahir`, `old_tanggal_lahir`, `new_alamat`, `old_alamat`, `new_no_hp`, `old_no_hp`, `new_role`, `old_role`, `new_section_id`, `old_section_id`, `created_at`, `updated_at`) VALUES (2 , new.id, new.name, old.name, new.username, old.username, new.email, old.email, new.tanggal_lahir, old.tanggal_lahir, new.alamat, old.alamat, new.no_hp, old.no_hp, new.role, old.role, new.section_id, old.section_id, NOW(), NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `users_view`
-- (See below for the actual view)
--
CREATE TABLE `users_view` (
`name` varchar(255)
,`username` varchar(255)
,`email` varchar(255)
,`tanggal_lahir` date
,`alamat` varchar(255)
,`no_hp` varchar(255)
,`role` enum('admin','kepala sekolah','lainnya')
,`bagian` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `destinations_view`
--
DROP TABLE IF EXISTS `destinations_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `destinations_view`  AS SELECT `destinations`.`disposition_no` AS `disposition_no`, `getSectionName`(`destinations`.`section_id`) AS `bagian` FROM `destinations` ;

-- --------------------------------------------------------

--
-- Structure for view `documents_view`
--
DROP TABLE IF EXISTS `documents_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `documents_view`  AS SELECT `documents`.`no` AS `no`, `documents`.`nama_dokumen` AS `nama_dokumen`, `getDocumentTypeName`(`documents`.`document_type_id`) AS `jenis_dokumen`, `getSectionName`(`documents`.`section_id`) AS `pemilik`, `documents`.`sifat_dokumen` AS `sifat_dokumen`, `documents`.`tanggal_terbit` AS `tanggal_terbit`, `documents`.`perihal` AS `perihal`, `documents`.`file_dokumen` AS `file_dokumen` FROM `documents` ;

-- --------------------------------------------------------

--
-- Structure for view `document_types_view`
--
DROP TABLE IF EXISTS `document_types_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `document_types_view`  AS SELECT `document_types`.`nama_jenis_dokumen` AS `nama_jenis_dokumen`, `getDocumentGroupName`(`document_types`.`document_group_id`) AS `kelompok_dokumen` FROM `document_types` ;

-- --------------------------------------------------------

--
-- Structure for view `inmails_view`
--
DROP TABLE IF EXISTS `inmails_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `inmails_view`  AS SELECT `inmails`.`no` AS `no`, `getMailTypeName`(`inmails`.`mail_type_id`) AS `jenis_surat`, `getSectionName`(`inmails`.`section_id`) AS `bagian`, `inmails`.`tanggal_masuk` AS `tanggal_masuk`, `inmails`.`perihal` AS `perihal`, if(`inmails`.`disposisi` = 1,(select `dispositions`.`no` from `dispositions` where `dispositions`.`inmail_no` = `inmails`.`no`),'-') AS `disposisi`, `inmails`.`pokok_masalah` AS `pokok_masalah`, `inmails`.`status` AS `status`, `inmails`.`file_surat` AS `file_surat` FROM `inmails` ;

-- --------------------------------------------------------

--
-- Structure for view `outmails_view`
--
DROP TABLE IF EXISTS `outmails_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `outmails_view`  AS SELECT `outmails`.`no` AS `no`, `getMailTypeName`(`outmails`.`mail_type_id`) AS `jenis_surat`, `getSectionName`(`outmails`.`section_id`) AS `bagian`, `outmails`.`tanggal_keluar` AS `tanggal_keluar`, `outmails`.`perihal` AS `perihal`, `outmails`.`pokok_masalah` AS `pokok_masalah`, `outmails`.`status` AS `status`, `outmails`.`file_surat` AS `file_surat` FROM `outmails` ;

-- --------------------------------------------------------

--
-- Structure for view `users_view`
--
DROP TABLE IF EXISTS `users_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `users_view`  AS SELECT `users`.`name` AS `name`, `users`.`username` AS `username`, `users`.`email` AS `email`, `users`.`tanggal_lahir` AS `tanggal_lahir`, `users`.`alamat` AS `alamat`, `users`.`no_hp` AS `no_hp`, `users`.`role` AS `role`, `getSectionName`(`users`.`section_id`) AS `bagian` FROM `users` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destinations_disposition_no_foreign` (`disposition_no`),
  ADD KEY `destinations_section_id_foreign` (`section_id`);

--
-- Indexes for table `dispositions`
--
ALTER TABLE `dispositions`
  ADD PRIMARY KEY (`no`),
  ADD KEY `dispositions_inmail_no_foreign` (`inmail_no`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`no`),
  ADD KEY `documents_document_type_id_foreign` (`document_type_id`),
  ADD KEY `documents_section_id_foreign` (`section_id`);

--
-- Indexes for table `document_groups`
--
ALTER TABLE `document_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_types_document_group_id_foreign` (`document_group_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inmails`
--
ALTER TABLE `inmails`
  ADD PRIMARY KEY (`no`),
  ADD KEY `inmails_mail_type_id_foreign` (`mail_type_id`),
  ADD KEY `inmails_section_id_foreign` (`section_id`);

--
-- Indexes for table `log_destinations`
--
ALTER TABLE `log_destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_dispositions`
--
ALTER TABLE `log_dispositions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_documents`
--
ALTER TABLE `log_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_inmails`
--
ALTER TABLE `log_inmails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_outmails`
--
ALTER TABLE `log_outmails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_users`
--
ALTER TABLE `log_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_types`
--
ALTER TABLE `mail_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outmails`
--
ALTER TABLE `outmails`
  ADD PRIMARY KEY (`no`),
  ADD KEY `outmails_mail_type_id_foreign` (`mail_type_id`),
  ADD KEY `outmails_section_id_foreign` (`section_id`);

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
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_section_id_foreign` (`section_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `document_groups`
--
ALTER TABLE `document_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_destinations`
--
ALTER TABLE `log_destinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `log_dispositions`
--
ALTER TABLE `log_dispositions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `log_documents`
--
ALTER TABLE `log_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `log_inmails`
--
ALTER TABLE `log_inmails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `log_outmails`
--
ALTER TABLE `log_outmails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `log_users`
--
ALTER TABLE `log_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `mail_types`
--
ALTER TABLE `mail_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `destinations`
--
ALTER TABLE `destinations`
  ADD CONSTRAINT `destinations_disposition_no_foreign` FOREIGN KEY (`disposition_no`) REFERENCES `dispositions` (`no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `destinations_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`);

--
-- Constraints for table `dispositions`
--
ALTER TABLE `dispositions`
  ADD CONSTRAINT `dispositions_inmail_no_foreign` FOREIGN KEY (`inmail_no`) REFERENCES `inmails` (`no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`),
  ADD CONSTRAINT `documents_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`);

--
-- Constraints for table `document_types`
--
ALTER TABLE `document_types`
  ADD CONSTRAINT `document_types_document_group_id_foreign` FOREIGN KEY (`document_group_id`) REFERENCES `document_groups` (`id`);

--
-- Constraints for table `inmails`
--
ALTER TABLE `inmails`
  ADD CONSTRAINT `inmails_mail_type_id_foreign` FOREIGN KEY (`mail_type_id`) REFERENCES `mail_types` (`id`),
  ADD CONSTRAINT `inmails_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`);

--
-- Constraints for table `outmails`
--
ALTER TABLE `outmails`
  ADD CONSTRAINT `outmails_mail_type_id_foreign` FOREIGN KEY (`mail_type_id`) REFERENCES `mail_types` (`id`),
  ADD CONSTRAINT `outmails_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
