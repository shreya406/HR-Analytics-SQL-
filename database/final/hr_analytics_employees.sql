-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: hr_analytics
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `job_role` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `experience_years` int DEFAULT NULL,
  `job_satisfaction` int DEFAULT NULL,
  `performance_rating` int DEFAULT NULL,
  `overtime` varchar(10) DEFAULT NULL,
  `attrition` varchar(10) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `job_role_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `idx_employees_department` (`department_id`),
  KEY `idx_employees_attrition` (`attrition`),
  KEY `fk_employees_job_role` (`job_role_id`),
  CONSTRAINT `fk_employees_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `fk_employees_job_role` FOREIGN KEY (`job_role_id`) REFERENCES `job_roles` (`job_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,25,'Male','IT','Developer',45000.00,2,4,4,'Yes','No',1,1),(2,32,'Female','HR','HR Manager',60000.00,7,3,4,'No','No',2,3),(3,28,'Male','IT','Developer',52000.00,4,3,3,'Yes','Yes',1,1),(4,35,'Female','Finance','Analyst',58000.00,8,4,5,'No','No',3,5),(5,24,'Male','Sales','Sales Executive',40000.00,1,2,3,'Yes','Yes',4,7),(6,41,'Female','IT','Team Lead',85000.00,15,4,5,'No','No',1,8),(7,30,'Male','Marketing','Marketing Executive',48000.00,5,3,4,'Yes','No',5,9),(8,27,'Female','IT','Developer',50000.00,3,2,3,'Yes','Yes',1,1),(9,38,'Male','Finance','Senior Analyst',72000.00,12,4,4,'No','No',3,6),(10,29,'Female','Sales','Sales Executive',43000.00,4,3,3,'Yes','No',4,7),(11,45,'Male','HR','HR Manager',78000.00,18,4,5,'No','No',2,3),(12,26,'Female','Marketing','Marketing Executive',42000.00,2,2,3,'Yes','Yes',5,9),(13,33,'Male','IT','Senior Developer',70000.00,9,4,5,'No','No',1,2),(14,31,'Female','Finance','Analyst',55000.00,6,3,4,'No','No',3,5),(15,23,'Male','Sales','Sales Executive',38000.00,1,2,2,'Yes','Yes',4,7),(16,36,'Female','IT','Team Lead',82000.00,11,4,5,'No','No',1,8),(17,28,'Male','HR','HR Executive',47000.00,3,3,3,'Yes','No',2,4),(18,40,'Female','Marketing','Marketing Manager',75000.00,14,4,4,'No','No',5,10),(19,25,'Male','Finance','Analyst',45000.00,2,2,3,'Yes','Yes',3,5),(20,34,'Female','IT','Developer',60000.00,8,4,4,'No','No',1,1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-11 22:14:19
