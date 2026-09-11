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
-- Temporary view structure for view `hr_kpi_dashboard`
--

DROP TABLE IF EXISTS `hr_kpi_dashboard`;
/*!50001 DROP VIEW IF EXISTS `hr_kpi_dashboard`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `hr_kpi_dashboard` AS SELECT 
 1 AS `total_employees`,
 1 AS `employees_left`,
 1 AS `attrition_rate`,
 1 AS `average_salary`,
 1 AS `average_experience`,
 1 AS `average_satisfaction`,
 1 AS `employees_with_overtime`,
 1 AS `low_satisfaction_employees`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_risk_analysis`
--

DROP TABLE IF EXISTS `employee_risk_analysis`;
/*!50001 DROP VIEW IF EXISTS `employee_risk_analysis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_risk_analysis` AS SELECT 
 1 AS `employee_id`,
 1 AS `department`,
 1 AS `job_role`,
 1 AS `salary`,
 1 AS `job_satisfaction`,
 1 AS `performance_rating`,
 1 AS `attendance_percentage`,
 1 AS `days_absent`,
 1 AS `overtime`,
 1 AS `attrition`,
 1 AS `risk_level`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `hr_dashboard`
--

DROP TABLE IF EXISTS `hr_dashboard`;
/*!50001 DROP VIEW IF EXISTS `hr_dashboard`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `hr_dashboard` AS SELECT 
 1 AS `total_employees`,
 1 AS `active_employees`,
 1 AS `employees_left`,
 1 AS `attrition_rate`,
 1 AS `average_salary`,
 1 AS `average_job_satisfaction`,
 1 AS `average_attendance`,
 1 AS `average_days_absent`,
 1 AS `employees_promoted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_hr_overview`
--

DROP TABLE IF EXISTS `employee_hr_overview`;
/*!50001 DROP VIEW IF EXISTS `employee_hr_overview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_hr_overview` AS SELECT 
 1 AS `employee_id`,
 1 AS `age`,
 1 AS `gender`,
 1 AS `department`,
 1 AS `manager_name`,
 1 AS `job_role`,
 1 AS `salary`,
 1 AS `experience_years`,
 1 AS `job_satisfaction`,
 1 AS `overtime`,
 1 AS `attrition`,
 1 AS `performance_rating`,
 1 AS `promotion_last_5_years`,
 1 AS `training_hours`,
 1 AS `total_working_days`,
 1 AS `days_present`,
 1 AS `days_absent`,
 1 AS `attendance_percentage`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `hr_kpi_dashboard`
--

/*!50001 DROP VIEW IF EXISTS `hr_kpi_dashboard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hr_kpi_dashboard` AS select count(0) AS `total_employees`,sum((case when (`employees`.`attrition` = 'Yes') then 1 else 0 end)) AS `employees_left`,round(((sum((case when (`employees`.`attrition` = 'Yes') then 1 else 0 end)) * 100.0) / count(0)),2) AS `attrition_rate`,round(avg(`employees`.`salary`),2) AS `average_salary`,round(avg(`employees`.`experience_years`),2) AS `average_experience`,round(avg(`employees`.`job_satisfaction`),2) AS `average_satisfaction`,sum((case when (`employees`.`overtime` = 'Yes') then 1 else 0 end)) AS `employees_with_overtime`,sum((case when (`employees`.`job_satisfaction` <= 2) then 1 else 0 end)) AS `low_satisfaction_employees` from `employees` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_risk_analysis`
--

/*!50001 DROP VIEW IF EXISTS `employee_risk_analysis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_risk_analysis` AS select `e`.`employee_id` AS `employee_id`,`d`.`department_name` AS `department`,`jr`.`job_role_name` AS `job_role`,`e`.`salary` AS `salary`,`e`.`job_satisfaction` AS `job_satisfaction`,`p`.`performance_rating` AS `performance_rating`,`a`.`attendance_percentage` AS `attendance_percentage`,`a`.`days_absent` AS `days_absent`,`e`.`overtime` AS `overtime`,`e`.`attrition` AS `attrition`,(case when ((`e`.`job_satisfaction` <= 2) and (`a`.`attendance_percentage` < 90) and (`a`.`days_absent` >= 5)) then 'High Risk' when ((`e`.`job_satisfaction` <= 3) or (`a`.`attendance_percentage` < 90) or (`a`.`days_absent` >= 5)) then 'Medium Risk' else 'Low Risk' end) AS `risk_level` from ((((`employees` `e` join `departments` `d` on((`e`.`department_id` = `d`.`department_id`))) join `job_roles` `jr` on((`e`.`job_role_id` = `jr`.`job_role_id`))) join `performance` `p` on((`e`.`employee_id` = `p`.`employee_id`))) join `attendance` `a` on((`e`.`employee_id` = `a`.`employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hr_dashboard`
--

/*!50001 DROP VIEW IF EXISTS `hr_dashboard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hr_dashboard` AS select count(0) AS `total_employees`,sum((case when (`e`.`attrition` = 'No') then 1 else 0 end)) AS `active_employees`,sum((case when (`e`.`attrition` = 'Yes') then 1 else 0 end)) AS `employees_left`,round(((sum((case when (`e`.`attrition` = 'Yes') then 1 else 0 end)) * 100.0) / count(0)),2) AS `attrition_rate`,round(avg(`e`.`salary`),2) AS `average_salary`,round(avg(`e`.`job_satisfaction`),2) AS `average_job_satisfaction`,round(avg(`a`.`attendance_percentage`),2) AS `average_attendance`,round(avg(`a`.`days_absent`),2) AS `average_days_absent`,(select count(0) from `performance` `p` where (`p`.`promotion_last_5_years` = 'Yes')) AS `employees_promoted` from (`employees` `e` join `attendance` `a` on((`e`.`employee_id` = `a`.`employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_hr_overview`
--

/*!50001 DROP VIEW IF EXISTS `employee_hr_overview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_hr_overview` AS select `e`.`employee_id` AS `employee_id`,`e`.`age` AS `age`,`e`.`gender` AS `gender`,`d`.`department_name` AS `department`,`d`.`manager_name` AS `manager_name`,`jr`.`job_role_name` AS `job_role`,`e`.`salary` AS `salary`,`e`.`experience_years` AS `experience_years`,`e`.`job_satisfaction` AS `job_satisfaction`,`e`.`overtime` AS `overtime`,`e`.`attrition` AS `attrition`,`p`.`performance_rating` AS `performance_rating`,`p`.`promotion_last_5_years` AS `promotion_last_5_years`,`p`.`training_hours` AS `training_hours`,`a`.`total_working_days` AS `total_working_days`,`a`.`days_present` AS `days_present`,`a`.`days_absent` AS `days_absent`,`a`.`attendance_percentage` AS `attendance_percentage` from ((((`employees` `e` join `departments` `d` on((`e`.`department_id` = `d`.`department_id`))) join `job_roles` `jr` on((`e`.`job_role_id` = `jr`.`job_role_id`))) join `performance` `p` on((`e`.`employee_id` = `p`.`employee_id`))) join `attendance` `a` on((`e`.`employee_id` = `a`.`employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'hr_analytics'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetDepartmentAnalysis` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDepartmentAnalysis`(IN dept_name VARCHAR(50))
BEGIN
    SELECT
        e.department,
        COUNT(*) AS total_employees,
        SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
        ROUND(
            SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
            / COUNT(*),
            2
        ) AS attrition_rate,
        ROUND(AVG(e.salary), 2) AS average_salary,
        ROUND(AVG(a.attendance_percentage), 2) AS average_attendance,
        ROUND(AVG(a.overtime_hours), 2) AS average_overtime_hours
    FROM employees e
    JOIN attendance a
        ON e.employee_id = a.employee_id
    WHERE e.department = dept_name
    GROUP BY e.department;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-11 22:14:20
