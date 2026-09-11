USE hr_analytics;

SELECT
    p.performance_rating,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN e.attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM employees e
JOIN performance p ON e.employee_id = p.employee_id
GROUP BY p.performance_rating
ORDER BY p.performance_rating;
