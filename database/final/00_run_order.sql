-- Recommended execution order for a fresh MySQL database.
-- The raw exports are preserved separately in database/raw_export/.
-- For a clean recreation, execute the table files in this order:

CREATE DATABASE IF NOT EXISTS hr_analytics;
USE hr_analytics;

-- 1. Departments
-- 2. Job roles
-- 3. Employees
-- 4. Performance
-- 5. Attendance
-- 6. Views
-- 7. Stored procedure

-- After loading:
SELECT COUNT(*) AS employee_count FROM employees;
SELECT COUNT(*) AS department_count FROM departments;
SELECT COUNT(*) AS job_role_count FROM job_roles;
SELECT COUNT(*) AS performance_count FROM performance;
SELECT COUNT(*) AS attendance_count FROM attendance;

SELECT * FROM hr_kpi_dashboard;
SELECT * FROM hr_dashboard;
SELECT * FROM employee_risk_analysis;
SELECT * FROM employee_hr_overview;

CALL GetDepartmentAnalysis('IT');
