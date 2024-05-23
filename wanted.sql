-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for rexshackredmbuild_c50ff1
CREATE DATABASE IF NOT EXISTS `rexshackredmbuild_c50ff1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `rexshackredmbuild_c50ff1`;

-- Dumping structure for table rexshackredmbuild_c50ff1.wanted_posters
CREATE TABLE IF NOT EXISTS `wanted_posters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(50) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `reward` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `is_edited` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_edited_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table rexshackredmbuild_c50ff1.wanted_posters: ~0 rows (approximately)
INSERT INTO `wanted_posters` (`id`, `date`, `reason`, `description`, `reward`, `image`, `created_by`, `is_edited`, `created_at`, `last_edited_at`) VALUES
	(9, '12/12/1800', 'WANTED FOR TRAIN ROBBERY', 'SHERIFF MAD DOG ', '500', 'https://cdn.discordapp.com/attachments/1099372115058229310/1233767683732930570/bg1.png?ex=66509232&is=664f40b2&hm=30fbaa9efbe35dafc6d1a6627b3f6aa77571f1b185578a8cb6d515ab0d2b150d&', 'SPH66494', 1, '2024-05-23 17:44:03', '2024-05-23 17:44:03'),
	(10, '12/12/1800', 'wanted for train robbery', 'SHERIFF MAD DOG ', '500', 'https://cdn.discordapp.com/attachments/1099372115058229310/1233767683732930570/bg1.png?ex=66509232&is=664f40b2&hm=30fbaa9efbe35dafc6d1a6627b3f6aa77571f1b185578a8cb6d515ab0d2b150d&', 'SPH66494', 1, '2024-05-23 17:44:38', '2024-05-23 17:44:38');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
