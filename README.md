# HR Analytics SQL Project

## Overview

This project analyzes employee data using MySQL to identify patterns in attrition, salary, employee performance, attendance, satisfaction, promotions, and retention risk.

The project was built in MySQL Workbench and uses a relational database named `hr_analytics`.

## Database

The database contains:

- `employees`
- `departments`
- `job_roles`
- `performance`
- `attendance`

The exported database files in `database/raw_export/` are preserved exactly as exported from the user's MySQL Workbench database.

## SQL Concepts Demonstrated

- SELECT, WHERE, GROUP BY, HAVING
- Aggregate functions: COUNT, SUM, AVG
- CASE statements
- INNER JOIN
- Subqueries
- Correlated subqueries
- CTEs
- Window functions
- RANK()
- ROW_NUMBER()
- LAG()
- Views
- Stored procedures
- Data-quality validation
- Employee segmentation
- Retention risk scoring

## Key Business Questions

1. Which departments have the highest attrition?
2. Does job satisfaction relate to employee attrition?
3. How does performance relate to attrition?
4. Which employees are paid above their department average?
5. Which employees are potential retention risks?
6. Which departments have stronger performance and promotion rates?
7. How does attendance relate to attrition?
8. Which employees are high performers but potentially at risk?

## Project Structure

```text
HR_Analytics_SQL_Project/
├── README.md
├── database/
│   ├── raw_export/
│   │   ├── hr_analytics_attendance.sql
│   │   ├── hr_analytics_departments.sql
│   │   ├── hr_analytics_employees.sql
│   │   ├── hr_analytics_job_roles.sql
│   │   ├── hr_analytics_performance.sql
│   │   └── hr_analytics_routines.sql
│   │
│   └── final/
│       ├── 00_run_order.sql
│       ├── hr_analytics_attendance.sql
│       ├── hr_analytics_departments.sql
│       ├── hr_analytics_employees.sql
│       ├── hr_analytics_job_roles.sql
│       ├── hr_analytics_performance.sql
│       ├── hr_analytics_routines.sql
│       └── views.sql
│
├── analysis/
│   ├── 01_department_attrition.sql
│   ├── 02_performance_vs_attrition.sql
│   ├── 03_overtime_vs_attrition.sql
│   ├── 04_satisfaction_vs_attrition.sql
│   ├── 05_salary_ranking.sql
│   ├── 06_above_department_average.sql
│   ├── 07_top_2_per_department.sql
│   ├── 08_lag_salary_comparison.sql
│   ├── 09_salary_range_attrition.sql
│   ├── 10_correlated_subquery.sql
│   ├── 11_department_performance.sql
│   ├── 12_high_performer_retention.sql
│   ├── 13_retention_risk_score.sql
│   ├── 14_experience_group_attrition.sql
│   ├── 15_promotion_rate.sql
│   ├── 16_data_quality_check.sql
│   ├── 17_employee_segmentation.sql
│   ├── 18_cte_risk_analysis.sql
│   ├── 19_department_attendance_attrition.sql
│   ├── 20_having_subquery.sql
│   └── 21_window_salary_comparison.sql
│
└── documentation/
    └── interview_notes.md
```

## Important Note About the Export

The raw export contains a stale version of the `GetDepartmentAnalysis` procedure that references `attendance.overtime_hours`.

The current attendance table does not contain `overtime_hours`; it contains `days_absent` and `attendance_percentage`.

Therefore:

- `database/raw_export/` is kept untouched as the original export.
- `database/final/hr_analytics_routines.sql` contains the corrected procedure.
- `database/final/views.sql` contains the current compatible views.

## Resume Description

**HR Analytics SQL Project — MySQL**

- Designed a relational HR analytics database with employee, department, job role, performance, and attendance tables.
- Analyzed employee attrition, salary, performance, satisfaction, attendance, promotions, and retention risk using advanced SQL.
- Implemented joins, CTEs, subqueries, correlated subqueries, window functions, views, and stored procedures.
