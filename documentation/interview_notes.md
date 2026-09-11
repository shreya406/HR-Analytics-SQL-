# Interview Notes

## Project Summary

I built an HR Analytics database in MySQL to analyze employee attrition and workforce patterns.

## Tables

- employees: employee-level demographic, salary, satisfaction, overtime, and attrition information
- departments: department and manager information
- job_roles: job role and job level information
- performance: performance rating, promotion history, and training hours
- attendance: working days, present days, absent days, and attendance percentage

## Strong SQL Topics Used

### CTE
Used to create an intermediate employee analysis dataset and classify employees into High Risk, Medium Risk, and Low Risk groups.

### Window Functions
Used RANK(), ROW_NUMBER(), AVG() OVER(), and LAG() for salary comparisons and departmental rankings.

### Correlated Subquery
Compared each employee's salary against the average salary of their own department.

### Views
Created reusable HR dashboard and employee-risk views.

### Stored Procedure
Created `GetDepartmentAnalysis(dept_name)` to return department-level KPIs for a supplied department.

## Important Project Limitation

This is a small demonstration dataset of 20 employees. Therefore, the analysis shows patterns in the dataset but should not be presented as statistically representative of a real company's workforce.

## Interview Answer: Why SQL?

SQL is useful for HR analytics because employee information is naturally relational. SQL makes it possible to combine employee, department, performance, and attendance data and calculate business KPIs directly from the database.
