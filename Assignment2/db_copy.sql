-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: Assignment1
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

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
-- Table structure for table `Departments`
--

DROP TABLE IF EXISTS `Departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departments` (
  `dept_id` int NOT NULL,
  `dept_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departments`
--

LOCK TABLES `Departments` WRITE;
/*!40000 ALTER TABLE `Departments` DISABLE KEYS */;
INSERT INTO `Departments` VALUES (1,'FE'),(2,'CE'),(3,'IT'),(4,'ENTC');
/*!40000 ALTER TABLE `Departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professors`
--

DROP TABLE IF EXISTS `Professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Professors` (
  `prof_id` int NOT NULL,
  `prof_fname` varchar(100) DEFAULT NULL,
  `prof_lname` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `doj` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`prof_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `Professors_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `Departments` (`dept_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professors`
--

LOCK TABLES `Professors` WRITE;
/*!40000 ALTER TABLE `Professors` DISABLE KEYS */;
INSERT INTO `Professors` VALUES (1,'Shivaji','Mundhe','Ast. Prof.',40000,'2009-07-01','svmundhe@pict.edu','24371101','Pune',1),(2,'Nikhil','Sangade','Ast. Prof.',30000,'2019-03-21','nvsangade@pict.edu','9762172013','Pune',1),(3,'Kartik','Nandi','Prof.',50000,'1990-07-01','kcnandi@pict.edu','24371101','Pune',1),(4,'Urmila','Pawar','Ast. Prof.',40000,'2016-01-01','uspawar@pict.edu','7083664201','Mumbai',2),(5,'Bhumesh','Masram','Ast. Prof.',30000,'2017-07-15','bsmasram@pict.edu','24371101','Mumbai',2),(6,'Archana','Ghotkar','Asc. Prof.',50000,'2000-03-01','aaghotkar@pict.edu','24371101','Pune',2),(7,'Girish','Mundada','Prof.',50000,'1900-09-01','gsmundada@pict.edu','24371101','Nashik',4),(8,'Chetan','Pawar','Ast. Prof.',15000,'2018-02-01','ccpawar@pict.edu','9028648563','Jalgaon',4),(9,'Shweta','Dharmadhikari','Asc. Prof.',40000,'1995-12-31','scdharmadhikari@pict.edu','24371101','Pune',3),(10,'Emmanuel','M','Prof.',50000,'2000-08-01','emmanuelm@pict.edu','24371101','Mumbai',3);
/*!40000 ALTER TABLE `Professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shift`
--

DROP TABLE IF EXISTS `Shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shift` (
  `working_hours` int DEFAULT NULL,
  `prof_id` int DEFAULT NULL,
  `shift` varchar(100) DEFAULT NULL,
  KEY `prof_id` (`prof_id`),
  CONSTRAINT `Shift_ibfk_2` FOREIGN KEY (`prof_id`) REFERENCES `Professors` (`prof_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shift`
--

LOCK TABLES `Shift` WRITE;
/*!40000 ALTER TABLE `Shift` DISABLE KEYS */;
INSERT INTO `Shift` VALUES (8,1,'morning'),(8,2,'morning'),(10,3,'afternoon'),(8,4,'morning'),(10,5,'afternoon'),(8,6,'morning'),(8,7,'morning'),(8,8,'morning'),(10,9,'afternoon'),(8,10,'morning');
/*!40000 ALTER TABLE `Shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works` (
  `dept_id` int DEFAULT NULL,
  `prof_id` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  KEY `dept_id` (`dept_id`),
  KEY `prof_id` (`prof_id`),
  CONSTRAINT `works_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `Departments` (`dept_id`) ON DELETE CASCADE,
  CONSTRAINT `works_ibfk_2` FOREIGN KEY (`prof_id`) REFERENCES `Professors` (`prof_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
INSERT INTO `works` VALUES (1,1,9),(1,2,4),(1,3,27),(2,4,7),(2,5,3),(2,6,20),(4,7,29),(4,8,3),(3,9,16),(3,10,21);
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-29 13:00:32
