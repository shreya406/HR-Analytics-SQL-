USE hr_analytics;

SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    ROUND(AVG(p.performance_rating), 2) AS average_performance,
    SUM(
        CASE
            WHEN p.performance_rating >= 4 THEN 1
            ELSE 0
        END
    ) AS high_performers,
    SUM(
        CASE
            WHEN p.promotion_last_5_years = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_promoted,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN performance p
    ON e.employee_id = p.employee_id
GROUP BY d.department_id, d.department_name
ORDER BY average_performance DESC;
