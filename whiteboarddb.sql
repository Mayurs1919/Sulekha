-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: whiteboarddb
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `DeviceMaster`
--

DROP TABLE IF EXISTS `DeviceMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeviceMaster` (
  `DeviceID` int NOT NULL AUTO_INCREMENT,
  `DeviceUniqueCode` varchar(255) NOT NULL,
  `Status` enum('online','offline','maintenance') DEFAULT 'offline',
  `LastCheck` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DeviceID`),
  UNIQUE KEY `DeviceUniqueCode` (`DeviceUniqueCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceMaster`
--

LOCK TABLES `DeviceMaster` WRITE;
/*!40000 ALTER TABLE `DeviceMaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeviceMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserDeviceMapping`
--

DROP TABLE IF EXISTS `UserDeviceMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserDeviceMapping` (
  `UserDeviceMapID` int NOT NULL AUTO_INCREMENT,
  `UID` int NOT NULL,
  `DeviceID` int NOT NULL,
  `TimeToCreate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserDeviceMapID`),
  UNIQUE KEY `UID` (`UID`,`DeviceID`),
  KEY `DeviceID` (`DeviceID`),
  CONSTRAINT `UserDeviceMapping_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `Users` (`UID`) ON DELETE CASCADE,
  CONSTRAINT `UserDeviceMapping_ibfk_2` FOREIGN KEY (`DeviceID`) REFERENCES `DeviceMaster` (`DeviceID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserDeviceMapping`
--

LOCK TABLES `UserDeviceMapping` WRITE;
/*!40000 ALTER TABLE `UserDeviceMapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserDeviceMapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `UID` int NOT NULL AUTO_INCREMENT,
  `Uname` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `LastLogin` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('active','inactive','suspended') DEFAULT 'active',
  `UserRole` enum('admin','standard','guest') DEFAULT 'standard',
  `TokenNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `Uname` (`Uname`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camera`
--

DROP TABLE IF EXISTS `camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camera` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `camera_id` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `online` tinyint(1) NOT NULL DEFAULT '1',
  `active` bit(1) NOT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_83iofr88gx11wu0q67kk7xe05` (`camera_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera`
--

LOCK TABLES `camera` WRITE;
/*!40000 ALTER TABLE `camera` DISABLE KEYS */;
INSERT INTO `camera` VALUES (1,NULL,NULL,1,_binary '','meet',12),(2,NULL,NULL,1,_binary '','samsan',12),(3,NULL,NULL,1,_binary '','meet',12),(4,NULL,NULL,1,_binary '','meet',9),(5,NULL,NULL,1,_binary '','meet',9),(6,NULL,NULL,1,_binary '','samsan',12),(7,NULL,NULL,1,_binary '','samsan',12),(8,NULL,NULL,1,_binary '','meet',12),(9,NULL,NULL,1,_binary '','samsan',12),(10,NULL,NULL,1,_binary '','mww',12),(11,NULL,NULL,1,_binary '','meet',9),(12,NULL,NULL,1,_binary '','meet',9),(13,NULL,NULL,1,_binary '','jfjkfd',9),(14,NULL,NULL,1,_binary '','meet',9),(15,NULL,NULL,1,_binary '','samsan',9),(16,NULL,NULL,1,_binary '','samsan',9),(17,NULL,NULL,1,_binary '','samsanaqq',9),(18,NULL,NULL,1,_binary '','sddd',9),(19,NULL,NULL,1,_binary '','samsan',9),(20,NULL,NULL,1,_binary '','fdfld',9),(21,NULL,NULL,1,_binary '','klfmfd',9),(22,NULL,NULL,1,_binary '','samsan',13),(23,NULL,NULL,1,_binary '','oekoflsd',13),(24,NULL,NULL,1,_binary '','mee',13),(25,NULL,NULL,1,_binary '','sdmdl',13),(26,NULL,NULL,1,_binary '','dfds',9),(27,NULL,NULL,1,_binary '','Boat',15),(28,NULL,NULL,1,_binary '','Boat',2),(29,NULL,NULL,1,_binary '','Fastt',2),(30,'1234',NULL,1,_binary '','meet',6),(31,'4321',NULL,1,_binary '','samsan',6);
/*!40000 ALTER TABLE `camera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camera_log`
--

DROP TABLE IF EXISTS `camera_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camera_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera_log`
--

LOCK TABLES `camera_log` WRITE;
/*!40000 ALTER TABLE `camera_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `camera_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_stream`
--

DROP TABLE IF EXISTS `image_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_stream` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `camera_id` varchar(255) DEFAULT NULL,
  `image_data` tinyblob,
  `timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_stream`
--

LOCK TABLES `image_stream` WRITE;
/*!40000 ALTER TABLE `image_stream` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_entry`
--

DROP TABLE IF EXISTS `log_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_entry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_entry`
--

LOCK TABLES `log_entry` WRITE;
/*!40000 ALTER TABLE `log_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_status`
--

DROP TABLE IF EXISTS `sync_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_status` (
  `email` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `last_synced` datetime DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_status`
--

LOCK TABLES `sync_status` WRITE;
/*!40000 ALTER TABLE `sync_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `sync_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_entity`
--

DROP TABLE IF EXISTS `user_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_entity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `ck_user_role` CHECK ((`role` in (_utf8mb4'ROLE_USER',_utf8mb4'ROLE_ADMIN')))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_entity`
--

LOCK TABLES `user_entity` WRITE;
/*!40000 ALTER TABLE `user_entity` DISABLE KEYS */;
INSERT INTO `user_entity` VALUES (1,'anita@gmail.com','Anita','$2a$10$68p2h3XqgJOXdX2t.9UlmuabSpspwvIZfpsPQL8dglNpNRBG6Rv8q','ROLE_USER'),(2,'aditi1717@gmail.com','aditi shinde','$2a$10$aVKJwdJJJXDQMLqprvCUeuNL5mjoyOua3slNGM0EB8Daka1EJOqea','ROLE_USER'),(3,'anish@gmail.com','Anish G ','$2a$10$SCDm9/PWHhXO1hMbcb19aeWWQhQS8ZRSBL.pZNB4ALP8PUOvu48OK','ROLE_USER'),(4,'sagar@gmail.com','Sagar D','$2a$10$X7hfEQ7S1S3mINsMHTyEwOBhBMeewZPTvGIai8qKhrIRA2LSJkj3G','ROLE_USER'),(5,'raj1@gmail.com','Raj','$2a$10$nKZFhrQggm5eoTizn8sU8OFhSyHdOIiEmrx/2FJxUR76FaNDCg432','ROLE_USER'),(6,'onkar@gmail.com','onkar ','$2a$10$RnrF0Pf265Y93DcT/6nKBOnnfT1lcxYHa2NKyOmWsfZjdFdVmwHuy','ROLE_USER');
/*!40000 ALTER TABLE `user_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `email` varchar(255) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `father_name` varchar(50) DEFAULT NULL,
  `residency` varchar(20) DEFAULT NULL,
  `org_name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `map_link` varchar(255) DEFAULT NULL,
  `theme` varchar(20) DEFAULT NULL,
  `notify_email` tinyint(1) DEFAULT NULL,
  `notify_sms` tinyint(1) DEFAULT NULL,
  `time_zone` varchar(50) DEFAULT NULL,
  `date_format` varchar(20) DEFAULT NULL,
  `two_fa` tinyint(1) DEFAULT NULL,
  `auto_logout` tinyint(1) DEFAULT NULL,
  `storage_pref` varchar(20) DEFAULT NULL,
  `cloud_sync_enabled` tinyint(1) DEFAULT NULL,
  `last_synced` datetime DEFAULT NULL,
  `sync_status` varchar(20) DEFAULT NULL,
  `sync_frequency` varchar(20) DEFAULT NULL,
  `notifysms` bit(1) NOT NULL,
  `twofa` bit(1) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-03 15:06:27
