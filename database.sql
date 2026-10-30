-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2026 at 11:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `traymonrp`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `id` int(11) NOT NULL,
  `name` varchar(54) NOT NULL DEFAULT 'None',
  `skinid` int(11) NOT NULL DEFAULT 10,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `posa` float DEFAULT 0,
  `vuln` int(11) NOT NULL DEFAULT 10,
  `interior` int(11) NOT NULL DEFAULT 10,
  `world` int(11) NOT NULL DEFAULT 10,
  `anim` int(11) NOT NULL DEFAULT 10
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`id`, `name`, `skinid`, `posx`, `posy`, `posz`, `posa`, `vuln`, `interior`, `world`, `anim`) VALUES
(0, 'e', 83, 0, 956.426, -913.503, 45.7656, 1127041810, 1, 0, 0),
(1, 'None', 10, 0, 0, 0, 0, 1, 10, 10, 10),
(2, 'None', 10, 0, 0, 0, 0, 1, 10, 10, 10),
(3, 'None', 10, 0, 0, 0, 0, 1, 10, 10, 10),
(4, 'None', 10, 0, 0, 0, 0, 1, 10, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `admin_ratings`
--

CREATE TABLE `admin_ratings` (
  `rating_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rating_type` tinyint(1) NOT NULL COMMENT '1 untuk like, -1 untuk dislike',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_ratings`
--

INSERT INTO `admin_ratings` (`rating_id`, `admin_id`, `admin_name`, `user_id`, `user_name`, `comment`, `rating_type`, `timestamp`) VALUES
(1, 1, 'alokmenjawa', 1, 'Hoverski_Hoverstiers', 'KELAS LOK KELAS ASLE DAH LO MAH', 1, '2026-09-26 05:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `atms`
--

CREATE TABLE `atms` (
  `id` int(11) NOT NULL,
  `posx` float NOT NULL,
  `posy` float NOT NULL,
  `posz` float NOT NULL,
  `posrx` float NOT NULL,
  `posry` float NOT NULL,
  `posrz` float NOT NULL,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 50000,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `atms`
--

INSERT INTO `atms` (`id`, `posx`, `posy`, `posz`, `posrx`, `posry`, `posrz`, `interior`, `world`, `stock`, `status`) VALUES
(0, 1659.11, -1886.76, 13.167, 0, 0, -88, 0, 0, 19794379, 0),
(1, 1172.35, -1328.53, 15.0453, -2.4753, -0.103235, 173.776, 0, 0, 51876876, 0),
(2, 1548.79, -1671.63, 13.1842, 0.608063, 0.000564, -175.613, 0, 0, 2539878, 0),
(3, 764.681, -1125.97, 23.8012, -2.00274, -2.99817, 179.105, 0, 0, 53298700, 0),
(4, 1283.65, -1531.55, 13.5026, 0, 0, 179, 0, 0, 50061643, 0),
(5, 1009.56, -1357.88, 12.9191, 0, 0, -92, 0, 0, 50000000, 0),
(6, 1531.87, -1025.26, 23.7884, 0, 0, 90, 0, 0, 58260873, 0),
(7, 617.801, -1496.47, 14.7442, 0, 0, 90, 0, 0, 3015188, 0),
(8, 1098.04, -1213.29, 17.3247, 0, 0, 178, 0, 0, 59721069, 0),
(9, 856.369, -1374.13, 13.4907, 0, 0, 89, 0, 0, 12295507, 0),
(14, 1518, -1471.58, 9.12001, 0, 0, 87.8999, 0, 0, 2018800, 0),
(12, 1504.46, -1753.62, 13.0969, 0, 0, 85.4999, 0, 0, 13190539, 0),
(13, 207.742, -1440.51, 12.8933, 0, 0, 139.507, 0, 0, 18980682, 0),
(15, 993.918, -925.553, 41.825, 0, 0, 93.0049, 0, 0, 52350255, 0),
(16, 1305.41, -1060.32, 28.9131, 0, 0, -91.8227, 0, 0, 51534176, 0),
(17, 1321.84, -869.394, 39.2369, 0, 0, 177.143, 0, 0, 50019500, 0),
(10, 1016.9, -1440.63, 13.3069, 0, 0, 0, 0, 0, 49995599, 0),
(19, 1928.94, -1797.46, 13.1878, 0.434093, -0.488195, 174.619, 0, 0, 5655899, 0),
(20, 1770.9, 815.042, 10.5633, 0, 0, 179.113, 0, 0, 50069500, 0),
(21, 587.658, 865.053, -43.8956, 0, 0, 0, 0, 0, 114095844, 0),
(22, 1032.93, -1090.84, 23.5065, 0, 0, 0, 0, 0, 12590414, 0),
(23, 901.97, -1741.9, 13.1449, 0, 0, 177.34, 0, 0, 42992000, 0),
(24, 160.417, -1626.02, 14.9559, 0, 0, 124.532, 0, 0, 3405037, 0),
(25, 1272.14, -1261.24, 14.051, 0, 0, 90.2463, 0, 0, 50024500, 0),
(26, -780.367, -146.679, 66.1194, 0, 0, 112.512, 0, 0, 2587075, 0),
(27, 1550.44, -942.558, 44.3343, 0, 0, 79.803, 0, 0, 50000000, 0),
(28, 1245.74, -1422.35, 13.2215, 0, 0, -88.67, 0, 0, 50002515, 0),
(29, 642.859, 291.389, 20.2325, 0, 0, -176.355, 0, 0, 2791501, 0),
(30, 939.08, -1682.84, 13.2173, 0, 0, 0, 0, 0, 50000000, 0),
(11, -114.341, -1206.08, 2.63639, 0, 0, -13.202, 0, 0, 3146704, 0),
(32, 1073.41, -1768.62, 12.9644, 0, 0, -179.508, 0, 0, 50000000, 0),
(33, 1359.53, -1669.2, 13.2833, 0, 0, -94.7784, 0, 0, 49995000, 0),
(34, 1354.36, -1757.5, 18.6909, 0, 0, 0, 0, 0, 2000000, 0),
(35, -100.378, -1512.33, 2.6788, 0, 0, -123.547, 0, 0, 2109850, 0),
(36, 1358.71, -1744.87, 13.2269, 0, 0, -87.8, 0, 0, 21649417, 0),
(37, 540.099, -1275.81, 16.8922, 0, 0, 179.5, 0, 0, 14718558, 0),
(38, -68.6475, -1141.4, 0.718125, 0, 0, 155.2, 0, 0, 2292815, 0),
(39, 2691.11, -2490.45, 13.3361, 0, 0, -91.8, 0, 0, 2000000, 0),
(18, 1788.48, -2033.47, 13.1836, 0, 0, -89.2611, 0, 0, 2275906, 0),
(41, 684.706, -1445.29, 14.6223, 0, 0, -91.9961, 0, 0, 2125727, 0),
(31, 668.876, -613.998, 15.9759, 0, 0, 179.985, 0, 0, 1992900, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `username` varchar(24) DEFAULT NULL,
  `gpci` varchar(128) DEFAULT NULL,
  `bannedby` varchar(24) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `permanent` tinyint(1) NOT NULL DEFAULT 0,
  `ban_expire` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bisnis`
--

CREATE TABLE `bisnis` (
  `ID` int(11) NOT NULL,
  `owner` varchar(40) NOT NULL DEFAULT '-',
  `name` varchar(128) NOT NULL DEFAULT 'None',
  `price` int(11) NOT NULL DEFAULT 500000,
  `type` int(11) NOT NULL DEFAULT 1,
  `locked` int(11) NOT NULL DEFAULT 1,
  `tax` int(11) NOT NULL DEFAULT 0,
  `seal` int(11) NOT NULL DEFAULT 0,
  `money` bigint(20) NOT NULL DEFAULT 0,
  `prod` int(11) NOT NULL DEFAULT 50,
  `bprice0` int(11) NOT NULL DEFAULT 500,
  `bprice1` int(11) NOT NULL DEFAULT 500,
  `bprice2` int(11) NOT NULL DEFAULT 500,
  `bprice3` int(11) NOT NULL DEFAULT 500,
  `bprice4` int(11) NOT NULL DEFAULT 500,
  `bprice5` int(11) NOT NULL DEFAULT 500,
  `bprice6` int(11) NOT NULL DEFAULT 500,
  `bprice7` int(11) NOT NULL DEFAULT 500,
  `bprice8` int(11) NOT NULL DEFAULT 500,
  `bprice9` int(11) NOT NULL DEFAULT 500,
  `bprice10` int(11) NOT NULL DEFAULT 500,
  `bprice11` int(11) NOT NULL DEFAULT 500,
  `bprice12` int(11) NOT NULL DEFAULT 500,
  `bprice13` int(11) NOT NULL DEFAULT 500,
  `bprice14` int(11) NOT NULL DEFAULT 500,
  `bprice15` int(11) NOT NULL DEFAULT 500,
  `bpname0` varchar(128) NOT NULL DEFAULT '-',
  `bpname1` varchar(128) NOT NULL DEFAULT '-',
  `bpname2` varchar(128) NOT NULL DEFAULT '-',
  `bpname3` varchar(128) NOT NULL DEFAULT '-',
  `bpname4` varchar(128) NOT NULL DEFAULT '-',
  `bpname5` varchar(128) NOT NULL DEFAULT '-',
  `bpname6` varchar(128) NOT NULL DEFAULT '-',
  `bpname7` varchar(128) NOT NULL DEFAULT '-',
  `bpname8` varchar(128) NOT NULL DEFAULT '-',
  `bpname9` varchar(128) NOT NULL DEFAULT '-',
  `bpname10` varchar(128) NOT NULL DEFAULT '-',
  `bpname11` varchar(128) NOT NULL DEFAULT '-',
  `bpname12` varchar(128) NOT NULL DEFAULT '-',
  `bpname13` varchar(128) NOT NULL DEFAULT '-',
  `bpname14` varchar(128) NOT NULL DEFAULT '-',
  `bpname15` varchar(128) NOT NULL DEFAULT '-',
  `bint` int(11) NOT NULL DEFAULT 0,
  `extposx` float NOT NULL DEFAULT 0,
  `extposy` float NOT NULL DEFAULT 0,
  `extposz` float NOT NULL DEFAULT 0,
  `extposa` float NOT NULL DEFAULT 0,
  `intposx` float NOT NULL DEFAULT 0,
  `intposy` float NOT NULL DEFAULT 0,
  `intposz` float NOT NULL DEFAULT 0,
  `intposa` float NOT NULL DEFAULT 0,
  `pointx` float DEFAULT 0,
  `pointy` float DEFAULT 0,
  `pointz` float DEFAULT 0,
  `actorskin` int(11) NOT NULL DEFAULT 172,
  `actoranim` int(11) NOT NULL DEFAULT 0,
  `actorx` float DEFAULT 0,
  `actory` float DEFAULT 0,
  `actorz` float DEFAULT 0,
  `actora` float DEFAULT 0,
  `visit` bigint(20) NOT NULL DEFAULT 0,
  `song_url` varchar(255) NOT NULL DEFAULT '-'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blackjack_logs`
--

CREATE TABLE `blackjack_logs` (
  `id` int(11) NOT NULL,
  `player_name` varchar(24) NOT NULL,
  `bet_amount` int(11) NOT NULL,
  `win_amount` int(11) NOT NULL,
  `result` varchar(32) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `casino_pools`
--

CREATE TABLE `casino_pools` (
  `pool_name` varchar(20) NOT NULL,
  `current_value` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `casino_pools`
--

INSERT INTO `casino_pools` (`pool_name`, `current_value`) VALUES
('blackjack_jackpot', 1162882),
('slot_jackpot', 2508721);

-- --------------------------------------------------------

--
-- Table structure for table `cctv`
--

CREATE TABLE `cctv` (
  `id` int(11) NOT NULL,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `rx` float NOT NULL DEFAULT 0,
  `ry` float NOT NULL DEFAULT 0,
  `rz` float NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cctv`
--

INSERT INTO `cctv` (`id`, `x`, `y`, `z`, `rx`, `ry`, `rz`, `interior`, `world`) VALUES
(0, 386.415, -1877.23, 2503.77, 17.3, -1.4, 135.3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `character_story`
--

CREATE TABLE `character_story` (
  `id` int(11) NOT NULL,
  `username` varchar(24) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `discordid` varchar(50) NOT NULL DEFAULT '0',
  `messageid` varchar(50) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `chargedby` varchar(24) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`id`, `uid`, `chargedby`, `date`, `reason`) VALUES
(2, 178, 'Ibraheem_Coronel', '2026-08-02 03:49:59', 'excessive use of horn it may disturbing other drivers '),
(3, 376, 'Simon_Fernandes', '2026-08-04 08:01:58', '3A1 who possesion cocaine/marijuanna in their in posseing'),
(4, 178, 'Simon_Fernandes', '2026-08-04 08:59:25', '1M2 DRIVING WHILE IMPAIRED'),
(5, 178, 'Simon_Fernandes', '2026-08-04 09:00:17', 'Evading From Law Enforcement '),
(6, 178, 'Simon_Fernandes', '2026-08-04 09:01:00', '1C3 A person drive who suspected'),
(7, 102, 'Keen_Drescher', '2026-08-12 10:24:44', 'pursuit '),
(8, 178, 'Isaias_Quintero', '2026-08-15 12:41:30', 'shoot in pd'),
(9, 76, 'Isaias_Quintero', '2026-08-15 12:41:35', 'shoot in pd'),
(10, 178, 'Alonzo_Porez', '2026-08-19 21:38:02', 'ilegal situaction , and drug , shooting the member\'s police dapartement'),
(11, 283, 'Alejandro_Giordano', '2026-08-19 21:43:02', 'ilegal gun, have drug'),
(12, 283, 'Creed_Pash', '2026-08-21 19:43:45', 'PC199 Ilegal Weapon'),
(13, 30, 'Frank_Lorenzo', '2026-08-22 13:39:28', 'criminal'),
(14, 30, 'Frank_Lorenzo', '2026-08-22 13:49:50', 'shooting at police on the street'),
(17, 629, 'Frank_Lorenzo', '2026-08-22 16:16:27', 'shoot in sapd'),
(18, 76, 'Frank_Lorenzo', '2026-08-22 16:16:37', 'shoot in sapd'),
(19, 1020, 'Frank_Lorenzo', '2026-08-22 16:43:43', 'judol'),
(22, 451, 'Maximiliano_Maximo', '2026-08-22 22:18:49', 'judol'),
(29, 276, 'Aguy_Bravist', '2026-09-04 02:24:09', 'membawa gun+barang haram'),
(30, 283, 'Aguy_Bravist', '2026-09-04 22:32:28', 'kriminal'),
(31, 1574, 'Aguy_Bravist', '2026-09-04 22:33:13', 'kriminal');

-- --------------------------------------------------------

--
-- Table structure for table `crates`
--

CREATE TABLE `crates` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `owner_name` varchar(24) NOT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `world` int(11) NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `health` float NOT NULL DEFAULT 100,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `pass` varchar(32) NOT NULL DEFAULT '',
  `max_weight` float NOT NULL DEFAULT 50
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crates`
--

INSERT INTO `crates` (`id`, `owner_id`, `owner_name`, `pos_x`, `pos_y`, `pos_z`, `world`, `interior`, `health`, `locked`, `pass`, `max_weight`) VALUES
(10, 310, 'Rayen_Yamatashi', 1361.41, -1661.28, 13.3828, 0, 0, 100, 0, 'None', 50),
(17, 76, 'Nicholas_Alvaro', -221.622, 1392.88, 27.4172, 0, 18, 100, 1, '1101', 50),
(20, 1472, 'Ivy_Charlotte', 1140.96, -1366.06, 13.7641, 0, 0, 100, 1, '1101', 50),
(23, 1513, 'Marsyad_AlexanderA', 1498.11, -1579.49, 13.5469, 0, 0, 100, 1, 'Fadil543', 50),
(24, 317, 'Mark_Rober', 149.377, 59.9309, 2.3902, 0, 0, 100, 0, 'None', 50),
(25, 421, 'Refan_Hermawan', 135.611, 43.0789, 1.7896, 0, 0, 100, 1, 'Rifz310', 50);

-- --------------------------------------------------------

--
-- Table structure for table `crate_items`
--

CREATE TABLE `crate_items` (
  `id` int(11) NOT NULL,
  `crate_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `id` int(11) NOT NULL,
  `owner` varchar(40) NOT NULL DEFAULT '-',
  `name` varchar(40) NOT NULL DEFAULT 'None',
  `price` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `posa` float DEFAULT 0,
  `posint` int(11) NOT NULL DEFAULT 0,
  `posvw` int(11) NOT NULL DEFAULT 0,
  `vehx` float DEFAULT 0,
  `vehy` float DEFAULT 0,
  `vehz` float DEFAULT 0,
  `veha` float DEFAULT 0,
  `vehint` bigint(20) NOT NULL DEFAULT 0,
  `vehvw` int(11) NOT NULL DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `tax` int(11) NOT NULL DEFAULT 0,
  `seal` int(11) NOT NULL DEFAULT 0,
  `visit` bigint(20) NOT NULL DEFAULT 0,
  `vehprice0` int(11) NOT NULL DEFAULT 0,
  `vehprice1` int(11) NOT NULL DEFAULT 0,
  `vehprice2` int(11) NOT NULL DEFAULT 0,
  `vehprice3` int(11) NOT NULL DEFAULT 0,
  `vehprice4` int(11) NOT NULL DEFAULT 0,
  `vehprice5` int(11) NOT NULL DEFAULT 0,
  `vehprice6` int(11) NOT NULL DEFAULT 0,
  `vehprice7` int(11) NOT NULL DEFAULT 0,
  `vehprice8` int(11) NOT NULL DEFAULT 0,
  `vehprice9` int(11) NOT NULL DEFAULT 0,
  `vehprice10` int(11) NOT NULL DEFAULT 0,
  `vehprice11` int(11) NOT NULL DEFAULT 0,
  `vehprice12` int(11) NOT NULL DEFAULT 0,
  `vehprice13` int(11) NOT NULL DEFAULT 0,
  `vehprice14` int(11) NOT NULL DEFAULT 0,
  `vehprice15` int(11) NOT NULL DEFAULT 0,
  `vehprice16` int(11) NOT NULL DEFAULT 0,
  `vehprice17` int(11) NOT NULL DEFAULT 0,
  `vehprice18` int(11) NOT NULL DEFAULT 0,
  `vehprice19` int(11) NOT NULL DEFAULT 0,
  `vehprice20` int(11) NOT NULL DEFAULT 0,
  `vehprice21` int(11) NOT NULL DEFAULT 0,
  `vehprice22` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doors`
--

CREATE TABLE `doors` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) DEFAULT 'None',
  `password` varchar(50) DEFAULT '',
  `icon` int(11) DEFAULT 19130,
  `locked` int(11) NOT NULL DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `vip` int(11) NOT NULL DEFAULT 0,
  `faction` int(11) NOT NULL DEFAULT 0,
  `family` int(11) NOT NULL DEFAULT -1,
  `garage` tinyint(4) NOT NULL DEFAULT 0,
  `custom` int(11) NOT NULL DEFAULT 0,
  `extvw` int(11) DEFAULT 0,
  `extint` int(11) DEFAULT 0,
  `extposx` float DEFAULT 0,
  `extposy` float DEFAULT 0,
  `extposz` float DEFAULT 0,
  `extposa` float DEFAULT 0,
  `intvw` int(11) DEFAULT 0,
  `intint` int(11) NOT NULL DEFAULT 0,
  `intposx` float DEFAULT 0,
  `intposy` float DEFAULT 0,
  `intposz` float DEFAULT 0,
  `intposa` float DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doors`
--

INSERT INTO `doors` (`ID`, `name`, `password`, `icon`, `locked`, `admin`, `vip`, `faction`, `family`, `garage`, `custom`, `extvw`, `extint`, `extposx`, `extposy`, `extposz`, `extposa`, `intvw`, `intint`, `intposx`, `intposy`, `intposz`, `intposa`) VALUES
(1, 'Rooftop Police Departement', '', 19130, 0, 0, 0, 1, -1, 0, 1, 0, 0, 1564.91, -1666.99, 28.3956, 170.239, 0, 0, 379.802, -1868.76, 2501.09, 271.704),
(2, 'Medical  Department', '', 19130, 0, 0, 0, 0, 7, 0, 0, 0, 0, -2653.73, 640.158, 14.4531, 5.84023, 0, 0, 1378.24, -1409.28, 2986.52, 176.659),
(3, 'San Andreas City Hall', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 1481.16, -1772.31, 18.7957, 0.059347, 170, 0, 1370.01, 1555.1, -62.9789, 268.874),
(4, 'All Saints General Hospital', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 2034.07, -1401.67, 17.2929, 342.481, 100, 1, 1391.67, -34.7404, 5000.86, 75.7286),
(5, 'The Strip Club', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 2421.63, -1219.44, 25.5489, 185.134, 0, 2, 1204.8, -13.6467, 1000.92, 359.948),
(6, 'Shell Room', '', 19130, 0, 0, 0, 1, -1, 0, 0, 0, 10, 217.03, 126.137, 999.022, 271.171, 0, 0, 1524.48, -1677.9, 6.21875, 88.9349),
(7, 'Black Market', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -370.515, 2223.71, 42.8134, 304.764, 0, 0, 2647.3, -2402.93, 3001.09, 34.6462),
(8, 'Medical Department', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1172.08, -1323.36, 15.403, 275.724, 0, 0, 1231.77, -1355.23, 1475.87, 351.633),
(9, 'Rooftop Medical Department', '', 19130, 0, 0, 0, 2, -1, 0, 0, 0, 0, 1161.63, -1329.72, 31.4941, 359.742, 0, 0, 1209.35, -1349.2, 1475.87, 265.384),
(10, 'Basment SAMD', '', 19130, 0, 0, 0, 2, -1, 0, 0, 0, 0, 1209.44, -1336.52, 1475.86, 95.299, 0, 0, 1144.73, -1325.51, 13.5815, 276.63),
(11, 'News Agency', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, 649.271, -1357.27, 13.6026, 88.5477, 0, 0, 2028.76, 1339.59, 1003.54, 269.378),
(12, 'Backend SANA', '', 19130, 0, 0, 0, 3, -1, 0, 1, 0, 0, 755.139, -1379.46, 13.7245, 82.1723, 0, 0, 2059.77, 1348.07, 1003.5, 2.01421),
(0, 'Bank Lost Santos', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1467.24, -1009.92, 26.8438, 348.191, 0, 1, 2143.54, 1613.92, -34.0138, 187.598),
(14, 'Driving School', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1219.2, -1812.02, 16.5938, 180.641, 0, 3, -2029.82, -119.282, 1035.17, 359.469),
(15, 'VIP Room', '', 19130, 0, 0, 1, 0, -1, 0, 1, 0, 0, 1015.47, -1549.41, 14.8594, 280.961, 0, 3, -2636.41, 1402.83, 906.461, 16.025),
(17, 'Police Departement', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1555.1, -1675.47, 16.1953, 87.3099, 0, 0, 416.251, -1864.26, 2501.09, 356.558),
(18, 'KohAxcell Center', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1487.49, -259.605, 14.1484, 321.102, 0, 0, 1370.5, -26.742, 1001.3, 273.961),
(20, 'Detective Bureau', 'DBPD2025', 19130, 0, 0, 0, 1, -1, 0, 0, 0, 0, 625.036, -565.463, 16.2541, 268.706, 0, 0, 617.455, -25.7369, 1000.99, 1.15165),
(21, 'Rooftop SANA', '', 19130, 0, 0, 0, 3, -1, 0, 0, 0, 0, 735.379, -1359.11, 19.7718, 173.41, 0, 0, 2066.87, 1330.88, 1003.5, 274.663),
(23, 'Detective Bureau Garage', 'DBPD2025', 19130, 0, 0, 0, 1, -1, 0, 0, 0, 0, 606.546, -570.047, 16.2541, 91.5976, 0, 0, 631.205, -11.7883, 1000.99, 88.2985),
(24, 'Detective Bureau Rooftop', 'DBPD2025', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 623.096, -559.889, 29.0826, 1.55356, 0, 0, 602.956, -10.8817, 1000.99, 268.999),
(25, 'Helipark Rooftop', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1570.44, -1337.45, 16.4844, 110.982, 0, 0, 1548.63, -1363.74, 326.218, 16.1488),
(26, 'SAPD Fort Carson', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -320.191, 1048.23, 20.3403, 180.091, 0, 0, 1553.2, -1674.05, 2110.54, 269.901),
(27, 'Meat Factory', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 2014.28, -2040.13, 13.5508, 269.353, 0, 0, 1096.37, 1934.08, -19.2638, 178.486),
(28, 'Valet Tower Apartement', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 327.699, -1512.1, 36.0325, 228.934, 0, 0, -1760.04, 1109.86, -48.9807, 182.925),
(29, 'Basement SAPD', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1379.86, 1514.47, 1505.1, 359.587, 0, 0, 2487.86, 2397.24, 4.21094, 91.3198),
(30, 'Meat Factory SF', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -2161.06, 654.435, 52.3672, 275.712, 0, 1, 932.647, 2129.87, 1011.02, 268.966),
(31, 'Rooftop SAPD', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -309.545, 1045.42, 26.0125, 98.0896, 0, 0, 1566.88, -1677.13, 2110.54, 268.063),
(32, 'Backdoor Medical SF', '', 19130, 0, 0, 0, 2, -1, 0, 0, 0, 0, -2594.79, 642.164, 14.4531, 267.905, 0, 0, 1416.98, -1400.7, 2986.52, 90.7973),
(33, 'Sanfierro / Los Santos', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1685.85, -2237.54, 13.5469, 0.817571, 0, 0, -1421.34, -286.835, 14.1484, 140.494),
(35, 'San Fierro Police Departement', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1605.54, 710.307, 13.8672, 357.858, 0, 0, 1563.55, 1597.16, 1003.5, 265.716),
(36, 'Basement SFPD', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1574.5, 1612.85, 997.728, 4.45588, 0, 0, -1594.15, 716.123, -4.90625, 274.776),
(37, 'Police Basement', '', 19130, 0, 0, 0, 1, -1, 0, 0, 0, 0, 1568.61, -1689.97, 6.21875, 1.15927, 0, 0, 392.452, -1855.12, 2501.09, 265.417),
(38, 'Rooftop SFPD', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1573.29, 1620.07, 991.94, 93.086, 0, 0, -1594.58, 694.471, 48.9375, 36.7154),
(39, 'Bank of San Fierro', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1492.47, 920.297, 7.21344, 86.7914, 0, 0, 1319.41, 9.87335, 2068.51, 353.731),
(40, 'San Fierro News Departement', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -2055.94, 453.474, 35.1718, 322.42, 0, 0, 2364.26, -290.316, 1303.75, 358.036),
(41, 'San Fierro Government Service', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -2766.55, 375.487, 6.33468, 274.314, 0, 0, 909.936, 235.335, 1289.99, 351.06),
(42, 'Los Santos / Las Venturas', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1685.73, -2335.5, 13.5469, 180.21, 0, 0, 1672.54, 1447.91, 10.7881, 270.484),
(43, 'Area Penambang', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 637.506, 831.155, -42.9609, 0.019782, 0, 0, 643.24, 940.175, 1003.4, 355.424),
(44, 'Strip Clubbing', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1951.44, 1343, 15.3746, 262.618, 0, 17, 493.44, -24.9152, 1000.67, 355.043),
(45, 'Rooftop Medical SF', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -2633.02, 691.037, 66.0938, 180.642, 0, 0, 1417.36, -1406.63, 2986.52, 95.6225),
(46, 'SANEWS Rooftop', '', 19130, 0, 0, 0, 3, -1, 0, 0, 0, 0, -1896.05, 487.126, 35.1719, 270.861, 0, 0, 2367.55, -271.171, 1305.4, 177.117),
(57, 'Torque Company', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1135.38, -2037.25, 69.0988, 275.207, 0, 0, 0, 0, 0, 0),
(50, 'EXIT', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -4041.55, 2023.55, 1239.47, 166.398, 0, 0, 1455.98, 1630.48, 126.547, 199.322),
(51, 'Waroeng Roman', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 562.112, -1506.72, 14.5495, 276.174, 0, 0, 1089.05, -1446.64, 10011.8, 89.8584),
(52, 'Sex Shopping (Only Roleplay)', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1940.01, -2116.08, 13.6953, 90.0405, 0, 3, -100.38, -25.0304, 1000.72, 3.70856),
(53, 'House Estate', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1411.55, -1699.55, 13.5395, 229.341, 0, 0, 2304.69, -16.1558, 26.7422, 268.404),
(54, 'Santa Maria Beach', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 9, 311.482, 991.437, 1957.43, 78.3414, 0, 0, 391.272, -1850.54, 2501.09, 60.7882),
(55, 'County Connector', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 9, 320.071, 988.561, 1958.09, 266.681, 0, 0, 625.417, -104.704, 1000.98, 65.5999),
(56, 'Rehabilitation Hospital', '', 19130, 0, 0, 0, 2, -1, 0, 0, 0, 0, 2200.97, -63.459, 27.2676, 274.409, 0, 0, 1175.88, -1326.17, -44.2836, 92.4885),
(47, 'Platinum Company', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1653.75, -1654.76, 22.5156, 184.722, 0, 3, 390.467, 173.773, 1008.38, 89.504),
(58, 'Casino Real Bet', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1022.52, -1121.66, 23.872, 179.909, 0, 12, 1133.09, -15.8258, 1000.68, 353.909),
(59, 'The Strip LV', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 9, 320.18, 999.455, 1955.58, 281.592, 0, 0, 2042.29, 1348.87, 1011.87, 354.231),
(60, 'Bank Vault', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 2153.48, 1631.36, -34.0138, 89.6266, 0, 0, -986.645, 1480.73, 1336.3, 89.7423),
(61, 'Recruitment Staff', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 3, 819.576, 7.05508, 1004.18, 181.06, 0, 0, 0, 0, 0, 0),
(62, 'Special Operations Metropolitan', '', 19130, 0, 0, 0, 1, -1, 0, 0, 0, 0, 2337.15, 2458.86, 14.9688, 358.755, 0, 3, 288.838, 167.534, 1007.17, 0.254109),
(63, 'Basement', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 2268.16, 2449.19, 3.53125, 173.251, 0, 3, 238.723, 138.626, 1003.02, 167.244),
(64, 'Rooftop', '', 19130, 0, 0, 0, 1, -1, 0, 0, 0, 0, 2296.93, 2451.44, 10.8203, 88.8341, 0, 0, 2279.76, 2458.44, 38.6875, 357.846),
(65, 'Basement 2nd', '', 19130, 0, 0, 0, 1, -1, 0, 0, 0, 0, 2296.99, 2468.64, 10.8203, 86.8404, 0, 3, 301.918, 174.809, 1007.17, 89.5957),
(66, 'Basement G2', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 2282.29, 2423.11, 3.47656, 180.572, 0, 0, 2282.18, 2423.61, -7.25, 181.45),
(68, 'Rooftop SAPD', '', 19130, 0, 0, 0, 1, -1, 0, 0, 0, 0, 1575.89, 1614.68, 1003.53, 270.541, 0, 0, -1642.06, 693.631, 38.2422, 100.258),
(69, 'Metropolitan Training', '', 19130, 0, 0, 0, 1, -1, 0, 0, 0, 3, 285.214, 192.538, 1007.17, 358.75, 0, 2, 2548.8, -1294.84, 1060.98, 93.5471),
(71, 'Basement Police FORT', 'CARSON2025', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1603.36, -1651.19, 2107.08, 177.323, 0, 0, -298.585, 1021.22, 19.5938, 180.587),
(48, 'Pasar Malam (SESION)', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1302.25, -1424.87, 14.9531, 185.078, 0, 18, 1710.78, -1643.94, 27.2035, 223.311),
(93, 'Basement Apartement', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 292.98, -1495.11, 24.9219, 241.008, 0, 0, -1749.57, 1102.75, -48.9885, 92.0796),
(19, 'NONE', '', 19130, 0, 1, 0, 0, -1, 0, 0, 0, 0, 914.167, -1004.63, 37.9794, 179.96, 0, 0, 2773.93, 535.894, 1005.22, 178.616),
(16, 'Fren Central', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 3157.44, -840.686, 11.2414, 88.5218, 0, 0, 1494.62, 1537.46, 911.312, 191.586),
(22, 'Torque Rooftop', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1134.2, -2005.79, 69.0378, 269.501, 0, 0, 1118.09, -2035.82, 94.9169, 359.621),
(34, '.', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 2528.44, 139.622, 26.4815, 174.664, 0, 0, 0, 0, 0, 0),
(49, 'Sezion Palermitana', '', 19130, 0, 0, 0, 0, 4, 0, 0, 0, 0, 2118.63, 2416.75, 10.8203, 265.962, 0, 18, 1727.03, -1637.83, 20.219, 16.5328),
(75, 'Halaman belakang', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, 936.846, -620.228, 126.432, 306.581, 46, 12, 2316.25, -1144.41, 1054.3, 184.381),
(67, 'Basement SAGS', '', 19130, 0, 0, 0, 0, -1, 0, 0, 170, 0, 1396.27, 1567.11, -62.9838, 110.014, 0, 0, 1485.64, -1824.88, 13.5469, 184.876),
(70, 'Ws Jungles Stones', '', 19130, 0, 0, 0, 0, 3, 0, 0, 5, 0, 2157.07, -1421.71, 25.5391, 87.2362, 0, 0, 0, 0, 0, 0),
(72, 'Sixties Gangs', '', 19130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 335.997, -1335.32, 14.5078, 42.3893, 0, 18, -229.293, 1401.26, 27.7656, 266.536),
(73, 'GUDANG', '', 19130, 0, 0, 0, 0, -1, 0, 0, 24, 15, 2247.21, -1156.93, 1029.8, 19.9411, 0, 5, 318.525, 1114.48, 1083.88, 356.552),
(74, 'WOLVEX', '', 19130, 0, 0, 0, 0, 3, 0, 0, 0, 0, 253.783, -163.961, 5.07861, 350.665, 0, 6, 2332.96, -1077.35, 1049.02, 4.16147);

-- --------------------------------------------------------

--
-- Table structure for table `dropped_items`
--

CREATE TABLE `dropped_items` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `world` int(11) NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `dropped_by` varchar(24) NOT NULL DEFAULT 'System',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drug_labs`
--

CREATE TABLE `drug_labs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1=Weed, 2=Cocaine, 3=Meth',
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `z` float DEFAULT NULL,
  `interior` int(11) DEFAULT 0,
  `world` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `factionrank`
--

CREATE TABLE `factionrank` (
  `id` int(11) NOT NULL,
  `factionid` int(10) UNSIGNED NOT NULL,
  `rank1` varchar(50) NOT NULL DEFAULT 'None',
  `rank2` varchar(50) NOT NULL DEFAULT 'None',
  `rank3` varchar(50) NOT NULL DEFAULT 'None',
  `rank4` varchar(50) NOT NULL DEFAULT 'None',
  `rank5` varchar(50) NOT NULL DEFAULT 'None',
  `rank6` varchar(50) NOT NULL DEFAULT 'None'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `factionrank`
--

INSERT INTO `factionrank` (`id`, `factionid`, `rank1`, `rank2`, `rank3`, `rank4`, `rank5`, `rank6`) VALUES
(1, 1, 'Prob. Officer', 'Officer II - III ', 'Police Supervisors', 'Captain ', 'Commander Of Police ', 'Commisiorner Of Police'),
(3, 2, 'Probationary EMT', 'Senior EMT', 'Paramedic', 'Doctor', 'Deputy Chief of Medical', 'Head of Medical '),
(4, 3, 'Junior Officer', 'Senior Employee', 'Producers', 'Lead Of Division', 'Director Secretary', 'Board Of Directors'),
(5, 4, 'None', 'None', 'None', 'None', 'None', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `faction_vehpoint`
--

CREATE TABLE `faction_vehpoint` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `posa` float DEFAULT 0,
  `basex` float DEFAULT 0,
  `basey` float DEFAULT 0,
  `basez` float DEFAULT 0,
  `basea` float DEFAULT 0,
  `roofx` float DEFAULT 0,
  `roofy` float DEFAULT 0,
  `roofz` float DEFAULT 0,
  `roofa` float DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `faction_vehpoint`
--

INSERT INTO `faction_vehpoint` (`id`, `owner`, `type`, `posx`, `posy`, `posz`, `posa`, `basex`, `basey`, `basez`, `basea`, `roofx`, `roofy`, `roofz`, `roofa`, `world`, `interior`) VALUES
(0, 0, 1, 1531.35, -1672.32, 6.21875, 96.2626, 1541.38, -1672.97, 5.89062, 263.85, 0, 0, 0, 0, 0, 0),
(1, 0, 1, 1565.28, -1656.6, 28.3979, 42.4833, 0, 0, 0, 0, 1565.01, -1656.31, 28.3979, 42.6337, 0, 0),
(2, 0, 2, 1124.25, -1321.73, 13.7719, 176.072, 1125.26, -1309.63, 13.5922, 354.181, 0, 0, 0, 0, 0, 0),
(3, 0, 3, 769.693, -1354.9, 13.6247, 267.692, 774.139, -1355.73, 13.6311, 251.576, 774.795, -1354.45, 13.6321, 2.50288, 0, 0),
(4, 0, 1, -293.804, 1045.88, 19.6037, 167.262, -295.554, 1057.96, 19.5938, 4.28907, -333.852, 1050.04, 26.0125, 359.37, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `families`
--

CREATE TABLE `families` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` tinyint(4) DEFAULT 0 COMMENT '0=None,1=Gang,2=Mafia,3=Cartel,4=MC,5=Racer,6=Yakuza',
  `color` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(24) NOT NULL DEFAULT 'System',
  `leader` varchar(64) DEFAULT 'None',
  `leader_uid` int(11) DEFAULT 0,
  `money` bigint(20) DEFAULT 0,
  `bank` bigint(20) DEFAULT 0,
  `materials` int(11) DEFAULT 0,
  `component` int(11) DEFAULT 0,
  `marijuana` int(11) DEFAULT 0,
  `cocaine` int(11) DEFAULT NULL,
  `meth` int(11) DEFAULT 0,
  `ephedrine` int(11) DEFAULT 0,
  `muriatic` int(11) DEFAULT 0,
  `clip_pistol` int(11) DEFAULT 0,
  `clip_sg` int(11) DEFAULT 0,
  `clip_smg` int(11) DEFAULT 0,
  `weapon_ids` text DEFAULT NULL,
  `weapon_ammo` text DEFAULT NULL,
  `weapon_serial` text DEFAULT NULL,
  `weapon_durability` text DEFAULT NULL,
  `kills` int(11) DEFAULT 0,
  `deaths` int(11) DEFAULT 0,
  `score` int(11) DEFAULT 0,
  `level` int(11) DEFAULT 1,
  `turf_tokens` int(11) DEFAULT 0,
  `vault_x` float DEFAULT 0,
  `vault_y` float DEFAULT 0,
  `vault_z` float DEFAULT 0,
  `vault_int` int(11) DEFAULT 0,
  `vault_vw` int(11) DEFAULT 0,
  `ent_x` float DEFAULT 0,
  `ent_y` float DEFAULT 0,
  `ent_z` float DEFAULT 0,
  `ent_a` float DEFAULT 0,
  `exit_x` float DEFAULT 0,
  `exit_y` float DEFAULT 0,
  `exit_z` float DEFAULT 0,
  `exit_a` float DEFAULT 0,
  `hq_int` int(11) DEFAULT 0,
  `hq_vw` int(11) DEFAULT 0,
  `hq_locked` tinyint(1) DEFAULT 0,
  `craft_x` float DEFAULT 0,
  `craft_y` float DEFAULT 0,
  `craft_z` float DEFAULT 0,
  `craft_int` int(11) DEFAULT 0,
  `craft_vw` int(11) DEFAULT 0,
  `motd` varchar(128) DEFAULT 'Set MOTD melalui /fsetmotd',
  `discord_hook` varchar(256) DEFAULT '-',
  `salary_1` int(11) DEFAULT 0,
  `salary_2` int(11) DEFAULT 0,
  `salary_3` int(11) DEFAULT 0,
  `salary_4` int(11) DEFAULT 0,
  `salary_5` int(11) DEFAULT 0,
  `salary_6` int(11) DEFAULT 0,
  `salary_7` int(11) DEFAULT 0,
  `rank_name_1` varchar(32) NOT NULL DEFAULT 'None',
  `rank_name_2` varchar(32) NOT NULL DEFAULT 'None',
  `rank_name_3` varchar(32) NOT NULL DEFAULT 'None',
  `rank_name_4` varchar(32) NOT NULL DEFAULT 'None',
  `rank_name_5` varchar(32) NOT NULL DEFAULT 'None',
  `rank_name_6` varchar(32) NOT NULL DEFAULT 'None',
  `rank_name_7` varchar(32) NOT NULL DEFAULT 'None',
  `skin_ids` varchar(64) DEFAULT NULL,
  `last_war_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `familys`
--

CREATE TABLE `familys` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT 'None',
  `leader` varchar(50) NOT NULL DEFAULT 'None',
  `type` int(11) NOT NULL DEFAULT 0,
  `point` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `motd` varchar(100) NOT NULL DEFAULT 'None',
  `color` int(11) DEFAULT 0,
  `extposx` float DEFAULT 0,
  `extposy` float DEFAULT 0,
  `extposz` float DEFAULT 0,
  `extposa` float DEFAULT 0,
  `intposx` float DEFAULT 0,
  `intposy` float DEFAULT 0,
  `intposz` float DEFAULT 0,
  `intposa` float DEFAULT 0,
  `fint` int(11) NOT NULL DEFAULT 0,
  `Weapon1` int(11) NOT NULL DEFAULT 0,
  `Ammo1` int(11) NOT NULL DEFAULT 0,
  `Weapon2` int(11) NOT NULL DEFAULT 0,
  `Ammo2` int(11) NOT NULL DEFAULT 0,
  `Weapon3` int(11) NOT NULL DEFAULT 0,
  `Ammo3` int(11) NOT NULL DEFAULT 0,
  `Weapon4` int(11) NOT NULL DEFAULT 0,
  `Ammo4` int(11) NOT NULL DEFAULT 0,
  `Weapon5` int(11) NOT NULL DEFAULT 0,
  `Ammo5` int(11) NOT NULL DEFAULT 0,
  `Weapon6` int(11) NOT NULL DEFAULT 0,
  `Ammo6` int(11) NOT NULL DEFAULT 0,
  `Weapon7` int(11) NOT NULL DEFAULT 0,
  `Ammo7` int(11) NOT NULL DEFAULT 0,
  `Weapon8` int(11) NOT NULL DEFAULT 0,
  `Ammo8` int(11) NOT NULL DEFAULT 0,
  `Weapon9` int(11) NOT NULL DEFAULT 0,
  `Ammo9` int(11) NOT NULL DEFAULT 0,
  `Weapon10` int(11) NOT NULL DEFAULT 0,
  `Ammo10` int(11) NOT NULL DEFAULT 0,
  `Serial1` int(11) NOT NULL DEFAULT 0,
  `Serial2` int(11) NOT NULL DEFAULT 0,
  `Serial3` int(11) NOT NULL DEFAULT 0,
  `Serial4` int(11) NOT NULL DEFAULT 0,
  `Serial5` int(11) NOT NULL DEFAULT 0,
  `Serial6` int(11) NOT NULL DEFAULT 0,
  `Serial7` int(11) NOT NULL DEFAULT 0,
  `Serial8` int(11) NOT NULL DEFAULT 0,
  `Serial9` int(11) NOT NULL DEFAULT 0,
  `Serial10` int(11) NOT NULL DEFAULT 0,
  `Serial11` int(11) NOT NULL DEFAULT 0,
  `Serial12` int(11) NOT NULL DEFAULT 0,
  `Serial13` int(11) NOT NULL DEFAULT 0,
  `Serial14` int(11) NOT NULL DEFAULT 0,
  `Serial15` int(11) NOT NULL DEFAULT 0,
  `Durability1` int(11) NOT NULL DEFAULT 0,
  `Durability2` int(11) NOT NULL DEFAULT 0,
  `Durability3` int(11) NOT NULL DEFAULT 0,
  `Durability4` int(11) NOT NULL DEFAULT 0,
  `Durability5` int(11) NOT NULL DEFAULT 0,
  `Durability6` int(11) NOT NULL DEFAULT 0,
  `Durability7` int(11) NOT NULL DEFAULT 0,
  `Durability8` int(11) NOT NULL DEFAULT 0,
  `Durability9` int(11) NOT NULL DEFAULT 0,
  `Durability10` int(11) NOT NULL DEFAULT 0,
  `Durability11` int(11) NOT NULL DEFAULT 0,
  `Durability12` int(11) NOT NULL DEFAULT 0,
  `Durability13` int(11) NOT NULL DEFAULT 0,
  `Durability14` int(11) NOT NULL DEFAULT 0,
  `Durability15` int(11) NOT NULL DEFAULT 0,
  `rank1` varchar(50) NOT NULL DEFAULT 'None',
  `rank2` varchar(50) NOT NULL DEFAULT 'None',
  `rank3` varchar(50) NOT NULL DEFAULT 'None',
  `rank4` varchar(50) NOT NULL DEFAULT 'None',
  `rank5` varchar(50) NOT NULL DEFAULT 'None',
  `rank6` varchar(50) NOT NULL DEFAULT 'None',
  `safex` float DEFAULT 0,
  `safey` float DEFAULT 0,
  `safez` float DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 0,
  `marijuana` int(11) NOT NULL DEFAULT 0,
  `cocaine` int(11) NOT NULL DEFAULT 0,
  `meth` int(11) NOT NULL DEFAULT 0,
  `component` int(11) NOT NULL DEFAULT 0,
  `material` int(11) NOT NULL DEFAULT 0,
  `Weapon11` int(11) NOT NULL DEFAULT 0,
  `Ammo11` int(11) NOT NULL DEFAULT 0,
  `Weapon12` int(11) NOT NULL DEFAULT 0,
  `Ammo12` int(11) NOT NULL DEFAULT 0,
  `Weapon13` int(11) NOT NULL DEFAULT 0,
  `Ammo13` int(11) NOT NULL DEFAULT 0,
  `Weapon14` int(11) NOT NULL DEFAULT 0,
  `Ammo14` int(11) NOT NULL DEFAULT 0,
  `Weapon15` int(11) NOT NULL DEFAULT 0,
  `Ammo15` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_logs`
--

CREATE TABLE `family_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `family_id` int(10) UNSIGNED NOT NULL,
  `player_id` int(10) UNSIGNED DEFAULT NULL,
  `player_name` varchar(64) DEFAULT NULL,
  `action_key` varchar(64) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `log_type` tinyint(4) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_relations`
--

CREATE TABLE `family_relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `fam_a` int(10) UNSIGNED NOT NULL,
  `fam_b` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Neutral,1=Alliance,-1=War',
  `since` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_relation_logs`
--

CREATE TABLE `family_relation_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `fam_a` int(10) UNSIGNED NOT NULL,
  `fam_b` int(10) UNSIGNED NOT NULL,
  `old_status` tinyint(4) NOT NULL DEFAULT 0,
  `new_status` tinyint(4) NOT NULL DEFAULT 0,
  `changed_by` varchar(24) NOT NULL,
  `changed_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_turfs`
--

CREATE TABLE `family_turfs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `min_x` float DEFAULT NULL,
  `min_y` float DEFAULT NULL,
  `max_x` float DEFAULT NULL,
  `max_y` float DEFAULT NULL,
  `owner` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK families.id ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â NULL = Netral',
  `color` int(11) DEFAULT -120,
  `cooldown` int(11) DEFAULT 0 COMMENT 'Unix timestamp proteksi setelah perang',
  `cap_x` float DEFAULT 0,
  `cap_y` float DEFAULT 0,
  `cap_z` float DEFAULT 0,
  `cap_int` int(11) DEFAULT 0,
  `cap_vw` int(11) DEFAULT 0,
  `tier` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=Common,1=Uncommon,2=Rare,3=Epic,4=Legendary'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_vehicles`
--

CREATE TABLE `family_vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `family_id` int(10) UNSIGNED NOT NULL,
  `slot_id` tinyint(4) NOT NULL,
  `model_id` int(11) NOT NULL,
  `spawn_x` float DEFAULT NULL,
  `spawn_y` float DEFAULT NULL,
  `spawn_z` float DEFAULT NULL,
  `spawn_a` float DEFAULT NULL,
  `color1` int(11) DEFAULT 0,
  `color2` int(11) DEFAULT 0,
  `health` float DEFAULT 1000,
  `fuel` int(11) DEFAULT 100,
  `locked` tinyint(1) DEFAULT 0,
  `engine` tinyint(1) DEFAULT 0,
  `interior` int(11) DEFAULT 0,
  `world` int(11) DEFAULT 0,
  `rank_access` tinyint(4) DEFAULT 1,
  `plate` varchar(32) DEFAULT NULL,
  `impounded` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fishingarea`
--

CREATE TABLE `fishingarea` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `size` float DEFAULT 30,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `furniture`
--

CREATE TABLE `furniture` (
  `id` int(11) NOT NULL,
  `houseid` int(11) NOT NULL DEFAULT -1,
  `label` varchar(124) NOT NULL DEFAULT 'None',
  `used` int(11) NOT NULL DEFAULT 0,
  `model` int(11) NOT NULL DEFAULT 0,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `posrx` float DEFAULT 0,
  `posry` float DEFAULT 0,
  `posrz` float DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gangvehicle`
--

CREATE TABLE `gangvehicle` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner` int(11) NOT NULL,
  `model` int(11) NOT NULL DEFAULT 0,
  `fuel` int(11) NOT NULL DEFAULT 1000,
  `health` float NOT NULL DEFAULT 1000,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `posa` float NOT NULL DEFAULT 0,
  `color1` int(11) NOT NULL DEFAULT 0,
  `color2` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `garkot`
--

CREATE TABLE `garkot` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `posa` float DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

CREATE TABLE `gates` (
  `ID` int(11) NOT NULL,
  `model` int(11) NOT NULL DEFAULT 0,
  `password` varchar(36) NOT NULL DEFAULT '',
  `admin` tinyint(4) NOT NULL DEFAULT 0,
  `vip` tinyint(4) NOT NULL DEFAULT 0,
  `faction` tinyint(4) NOT NULL DEFAULT 0,
  `family` int(11) NOT NULL DEFAULT -1,
  `speed` float NOT NULL DEFAULT 2,
  `cX` float NOT NULL,
  `cY` float NOT NULL,
  `cZ` float NOT NULL,
  `cRX` float NOT NULL,
  `cRY` float NOT NULL,
  `cRZ` float NOT NULL,
  `oX` float NOT NULL,
  `oY` float NOT NULL,
  `oZ` float NOT NULL,
  `oRX` float NOT NULL,
  `oRY` float NOT NULL,
  `oRZ` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gstations`
--

CREATE TABLE `gstations` (
  `id` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 10000,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gstations`
--

INSERT INTO `gstations` (`id`, `stock`, `posx`, `posy`, `posz`) VALUES
(3, 10000, 1000.65, -940.337, 42.1797),
(2, 10000, 1008.78, -933.784, 41.7496),
(1, 10000, -94.6416, -1160.81, 2.18387),
(0, 10000, -93.4353, -1174.43, 2.28702),
(4, 10000, 1938.53, -1774.43, 13.3828),
(5, 10000, 1944.19, -1767.01, 13.3828);

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `ID` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL DEFAULT '-',
  `owner2` varchar(50) NOT NULL DEFAULT '-',
  `address` varchar(255) NOT NULL DEFAULT '-',
  `price` int(11) NOT NULL DEFAULT 500000,
  `type` int(11) NOT NULL DEFAULT 1,
  `locked` int(11) NOT NULL DEFAULT 1,
  `seal` int(11) NOT NULL DEFAULT 0,
  `money` bigint(20) NOT NULL DEFAULT 0,
  `component` int(11) NOT NULL DEFAULT 0,
  `material` int(11) NOT NULL DEFAULT 0,
  `burger` int(11) NOT NULL DEFAULT 0,
  `milk` int(11) NOT NULL DEFAULT 0,
  `bandage` int(11) NOT NULL DEFAULT 0,
  `medicine` int(11) NOT NULL DEFAULT 0,
  `food` int(11) NOT NULL DEFAULT 0,
  `seed` int(11) NOT NULL DEFAULT 0,
  `clippistol` int(11) NOT NULL DEFAULT 0,
  `clipsg` int(11) NOT NULL DEFAULT 0,
  `clipsmg` int(11) NOT NULL DEFAULT 0,
  `marijuana` int(11) NOT NULL DEFAULT 0,
  `ephedrine` int(11) NOT NULL DEFAULT 0,
  `cocaine` int(11) NOT NULL DEFAULT 0,
  `meth` int(11) NOT NULL DEFAULT 0,
  `houseint` int(11) NOT NULL DEFAULT 0,
  `extposx` float NOT NULL DEFAULT 0,
  `extposy` float NOT NULL DEFAULT 0,
  `extposz` float NOT NULL DEFAULT 0,
  `extposa` float NOT NULL DEFAULT 0,
  `intposx` float NOT NULL DEFAULT 0,
  `intposy` float NOT NULL DEFAULT 0,
  `intposz` float NOT NULL DEFAULT 0,
  `intposa` float NOT NULL DEFAULT 0,
  `visit` bigint(20) DEFAULT 0,
  `houseSkin1` int(11) NOT NULL DEFAULT 0,
  `houseSkin2` int(11) NOT NULL DEFAULT 0,
  `houseSkin3` int(11) NOT NULL DEFAULT 0,
  `houseSkin4` int(11) NOT NULL DEFAULT 0,
  `houseSkin5` int(11) NOT NULL DEFAULT 0,
  `houseWeapon1` int(11) DEFAULT 0,
  `houseAmmo1` int(11) DEFAULT 0,
  `houseWeapon2` int(11) DEFAULT 0,
  `houseAmmo2` int(11) DEFAULT 0,
  `houseWeapon3` int(11) DEFAULT 0,
  `houseAmmo3` int(11) DEFAULT 0,
  `houseWeapon4` int(11) DEFAULT 0,
  `houseAmmo4` int(11) DEFAULT 0,
  `houseWeapon5` int(11) DEFAULT 0,
  `houseAmmo5` int(11) DEFAULT 0,
  `houseWeapon6` int(11) DEFAULT 0,
  `houseAmmo6` int(11) DEFAULT 0,
  `houseWeapon7` int(11) DEFAULT 0,
  `houseAmmo7` int(11) DEFAULT 0,
  `houseWeapon8` int(11) DEFAULT 0,
  `houseAmmo8` int(11) DEFAULT 0,
  `houseWeapon9` int(11) DEFAULT 0,
  `houseAmmo9` int(11) DEFAULT 0,
  `houseWeapon10` int(11) DEFAULT 0,
  `houseAmmo10` int(11) DEFAULT 0,
  `houseSerial1` int(11) NOT NULL DEFAULT 0,
  `houseSerial2` int(11) NOT NULL DEFAULT 0,
  `houseSerial3` int(11) NOT NULL DEFAULT 0,
  `houseSerial4` int(11) NOT NULL DEFAULT 0,
  `houseSerial5` int(11) NOT NULL DEFAULT 0,
  `houseSerial6` int(11) NOT NULL DEFAULT 0,
  `houseSerial7` int(11) NOT NULL DEFAULT 0,
  `houseSerial8` int(11) NOT NULL DEFAULT 0,
  `houseSerial9` int(11) NOT NULL DEFAULT 0,
  `houseSerial10` int(11) NOT NULL DEFAULT 0,
  `houseDurability1` int(11) NOT NULL DEFAULT 0,
  `houseDurability2` int(11) NOT NULL DEFAULT 0,
  `houseDurability3` int(11) NOT NULL DEFAULT 0,
  `houseDurability4` int(11) NOT NULL DEFAULT 0,
  `houseDurability5` int(11) NOT NULL DEFAULT 0,
  `houseDurability6` int(11) NOT NULL DEFAULT 0,
  `houseDurability7` int(11) NOT NULL DEFAULT 0,
  `houseDurability8` int(11) NOT NULL DEFAULT 0,
  `houseDurability9` int(11) NOT NULL DEFAULT 0,
  `houseDurability10` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `huntable_objects`
--

CREATE TABLE `huntable_objects` (
  `id` int(11) NOT NULL,
  `modelid` int(11) NOT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `rot_x` float NOT NULL DEFAULT 0,
  `rot_y` float NOT NULL DEFAULT 0,
  `rot_z` float NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 3,
  `reward` int(11) NOT NULL DEFAULT 500,
  `respawn_time` int(11) NOT NULL DEFAULT 60
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lockers`
--

CREATE TABLE `lockers` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 0,
  `wheat` int(11) NOT NULL DEFAULT 0,
  `orange` int(11) NOT NULL DEFAULT 0,
  `potato` int(11) NOT NULL DEFAULT 0,
  `meat` int(11) NOT NULL DEFAULT 0,
  `milk` int(11) NOT NULL DEFAULT 0,
  `coffeebeans` int(11) NOT NULL DEFAULT 0,
  `fish` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lockers`
--

INSERT INTO `lockers` (`id`, `type`, `posx`, `posy`, `posz`, `interior`, `money`, `wheat`, `orange`, `potato`, `meat`, `milk`, `coffeebeans`, `fish`) VALUES
(0, 2, 1237.74, -1306.45, 1475.87, 0, 172864, 0, 0, 0, 0, 0, 0, 0),
(2, 1, 408.387, -1871.01, 2501.09, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 408.387, -1871.01, 2501.09, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 5, 1386.88, 1565.85, -62.9838, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `logbank`
--

CREATE TABLE `logbank` (
  `player` varchar(50) NOT NULL,
  `playerid` int(11) NOT NULL,
  `other` varchar(50) NOT NULL DEFAULT '*',
  `otherid` int(11) NOT NULL DEFAULT -1,
  `str` varchar(50) NOT NULL DEFAULT '*',
  `live_time` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logbans`
--

CREATE TABLE `logbans` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `target_name` varchar(24) DEFAULT NULL,
  `admin_name` varchar(24) DEFAULT NULL,
  `type` enum('Ban','Unban','TempBan','OfflineBan') DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `ip` varchar(16) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logfaction`
--

CREATE TABLE `logfaction` (
  `command` varchar(50) NOT NULL,
  `player` varchar(50) NOT NULL,
  `playerid` int(11) NOT NULL,
  `other` varchar(50) NOT NULL DEFAULT '*',
  `otherid` int(11) NOT NULL DEFAULT -1,
  `factionid` int(11) NOT NULL DEFAULT 0,
  `str` varchar(50) NOT NULL DEFAULT '*',
  `time` bigint(20) UNSIGNED NOT NULL,
  `live_time` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loggive`
--

CREATE TABLE `loggive` (
  `command` varchar(50) NOT NULL,
  `player` varchar(50) NOT NULL,
  `playerid` int(11) NOT NULL,
  `player_admin` int(11) NOT NULL DEFAULT 0,
  `other` varchar(50) NOT NULL DEFAULT '*',
  `otherid` int(11) NOT NULL DEFAULT -1,
  `other_admin` int(11) NOT NULL DEFAULT 0,
  `str` varchar(50) NOT NULL DEFAULT '*',
  `live_time` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logjail`
--

CREATE TABLE `logjail` (
  `admin` varchar(40) NOT NULL DEFAULT 'None',
  `adminid` int(11) NOT NULL DEFAULT 0,
  `toplayer` varchar(40) NOT NULL DEFAULT 'None',
  `toplayerid` int(11) NOT NULL DEFAULT 0,
  `jail_time` int(11) NOT NULL DEFAULT 0,
  `reason` varchar(128) NOT NULL DEFAULT '*',
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loglocker`
--

CREATE TABLE `loglocker` (
  `status` varchar(50) NOT NULL,
  `player` varchar(50) NOT NULL,
  `playerid` int(11) NOT NULL,
  `factionid` int(11) NOT NULL,
  `str` varchar(50) NOT NULL DEFAULT '*',
  `live_time` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `loglocker`
--

INSERT INTO `loglocker` (`status`, `player`, `playerid`, `factionid`, `str`, `live_time`) VALUES
('WITHDRAWWEAPON', 'Hoverski_Hoverstiers', 1, 1, 'M4', '2026-09-26 12:57:28.430460');

-- --------------------------------------------------------

--
-- Table structure for table `loglogin`
--

CREATE TABLE `loglogin` (
  `no` int(11) NOT NULL,
  `username` varchar(40) NOT NULL DEFAULT 'None',
  `reg_id` int(11) NOT NULL DEFAULT 0,
  `password` varchar(64) NOT NULL DEFAULT 'None',
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logpay`
--

CREATE TABLE `logpay` (
  `player` varchar(40) NOT NULL DEFAULT 'None',
  `playerid` int(11) NOT NULL DEFAULT 0,
  `toplayer` varchar(40) NOT NULL DEFAULT 'None',
  `toplayerid` int(11) NOT NULL DEFAULT 0,
  `ammount` int(11) NOT NULL DEFAULT 0,
  `time` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logstaff`
--

CREATE TABLE `logstaff` (
  `command` varchar(50) NOT NULL,
  `admin` varchar(50) NOT NULL,
  `adminid` int(11) NOT NULL,
  `player` varchar(50) NOT NULL DEFAULT '*',
  `playerid` int(11) NOT NULL DEFAULT -1,
  `str` varchar(50) NOT NULL DEFAULT '*',
  `time` bigint(20) UNSIGNED NOT NULL,
  `live_time` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `logstaff`
--

INSERT INTO `logstaff` (`command`, `admin`, `adminid`, `player`, `playerid`, `str`, `time`, `live_time`) VALUES
('SETVIP', 'Hoverski_Hoverstiers(alokmenjawa)', 1, 'Hoverski_Hoverstiers', 1, '3(0 days)', 1790400920, '2026-09-26 12:35:20.973137'),
('OVERDOSEMONEYALL', 'Hoverski_Hoverstiers(alokmenjawa)', 1, '*', -1, '$1.00', 1790402007, '2026-09-26 12:53:27.738620'),
('OVERDOSEMONEYALL', 'Hoverski_Hoverstiers(alokmenjawa)', 1, '*', -1, '$100.00', 1790402012, '2026-09-26 12:53:32.522106'),
('OVERDOSEMONEYALL', 'Hoverski_Hoverstiers(alokmenjawa)', 1, '*', -1, '$100.00', 1790402016, '2026-09-26 12:53:36.745115'),
('OVERDOSEMONEYALL', 'Hoverski_Hoverstiers(alokmenjawa)', 1, '*', -1, '$10,000.00', 1790402023, '2026-09-26 12:53:43.663611'),
('SETLEADER', 'Hoverski_Hoverstiers(alokmenjawa)', 1, 'Hoverski_Hoverstiers', 1, '1', 1790402217, '2026-09-26 12:56:57.140440'),
('SETLEVEL', 'Hoverski_Hoverstiers(alokmenjawa)', 1, 'Hoverski_Hoverstiers', 1, 'Set level to 100', 1790402266, '2026-09-26 12:57:46.763327'),
('CREATEBISNIS', 'Hoverski_Hoverstiers(alokmenjawa)', 1, '*', -1, 'Bisnis ID: 53', 1790403001, '2026-09-26 13:10:01.671545');

-- --------------------------------------------------------

--
-- Table structure for table `logwarn`
--

CREATE TABLE `logwarn` (
  `admin` varchar(40) NOT NULL DEFAULT 'None',
  `adminid` int(11) NOT NULL DEFAULT 0,
  `toplayer` varchar(40) NOT NULL DEFAULT 'None',
  `toplayerid` int(11) NOT NULL DEFAULT 0,
  `reason` varchar(128) NOT NULL DEFAULT '*',
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logworkshop`
--

CREATE TABLE `logworkshop` (
  `command` varchar(50) NOT NULL,
  `admin` int(11) NOT NULL DEFAULT 0,
  `player` varchar(50) NOT NULL DEFAULT '*',
  `playerid` int(11) NOT NULL DEFAULT -1,
  `other` varchar(50) NOT NULL DEFAULT '*',
  `otherid` int(11) NOT NULL DEFAULT -1,
  `workshopid` int(11) NOT NULL DEFAULT -1,
  `str` varchar(50) NOT NULL DEFAULT '*',
  `time` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_crates`
--

CREATE TABLE `log_crates` (
  `id` int(11) NOT NULL,
  `crate_sql_id` int(11) NOT NULL,
  `player_name` varchar(24) NOT NULL,
  `player_sql_id` int(11) NOT NULL,
  `action` varchar(32) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `amount` int(11) NOT NULL,
  `description` varchar(128) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lotre_state`
--

CREATE TABLE `lotre_state` (
  `provider_id` tinyint(3) UNSIGNED NOT NULL,
  `jackpot` int(10) UNSIGNED DEFAULT 0,
  `last_draw` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lotre_state`
--

INSERT INTO `lotre_state` (`provider_id`, `jackpot`, `last_draw`) VALUES
(0, 0, 1790493766),
(1, 8000, 1788508829),
(2, 0, 1788519632),
(3, 0, 1788530437),
(4, 0, 1790493766);

-- --------------------------------------------------------

--
-- Table structure for table `lotre_tickets`
--

CREATE TABLE `lotre_tickets` (
  `id` int(11) NOT NULL,
  `provider_id` tinyint(3) UNSIGNED NOT NULL,
  `ticket_slot` smallint(5) UNSIGNED NOT NULL,
  `ticket_number` int(10) UNSIGNED NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `owner_name` varchar(24) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lotre_tickets`
--

INSERT INTO `lotre_tickets` (`id`, `provider_id`, `ticket_slot`, `ticket_number`, `owner_id`, `owner_name`) VALUES
(173, 1, 0, 79174, 1126, 'Horis_Alvar');

-- --------------------------------------------------------

--
-- Table structure for table `mappingingame`
--

CREATE TABLE `mappingingame` (
  `id` int(11) NOT NULL,
  `objectmodel` int(11) NOT NULL DEFAULT 0,
  `posx` float NOT NULL,
  `posy` float NOT NULL,
  `posz` float NOT NULL,
  `posrx` float NOT NULL,
  `posry` float NOT NULL,
  `posrz` float NOT NULL,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mappingingame`
--

INSERT INTO `mappingingame` (`id`, `objectmodel`, `posx`, `posy`, `posz`, `posrx`, `posry`, `posrz`, `interior`, `world`) VALUES
(0, 12814, 2046.67, -1907.31, 12.5469, 0, 0, -90, 0, 0),
(1, 12814, 2051.54, -1895.48, 12.4547, 0, 0, -40, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `matext`
--

CREATE TABLE `matext` (
  `id` int(11) NOT NULL,
  `text` varchar(254) NOT NULL DEFAULT 'None',
  `size` int(11) NOT NULL DEFAULT 0,
  `color` int(11) NOT NULL DEFAULT 0,
  `bold` int(11) NOT NULL DEFAULT 0,
  `x` float DEFAULT 0,
  `y` float DEFAULT 0,
  `z` float DEFAULT 0,
  `rx` float DEFAULT 0,
  `ry` float DEFAULT 0,
  `rz` float DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `midtrans`
--

CREATE TABLE `midtrans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discord_id` varchar(20) NOT NULL,
  `discord_username` varchar(100) NOT NULL DEFAULT 'None',
  `guild_id` varchar(20) DEFAULT NULL,
  `channel_id` varchar(20) DEFAULT NULL,
  `message_id` varchar(20) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_price` decimal(15,0) NOT NULL DEFAULT 0,
  `payment_url` varchar(600) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `va_number` varchar(30) DEFAULT NULL,
  `is_promo` tinyint(1) NOT NULL DEFAULT 0,
  `expire_time` timestamp NULL DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `claimed_at` timestamp NULL DEFAULT NULL,
  `attempt_count` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status_claim` tinyint(1) NOT NULL DEFAULT 0,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `myfish`
--

CREATE TABLE `myfish` (
  `id` bigint(20) NOT NULL,
  `owner` int(11) NOT NULL DEFAULT 0,
  `name` varchar(46) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `area_type` int(11) NOT NULL,
  `date` varchar(36) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `myore`
--

CREATE TABLE `myore` (
  `id` bigint(20) NOT NULL,
  `owner` int(11) DEFAULT 0,
  `description` varchar(128) DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT 0,
  `date` varchar(128) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `npcfamily`
--

CREATE TABLE `npcfamily` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `posa` float DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 0,
  `material` int(11) NOT NULL DEFAULT 0,
  `marijuana` int(11) NOT NULL DEFAULT 0,
  `cocaine` int(11) NOT NULL DEFAULT 0,
  `meth` int(11) NOT NULL DEFAULT 0,
  `price0` int(11) NOT NULL DEFAULT 0,
  `price1` int(11) NOT NULL DEFAULT 0,
  `price2` int(11) NOT NULL DEFAULT 0,
  `price3` int(11) NOT NULL DEFAULT 0,
  `price4` int(11) NOT NULL DEFAULT 0,
  `price5` int(11) NOT NULL DEFAULT 0,
  `price6` int(11) NOT NULL DEFAULT 0,
  `price7` int(11) NOT NULL DEFAULT 0,
  `price8` int(11) NOT NULL DEFAULT 0,
  `price9` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ores`
--

CREATE TABLE `ores` (
  `id` int(11) NOT NULL,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `posrx` float DEFAULT 0,
  `posry` float DEFAULT 0,
  `posrz` float DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phonebook`
--

CREATE TABLE `phonebook` (
  `id` bigint(20) NOT NULL,
  `owner` int(11) DEFAULT 0,
  `cname` varchar(46) DEFAULT '',
  `cnumber` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plants`
--

CREATE TABLE `plants` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `time` bigint(20) NOT NULL DEFAULT 0,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `reg_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(24) NOT NULL DEFAULT '',
  `ucp_name` varchar(24) NOT NULL DEFAULT '',
  `adminname` varchar(24) NOT NULL DEFAULT 'None',
  `twittername` varchar(24) NOT NULL DEFAULT 'None',
  `ip` varchar(24) NOT NULL DEFAULT '',
  `password` char(64) NOT NULL DEFAULT '',
  `salt` char(16) NOT NULL DEFAULT '',
  `email` varchar(40) NOT NULL DEFAULT 'None',
  `admin` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `helper` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `levelup` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `vip` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `vip_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `gold` int(11) NOT NULL DEFAULT 0,
  `reg_date` varchar(30) NOT NULL DEFAULT '',
  `last_login` varchar(30) NOT NULL DEFAULT '',
  `money` int(11) NOT NULL DEFAULT 0,
  `bmoney` int(11) NOT NULL DEFAULT 0,
  `brek` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `phone` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `phonecredit` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `phonebook` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `wt` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `hours` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `minutes` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `seconds` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `paycheck` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `skin` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `facskin` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `age` varchar(30) NOT NULL DEFAULT '',
  `indoor` mediumint(8) NOT NULL DEFAULT -1,
  `inbiz` mediumint(8) NOT NULL DEFAULT -1,
  `inhouse` mediumint(8) NOT NULL DEFAULT -1,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `posa` float NOT NULL DEFAULT 0,
  `interior` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `world` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `health` float NOT NULL DEFAULT 100,
  `armour` float NOT NULL DEFAULT 0,
  `hunger` smallint(5) NOT NULL DEFAULT 100,
  `bladder` smallint(5) NOT NULL DEFAULT 100,
  `energy` smallint(5) NOT NULL DEFAULT 100,
  `sick` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hospital` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `injured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `duty` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `dutytime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `faction` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `factionrank` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `factionlead` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `family` tinyint(3) NOT NULL DEFAULT -1,
  `familyrank` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `workshop` tinyint(3) NOT NULL DEFAULT -1,
  `workshoprank` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `jail` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `jail_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `rehab` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `rehab_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `robbing` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `robbing_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `arrest` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `arrest_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `warn` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `job` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `job2` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `jobtime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sidejobtime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `exitjob` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `taxitime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `medicine` mediumint(8) NOT NULL DEFAULT 0,
  `medkit` mediumint(8) NOT NULL DEFAULT 0,
  `mask` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `helmet` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `fightingstyle` tinyint(3) UNSIGNED NOT NULL DEFAULT 4,
  `burger` mediumint(8) NOT NULL DEFAULT 0,
  `milk` mediumint(8) NOT NULL DEFAULT 0,
  `gas` mediumint(8) NOT NULL DEFAULT 0,
  `bandage` mediumint(8) NOT NULL DEFAULT 0,
  `gps` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `cigar` mediumint(8) NOT NULL DEFAULT 0,
  `material` mediumint(8) NOT NULL DEFAULT 0,
  `component` mediumint(8) NOT NULL DEFAULT 0,
  `food` mediumint(8) NOT NULL DEFAULT 0,
  `seed` mediumint(8) NOT NULL DEFAULT 0,
  `potato` mediumint(8) NOT NULL DEFAULT 0,
  `wheat` mediumint(8) NOT NULL DEFAULT 0,
  `orange` mediumint(8) NOT NULL DEFAULT 0,
  `price1` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `price2` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `price3` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `price4` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `marijuana` mediumint(8) NOT NULL DEFAULT 0,
  `ephedrine` mediumint(11) NOT NULL DEFAULT 0,
  `cocaine` mediumint(11) NOT NULL DEFAULT 0,
  `meth` mediumint(11) NOT NULL DEFAULT 0,
  `muriatic` mediumint(11) NOT NULL DEFAULT 0,
  `plant` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `plant_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `fishtool` tinyint(3) NOT NULL DEFAULT 0,
  `fish` mediumint(8) NOT NULL DEFAULT 0,
  `worm` mediumint(8) NOT NULL DEFAULT 0,
  `idcard` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `idcard_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `drivelic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `drivelic_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `trucklic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `trucklic_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `lumberlic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lumberlic_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `weaponlic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `weaponlic_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `hbemode` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `togpm` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `toglog` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `togads` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `togwt` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Gun1` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun2` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun3` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun4` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun5` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun6` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun7` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun8` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun9` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun10` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun11` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun12` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun13` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo1` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo2` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo3` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo4` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo5` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo6` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo7` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo8` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo9` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo10` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo11` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo12` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo13` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `cs` int(11) NOT NULL DEFAULT 0,
  `character_story` int(11) NOT NULL DEFAULT 0,
  `charstory` int(11) NOT NULL DEFAULT 0,
  `booster` int(11) NOT NULL DEFAULT 0,
  `Serial1` int(11) NOT NULL DEFAULT 0,
  `Serial2` int(11) NOT NULL DEFAULT 0,
  `Serial3` int(11) NOT NULL DEFAULT 0,
  `Serial4` int(11) NOT NULL DEFAULT 0,
  `Serial5` int(11) NOT NULL DEFAULT 0,
  `Serial6` int(11) NOT NULL DEFAULT 0,
  `Serial7` int(11) NOT NULL DEFAULT 0,
  `Serial8` int(11) NOT NULL DEFAULT 0,
  `Serial9` int(11) NOT NULL DEFAULT 0,
  `Serial10` int(11) NOT NULL DEFAULT 0,
  `Serial11` int(11) NOT NULL DEFAULT 0,
  `Serial12` int(11) NOT NULL DEFAULT 0,
  `Serial13` int(11) NOT NULL DEFAULT 0,
  `Durability1` int(11) NOT NULL DEFAULT 350,
  `Durability2` int(11) NOT NULL DEFAULT 350,
  `Durability3` int(11) NOT NULL DEFAULT 350,
  `Durability4` int(11) NOT NULL DEFAULT 350,
  `Durability5` int(11) NOT NULL DEFAULT 350,
  `Durability6` int(11) NOT NULL DEFAULT 350,
  `Durability7` int(11) NOT NULL DEFAULT 350,
  `Durability8` int(11) NOT NULL DEFAULT 350,
  `Durability9` int(11) NOT NULL DEFAULT 350,
  `Durability10` int(11) NOT NULL DEFAULT 350,
  `Durability11` int(11) NOT NULL DEFAULT 350,
  `Durability12` int(11) NOT NULL DEFAULT 350,
  `Durability13` int(11) NOT NULL DEFAULT 350,
  `book_pistol` mediumint(9) NOT NULL DEFAULT 0,
  `book_sg` mediumint(9) NOT NULL DEFAULT 0,
  `book_smg` mediumint(9) NOT NULL DEFAULT 0,
  `book_ar` mediumint(9) NOT NULL DEFAULT 0,
  `book_sniper` mediumint(9) NOT NULL DEFAULT 0,
  `jobskin` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `duty_job` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rock` mediumint(9) NOT NULL DEFAULT 0,
  `iron_ore` mediumint(9) NOT NULL DEFAULT 0,
  `iron_fragment` mediumint(9) NOT NULL DEFAULT 0,
  `iron_purified` mediumint(9) NOT NULL DEFAULT 0,
  `gold_ore` mediumint(9) NOT NULL DEFAULT 0,
  `gold_coin` mediumint(9) NOT NULL DEFAULT 0,
  `lighter` mediumint(9) NOT NULL DEFAULT 0,
  `coffeebeans` int(11) NOT NULL DEFAULT 0,
  `potatofries` int(11) NOT NULL DEFAULT 0,
  `friedfish` int(11) NOT NULL DEFAULT 0,
  `fishchips` int(11) NOT NULL DEFAULT 0,
  `hotcoffee` int(11) NOT NULL DEFAULT 0,
  `milkcoffee` int(11) NOT NULL DEFAULT 0,
  `orangejuice` int(11) NOT NULL DEFAULT 0,
  `stream_multiplier` float DEFAULT 1,
  `stream_tickrate` int(11) DEFAULT 150,
  `max_objects` int(11) DEFAULT 500,
  `show_map_icons` int(11) DEFAULT 1,
  `show_3d_labels` int(11) DEFAULT 1,
  `show_actors` int(11) DEFAULT 1,
  `show_pickups` int(11) DEFAULT 1,
  `perf_preset` int(11) DEFAULT 1,
  `adaptive_mode` int(11) DEFAULT 1,
  `online` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `paintball_kill` int(11) NOT NULL DEFAULT 0,
  `admin_point` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_contract` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `content_creator` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `youtube_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'None',
  `tiktok_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'None',
  `etoll` int(11) NOT NULL DEFAULT 0,
  `bandana` int(11) NOT NULL DEFAULT 0,
  `privatefarmer` int(11) NOT NULL DEFAULT 0,
  `wantedlevel` int(11) NOT NULL DEFAULT 0,
  `crimes` int(11) NOT NULL DEFAULT 0,
  `delay_trucker` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_hauling` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_lumber` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_reflenish` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_miner` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_butcher` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_pizza` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_bus` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_trashmaster` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_kopi` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_sweeper` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_forklift` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_mower` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_fish` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delay_smuggle` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `toglogin` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `togadmin` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `togfaction` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `togjob` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `togspeedcam` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `togtwitter` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `togphone` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `treatlic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `treatlic_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `auctionlic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `auctionlic_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `kepala` int(11) NOT NULL DEFAULT 0,
  `perut` int(11) NOT NULL DEFAULT 0,
  `groin` int(11) NOT NULL DEFAULT 0,
  `tangankanan` int(11) NOT NULL DEFAULT 0,
  `tangankiri` int(11) NOT NULL DEFAULT 0,
  `kakikanan` int(11) NOT NULL DEFAULT 0,
  `kakikiri` int(11) NOT NULL DEFAULT 0,
  `kepala_wound` int(11) NOT NULL DEFAULT 0,
  `perut_wound` int(11) NOT NULL DEFAULT 0,
  `groin_wound` int(11) NOT NULL DEFAULT 0,
  `tangankanan_wound` int(11) NOT NULL DEFAULT 0,
  `tangankiri_wound` int(11) NOT NULL DEFAULT 0,
  `kakikanan_wound` int(11) NOT NULL DEFAULT 0,
  `kakikiri_wound` int(11) NOT NULL DEFAULT 0,
  `ask_time` bigint(20) NOT NULL DEFAULT 0,
  `suspected` int(11) NOT NULL DEFAULT 0,
  `getloc_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `patch_bomb` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `repairkit` mediumint(9) NOT NULL DEFAULT 0,
  `rob_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `boost` tinyint(4) NOT NULL DEFAULT 0,
  `boost_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `accent_id` mediumint(9) NOT NULL DEFAULT 0,
  `clip_pistol` mediumint(9) NOT NULL DEFAULT 0,
  `clip_sg` mediumint(9) NOT NULL DEFAULT 0,
  `clip_smg` mediumint(9) NOT NULL DEFAULT 0,
  `tdrug` mediumint(9) NOT NULL DEFAULT 0,
  `use_drug` mediumint(9) NOT NULL DEFAULT 0,
  `starterpack` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `boombox` mediumint(9) NOT NULL DEFAULT 0,
  `taxi_skill` int(11) NOT NULL DEFAULT 0,
  `mechanic_skill` int(11) NOT NULL DEFAULT 0,
  `lumber_skill` int(11) NOT NULL DEFAULT 0,
  `trucker_skill` int(11) NOT NULL DEFAULT 0,
  `miner_skill` int(11) NOT NULL DEFAULT 0,
  `farmer_skill` int(11) NOT NULL DEFAULT 0,
  `hauling_skill` int(11) NOT NULL DEFAULT 0,
  `pizza_skill` int(11) NOT NULL DEFAULT 0,
  `butcher_skill` int(11) NOT NULL DEFAULT 0,
  `reflenish_skill` int(11) NOT NULL DEFAULT 0,
  `smuggler_skill` int(11) NOT NULL DEFAULT 0,
  `togserver` tinyint(3) NOT NULL DEFAULT 0,
  `show_3d_labelsa` int(11) NOT NULL DEFAULT 0,
  `oil` int(11) NOT NULL DEFAULT 0,
  `meat` int(11) NOT NULL DEFAULT 0,
  `Char_TheStars` int(11) NOT NULL DEFAULT 0,
  `Char_TheStarsTime` int(11) NOT NULL DEFAULT 0,
  `susu` int(11) NOT NULL DEFAULT 0,
  `susuolahan` int(11) NOT NULL DEFAULT 0,
  `Char_Helper` tinyint(1) NOT NULL DEFAULT 0,
  `Char_HelperTime` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`reg_id`, `username`, `ucp_name`, `adminname`, `twittername`, `ip`, `password`, `salt`, `email`, `admin`, `helper`, `level`, `levelup`, `vip`, `vip_time`, `gold`, `reg_date`, `last_login`, `money`, `bmoney`, `brek`, `phone`, `phonecredit`, `phonebook`, `wt`, `hours`, `minutes`, `seconds`, `paycheck`, `skin`, `facskin`, `gender`, `age`, `indoor`, `inbiz`, `inhouse`, `posx`, `posy`, `posz`, `posa`, `interior`, `world`, `health`, `armour`, `hunger`, `bladder`, `energy`, `sick`, `hospital`, `injured`, `duty`, `dutytime`, `faction`, `factionrank`, `factionlead`, `family`, `familyrank`, `workshop`, `workshoprank`, `jail`, `jail_time`, `rehab`, `rehab_time`, `robbing`, `robbing_time`, `arrest`, `arrest_time`, `warn`, `job`, `job2`, `jobtime`, `sidejobtime`, `exitjob`, `taxitime`, `medicine`, `medkit`, `mask`, `helmet`, `fightingstyle`, `burger`, `milk`, `gas`, `bandage`, `gps`, `cigar`, `material`, `component`, `food`, `seed`, `potato`, `wheat`, `orange`, `price1`, `price2`, `price3`, `price4`, `marijuana`, `ephedrine`, `cocaine`, `meth`, `muriatic`, `plant`, `plant_time`, `fishtool`, `fish`, `worm`, `idcard`, `idcard_time`, `drivelic`, `drivelic_time`, `trucklic`, `trucklic_time`, `lumberlic`, `lumberlic_time`, `weaponlic`, `weaponlic_time`, `hbemode`, `togpm`, `toglog`, `togads`, `togwt`, `Gun1`, `Gun2`, `Gun3`, `Gun4`, `Gun5`, `Gun6`, `Gun7`, `Gun8`, `Gun9`, `Gun10`, `Gun11`, `Gun12`, `Gun13`, `Ammo1`, `Ammo2`, `Ammo3`, `Ammo4`, `Ammo5`, `Ammo6`, `Ammo7`, `Ammo8`, `Ammo9`, `Ammo10`, `Ammo11`, `Ammo12`, `Ammo13`, `cs`, `character_story`, `charstory`, `booster`, `Serial1`, `Serial2`, `Serial3`, `Serial4`, `Serial5`, `Serial6`, `Serial7`, `Serial8`, `Serial9`, `Serial10`, `Serial11`, `Serial12`, `Serial13`, `Durability1`, `Durability2`, `Durability3`, `Durability4`, `Durability5`, `Durability6`, `Durability7`, `Durability8`, `Durability9`, `Durability10`, `Durability11`, `Durability12`, `Durability13`, `book_pistol`, `book_sg`, `book_smg`, `book_ar`, `book_sniper`, `jobskin`, `duty_job`, `rock`, `iron_ore`, `iron_fragment`, `iron_purified`, `gold_ore`, `gold_coin`, `lighter`, `coffeebeans`, `potatofries`, `friedfish`, `fishchips`, `hotcoffee`, `milkcoffee`, `orangejuice`, `stream_multiplier`, `stream_tickrate`, `max_objects`, `show_map_icons`, `show_3d_labels`, `show_actors`, `show_pickups`, `perf_preset`, `adaptive_mode`, `online`, `paintball_kill`, `admin_point`, `admin_time`, `admin_contract`, `content_creator`, `youtube_name`, `tiktok_name`, `etoll`, `bandana`, `privatefarmer`, `wantedlevel`, `crimes`, `delay_trucker`, `delay_hauling`, `delay_lumber`, `delay_reflenish`, `delay_miner`, `delay_butcher`, `delay_pizza`, `delay_bus`, `delay_trashmaster`, `delay_kopi`, `delay_sweeper`, `delay_forklift`, `delay_mower`, `delay_fish`, `delay_smuggle`, `toglogin`, `togadmin`, `togfaction`, `togjob`, `togspeedcam`, `togtwitter`, `togphone`, `treatlic`, `treatlic_time`, `auctionlic`, `auctionlic_time`, `kepala`, `perut`, `groin`, `tangankanan`, `tangankiri`, `kakikanan`, `kakikiri`, `kepala_wound`, `perut_wound`, `groin_wound`, `tangankanan_wound`, `tangankiri_wound`, `kakikanan_wound`, `kakikiri_wound`, `ask_time`, `suspected`, `getloc_time`, `patch_bomb`, `repairkit`, `rob_time`, `boost`, `boost_time`, `accent_id`, `clip_pistol`, `clip_sg`, `clip_smg`, `tdrug`, `use_drug`, `starterpack`, `boombox`, `taxi_skill`, `mechanic_skill`, `lumber_skill`, `trucker_skill`, `miner_skill`, `farmer_skill`, `hauling_skill`, `pizza_skill`, `butcher_skill`, `reflenish_skill`, `smuggler_skill`, `togserver`, `show_3d_labelsa`, `oil`, `meat`, `Char_TheStars`, `Char_TheStarsTime`, `susu`, `susuolahan`, `Char_Helper`, `Char_HelperTime`) VALUES
(1, 'Hoverski_Hoverstiers', 'traymon', 'alokmenjawa', 'None', '192.168.1.25', '', '', 'None', 8, 0, 100, 0, 3, 0, 345, '2026-09-26 12:19:18', '2026-09-27 14:33:06', 32733, 500, 509578, 24545, 20, 1, 1, 0, 47, 28, 2848, 137, 300, 1, '11/01/2004', -1, -1, -1, 310.672, 1139.46, 9.086, 264.049, 0, 0, 95, 97, 85, 76, 79, 0, 0, 0, 1, 1734, 1, 6, 1, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 1, 0, 1, 0, 4500, 4500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 266, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 17771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 150, 500, 1, 1, 1, 1, 1, 1, 0, 0, 0, 786, 0, 0, 'None', 'None', 100, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1791612284, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pooltables`
--

CREATE TABLE `pooltables` (
  `id` int(11) NOT NULL,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privatefarm`
--

CREATE TABLE `privatefarm` (
  `id` int(11) NOT NULL,
  `owner` varchar(40) NOT NULL DEFAULT '-',
  `price` int(11) NOT NULL DEFAULT 500000,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `posa` float DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0,
  `seeds` int(11) NOT NULL DEFAULT 0,
  `potato` int(11) NOT NULL DEFAULT 0,
  `orange` int(11) NOT NULL DEFAULT 0,
  `wheat` int(11) NOT NULL DEFAULT 0,
  `visit` bigint(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `privatefarm`
--

INSERT INTO `privatefarm` (`id`, `owner`, `price`, `posx`, `posy`, `posz`, `posa`, `interior`, `world`, `seeds`, `potato`, `orange`, `wheat`, `visit`) VALUES
(0, '-', 8000, -340.124, -1822.68, 2.74845, 85.157, 0, 0, 0, 0, 0, 0, 0),
(1, 'Morgan_Alexz', 8000, -811.665, 2328.28, 146.157, 60.6298, 0, 0, 0, 0, 0, 0, 1791016089),
(2, 'Christopher_Watson', 8000, -1064.89, -1623.53, 76.3739, 117.143, 0, 0, 0, 0, 0, 0, 1791039816),
(3, 'Jerry_Roberto', 8000, -772.757, -824.051, 149.515, 3.81803, 0, 0, 0, 0, 0, 0, 1791106904),
(4, '-', 8000, -398.451, -1825.5, 2.12085, 194.471, 0, 0, 0, 0, 0, 0, 0),
(5, '-', 8000, -1102.32, -1209.43, 129.219, 19.7549, 0, 0, 0, 0, 0, 0, 0),
(6, 'Jerry_Hellhound', 8000, -499.89, -1831.04, 18.0099, 110.238, 0, 0, 0, 0, 0, 0, 1791551888),
(7, '-', 8000, -1330.68, 2512.16, 87.0469, 26.5976, 0, 0, 0, 0, 0, 0, 0),
(8, '-', 8000, -1112.07, -1676.35, 76.3672, 188.762, 0, 0, 0, 0, 0, 0, 0),
(9, '-', 8000, 1074.01, -288.541, 73.9922, 236.127, 0, 0, 0, 0, 0, 0, 0),
(10, '-', 8000, 627.835, -2584.96, 7.53681, 104.02, 0, 0, 0, 0, 0, 0, 0),
(11, '-', 8000, 1955.96, -1554.7, 13.6269, 351.846, 0, 0, 0, 0, 0, 0, 0),
(13, 'Gerry_Andreas', 8000, 922.221, -605.415, 114.312, 98.9547, 0, 0, 0, 0, 0, 0, 1790779086),
(12, 'Refan_Hermawan', 8000, 129.861, 50.3471, 1.68909, 46.0722, 0, 0, 700, 0, 3, 0, 1790675942);

-- --------------------------------------------------------

--
-- Table structure for table `radio_url`
--

CREATE TABLE `radio_url` (
  `id` int(11) NOT NULL,
  `music_name` varchar(128) NOT NULL DEFAULT 'None',
  `music_url` varchar(128) NOT NULL DEFAULT 'None',
  `postby` varchar(50) NOT NULL DEFAULT 'None'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `radio_url`
--

INSERT INTO `radio_url` (`id`, `music_name`, `music_url`, `postby`) VALUES
(42, 'Dj CLBK | Kayzer', 'http://f.top4top.io/m_3765dtl6x1.mp3', 'Elicia_DeBatharia'),
(41, 'Aku Jatuh Cinta | Keyzer', 'http://h.top4top.io/m_3896jt3y31.mp3', 'Elicia_DeBatharia'),
(40, 'Seluruh Nafas Ini | Kayzer', 'http://e.top4top.io/m_35091z4wu1.mp3', 'Elicia_DeBatharia'),
(39, 'Diary Depresiku | Kayzer', 'http://l.top4top.io/m_38965v0cj1.mp3', 'Elicia_DeBatharia'),
(38, 'Nadrif Full Album | Kayzer', 'http://f.top4top.io/m_38966dmoi1.mp3', 'Elicia_DeBatharia'),
(37, 'About U | Dilan', 'http://g.top4top.io/m_3893cgawb0.mp3', 'Gery_Antonio'),
(36, '505 | Dilan', 'http://c.top4top.io/m_389395ig10.mp3', 'Gery_Antonio'),
(35, 'Reckless | Gery', 'http://c.top4top.io/m_3892bmyf41.mp3', 'Gery_Antonio'),
(34, 'Sedia Aku Sebelum Hujan | Gery', 'http://g.top4top.io/m_3892xky3x1.mp3', 'Gery_Antonio'),
(27, 'Sesi potret | Elicia', 'http://a.top4top.io/m_3867y9m2k1.mp3', 'Elicia_DeBatharia'),
(28, 'Maafkan | Cimokk', 'http://k.top4top.io/m_3889n86ur0.mp3', 'Elicia_DeBatharia'),
(29, 'Ini abadi | Cimokk', 'http://e.top4top.io/m_3887wg31s0.mp3', 'Elicia_DeBatharia'),
(33, 'Pluto Projector | Dyson', 'http://g.top4top.io/m_3893mdkxv0.mp3', 'Gery_Antonio'),
(32, 'Always | Dyson', 'http://g.top4top.io/m_38939rs220.mp3', 'Gery_Antonio'),
(25, 'Teh hijau | Elicia', 'http://e.top4top.io/m_3888kxwbt1.mp3', 'Elicia_DeBatharia'),
(26, 'Tulus full album | Elicia', 'http://k.top4top.io/m_3891o8n7w1.mp3', 'Elicia_DeBatharia');

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `extposx` float DEFAULT 0,
  `extposy` float DEFAULT 0,
  `extposz` float DEFAULT 0,
  `extposa` float DEFAULT 0,
  `vehposx` float DEFAULT 0,
  `vehposy` float DEFAULT 0,
  `vehposz` float DEFAULT 0,
  `vehposa` float DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rental`
--

INSERT INTO `rental` (`id`, `type`, `price`, `extposx`, `extposy`, `extposz`, `extposa`, `vehposx`, `vehposy`, `vehposz`, `vehposa`) VALUES
(0, 2, 1000, 432.331, -2056.47, 1.68853, 355.164, 434.157, -2062.63, -0.59245, 193.885),
(1, 1, 1000, 584.806, 872.501, -42.4973, 91.5599, 590.61, 857.998, -43.0041, 182.026);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` bigint(20) NOT NULL,
  `owner` int(11) DEFAULT 0,
  `info` varchar(46) DEFAULT '',
  `money` int(11) NOT NULL DEFAULT 0,
  `date` varchar(36) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE `server` (
  `id` int(11) NOT NULL DEFAULT 0,
  `servermoney` varchar(64) NOT NULL DEFAULT '0',
  `tax_income` int(10) UNSIGNED NOT NULL DEFAULT 5,
  `tax_sales` int(10) UNSIGNED NOT NULL DEFAULT 5,
  `tax_vehicle` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `tax_property` int(10) UNSIGNED NOT NULL DEFAULT 5,
  `inflation` float NOT NULL DEFAULT 0,
  `material` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `materialprice` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `materialmomentum` float NOT NULL DEFAULT 0,
  `lumber` int(10) UNSIGNED NOT NULL DEFAULT 1000,
  `lumberprice` int(10) UNSIGNED NOT NULL DEFAULT 800,
  `lumbermomentum` float NOT NULL DEFAULT 0,
  `component` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `componentprice` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `componentmomentum` float NOT NULL DEFAULT 0,
  `medicine` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `medicineprice` int(10) UNSIGNED NOT NULL DEFAULT 300,
  `medicinemomentum` float NOT NULL DEFAULT 0,
  `medkit` int(10) UNSIGNED NOT NULL DEFAULT 200,
  `medkitprice` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `medkitmomentum` float NOT NULL DEFAULT 0,
  `bandage` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `bandageprice` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `bandagemomentum` float NOT NULL DEFAULT 0,
  `food` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `foodprice` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `foodmomentum` float NOT NULL DEFAULT 0,
  `product` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `productprice` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `productmomentum` float NOT NULL DEFAULT 0,
  `gasfuel` int(11) NOT NULL DEFAULT 10000,
  `gasfuelprice` int(11) NOT NULL DEFAULT 5,
  `gasfuelmomentum` float NOT NULL DEFAULT 0,
  `kopi` int(11) NOT NULL DEFAULT 500,
  `kopiprice` int(11) NOT NULL DEFAULT 15,
  `kopimomentum` float NOT NULL DEFAULT 0,
  `seed` int(10) UNSIGNED NOT NULL DEFAULT 1000,
  `seedprice` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `seedmomentum` float NOT NULL DEFAULT 0,
  `potato` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `potatoprice` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `potatomomentum` float NOT NULL DEFAULT 0,
  `wheat` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `wheatprice` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `wheatmomentum` float NOT NULL DEFAULT 0,
  `orange` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `orangeprice` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `orangemomentum` float NOT NULL DEFAULT 0,
  `fish` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `fishprice` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `fishmomentum` float NOT NULL DEFAULT 0,
  `meat` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `meatprice` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `meatmomentum` float NOT NULL DEFAULT 0,
  `marijuana` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `marijuanaprice` int(10) UNSIGNED NOT NULL DEFAULT 5000,
  `marijuanamomentum` float NOT NULL DEFAULT 0,
  `ephedrine` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `ephedrineprice` int(10) UNSIGNED NOT NULL DEFAULT 5000,
  `ephedrinemomentum` float NOT NULL DEFAULT 0,
  `cocaine` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `cocaineprice` int(10) UNSIGNED NOT NULL DEFAULT 5000,
  `cocainemomentum` float NOT NULL DEFAULT 0,
  `rock` int(10) UNSIGNED NOT NULL DEFAULT 1000,
  `rockprice` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `rockmomentum` float NOT NULL DEFAULT 0,
  `iron` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `ironprice` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `ironmomentum` float NOT NULL DEFAULT 0,
  `gold` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `goldprice` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `goldmomentum` float NOT NULL DEFAULT 0,
  `firstspawnprice` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `robatm_time` int(11) NOT NULL DEFAULT 0,
  `song_url` varchar(128) NOT NULL DEFAULT 'None',
  `sjmower` int(10) UNSIGNED NOT NULL DEFAULT 50,
  `sjsweeper` int(10) UNSIGNED NOT NULL DEFAULT 50,
  `sjbus` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `sjtrashmaster` int(10) UNSIGNED NOT NULL DEFAULT 150,
  `sjkopi` int(10) UNSIGNED NOT NULL DEFAULT 50,
  `jobpizza` int(10) UNSIGNED NOT NULL DEFAULT 150,
  `jobbutcher` int(10) UNSIGNED NOT NULL DEFAULT 150,
  `jobreflenish` int(10) UNSIGNED NOT NULL DEFAULT 150,
  `jobtrucker` int(10) UNSIGNED NOT NULL DEFAULT 200,
  `drugdealer` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `jobminer` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `joboil` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `joblumber` int(10) UNSIGNED NOT NULL DEFAULT 150,
  `jobfisherman` int(10) UNSIGNED NOT NULL DEFAULT 150,
  `jobfarmer` int(10) UNSIGNED NOT NULL DEFAULT 120,
  `jobforklift` int(10) UNSIGNED NOT NULL DEFAULT 100,
  `hauling1` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `hauling2` int(10) UNSIGNED NOT NULL DEFAULT 600,
  `hauling3` int(10) UNSIGNED NOT NULL DEFAULT 700,
  `factionprice` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `delaymower` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delaysweeper` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delaybus` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delaytrash` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delaykopi` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delaypizza` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delaybutcher` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delayreflenish` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delaytrucker` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delayminer` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delayhauling` int(10) UNSIGNED NOT NULL DEFAULT 300,
  `delaylumber` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delayfisherman` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delayfarmer` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delayforklift` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `delaydrug` int(10) UNSIGNED NOT NULL DEFAULT 600,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `materialstock` int(11) NOT NULL DEFAULT 0,
  `lumberstock` int(11) NOT NULL DEFAULT 0,
  `bandagestock` int(11) NOT NULL DEFAULT 0,
  `medicinestock` int(11) NOT NULL DEFAULT 0,
  `medkitstock` int(11) NOT NULL DEFAULT 0,
  `foodstock` int(11) NOT NULL DEFAULT 0,
  `seedstock` int(11) NOT NULL DEFAULT 0,
  `potatostock` int(11) NOT NULL DEFAULT 0,
  `wheatstock` int(11) NOT NULL DEFAULT 0,
  `orangestock` int(11) NOT NULL DEFAULT 0,
  `marijuanastock` int(11) NOT NULL DEFAULT 0,
  `cocainestock` int(11) NOT NULL DEFAULT 0,
  `methstock` int(11) NOT NULL DEFAULT 0,
  `ephedrinestock` int(11) NOT NULL DEFAULT 0,
  `rockstock` int(11) NOT NULL DEFAULT 0,
  `ironstock` int(11) NOT NULL DEFAULT 0,
  `goldstock` int(11) NOT NULL DEFAULT 0,
  `componentstock` int(11) NOT NULL DEFAULT 0,
  `fishstock` int(11) NOT NULL DEFAULT 0,
  `fuelstock` int(11) NOT NULL DEFAULT 0,
  `meatstock` int(11) NOT NULL DEFAULT 0,
  `oilstock` int(11) NOT NULL DEFAULT 0,
  `productstock` int(11) NOT NULL DEFAULT 0,
  `kopistock` int(11) NOT NULL DEFAULT 0,
  `materialtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lumbertime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bandagetime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `medicinetime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `medkittime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `foodtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `seedtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `potatotime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wheattime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `orangetime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `marijuanatime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cocainetime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `methprice` int(10) UNSIGNED NOT NULL DEFAULT 5000,
  `methtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ephedrinetime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rocktime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `irontime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `goldtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `componenttime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fishtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fuelprice` int(10) UNSIGNED NOT NULL DEFAULT 5,
  `fueltime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `meattime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `oilprice` int(10) UNSIGNED NOT NULL DEFAULT 500,
  `oiltime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `producttime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `kopitime` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `server`
--

INSERT INTO `server` (`id`, `servermoney`, `tax_income`, `tax_sales`, `tax_vehicle`, `tax_property`, `inflation`, `material`, `materialprice`, `materialmomentum`, `lumber`, `lumberprice`, `lumbermomentum`, `component`, `componentprice`, `componentmomentum`, `medicine`, `medicineprice`, `medicinemomentum`, `medkit`, `medkitprice`, `medkitmomentum`, `bandage`, `bandageprice`, `bandagemomentum`, `food`, `foodprice`, `foodmomentum`, `product`, `productprice`, `productmomentum`, `gasfuel`, `gasfuelprice`, `gasfuelmomentum`, `kopi`, `kopiprice`, `kopimomentum`, `seed`, `seedprice`, `seedmomentum`, `potato`, `potatoprice`, `potatomomentum`, `wheat`, `wheatprice`, `wheatmomentum`, `orange`, `orangeprice`, `orangemomentum`, `fish`, `fishprice`, `fishmomentum`, `meat`, `meatprice`, `meatmomentum`, `marijuana`, `marijuanaprice`, `marijuanamomentum`, `ephedrine`, `ephedrineprice`, `ephedrinemomentum`, `cocaine`, `cocaineprice`, `cocainemomentum`, `rock`, `rockprice`, `rockmomentum`, `iron`, `ironprice`, `ironmomentum`, `gold`, `goldprice`, `goldmomentum`, `firstspawnprice`, `robatm_time`, `song_url`, `sjmower`, `sjsweeper`, `sjbus`, `sjtrashmaster`, `sjkopi`, `jobpizza`, `jobbutcher`, `jobreflenish`, `jobtrucker`, `drugdealer`, `jobminer`, `joboil`, `joblumber`, `jobfisherman`, `jobfarmer`, `jobforklift`, `hauling1`, `hauling2`, `hauling3`, `factionprice`, `delaymower`, `delaysweeper`, `delaybus`, `delaytrash`, `delaykopi`, `delaypizza`, `delaybutcher`, `delayreflenish`, `delaytrucker`, `delayminer`, `delayhauling`, `delaylumber`, `delayfisherman`, `delayfarmer`, `delayforklift`, `delaydrug`, `last_update`, `materialstock`, `lumberstock`, `bandagestock`, `medicinestock`, `medkitstock`, `foodstock`, `seedstock`, `potatostock`, `wheatstock`, `orangestock`, `marijuanastock`, `cocainestock`, `methstock`, `ephedrinestock`, `rockstock`, `ironstock`, `goldstock`, `componentstock`, `fishstock`, `fuelstock`, `meatstock`, `oilstock`, `productstock`, `kopistock`, `materialtime`, `lumbertime`, `bandagetime`, `medicinetime`, `medkittime`, `foodtime`, `seedtime`, `potatotime`, `wheattime`, `orangetime`, `marijuanatime`, `cocainetime`, `methprice`, `methtime`, `ephedrinetime`, `rocktime`, `irontime`, `goldtime`, `componenttime`, `fishtime`, `fuelprice`, `fueltime`, `meattime`, `oilprice`, `oiltime`, `producttime`, `kopitime`) VALUES
(0, '0016061594', 19, 11, 5, 5, 26.5, 0, 1000, 0, 1000, 4, 0, 0, 1000, 0.0232, 650, 3, 0, 1000, 1000, 0, 0, 2, 0.015, 0, 1000, 0, 0, 40, 0, 1020, 290, 0, 1136, 2, 0, 26, 1, 0, 1182, 457, 0, 1004, 3, 0, 1003, 2, 0, 1461, 198, 0, 1188, 1, 0, 3000, 3, 0, 3000, 2, 0, 3000, 2, 0, 1052, 20, 0, 1020, 2, 0, 1006, 2, 0, 250, 0, 'http://j.top4top.io/m_2710gpw1u0.mp3', 228, 278, 443, 506, 44, 569, 84, 759, 3041, 5693, 41, 1173, 202, 6, 19, 506, 6083, 6083, 2223, 949, 300, 300, 600, 60, 60, 60, 60, 60, 600, 60, 1200, 60, 60, 60, 60, 1800, '2026-08-24 11:03:20', 10000, 10000, 1000, 1000, 1000, 1000, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 1000, 1000, 1000, 1000, 10000, 1000, 1000, 2000, 5000, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 500, 0, 0, 0),
(1, '3450752', 19, 11, 5, 5, 26.5, 500, 5, 0, 1000, 10, 0, 500, 5, 0.0232, 650, 1, 0, 1000, 1, 0, 0, 1, 0.015, 0, 11, 0, 0, 0, 0, 1020, 2, 0, 1136, 10, 0, 26, 11, 0, 1182, 0, 0, 1004, 0, 0, 1003, 0, 0, 1461, 0, 0, 1188, 0, 0, 3000, 0, 0, 3000, 0, 0, 3000, 0, 0, 1052, 0, 0, 1020, 0, 0, 1006, 0, 0, 250, 0, 'http://j.top4top.io/m_2710gpw1u0.mp3', 228, 278, 443, 506, 44, 569, 84, 759, 3041, 5693, 41, 1173, 202, 6, 19, 506, 6083, 6083, 2223, 949, 300, 300, 600, 60, 60, 60, 60, 60, 600, 60, 1200, 60, 60, 60, 60, 1800, '2026-09-26 06:11:56', 58992, 153, 99148, 99615, 99982, 54095, 9830, 0, 0, 0, 20000, 19998, 20000, 0, 0, 0, 0, 40997, 25, 690753, 865, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `server_economy`
--

CREATE TABLE `server_economy` (
  `item_db_col` varchar(32) NOT NULL,
  `item_name` varchar(32) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `limit_stock` int(11) NOT NULL DEFAULT 1000,
  `price` int(11) NOT NULL DEFAULT 0,
  `base_price` int(11) NOT NULL DEFAULT 0,
  `min_price` int(11) NOT NULL DEFAULT 0,
  `max_price` int(11) NOT NULL DEFAULT 0,
  `momentum` float NOT NULL DEFAULT 0,
  `volatilitas` float NOT NULL DEFAULT 0.5,
  `total_volume` int(11) NOT NULL DEFAULT 0,
  `peak_price` int(11) NOT NULL DEFAULT 0,
  `low_price` int(11) NOT NULL DEFAULT 0,
  `alert_status` int(11) NOT NULL DEFAULT 0,
  `last_sync` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `server_economy`
--

INSERT INTO `server_economy` (`item_db_col`, `item_name`, `stock`, `limit_stock`, `price`, `base_price`, `min_price`, `max_price`, `momentum`, `volatilitas`, `total_volume`, `peak_price`, `low_price`, `alert_status`, `last_sync`) VALUES
('bandage', 'Perban Luka', 3110, 3000, 5, 5, 1, 100, -0.522259, 0.15, 1000, 100, 1, 0, 1769599931),
('cocaine', 'Kokain', 296529, 500, 1, 5, 1, 100, -2, 1.2, 150, 537, 1, 1, 1769599931),
('component', 'Komponen Mesin', 633, 4000, 9, 5, 1, 100, 0.337894, 0.2, 1500, 112, 1, 0, 1769599931),
('fish', 'Ikan Segar', 3687, 4000, 5, 5, 1, 100, -0.426149, 0.3, 4500, 42, 1, 0, 1769599931),
('food', 'Bahan Makanan', 280, 8000, 8, 5, 1, 100, 0.605253, 0.15, 12000, 100, 1, 0, 1769599931),
('gasfuel', 'BBM (Bensin)', 69, 20000, 8, 5, 1, 100, 0.26517, 0.05, 50000, 100, 2, 0, 1769599931),
('gold', 'Koin Emas', 1322, 500, 1, 5, 1, 100, -2, 1, 200, 333, 1, 1, 1769599931),
('iron', 'Besi Murni', 3810, 2000, 1, 5, 1, 100, -1.405, 0.5, 800, 91, 1, 1, 1769599931),
('kopi', 'Biji Kopi', 0, 2000, 11, 5, 1, 100, 0.499989, 0.35, 900, 96, 6, 0, 1769599931),
('lumber', 'Kayu Log', 11149, 3000, 1, 5, 1, 100, -2, 0.4, 3200, 100, 1, 1, 1769599931),
('marijuana', 'Marijuana', 344226, 1000, 1, 5, 1, 100, -2, 0.9, 400, 141, 1, 1, 1769599931),
('material', 'Material Olahan', 0, 5000, 11, 5, 1, 100, 0.5, 0.2, 5000, 100, 1, 0, 1769599931),
('meat', 'Daging Sapi', 351, 3000, 9, 5, 1, 100, 0.382397, 0.3, 2000, 100, 1, 0, 1769599931),
('medicine', 'Obat-obatan', 565, 5000, 8, 5, 1, 100, 0.396261, 0.1, 1500, 100, 1, 0, 1769599931),
('medkit', 'Medical Kit', 992, 1000, 5, 5, 1, 100, -0.509195, 0.15, 600, 175, 1, 0, 1769599931),
('meth', 'Meth', 504400, 800, 1, 5, 1, 100, -2, 1, 300, 266, 1, 1, 1769599931),
('orange', 'Jeruk Segar', 3652, 5000, 6, 5, 1, 100, -0.2304, 0.25, 2800, 92, 6, 0, 1769599931),
('potato', 'Kentang', 15199, 5000, 1, 5, 1, 100, -1.73168, 0.25, 3000, 75, 1, 1, 1769599931),
('product', 'Produk Ritel', 0, 10000, 11, 5, 1, 100, 0.572175, 0.15, 8000, 100, 5, 0, 1769599931),
('rock', 'Batu Mineral', 9640, 5000, 1, 5, 1, 100, -1.23312, 0.3, 4000, 41, 1, 1, 1769599931),
('seed', 'Bibit Tanaman', 0, 10000, 11, 5, 1, 100, 0.5, 0.2, 5000, 100, 1, 0, 1769599931),
('wheat', 'Gandum', 4127, 5000, 6, 5, 1, 100, -0.3254, 0.25, 3100, 75, 5, 0, 1769599931);

-- --------------------------------------------------------

--
-- Table structure for table `server_settings`
--

CREATE TABLE `server_settings` (
  `id` int(11) NOT NULL DEFAULT 0,
  `servermoney` varchar(64) NOT NULL DEFAULT '0',
  `inflation` float NOT NULL DEFAULT 0,
  `tax_income` int(11) NOT NULL DEFAULT 2,
  `tax_sales` int(11) NOT NULL DEFAULT 5,
  `tax_vehicle` int(11) NOT NULL DEFAULT 5,
  `tax_property` int(11) NOT NULL DEFAULT 2,
  `robatm_time` int(11) NOT NULL DEFAULT 0,
  `Global_SpawnPrice` int(11) NOT NULL DEFAULT 150,
  `song_url` varchar(128) NOT NULL DEFAULT 'None',
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `server_settings`
--

INSERT INTO `server_settings` (`id`, `servermoney`, `inflation`, `tax_income`, `tax_sales`, `tax_vehicle`, `tax_property`, `robatm_time`, `Global_SpawnPrice`, `song_url`, `last_update`) VALUES
(0, '158740929', -2, 1, 3, 1, 1, 0, 0, 'http://server-radio.com/welcome.mp3', '2026-05-08 11:48:33');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `class` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(31) NOT NULL DEFAULT 'string',
  `context` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shots`
--

CREATE TABLE `shots` (
  `id` int(11) NOT NULL,
  `playerid` int(11) DEFAULT NULL,
  `weaponid` tinyint(4) DEFAULT NULL,
  `damage` float NOT NULL DEFAULT 0,
  `bodypart` tinyint(4) DEFAULT NULL,
  `hitid` int(11) DEFAULT NULL,
  `hitplayer` varchar(24) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sigenal`
--

CREATE TABLE `sigenal` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `posrx` float DEFAULT 0,
  `posry` float DEFAULT 0,
  `posrz` float DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sigenal`
--

INSERT INTO `sigenal` (`id`, `status`, `posx`, `posy`, `posz`, `posrx`, `posry`, `posrz`, `interior`, `world`) VALUES
(0, 0, 1509.04, -1704.59, 13.0469, 0, 0, 0, 0, 0),
(1, 0, 1125.47, -1379.95, 13.2812, 0, 0, 0, 0, 0),
(2, 0, 180.422, -1665.09, 14.3023, 0, 0, 0, 0, 0),
(3, 0, 1940.53, -2103.8, 12.566, 0, 0, 0, 0, 0),
(4, 0, 1112.91, -542.733, 90.1816, 0, 0, 0, 0, 0),
(5, 0, 621.192, 285.422, 19.0681, 0, 0, 0, 0, 0),
(6, 0, -743.779, -112.35, 65.8626, 0, 0, 0, 0, 0),
(7, 0, 1826.56, 873.156, 9.7667, 0, 0, 0, 0, 0),
(8, 0, 2679.25, 1437.31, 8.57852, 0, 0, 0, 0, 0),
(9, 1, 1625.32, 1860.14, 9.82031, 0, 0, 0, 0, 0),
(10, 0, 425.754, -1815.06, 5.60406, 0, 0, 0, 0, 0),
(11, 0, 1678.36, 2831.56, 9.82031, 0, 0, 0, 0, 0),
(12, 0, -822.355, 1533.05, 25.6754, 0, 0, 0, 0, 0),
(13, 0, -216.623, 2658, 61.6016, 0, 0, 0, 0, 0),
(14, 0, 654.745, 1691.13, 5.99219, 0, 0, 0, 0, 0),
(15, 0, 2915.41, -1451.53, 9.875, 0, 0, 0, 0, 0),
(16, 0, -950.254, -1411.97, 127.823, 0, 0, 0, 0, 0),
(17, 0, -2447.07, 154.15, 33.7501, 0, 0, 0, 0, 0),
(18, 0, -2375.44, -566.928, 127.926, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `slot_logs`
--

CREATE TABLE `slot_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(24) NOT NULL,
  `bet_amount` int(11) NOT NULL,
  `win_amount` int(11) NOT NULL,
  `profit` int(11) NOT NULL,
  `result_type` varchar(20) NOT NULL,
  `reels` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `speedcam`
--

CREATE TABLE `speedcam` (
  `ID` int(11) NOT NULL,
  `camx` float DEFAULT 0,
  `camy` float DEFAULT 0,
  `camz` float DEFAULT 0,
  `camrx` float DEFAULT 0,
  `camry` float DEFAULT 0,
  `camrz` float DEFAULT 0,
  `camworld` int(11) NOT NULL DEFAULT 10,
  `camint` int(11) NOT NULL DEFAULT 10,
  `camspeed` int(11) NOT NULL DEFAULT 10
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `speedcam`
--

INSERT INTO `speedcam` (`ID`, `camx`, `camy`, `camz`, `camrx`, `camry`, `camrz`, `camworld`, `camint`, `camspeed`) VALUES
(0, 1784.62, 685.392, 15.0561, 0, 0, 77.6355, 0, 0, 80);

-- --------------------------------------------------------

--
-- Table structure for table `spraytag`
--

CREATE TABLE `spraytag` (
  `id` int(11) NOT NULL,
  `owner` varchar(40) NOT NULL DEFAULT '-',
  `text` varchar(254) NOT NULL DEFAULT 'None',
  `size` int(11) NOT NULL DEFAULT 0,
  `color` int(11) NOT NULL DEFAULT 0,
  `bold` int(11) NOT NULL DEFAULT 0,
  `x` float DEFAULT 0,
  `y` float DEFAULT 0,
  `z` float DEFAULT 0,
  `rx` float DEFAULT 0,
  `ry` float DEFAULT 0,
  `rz` float DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0,
  `time` bigint(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `topup_logs`
--

CREATE TABLE `topup_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `discord_id` varchar(20) NOT NULL,
  `discord_username` varchar(100) NOT NULL DEFAULT 'None',
  `action` enum('order_created','claim_attempt','claim_success','claim_failed','invoice_resent','order_expired') NOT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `toys`
--

CREATE TABLE `toys` (
  `Id` int(11) NOT NULL,
  `Owner` varchar(40) NOT NULL DEFAULT '',
  `Slot0_Model` int(11) NOT NULL DEFAULT 0,
  `Slot0_Bone` int(11) NOT NULL DEFAULT 0,
  `Slot0_Hide` int(11) NOT NULL DEFAULT 0,
  `Slot0_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_Model` int(11) NOT NULL DEFAULT 0,
  `Slot1_Bone` int(11) NOT NULL DEFAULT 0,
  `Slot1_Hide` int(11) NOT NULL DEFAULT 0,
  `Slot1_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_Model` int(11) NOT NULL DEFAULT 0,
  `Slot2_Bone` int(11) NOT NULL DEFAULT 0,
  `Slot2_Hide` int(11) NOT NULL DEFAULT 0,
  `Slot2_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_Model` int(11) NOT NULL DEFAULT 0,
  `Slot3_Bone` int(11) NOT NULL DEFAULT 0,
  `Slot3_Hide` int(11) NOT NULL DEFAULT 0,
  `Slot3_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_Model` int(11) NOT NULL DEFAULT 0,
  `Slot4_Bone` int(11) NOT NULL DEFAULT 0,
  `Slot4_Hide` int(11) NOT NULL DEFAULT 0,
  `Slot4_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_Model` int(11) NOT NULL DEFAULT 0,
  `Slot5_Bone` int(11) NOT NULL DEFAULT 0,
  `Slot5_Hide` int(11) NOT NULL DEFAULT 0,
  `Slot5_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_ZScale` float(20,3) NOT NULL DEFAULT 0.000
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `toysveh`
--

CREATE TABLE `toysveh` (
  `Owner` int(11) NOT NULL,
  `kode_preset` varchar(20) NOT NULL DEFAULT 'None',
  `Slot0_Model` int(11) NOT NULL DEFAULT 0,
  `Slot0_Text` varchar(64) NOT NULL DEFAULT 'None',
  `Slot0_Size` int(11) NOT NULL DEFAULT 0,
  `Slot0_Color` int(11) NOT NULL DEFAULT 0,
  `Slot0_Bold` int(11) NOT NULL DEFAULT 0,
  `Slot0_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_FontFace` varchar(32) NOT NULL DEFAULT 'Arial',
  `Slot0_BackColor` int(11) NOT NULL DEFAULT 0,
  `Slot0_Align` int(11) NOT NULL DEFAULT 1,
  `Slot0_Res` int(11) NOT NULL DEFAULT 70,
  `Slot1_Model` int(11) NOT NULL DEFAULT 0,
  `Slot1_Text` varchar(64) NOT NULL DEFAULT 'None',
  `Slot1_Size` int(11) NOT NULL DEFAULT 0,
  `Slot1_Color` int(11) NOT NULL DEFAULT 0,
  `Slot1_Bold` int(11) NOT NULL DEFAULT 0,
  `Slot1_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_FontFace` varchar(32) NOT NULL DEFAULT 'Arial',
  `Slot1_BackColor` int(11) NOT NULL DEFAULT 0,
  `Slot1_Align` int(11) NOT NULL DEFAULT 1,
  `Slot1_Res` int(11) NOT NULL DEFAULT 70,
  `Slot2_Model` int(11) NOT NULL DEFAULT 0,
  `Slot2_Text` varchar(64) NOT NULL DEFAULT 'None',
  `Slot2_Size` int(11) NOT NULL DEFAULT 0,
  `Slot2_Color` int(11) NOT NULL DEFAULT 0,
  `Slot2_Bold` int(11) NOT NULL DEFAULT 0,
  `Slot2_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_FontFace` varchar(32) NOT NULL DEFAULT 'Arial',
  `Slot2_BackColor` int(11) NOT NULL DEFAULT 0,
  `Slot2_Align` int(11) NOT NULL DEFAULT 1,
  `Slot2_Res` int(11) NOT NULL DEFAULT 70,
  `Slot3_Model` int(11) NOT NULL DEFAULT 0,
  `Slot3_Text` varchar(64) NOT NULL DEFAULT 'None',
  `Slot3_Size` int(11) NOT NULL DEFAULT 0,
  `Slot3_Color` int(11) NOT NULL DEFAULT 0,
  `Slot3_Bold` int(11) NOT NULL DEFAULT 0,
  `Slot3_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_FontFace` varchar(32) NOT NULL DEFAULT 'Arial',
  `Slot3_BackColor` int(11) NOT NULL DEFAULT 0,
  `Slot3_Align` int(11) NOT NULL DEFAULT 1,
  `Slot3_Res` int(11) NOT NULL DEFAULT 70
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trashmaster`
--

CREATE TABLE `trashmaster` (
  `id` int(11) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `posrx` float DEFAULT 0,
  `posry` float DEFAULT 0,
  `posrz` float DEFAULT 0,
  `interior` int(11) NOT NULL,
  `world` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treasury_logs`
--

CREATE TABLE `treasury_logs` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reason` varchar(128) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(32) NOT NULL,
  `balance_before` varchar(64) NOT NULL,
  `balance_after` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trees`
--

CREATE TABLE `trees` (
  `id` int(11) NOT NULL,
  `posx` float DEFAULT NULL,
  `posy` float DEFAULT NULL,
  `posz` float DEFAULT NULL,
  `posrx` float DEFAULT NULL,
  `posry` float DEFAULT NULL,
  `posrz` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `trees`
--

INSERT INTO `trees` (`id`, `posx`, `posy`, `posz`, `posrx`, `posry`, `posrz`) VALUES
(0, -503.489, -2249, 36.2342, 0, 0, 0),
(1, -526.161, -2264.92, 31.4714, 0, 0, 0),
(2, -536.041, -2278.51, 29.4497, 0, 0, 0),
(3, -542.761, -2288.88, 28.32, 0, 0, 0),
(4, -570.57, -2279.57, 26.4029, 0, 0, 0),
(5, -577.852, -2263.32, 25.0532, 0, 0, 0),
(6, -561.27, -2249.31, 27.2139, 0, 0, 0),
(7, -611.991, -2301.46, 26.9907, 0, 0, 0),
(8, -625.979, -2317.64, 31.0663, 0, 0, 0),
(9, -619.75, -2344.34, 30.6352, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ucp`
--

CREATE TABLE `ucp` (
  `reg_id` int(11) UNSIGNED NOT NULL,
  `ucp_name` varchar(24) NOT NULL DEFAULT '',
  `ip` varchar(24) NOT NULL DEFAULT '',
  `password` char(64) NOT NULL DEFAULT '',
  `salt` char(16) NOT NULL DEFAULT '',
  `register` int(11) NOT NULL DEFAULT 0,
  `pin_code` int(11) NOT NULL DEFAULT 0,
  `discordid` varchar(30) NOT NULL DEFAULT '',
  `reg_date` varchar(30) NOT NULL DEFAULT '',
  `last_login` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(40) NOT NULL DEFAULT 'None',
  `email_verified` tinyint(5) NOT NULL DEFAULT 0,
  `questbr` int(11) NOT NULL DEFAULT 0,
  `telegramid` varchar(30) NOT NULL DEFAULT '',
  `whatsappid` varchar(30) NOT NULL DEFAULT '',
  `timestamp_last` bigint(10) NOT NULL DEFAULT 0,
  `last_gpci` varchar(128) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ucp`
--

INSERT INTO `ucp` (`reg_id`, `ucp_name`, `ip`, `password`, `salt`, `register`, `pin_code`, `discordid`, `reg_date`, `last_login`, `email`, `email_verified`, `questbr`, `telegramid`, `whatsappid`, `timestamp_last`, `last_gpci`) VALUES
(1, 'traymon', '192.168.1.25', '$2b$12$89nQRlKyteZS40rVVuGxG.5mx2f904uPkb09P9X1Vzq2PoE4dvdqS', '', 1, 1234, '1184818581851995', '', '2026-09-27 14:33:06', 'None', 1, 0, '', '', 1790497986, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `last_active` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner` int(11) DEFAULT NULL,
  `owner2` int(11) NOT NULL DEFAULT -1,
  `model` int(11) NOT NULL DEFAULT 0,
  `name` varchar(40) NOT NULL DEFAULT 'None',
  `color1` int(11) NOT NULL DEFAULT 0,
  `color2` int(11) NOT NULL DEFAULT 0,
  `paintjob` int(11) NOT NULL DEFAULT -1,
  `neon` int(11) NOT NULL DEFAULT 0,
  `locked` int(11) NOT NULL DEFAULT 0,
  `tax` int(11) NOT NULL DEFAULT 0,
  `tax_time` bigint(20) NOT NULL DEFAULT 0,
  `plate` varchar(50) NOT NULL DEFAULT 'None',
  `plate_time` bigint(20) NOT NULL DEFAULT 0,
  `ticket` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `impound` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parkid` int(11) NOT NULL DEFAULT -1,
  `price` int(11) NOT NULL DEFAULT 200000,
  `health` float NOT NULL DEFAULT 1000,
  `fuel` int(11) NOT NULL DEFAULT 1000,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `a` float NOT NULL DEFAULT 0,
  `int` int(11) NOT NULL DEFAULT 0,
  `vw` int(11) NOT NULL DEFAULT 0,
  `damage0` int(11) NOT NULL DEFAULT 0,
  `damage1` int(11) NOT NULL DEFAULT 0,
  `damage2` int(11) NOT NULL DEFAULT 0,
  `damage3` int(11) NOT NULL DEFAULT 0,
  `mod0` int(11) NOT NULL DEFAULT 0,
  `mod1` int(11) NOT NULL DEFAULT 0,
  `mod2` int(11) NOT NULL DEFAULT 0,
  `mod3` int(11) NOT NULL DEFAULT 0,
  `mod4` int(11) NOT NULL DEFAULT 0,
  `mod5` int(11) NOT NULL DEFAULT 0,
  `mod6` int(11) NOT NULL DEFAULT 0,
  `mod7` int(11) NOT NULL DEFAULT 0,
  `mod8` int(11) NOT NULL DEFAULT 0,
  `mod9` int(11) NOT NULL DEFAULT 0,
  `mod10` int(11) NOT NULL DEFAULT 0,
  `mod11` int(11) NOT NULL DEFAULT 0,
  `mod12` int(11) NOT NULL DEFAULT 0,
  `mod13` int(11) NOT NULL DEFAULT 0,
  `mod14` int(11) NOT NULL DEFAULT 0,
  `mod15` int(11) NOT NULL DEFAULT 0,
  `mod16` int(11) NOT NULL DEFAULT 0,
  `parachute` int(11) NOT NULL DEFAULT 0,
  `lumber` int(11) NOT NULL DEFAULT -1,
  `product` int(11) NOT NULL DEFAULT 0,
  `Weapon1` int(11) NOT NULL DEFAULT 0,
  `Ammo1` int(11) NOT NULL DEFAULT 0,
  `Weapon2` int(11) NOT NULL DEFAULT 0,
  `Ammo2` int(11) NOT NULL DEFAULT 0,
  `Weapon3` int(11) NOT NULL DEFAULT 0,
  `Ammo3` int(11) NOT NULL DEFAULT 0,
  `Weapon4` int(11) NOT NULL DEFAULT 0,
  `Ammo4` int(11) NOT NULL DEFAULT 0,
  `Weapon5` int(11) NOT NULL DEFAULT 0,
  `Ammo5` int(11) NOT NULL DEFAULT 0,
  `Serial1` int(11) NOT NULL DEFAULT 0,
  `Serial2` int(11) NOT NULL DEFAULT 0,
  `Serial3` int(11) NOT NULL DEFAULT 0,
  `Serial4` int(11) NOT NULL DEFAULT 0,
  `Serial5` int(11) NOT NULL DEFAULT 0,
  `Durability1` int(11) NOT NULL DEFAULT 0,
  `Durability2` int(11) NOT NULL DEFAULT 0,
  `Durability3` int(11) NOT NULL DEFAULT 0,
  `Durability4` int(11) NOT NULL DEFAULT 0,
  `Durability5` int(11) NOT NULL DEFAULT 0,
  `component` int(11) NOT NULL DEFAULT 0,
  `material` int(11) NOT NULL DEFAULT 0,
  `seed` int(11) NOT NULL DEFAULT 0,
  `food` int(11) NOT NULL DEFAULT 0,
  `burger` int(11) NOT NULL DEFAULT 0,
  `milk` int(11) NOT NULL DEFAULT 0,
  `repairkit` int(11) NOT NULL DEFAULT 0,
  `marijuana` int(11) NOT NULL DEFAULT 0,
  `cocaine` int(11) NOT NULL DEFAULT 0,
  `clippistol` int(11) NOT NULL DEFAULT 0,
  `clipsg` int(11) NOT NULL DEFAULT 0,
  `clipsmg` int(11) NOT NULL DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 0,
  `gasoil` int(11) NOT NULL DEFAULT 0,
  `rental` bigint(20) NOT NULL DEFAULT 0,
  `engine_level` tinyint(4) NOT NULL DEFAULT 0,
  `brake_level` tinyint(4) NOT NULL DEFAULT 0,
  `max_fuel` float NOT NULL DEFAULT 100,
  `fuel_level` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `owner`, `owner2`, `model`, `name`, `color1`, `color2`, `paintjob`, `neon`, `locked`, `tax`, `tax_time`, `plate`, `plate_time`, `ticket`, `impound`, `parkid`, `price`, `health`, `fuel`, `x`, `y`, `z`, `a`, `int`, `vw`, `damage0`, `damage1`, `damage2`, `damage3`, `mod0`, `mod1`, `mod2`, `mod3`, `mod4`, `mod5`, `mod6`, `mod7`, `mod8`, `mod9`, `mod10`, `mod11`, `mod12`, `mod13`, `mod14`, `mod15`, `mod16`, `parachute`, `lumber`, `product`, `Weapon1`, `Ammo1`, `Weapon2`, `Ammo2`, `Weapon3`, `Ammo3`, `Weapon4`, `Ammo4`, `Weapon5`, `Ammo5`, `Serial1`, `Serial2`, `Serial3`, `Serial4`, `Serial5`, `Durability1`, `Durability2`, `Durability3`, `Durability4`, `Durability5`, `component`, `material`, `seed`, `food`, `burger`, `milk`, `repairkit`, `marijuana`, `cocaine`, `clippistol`, `clipsg`, `clipsmg`, `money`, `gasoil`, `rental`, `engine_level`, `brake_level`, `max_fuel`, `fuel_level`) VALUES
(1, 1, -1, 560, 'Sultan', 0, 0, -1, 0, 0, 76500, 1793081069, 'R 1828 RP', 1791007469, 0, 0, -1, 90000, 1000, 100, 2144.03, 1622.59, -34.1039, 187.341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0),
(2, 1, -1, 429, 'Banshee', 0, 0, -1, 0, 0, 85, 1793081084, 'R 1306 RP', 1791007484, 0, 0, -1, 100, 1000, 100, 1459.94, -1034.05, 23.4893, 272.911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_toys`
--

CREATE TABLE `vehicle_toys` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `slot_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `model` int(11) NOT NULL DEFAULT 0,
  `is_material_text` tinyint(1) NOT NULL DEFAULT 0,
  `text_content` varchar(64) DEFAULT NULL,
  `font_face` varchar(32) DEFAULT 'Arial',
  `font_size` tinyint(3) UNSIGNED DEFAULT 20,
  `flags` int(11) DEFAULT 0,
  `mat_index` int(11) DEFAULT -1,
  `color_text` int(11) DEFAULT -1,
  `color_back` int(11) DEFAULT 0,
  `alignment` tinyint(1) DEFAULT 1,
  `resolution` smallint(6) DEFAULT 70,
  `pos_x` float NOT NULL DEFAULT 0,
  `pos_y` float NOT NULL DEFAULT 0,
  `pos_z` float NOT NULL DEFAULT 0,
  `rot_x` float NOT NULL DEFAULT 0,
  `rot_y` float NOT NULL DEFAULT 0,
  `rot_z` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_toy_presets`
--

CREATE TABLE `vehicle_toy_presets` (
  `vehicle_id` int(11) NOT NULL,
  `preset_code` varchar(24) NOT NULL DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle_toy_presets`
--

INSERT INTO `vehicle_toy_presets` (`vehicle_id`, `preset_code`) VALUES
(1, 'R-0001'),
(2, 'R-0002');

-- --------------------------------------------------------

--
-- Table structure for table `vending_machine`
--

CREATE TABLE `vending_machine` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL DEFAULT 'None',
  `modelid` int(11) NOT NULL DEFAULT 1209,
  `price` int(11) NOT NULL DEFAULT 500000,
  `drinkprice` int(11) NOT NULL DEFAULT 0,
  `tax` int(11) NOT NULL DEFAULT 0,
  `seal` int(11) NOT NULL DEFAULT 0,
  `product` int(11) NOT NULL DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 0,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `posrx` float DEFAULT 0,
  `posry` float DEFAULT 0,
  `posrz` float DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0,
  `visit` bigint(20) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `order_id` varchar(50) NOT NULL DEFAULT 'None',
  `source` enum('midtrans','manual','system') NOT NULL DEFAULT 'midtrans',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `skinid` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `vehicleid` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `mask_number` mediumint(9) NOT NULL DEFAULT 0,
  `phone_number` int(11) NOT NULL DEFAULT 0,
  `bank_number` int(11) NOT NULL DEFAULT 0,
  `plate_number` varchar(50) NOT NULL DEFAULT 'None',
  `vip` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `vip_time` int(11) NOT NULL DEFAULT 0,
  `booster_time` int(11) NOT NULL DEFAULT 0,
  `gold` int(11) NOT NULL DEFAULT 0,
  `component` int(11) NOT NULL DEFAULT 0,
  `material` int(11) NOT NULL DEFAULT 0,
  `repairkit` int(11) NOT NULL DEFAULT 0,
  `admin` varchar(50) NOT NULL DEFAULT 'None',
  `created_by_discord_id` varchar(30) NOT NULL DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  `donature` varchar(50) NOT NULL DEFAULT 'None',
  `claim` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','claimed','expired','revoked') NOT NULL DEFAULT 'active',
  `max_uses` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `current_uses` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `expires_at` timestamp NULL DEFAULT NULL,
  `target_discord_id` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `claimed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `code`, `order_id`, `source`, `type`, `skinid`, `vehicleid`, `mask_number`, `phone_number`, `bank_number`, `plate_number`, `vip`, `vip_time`, `booster_time`, `gold`, `component`, `material`, `repairkit`, `admin`, `created_by_discord_id`, `notes`, `donature`, `claim`, `status`, `max_uses`, `current_uses`, `expires_at`, `target_discord_id`, `created_at`, `claimed_at`) VALUES
(1, 'GLWM5QM3', 'MANUAL-1785522052789-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', NULL, 'None', 0, 'active', 1, 0, NULL, NULL, '2026-07-31 11:20:52', NULL),
(2, 'W3RJJCTT', 'MANUAL-1785686724333-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 3, 30, 45, 750, 3300, 3300, 30, 'noxdev.', '1518807419235598463', NULL, 'None', 0, 'active', 1, 0, '2026-08-02 10:05:23', '1518807419235598463', '2026-08-02 09:05:24', NULL),
(3, 'FULZPYRQ', 'MANUAL-1785742497349-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', 'NIH VIP', 'None', 0, 'active', 1, 0, '2026-08-03 01:34:56', '1518807419235598463', '2026-08-03 00:34:57', NULL),
(4, '57L2J32W', 'MANUAL-1785742626910-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 2, 30, 30, 500, 2200, 2200, 20, 'noxdev.', '1518807419235598463', NULL, 'None', 0, 'active', 1, 0, '2026-08-03 01:37:06', '1518807419235598463', '2026-08-03 00:37:06', NULL),
(5, 'JW4A349L', 'MANUAL-1785742697057-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 3, 30, 45, 750, 3300, 3300, 30, 'noxdev.', '1518807419235598463', NULL, 'None', 0, 'active', 1, 0, '2026-08-03 01:38:16', '1518807419235598463', '2026-08-03 00:38:17', NULL),
(6, '3R7D5G9J', 'MANUAL-1785743269766-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', NULL, 'Dheriy_Axelios', 1, 'claimed', 2, 1, '2026-08-03 01:47:49', NULL, '2026-08-03 00:47:49', '2026-08-03 00:49:22'),
(7, '2HHNAH6R', 'MANUAL-1785743269768-1', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', NULL, 'Zanz_Morgan', 1, 'claimed', 2, 1, '2026-08-03 01:47:49', NULL, '2026-08-03 00:47:49', '2026-08-03 00:49:44'),
(8, 'WYGUW34H', 'MANUAL-1786193508245-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 3, 30, 45, 750, 3300, 3300, 30, 'noxdev.', '1518807419235598463', 'NIH DONE', 'Frederico_Malvardo', 1, 'claimed', 1, 1, '2026-08-08 06:51:47', NULL, '2026-08-08 05:51:48', '2026-08-08 05:52:39'),
(9, 'JJAGJU5W', 'MANUAL-1786260654342-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 2, 30, 30, 500, 2200, 2200, 20, 'noxdev.', '1518807419235598463', NULL, 'None', 0, 'active', 1, 0, '2026-08-09 01:30:53', NULL, '2026-08-09 00:30:54', NULL),
(10, 'D4JNEMXE', 'MANUAL-1786260684475-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 2, 30, 30, 500, 2200, 2200, 20, 'noxdev.', '1518807419235598463', 'ni', 'None', 0, 'active', 1, 0, '2026-08-09 01:31:24', '1533119283918541005', '2026-08-09 00:31:24', NULL),
(11, '8R6EPCNW', 'MANUAL-1786260806382-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 2, 30, 30, 500, 2200, 2200, 20, 'noxdev.', '1518807419235598463', 'y', 'None', 0, 'active', 1, 0, '2026-08-09 05:33:25', '1518807419235598463', '2026-08-09 00:33:26', NULL),
(12, 'M9TWRDTX', 'MANUAL-1786277288009-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 3, 30, 45, 750, 3300, 3300, 30, 'noxdev.', '1518807419235598463', 'nih', 'None', 0, 'active', 1, 0, '2026-08-09 06:08:07', NULL, '2026-08-09 05:08:08', NULL),
(13, '8QHXDSEL', 'MANUAL-1786292787021-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 3, 30, 45, 750, 3300, 3300, 30, 'noxdev.', '1518807419235598463', 'nih', 'None', 0, 'active', 1, 0, '2026-08-09 10:26:26', '1518807419235598463', '2026-08-09 09:26:27', NULL),
(14, 'QREJ687D', 'MANUAL-1786343497711-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', 'yo', 'None', 0, 'active', 1, 0, '2026-08-10 01:31:37', '276060004262477825', '2026-08-09 23:31:37', NULL),
(15, '2TV4WNEZ', 'MANUAL-1786362702946-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', 'y', 'Jambol_Maverick', 1, 'claimed', 1, 1, '2026-08-10 05:51:42', '276060004262477825', '2026-08-10 04:51:42', '2026-08-10 04:53:00'),
(16, 'C7K7H9DQ', 'MANUAL-1786362724311-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', NULL, 'Leon_Maverick', 1, 'claimed', 1, 1, '2026-08-10 05:52:03', NULL, '2026-08-10 04:52:04', '2026-08-10 04:53:01'),
(17, '33ZST4VB', 'MANUAL-1786381470498-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 3, 30, 45, 750, 3300, 3300, 30, 'noxdev.', '1518807419235598463', NULL, 'Rexy_Dawson', 1, 'claimed', 1, 1, '2026-08-10 11:04:30', '276060004262477825', '2026-08-10 10:04:30', '2026-08-10 10:05:57'),
(18, 'NWXV93FZ', 'MANUAL-1786899573137-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 2, 30, 30, 500, 2200, 2200, 20, 'noxdev.', '1518807419235598463', NULL, 'None', 0, 'active', 1, 0, '2026-08-16 10:59:32', '981128340297633874', '2026-08-16 09:59:33', NULL),
(19, 'EYYKK9D4', 'MANUAL-1786899704914-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 2, 30, 30, 500, 2200, 2200, 20, 'noxdev.', '1518807419235598463', NULL, 'None', 0, 'active', 1, 0, '2026-08-16 15:01:44', '981128340297633874', '2026-08-16 10:01:44', NULL),
(20, 'B4NN87WH', 'MANUAL-1787119672883-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 2, 30, 30, 500, 2200, 2200, 20, 'noxdev.', '1518807419235598463', 'nih', 'None', 0, 'active', 1, 0, '2026-08-19 02:07:52', '276060004262477825', '2026-08-18 23:07:52', NULL),
(21, '75D29M8T', 'MANUAL-1787120843211-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 3, 30, 45, 750, 3300, 3300, 30, 'noxdev.', '1518807419235598463', 'y', 'Lucas_Anderson', 0, 'active', 5, 1, '2026-09-17 23:27:22', '1518807419235598463', '2026-08-18 23:27:23', '2026-08-19 06:27:32'),
(22, 'UPZB9ZXN', 'MANUAL-1787120877956-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 2, 30, 30, 500, 2200, 2200, 20, 'noxdev.', '1518807419235598463', 'y', 'Franklin_Dantecruz', 0, 'active', 5, 1, '2026-09-17 23:27:57', '1465141202394415125', '2026-08-18 23:27:57', '2026-08-19 06:28:34'),
(23, '6QKYE2DC', 'MANUAL-1787901975425-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', 'ni', 'None', 0, 'active', 1, 0, '2026-08-28 02:26:14', '276060004262477825', '2026-08-28 00:26:15', NULL),
(24, 'ELKP8E9H', 'MANUAL-1787902187683-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', NULL, 'Leonn_Leonardo', 1, 'claimed', 2, 1, '2026-09-27 00:29:47', '276060004262477825', '2026-08-28 00:29:47', '2026-08-28 07:30:19'),
(25, 'E8C2SZX6', 'MANUAL-1787902187694-1', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', NULL, 'None', 0, 'active', 2, 0, '2026-09-27 00:29:47', '276060004262477825', '2026-08-28 00:29:47', NULL),
(26, 'NKF2PAZJ', 'MANUAL-1787912578115-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', NULL, 'None', 0, 'active', 1, 0, '2026-08-28 05:22:57', '276060004262477825', '2026-08-28 03:22:58', NULL),
(27, 'RJNX82HD', 'MANUAL-1787912578126-1', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', NULL, 'None', 0, 'active', 1, 0, '2026-08-28 05:22:57', '276060004262477825', '2026-08-28 03:22:58', NULL),
(28, '4MMG7LA6', 'MANUAL-1787912847888-0', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', NULL, 'Vinx_Elpatrons', 1, 'claimed', 2, 1, '2026-08-31 03:27:27', '276060004262477825', '2026-08-28 03:27:27', '2026-08-28 10:27:53'),
(29, 'TNVYGVCT', 'MANUAL-1787912847898-1', 'manual', 1, 0, 0, 0, 0, 0, 'None', 1, 30, 15, 250, 1100, 1100, 10, 'noxdev.', '1518807419235598463', NULL, 'None', 0, 'active', 2, 0, '2026-08-31 03:27:27', '276060004262477825', '2026-08-28 03:27:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `voucher_logs`
--

CREATE TABLE `voucher_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `action` enum('created','claimed','expired','revoked') NOT NULL,
  `actor_discord_id` varchar(30) DEFAULT NULL,
  `actor_username` varchar(100) DEFAULT NULL,
  `ingame_username` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `voucher_logs`
--

INSERT INTO `voucher_logs` (`id`, `voucher_id`, `code`, `action`, `actor_discord_id`, `actor_username`, `ingame_username`, `notes`, `created_at`) VALUES
(1, 1, 'GLWM5QM3', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-07-31 11:20:52'),
(2, 2, 'W3RJJCTT', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-02 09:05:24'),
(3, 3, 'FULZPYRQ', 'created', '1518807419235598463', 'noxdev.', NULL, 'NIH VIP', '2026-08-03 00:34:57'),
(4, 4, '57L2J32W', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-03 00:37:06'),
(5, 5, 'JW4A349L', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-03 00:38:17'),
(6, 6, '3R7D5G9J', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-03 00:47:49'),
(7, 7, '2HHNAH6R', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-03 00:47:49'),
(8, 8, 'WYGUW34H', 'created', '1518807419235598463', 'noxdev.', NULL, 'NIH DONE', '2026-08-08 05:51:48'),
(9, 9, 'JJAGJU5W', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-09 00:30:54'),
(10, 10, 'D4JNEMXE', 'created', '1518807419235598463', 'noxdev.', NULL, 'ni', '2026-08-09 00:31:24'),
(11, 11, '8R6EPCNW', 'created', '1518807419235598463', 'noxdev.', NULL, 'y', '2026-08-09 00:33:26'),
(12, 12, 'M9TWRDTX', 'created', '1518807419235598463', 'noxdev.', NULL, 'nih', '2026-08-09 05:08:08'),
(13, 13, '8QHXDSEL', 'created', '1518807419235598463', 'noxdev.', NULL, 'nih', '2026-08-09 09:26:27'),
(14, 14, 'QREJ687D', 'created', '1518807419235598463', 'noxdev.', NULL, 'yo', '2026-08-09 23:31:37'),
(15, 15, '2TV4WNEZ', 'created', '1518807419235598463', 'noxdev.', NULL, 'y', '2026-08-10 04:51:42'),
(16, 16, 'C7K7H9DQ', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-10 04:52:04'),
(17, 17, '33ZST4VB', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-10 10:04:30'),
(18, 18, 'NWXV93FZ', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-16 16:59:33'),
(19, 19, 'EYYKK9D4', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-16 17:01:44'),
(20, 20, 'B4NN87WH', 'created', '1518807419235598463', 'noxdev.', NULL, 'nih', '2026-08-19 06:07:52'),
(21, 21, '75D29M8T', 'created', '1518807419235598463', 'noxdev.', NULL, 'y', '2026-08-19 06:27:23'),
(22, 22, 'UPZB9ZXN', 'created', '1518807419235598463', 'noxdev.', NULL, 'y', '2026-08-19 06:27:57'),
(23, 23, '6QKYE2DC', 'created', '1518807419235598463', 'noxdev.', NULL, 'ni', '2026-08-28 07:26:09'),
(24, 24, 'ELKP8E9H', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-28 07:29:41'),
(25, 25, 'E8C2SZX6', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-28 07:29:41'),
(26, 26, 'NKF2PAZJ', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-28 10:22:52'),
(27, 27, 'RJNX82HD', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-28 10:22:52'),
(28, 28, '4MMG7LA6', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-28 10:27:22'),
(29, 29, 'TNVYGVCT', 'created', '1518807419235598463', 'noxdev.', NULL, NULL, '2026-08-28 10:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `weaponsettings`
--

CREATE TABLE `weaponsettings` (
  `Owner` int(11) NOT NULL,
  `WeaponID` tinyint(4) NOT NULL,
  `PosX` float DEFAULT -0.116,
  `PosY` float DEFAULT 0.189,
  `PosZ` float DEFAULT 0.088,
  `RotX` float DEFAULT 0,
  `RotY` float DEFAULT 44.5,
  `RotZ` float DEFAULT 0,
  `Bone` tinyint(4) NOT NULL DEFAULT 1,
  `Hidden` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weapon_logs`
--

CREATE TABLE `weapon_logs` (
  `id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `actor_name` varchar(24) NOT NULL,
  `target_id` int(11) NOT NULL,
  `target_name` varchar(24) NOT NULL,
  `action` varchar(64) NOT NULL,
  `weapon_name` varchar(32) NOT NULL,
  `weapon_id` int(11) NOT NULL,
  `ammo` int(11) NOT NULL,
  `serial` int(11) NOT NULL,
  `durability` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weapon_skills`
--

CREATE TABLE `weapon_skills` (
  `id` int(11) NOT NULL,
  `reg_id` int(10) UNSIGNED NOT NULL,
  `weapon_id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `xp` int(11) NOT NULL DEFAULT 0,
  `total_xp` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workshop`
--

CREATE TABLE `workshop` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT 'None',
  `leader` varchar(50) NOT NULL DEFAULT 'None',
  `price` int(11) NOT NULL DEFAULT 500000,
  `status` int(11) NOT NULL DEFAULT 1,
  `extposx` float DEFAULT 0,
  `extposy` float DEFAULT NULL,
  `extposz` float DEFAULT 0,
  `extposa` float DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 0,
  `component` int(11) NOT NULL DEFAULT 0,
  `repairkit` int(11) NOT NULL DEFAULT 0,
  `tax` int(11) NOT NULL DEFAULT 0,
  `visit` int(11) NOT NULL DEFAULT 0,
  `employe0` varchar(25) DEFAULT '',
  `employe1` varchar(25) NOT NULL DEFAULT '',
  `employe2` varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `workshop`
--

INSERT INTO `workshop` (`ID`, `name`, `leader`, `price`, `status`, `extposx`, `extposy`, `extposz`, `extposa`, `money`, `component`, `repairkit`, `tax`, `visit`, `employe0`, `employe1`, `employe2`) VALUES
(0, 'BENGKEL PAK YONO', 'Harsa_Barrakah', 200000, 0, 1654.88, -1892.69, 13.557, 182.402, 0, 48500, 0, 0, 1791363513, '', '', ''),
(1, 'ORACLE GARAGE V-1', 'Uchiha_Maeng', 100000, 0, 1922.09, -1799.45, 13.5547, 11.8226, 0, 50000, 0, 0, 1790768610, '', '', ''),
(30, 'None', '-', 1000, 0, 441.489, -1727.43, 10.2743, 6.45051, 0, 0, 0, 0, 0, '', '', ''),
(2, 'Oasis V1', 'Oben_Blicho', 1000, 0, 1276.77, -1527.17, 13.8326, 96.8547, 15000, 29679, 35, 0, 1790757260, '', '', ''),
(4, 'ROSE CUSTOMS V1', 'Arlo_Rosenfeldt', 1000, 1, 1011.56, -1364.28, 13.3871, 97.0249, 0, 16838, 0, 0, 1790765229, '', '', ''),
(3, 'Grave Diggers Garage', 'Zen_Saito', 10000, 1, 1052.12, -892.101, 43.1331, 265.685, 1000, 800, 0, 0, 0, '', '', ''),
(5, 'Speed Garage X PLATINUM V4', 'Keen_Drescher', 1000, 0, 1247.82, -1428.81, 13.6025, 85.3398, 230000, 0, 0, 0, 1790772231, '', '', ''),
(28, 'Angkringan Mamat V1', 'Jordan_Elguerdoo', 6400, 0, 643.417, 284.554, 20.7242, 183.807, 0, 41000, 0, 0, 1791283385, '', '', ''),
(8, 'ORACLE GARAGE V2', 'Gery_Antonio', 1000, 0, 144.614, -1634.15, 15.4694, 125.786, 0, 9900, 0, 0, 1791209076, '', '', ''),
(10, 'ORACLE V4', 'Gery_Antonio', 1000, 0, 758.177, -1127.96, 24.6062, 351.564, 0, 2050, 0, 0, 1790822303, '', '', ''),
(9, 'Everlast.Co', 'Steve_Decaprion', 1000, 0, 543.176, -1284.26, 17.2623, 188.148, 0, 37000, 0, 0, 1791300274, '', '', ''),
(15, 'Torque Garage V1', 'Dyson_Leonn', 1000, 0, 608.053, -1498.14, 15.3964, 86.6423, 0, 33946, 0, 0, 1790865872, '', '', ''),
(11, 'INSPIRING V1', 'Rendra_Widya', 1000, 1, 200.551, -1437.01, 13.2062, 326.975, 0, 17650, 0, 0, 1790825889, '', '', ''),
(12, 'None', '-', 1000, 0, 1023.73, -1438.76, 13.6063, 182.779, 0, 0, 0, 0, 0, 'Nicholas_Alvaro', '', ''),
(7, 'None', '-', 1000, 0, 1515.99, -1464.12, 9.55469, 282.131, 0, 0, 0, 0, 0, '', '', ''),
(13, 'None', '-', 1000, 0, 1361.04, -1767.14, 13.6109, 353.097, 0, 0, 0, 0, 0, 'Rayen_Yamatashi', '', ''),
(18, 'VINTEZ GARAGE V1   [[P.M.O]] V2', 'Calvin_Cortez', 1000, 0, 991.513, -918.04, 42.1797, 279.686, 39100, 35000, 0, 0, 1790947716, '', '', ''),
(14, '279 Garage V2', 'Gerry_Andreas', 1000, 0, 1529.79, -1017.57, 24.1062, 266.24, 3000000, 36000, 8, 0, 1790849445, '-', '', ''),
(16, 'STM WORKSHOP', 'Evander_Knox', 1000, 0, 1089.84, -1215.37, 17.8125, 0.749649, 0, 5000, 0, 0, 0, '', '', ''),
(19, 'ORACLE GARAGE V3', 'Gery_Antonio', 1000, 0, 1542.39, -941.77, 44.7221, 65.2273, 0, 0, 0, 0, 1790952235, '', '', ''),
(23, 'None', '-', 100000, 0, 1039.77, -1088.76, 23.9062, 216.346, 0, 0, 0, 0, 0, '', '', ''),
(20, 'BENGKEL TUKTUK P.M.O', 'Diego_Armando', 1000, 0, 1307.49, -1067.11, 29.3062, 100.347, 0, 14445, 0, 0, 1791017806, 'Garvin_Occoner', 'Tomy_Doyle', 'Alex_Oklama'),
(21, 'Torque Garage V2', 'Dyson_Leonn', 1000, 0, 1306.75, -858.798, 39.5822, 84.451, 0, 34000, 0, 0, 1791023193, '', '', ''),
(33, 'None', '-', 1000, 0, 1361.61, -1675.64, 13.6206, 108.115, 0, 0, 0, 0, 0, '', '', ''),
(22, 'None', '-', 1000, 0, 1766.09, -2021.28, 14.1405, 60.6331, 0, 0, 0, 0, 0, '', '', ''),
(24, 'WS KEV V1', 'Kever_Moale', 1000, 0, 1754, 805.058, 10.9107, 175.756, 0, 500, 0, 0, 0, '', '', ''),
(25, 'ROSE CUSTOMS V2', 'Arlo_Rosenfeldt', 1000, 1, 890.212, -1731.24, 14.4269, 95.934, 0, 11830, 0, 0, 1791207784, '', '', ''),
(26, 'OASIS V2 ', 'Oben_Blicho', 1000, 0, 1276.68, -1254.32, 14.3584, 350.168, 0, 0, 0, 0, 1791275170, '', '', ''),
(27, 'None', '-', 1000, 0, -791.053, -116.354, 66.4647, 93.0854, 0, 0, 0, 0, 0, '', '', ''),
(31, 'None', '-', 1000, 0, 944.631, -1680.76, 13.6063, 158.099, 0, 0, 0, 0, 0, '', '', ''),
(17, 'None', '-', 1000, 1, -107.239, -1206.04, 3.00625, 176.635, 0, 0, 0, 0, 0, '', '', ''),
(32, 'ROSE CUSTOMS V3', 'Arlo_Rosenfeldt', 1000, 1, 1066.92, -1770.52, 13.3996, 6.16707, 0, 18000, 0, 0, 1791642794, '', '', ''),
(6, 'None', '-', 1000, 0, 854.287, -1366.58, 13.8062, 267.313, 0, 0, 0, 0, 0, 'Betinho_Filho', 'Briella_Valensky', ''),
(35, 'None', '-', 1000, 1, -102.223, -1519.43, 3.00625, 51.3752, 0, 0, 0, 0, 0, '', '', ''),
(37, 'None', '-', 1000, 1, 1008.34, -1851.35, 14.2226, 150.026, 0, 0, 0, 0, 0, '', '', ''),
(38, 'None', '-', 1000, 1, 1842.37, 784.194, 11.2134, 156.271, 0, 0, 0, 0, 0, '', '', ''),
(39, 'None', '-', 1000, 0, 686.187, -1452.11, 15.1166, 83.5464, 0, 0, 0, 0, 0, '', '', ''),
(29, 'None', '-', 1000, 1, 1019.18, -1953.26, 13.1233, 93.4438, 0, 0, 0, 0, 0, '', '', ''),
(34, '{FFFFOP} 279 GARAGE V5', 'Franklin_Dantecruz', 1000, 0, 662.07, -615.957, 16.4062, 358.867, 0, 9000, 0, 0, 1790510333, '', '', ''),
(36, 'Lc x Gac Centerr', 'Michael_Wallacee', 1000, 0, 748.694, -1277.65, 14.7654, 183.703, 0, 5567, 0, 0, 1790515457, '', '', ''),
(40, 'Lc x Gac Center', 'Michael_Wallacee', 1000, 0, 754.31, -1230.41, 14.8517, 85.9901, 0, 0, 0, 0, 1790515498, '', '', ''),
(41, 'CPS GARAGE V1', 'Axel_Francisco', 1000, 0, -129.239, -1144.12, 4.5509, 170.579, 0, 1434, 0, 0, 1790771942, '', '', ''),
(42, '{FFFFOP} 279 GARAGE V6', 'Franklin_Dantecruz', 1000, 0, 868.861, 921.534, 13.4286, 295.862, 0, 0, 0, 0, 1791030620, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_ratings`
--
ALTER TABLE `admin_ratings`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `atms`
--
ALTER TABLE `atms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bans_username` (`username`);

--
-- Indexes for table `bisnis`
--
ALTER TABLE `bisnis`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_bisnis_owner` (`owner`);

--
-- Indexes for table `blackjack_logs`
--
ALTER TABLE `blackjack_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `casino_pools`
--
ALTER TABLE `casino_pools`
  ADD PRIMARY KEY (`pool_name`);

--
-- Indexes for table `cctv`
--
ALTER TABLE `cctv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `character_story`
--
ALTER TABLE `character_story`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crates`
--
ALTER TABLE `crates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crate_items`
--
ALTER TABLE `crate_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crate_id` (`crate_id`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dealer_owner` (`owner`);

--
-- Indexes for table `doors`
--
ALTER TABLE `doors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dropped_items`
--
ALTER TABLE `dropped_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drug_labs`
--
ALTER TABLE `drug_labs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `factionrank`
--
ALTER TABLE `factionrank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faction_vehpoint`
--
ALTER TABLE `faction_vehpoint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `families`
--
ALTER TABLE `families`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `leader_uid` (`leader_uid`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `familys`
--
ALTER TABLE `familys`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `family_logs`
--
ALTER TABLE `family_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `family_id` (`family_id`,`created_at`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `family_relations`
--
ALTER TABLE `family_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pair` (`fam_a`,`fam_b`);

--
-- Indexes for table `family_relation_logs`
--
ALTER TABLE `family_relation_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fam_a` (`fam_a`),
  ADD KEY `fam_b` (`fam_b`);

--
-- Indexes for table `family_turfs`
--
ALTER TABLE `family_turfs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`);

--
-- Indexes for table `family_vehicles`
--
ALTER TABLE `family_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_family_slot` (`family_id`,`slot_id`),
  ADD KEY `family_id` (`family_id`);

--
-- Indexes for table `fishingarea`
--
ALTER TABLE `fishingarea`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_furniture_house` (`houseid`);

--
-- Indexes for table `gangvehicle`
--
ALTER TABLE `gangvehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `garkot`
--
ALTER TABLE `garkot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gates`
--
ALTER TABLE `gates`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `gstations`
--
ALTER TABLE `gstations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_house_owner` (`owner`);

--
-- Indexes for table `huntable_objects`
--
ALTER TABLE `huntable_objects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lockers`
--
ALTER TABLE `lockers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logbank`
--
ALTER TABLE `logbank`
  ADD KEY `idx_logtransfer_player` (`player`),
  ADD KEY `idx_logtransfer_target` (`other`);

--
-- Indexes for table `logbans`
--
ALTER TABLE `logbans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_logbans_target` (`target_name`);

--
-- Indexes for table `loglogin`
--
ALTER TABLE `loglogin`
  ADD PRIMARY KEY (`no`),
  ADD KEY `idx_loglogin_user` (`username`);

--
-- Indexes for table `log_crates`
--
ALTER TABLE `log_crates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lotre_state`
--
ALTER TABLE `lotre_state`
  ADD PRIMARY KEY (`provider_id`);

--
-- Indexes for table `lotre_tickets`
--
ALTER TABLE `lotre_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_slot` (`provider_id`,`ticket_slot`);

--
-- Indexes for table `mappingingame`
--
ALTER TABLE `mappingingame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matext`
--
ALTER TABLE `matext`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `midtrans`
--
ALTER TABLE `midtrans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_midtrans_order` (`order_id`),
  ADD KEY `idx_discord_id` (`discord_id`),
  ADD KEY `idx_guild_id` (`guild_id`),
  ADD KEY `idx_status_claim` (`status_claim`),
  ADD KEY `idx_expire_time` (`expire_time`),
  ADD KEY `idx_created_time` (`created_time`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myfish`
--
ALTER TABLE `myfish`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myore`
--
ALTER TABLE `myore`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `npcfamily`
--
ALTER TABLE `npcfamily`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ores`
--
ALTER TABLE `ores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phonebook`
--
ALTER TABLE `phonebook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_phonebook_owner` (`owner`);

--
-- Indexes for table `plants`
--
ALTER TABLE `plants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`reg_id`);

--
-- Indexes for table `pooltables`
--
ALTER TABLE `pooltables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privatefarm`
--
ALTER TABLE `privatefarm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radio_url`
--
ALTER TABLE `radio_url`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rental_type` (`type`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server`
--
ALTER TABLE `server`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_economy`
--
ALTER TABLE `server_economy`
  ADD PRIMARY KEY (`item_db_col`);

--
-- Indexes for table `server_settings`
--
ALTER TABLE `server_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shots`
--
ALTER TABLE `shots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sigenal`
--
ALTER TABLE `sigenal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slot_logs`
--
ALTER TABLE `slot_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `speedcam`
--
ALTER TABLE `speedcam`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `spraytag`
--
ALTER TABLE `spraytag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topup_logs`
--
ALTER TABLE `topup_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_discord_id` (`discord_id`),
  ADD KEY `idx_action` (`action`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `toys`
--
ALTER TABLE `toys`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `idx_toys_owner` (`Owner`);

--
-- Indexes for table `toysveh`
--
ALTER TABLE `toysveh`
  ADD PRIMARY KEY (`Owner`),
  ADD KEY `idx_toysveh_owner` (`Owner`);

--
-- Indexes for table `trashmaster`
--
ALTER TABLE `trashmaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treasury_logs`
--
ALTER TABLE `treasury_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trees`
--
ALTER TABLE `trees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ucp`
--
ALTER TABLE `ucp`
  ADD PRIMARY KEY (`reg_id`),
  ADD KEY `idx_ucp_name` (`ucp_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vehicle_owner` (`owner`),
  ADD KEY `idx_vehicle_owner2` (`owner2`),
  ADD KEY `idx_vehicle_model` (`model`);

--
-- Indexes for table `vehicle_toys`
--
ALTER TABLE `vehicle_toys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_vehicle_slot` (`vehicle_id`,`slot_id`),
  ADD KEY `idx_vehicle` (`vehicle_id`);

--
-- Indexes for table `vehicle_toy_presets`
--
ALTER TABLE `vehicle_toy_presets`
  ADD PRIMARY KEY (`vehicle_id`);

--
-- Indexes for table `vending_machine`
--
ALTER TABLE `vending_machine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_code` (`code`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_source` (`source`),
  ADD KEY `idx_target_discord` (`target_discord_id`),
  ADD KEY `idx_expires_at` (`expires_at`);

--
-- Indexes for table `voucher_logs`
--
ALTER TABLE `voucher_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_voucher_id` (`voucher_id`),
  ADD KEY `idx_code` (`code`),
  ADD KEY `idx_action` (`action`);

--
-- Indexes for table `weaponsettings`
--
ALTER TABLE `weaponsettings`
  ADD PRIMARY KEY (`Owner`,`WeaponID`);

--
-- Indexes for table `weapon_logs`
--
ALTER TABLE `weapon_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weapon_skills`
--
ALTER TABLE `weapon_skills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_player_weapon` (`reg_id`,`weapon_id`);

--
-- Indexes for table `workshop`
--
ALTER TABLE `workshop`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_ratings`
--
ALTER TABLE `admin_ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blackjack_logs`
--
ALTER TABLE `blackjack_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `character_story`
--
ALTER TABLE `character_story`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `crates`
--
ALTER TABLE `crates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `crate_items`
--
ALTER TABLE `crate_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dropped_items`
--
ALTER TABLE `dropped_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `drug_labs`
--
ALTER TABLE `drug_labs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factionrank`
--
ALTER TABLE `factionrank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `families`
--
ALTER TABLE `families`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `family_logs`
--
ALTER TABLE `family_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=470;

--
-- AUTO_INCREMENT for table `family_relations`
--
ALTER TABLE `family_relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_relation_logs`
--
ALTER TABLE `family_relation_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_turfs`
--
ALTER TABLE `family_turfs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_vehicles`
--
ALTER TABLE `family_vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `huntable_objects`
--
ALTER TABLE `huntable_objects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logbans`
--
ALTER TABLE `logbans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loglogin`
--
ALTER TABLE `loglogin`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_crates`
--
ALTER TABLE `log_crates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lotre_tickets`
--
ALTER TABLE `lotre_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `midtrans`
--
ALTER TABLE `midtrans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myfish`
--
ALTER TABLE `myfish`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `myore`
--
ALTER TABLE `myore`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phonebook`
--
ALTER TABLE `phonebook`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `reg_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `radio_url`
--
ALTER TABLE `radio_url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shots`
--
ALTER TABLE `shots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `slot_logs`
--
ALTER TABLE `slot_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topup_logs`
--
ALTER TABLE `topup_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `toys`
--
ALTER TABLE `toys`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treasury_logs`
--
ALTER TABLE `treasury_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ucp`
--
ALTER TABLE `ucp`
  MODIFY `reg_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicle_toys`
--
ALTER TABLE `vehicle_toys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `voucher_logs`
--
ALTER TABLE `voucher_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `weapon_logs`
--
ALTER TABLE `weapon_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weapon_skills`
--
ALTER TABLE `weapon_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `family_logs`
--
ALTER TABLE `family_logs`
  ADD CONSTRAINT `family_logs_ibfk_1` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `family_relation_logs`
--
ALTER TABLE `family_relation_logs`
  ADD CONSTRAINT `family_relation_logs_ibfk_fam_a` FOREIGN KEY (`fam_a`) REFERENCES `families` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `family_relation_logs_ibfk_fam_b` FOREIGN KEY (`fam_b`) REFERENCES `families` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `family_turfs`
--
ALTER TABLE `family_turfs`
  ADD CONSTRAINT `family_turfs_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `families` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `family_vehicles`
--
ALTER TABLE `family_vehicles`
  ADD CONSTRAINT `family_vehicles_ibfk_1` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
