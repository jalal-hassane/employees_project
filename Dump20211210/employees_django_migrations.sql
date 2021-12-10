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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-12-03 08:37:23.237747'),(2,'auth','0001_initial','2021-12-03 08:37:23.607249'),(3,'admin','0001_initial','2021-12-03 08:37:23.734726'),(4,'admin','0002_logentry_remove_auto_add','2021-12-03 08:37:23.740530'),(5,'admin','0003_logentry_add_action_flag_choices','2021-12-03 08:37:23.744994'),(6,'contenttypes','0002_remove_content_type_name','2021-12-03 08:37:23.815637'),(7,'auth','0002_alter_permission_name_max_length','2021-12-03 08:37:23.855800'),(8,'auth','0003_alter_user_email_max_length','2021-12-03 08:37:23.872044'),(9,'auth','0004_alter_user_username_opts','2021-12-03 08:37:23.878025'),(10,'auth','0005_alter_user_last_login_null','2021-12-03 08:37:23.926376'),(11,'auth','0006_require_contenttypes_0002','2021-12-03 08:37:23.928469'),(12,'auth','0007_alter_validators_add_error_messages','2021-12-03 08:37:23.933587'),(13,'auth','0008_alter_user_username_max_length','2021-12-03 08:37:23.977184'),(14,'auth','0009_alter_user_last_name_max_length','2021-12-03 08:37:24.054300'),(15,'auth','0010_alter_group_name_max_length','2021-12-03 08:37:24.074228'),(16,'auth','0011_update_proxy_permissions','2021-12-03 08:37:24.086188'),(17,'auth','0012_alter_user_first_name_max_length','2021-12-03 08:37:24.144468'),(18,'sessions','0001_initial','2021-12-03 08:37:24.168733'),(19,'employees','0001_initial','2021-12-03 10:01:50.516949'),(20,'employees','0002_auto_20211203_1209','2021-12-03 10:10:47.324962'),(21,'employees','0003_auto_20211203_1210','2021-12-03 10:10:47.392545'),(22,'employees','0004_auto_20211203_1525','2021-12-03 13:25:14.436983'),(23,'employees','0005_auto_20211206_1552','2021-12-06 13:52:32.125020'),(24,'employees','0006_alter_attendance_check_out_time','2021-12-06 13:53:20.370071'),(25,'employees','0007_auto_20211206_1640','2021-12-06 14:44:45.778712'),(26,'employees','0008_auto_20211206_1642','2021-12-06 14:45:15.952912'),(27,'employees','0009_alter_employee_hour_rate','2021-12-06 14:45:15.980744'),(28,'employees','0010_alter_employee_hour_rate','2021-12-06 14:45:16.008926'),(29,'employees','0011_alter_attendance_attendance','2021-12-06 14:45:56.590406'),(30,'employees','0012_auto_20211206_1647','2021-12-06 14:47:26.221352'),(31,'employees','0013_alter_attendance_attendance','2021-12-06 15:10:58.828208'),(32,'employees','0014_alter_attendance_check_in_time','2021-12-06 15:19:39.840775');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
