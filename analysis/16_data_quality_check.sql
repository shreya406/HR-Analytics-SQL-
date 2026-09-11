USE hr_analytics;

SELECT
    e.employee_id,
    e.department,
    e.job_role,
    e.salary,
    p.performance_rating,
    e.job_satisfaction,
    a.attendance_percentage,
    e.attrition
FROM employees e
JOIN performance p
    ON e.employee_id = p.employee_id
JOIN attendance a
    ON e.employee_id = a.employee_id
WHERE e.salary <= 0
   OR e.job_satisfaction NOT BETWEEN 1 AND 5
   OR p.performance_rating NOT BETWEEN 1 AND 5
   OR a.attendance_percentage NOT BETWEEN 0 AND 100
   OR e.attrition NOT IN ('Yes', 'No');
