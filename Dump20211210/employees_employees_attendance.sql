-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: employees
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employees_attendance`
--

DROP TABLE IF EXISTS `employees_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_attendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `attendance` decimal(12,2) NOT NULL,
  `employee_public_id_id` varchar(30) NOT NULL,
  `check_in_time` time(6) DEFAULT NULL,
  `check_out_time` time(6) DEFAULT NULL,
  `date` date NOT NULL,
  `is_day_off` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_attendance_employee_public_id_i_610d67b8_fk_employees` (`employee_public_id_id`),
  CONSTRAINT `employees_attendance_employee_public_id_i_610d67b8_fk_employees` FOREIGN KEY (`employee_public_id_id`) REFERENCES `employees_employee` (`public_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_attendance`
--

LOCK TABLES `employees_attendance` WRITE;
/*!40000 ALTER TABLE `employees_attendance` DISABLE KEYS */;
INSERT INTO `employees_attendance` VALUES (38,32400.00,'j1','09:00:00.000000','18:00:00.000000','2021-12-07',0),(39,7200.00,'j1','09:00:00.000000','11:00:00.000000','2021-12-08',0),(40,18000.00,'j1','12:00:00.000000','17:00:00.000000','2021-12-08',0),(41,1800.00,'j1','09:00:00.000000','09:30:00.000000','2021-12-09',0);
/*!40000 ALTER TABLE `employees_attendance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-10 11:42:25
