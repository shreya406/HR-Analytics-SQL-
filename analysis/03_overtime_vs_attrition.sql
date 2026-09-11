USE hr_analytics;

SELECT
    e.overtime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate,
    ROUND(AVG(a.attendance_percentage), 2) AS average_attendance,
    ROUND(AVG(a.days_absent), 2) AS average_days_absent
FROM employees e
JOIN attendance a
    ON e.employee_id = a.employee_id
GROUP BY e.overtime
ORDER BY attrition_rate DESC;
