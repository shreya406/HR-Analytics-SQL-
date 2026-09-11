USE hr_analytics;

SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    ROUND(AVG(a.attendance_percentage), 2) AS average_attendance,
    ROUND(AVG(a.days_absent), 2) AS average_days_absent,
    SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(e.employee_id),
        2
    ) AS attrition_rate
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN attendance a
    ON e.employee_id = a.employee_id
GROUP BY d.department_id, d.department_name
ORDER BY attrition_rate DESC;
