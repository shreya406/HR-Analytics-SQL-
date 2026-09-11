USE hr_analytics;

CREATE OR REPLACE VIEW hr_kpi_dashboard AS
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate,
    ROUND(AVG(salary), 2) AS average_salary,
    ROUND(AVG(experience_years), 2) AS average_experience,
    ROUND(AVG(job_satisfaction), 2) AS average_satisfaction,
    SUM(CASE WHEN overtime = 'Yes' THEN 1 ELSE 0 END) AS employees_with_overtime,
    SUM(CASE WHEN job_satisfaction <= 2 THEN 1 ELSE 0 END) AS low_satisfaction_employees
FROM employees;


CREATE OR REPLACE VIEW employee_risk_analysis AS
SELECT
    e.employee_id,
    d.department_name AS department,
    jr.job_role_name AS job_role,
    e.salary,
    e.job_satisfaction,
    p.performance_rating,
    a.attendance_percentage,
    a.days_absent,
    e.overtime,
    e.attrition,
    CASE
        WHEN e.job_satisfaction <= 2
             AND a.attendance_percentage < 90
             AND a.days_absent >= 5
        THEN 'High Risk'
        WHEN e.job_satisfaction <= 3
             OR a.attendance_percentage < 90
             OR a.days_absent >= 5
        THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN job_roles jr
    ON e.job_role_id = jr.job_role_id
JOIN performance p
    ON e.employee_id = p.employee_id
JOIN attendance a
    ON e.employee_id = a.employee_id;


CREATE OR REPLACE VIEW hr_dashboard AS
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN e.attrition = 'No' THEN 1 ELSE 0 END) AS active_employees,
    SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate,
    ROUND(AVG(e.salary), 2) AS average_salary,
    ROUND(AVG(e.job_satisfaction), 2) AS average_job_satisfaction,
    ROUND(AVG(a.attendance_percentage), 2) AS average_attendance,
    ROUND(AVG(a.days_absent), 2) AS average_days_absent,
    (
        SELECT COUNT(*)
        FROM performance p
        WHERE p.promotion_last_5_years = 'Yes'
    ) AS employees_promoted
FROM employees e
JOIN attendance a
    ON e.employee_id = a.employee_id;


CREATE OR REPLACE VIEW employee_hr_overview AS
SELECT
    e.employee_id,
    e.age,
    e.gender,
    d.department_name AS department,
    d.manager_name,
    jr.job_role_name AS job_role,
    e.salary,
    e.experience_years,
    e.job_satisfaction,
    e.overtime,
    e.attrition,
    p.performance_rating,
    p.promotion_last_5_years,
    p.training_hours,
    a.total_working_days,
    a.days_present,
    a.days_absent,
    a.attendance_percentage
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN job_roles jr
    ON e.job_role_id = jr.job_role_id
JOIN performance p
    ON e.employee_id = p.employee_id
JOIN attendance a
    ON e.employee_id = a.employee_id;
