-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: devops-db
-- ------------------------------------------------------
-- Server version	5.5.5-10.9.2-MariaDB-1:10.9.2+maria~ubu2204

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
-- Table structure for table `Certificate`
--

DROP TABLE IF EXISTS `Certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) DEFAULT NULL,
  `DateOfRequest` date DEFAULT NULL,
  `DateOfCompletion` date DEFAULT NULL,
  `NumOfCopies` int(11) DEFAULT NULL,
  `Comments` varchar(100) DEFAULT NULL,
  `Status` varchar(100) DEFAULT NULL,
  `StudentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Certificate_FK` (`StudentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Certificate`
--

LOCK TABLES `Certificate` WRITE;
/*!40000 ALTER TABLE `Certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `Certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Experience`
--

DROP TABLE IF EXISTS `Experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Company` varchar(100) DEFAULT NULL,
  `Period` varchar(100) DEFAULT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `StudentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Experience_FK` (`StudentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Experience`
--

LOCK TABLES `Experience` WRITE;
/*!40000 ALTER TABLE `Experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `Experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Scholarship`
--

DROP TABLE IF EXISTS `Scholarship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Scholarship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `School` varchar(100) DEFAULT NULL,
  `Period` varchar(100) DEFAULT NULL,
  `Field` varchar(100) DEFAULT NULL,
  `StudentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Scholarship_FK` (`StudentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Scholarship`
--

LOCK TABLES `Scholarship` WRITE;
/*!40000 ALTER TABLE `Scholarship` DISABLE KEYS */;
/*!40000 ALTER TABLE `Scholarship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `StudiesId` int(11) DEFAULT NULL,
  `ExperienceId` int(11) DEFAULT NULL,
  `ScholarshipId` int(11) DEFAULT NULL,
  `CertificateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Student_Studies_FK` (`StudiesId`),
  KEY `Student_Experience_FK` (`ExperienceId`),
  KEY `Student_Scholarship_FK` (`ScholarshipId`),
  KEY `Student_Certificate_FK` (`CertificateId`),
  CONSTRAINT `Student_Certificate_FK` FOREIGN KEY (`CertificateId`) REFERENCES `Certificate` (`id`),
  CONSTRAINT `Student_Experience_FK` FOREIGN KEY (`ExperienceId`) REFERENCES `Experience` (`id`),
  CONSTRAINT `Student_Scholarship_FK` FOREIGN KEY (`ScholarshipId`) REFERENCES `Scholarship` (`id`),
  CONSTRAINT `Student_Studies_FK` FOREIGN KEY (`StudiesId`) REFERENCES `Studies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (2,'Spyros','Mouchlianitis','it21958@gmail.gr',NULL,'Omirou 9',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Studies`
--

DROP TABLE IF EXISTS `Studies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Studies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `School` varchar(100) DEFAULT NULL,
  `Period` varchar(100) DEFAULT NULL,
  `Level` varchar(100) DEFAULT NULL,
  `StudentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Studies_FK` (`StudentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Studies`
--

LOCK TABLES `Studies` WRITE;
/*!40000 ALTER TABLE `Studies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Studies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1001,1,9223372036854775806,1,1,1000,0,0);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'devops-db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-04 18:55:25
