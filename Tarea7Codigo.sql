CREATE DATABASE  IF NOT EXISTS `empresa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `empresa`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: empresa
-- ------------------------------------------------------
-- Server version	5.7.28

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Dnumber` int(11) NOT NULL,
  `Dname` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Mgr_ssn` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  KEY `fk_DEPARTMENT_EMPLEADO1_idx` (`Mgr_ssn`),
  CONSTRAINT `fk_DEPARTMENT_EMPLEADO1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `empleado` (`SSN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `Essn` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Dependent_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sex` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Essn`),
  CONSTRAINT `fk_DEPENDENT_EMPLEADO1` FOREIGN KEY (`Essn`) REFERENCES `empleado` (`SSN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int(11) NOT NULL,
  `Dlocation` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `fk_DEPT_LOCATIONS_DEPARTMENT1` FOREIGN KEY (`Dnumber`) REFERENCES `department` (`Dnumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `Fname` int(11) DEFAULT NULL,
  `Minit` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Lname` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SSN` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sex` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Salary` decimal(7,2) DEFAULT NULL,
  `Super_ssn` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Dno` int(11) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `fk_EMPLEADO_DEPARTMENT_idx` (`Dno`),
  KEY `fk_EMPLEADO_EMPLEADO1_idx` (`Super_ssn`),
  CONSTRAINT `fk_EMPLEADO_DEPARTMENT` FOREIGN KEY (`Dno`) REFERENCES `department` (`Dnumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_EMPLEADO1` FOREIGN KEY (`Super_ssn`) REFERENCES `empleado` (`SSN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Pnumber` int(11) NOT NULL,
  `Plocation` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Dnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pnumber`,`Plocation`),
  KEY `fk_PROJECT_DEPARTMENT1_idx` (`Dnum`),
  CONSTRAINT `fk_PROJECT_DEPARTMENT1` FOREIGN KEY (`Dnum`) REFERENCES `department` (`Dnumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pno` int(11) NOT NULL,
  `Hours` int(11) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_WORKS_ON_PROJECT1_idx` (`Pno`),
  CONSTRAINT `fk_WORKS_ON_EMPLEADO1` FOREIGN KEY (`Essn`) REFERENCES `empleado` (`SSN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_WORKS_ON_PROJECT1` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-16 18:06:55
