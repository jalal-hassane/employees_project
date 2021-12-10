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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-12-03 10:07:31.606614','sadsa','Employee object (sadsa)',1,'[{\"added\": {}}]',8,1),(2,'2021-12-03 10:11:40.879938','sadsa','Employee object (sadsa)',3,'',8,1),(3,'2021-12-06 10:19:46.988861','j1','Employee object (j1)',1,'[{\"added\": {}}]',8,1),(4,'2021-12-06 14:43:31.055968','15','Attendance object (15)',3,'',7,1),(5,'2021-12-06 14:43:34.109935','14','Attendance object (14)',3,'',7,1),(6,'2021-12-06 14:43:36.902482','13','Attendance object (13)',3,'',7,1),(7,'2021-12-06 14:43:40.008096','6','Attendance object (6)',3,'',7,1),(8,'2021-12-06 14:43:42.215528','10','Attendance object (10)',3,'',7,1),(9,'2021-12-06 14:43:44.413400','11','Attendance object (11)',3,'',7,1),(10,'2021-12-06 14:43:47.991095','12','Attendance object (12)',3,'',7,1),(11,'2021-12-06 14:43:50.222282','2','Attendance object (2)',3,'',7,1),(12,'2021-12-06 14:43:59.474155','7','Attendance object (7)',3,'',7,1),(13,'2021-12-06 14:44:01.893181','9','Attendance object (9)',3,'',7,1),(14,'2021-12-06 14:44:04.865185','8','Attendance object (8)',3,'',7,1),(15,'2021-12-06 14:44:07.360109','5','Attendance object (5)',3,'',7,1),(16,'2021-12-06 14:44:09.961262','4','Attendance object (4)',3,'',7,1),(17,'2021-12-06 14:44:12.435460','3','Attendance object (3)',3,'',7,1),(18,'2021-12-06 14:44:36.530828','1','Attendance object (1)',3,'',7,1),(19,'2021-12-06 14:44:40.335379','16','Attendance object (16)',3,'',7,1),(20,'2021-12-06 14:45:04.759315','j1','Employee object (j1)',3,'',8,1),(21,'2021-12-06 14:47:29.984454','j1','Employee object (j1)',1,'[{\"added\": {}}]',8,1),(22,'2021-12-06 14:49:41.671759','17','Attendance object (17)',2,'[{\"changed\": {\"fields\": [\"Check in time\"]}}]',7,1),(23,'2021-12-06 14:49:50.653560','17','Attendance object (17)',2,'[{\"changed\": {\"fields\": [\"Check out time\"]}}]',7,1),(24,'2021-12-08 08:21:55.256154','j2','Employee object (j2)',1,'[{\"added\": {}}]',8,1),(25,'2021-12-10 09:13:19.485849','j1','Employee object (j1)',3,'',8,1),(26,'2021-12-10 09:13:25.236002','j2','Employee object (j2)',3,'',8,1),(27,'2021-12-10 09:14:57.937909','u1','Employee object (u1)',1,'[{\"added\": {}}]',8,1),(28,'2021-12-10 09:27:21.168157','u1','Employee object (u1)',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',8,1),(29,'2021-12-10 09:28:25.320208','j2','Employee object (j2)',1,'[{\"added\": {}}]',8,1),(30,'2021-12-10 09:28:32.223245','j1','Employee object (j1)',2,'[{\"changed\": {\"fields\": [\"Public id\"]}}]',8,1),(31,'2021-12-10 09:28:38.884965','u1','Employee object (u1)',3,'',8,1),(32,'2021-12-10 09:30:01.167585','j3','Employee object (j3)',1,'[{\"added\": {}}]',8,1),(33,'2021-12-10 09:32:23.657005','38','Attendance object (38)',1,'[{\"added\": {}}]',7,1),(34,'2021-12-10 09:33:05.376344','39','Attendance object (39)',1,'[{\"added\": {}}]',7,1),(35,'2021-12-10 09:33:44.255636','40','Attendance object (40)',1,'[{\"added\": {}}]',7,1),(36,'2021-12-10 09:34:44.137375','41','Attendance object (41)',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
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
