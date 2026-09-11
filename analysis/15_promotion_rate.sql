USE hr_analytics;

SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    SUM(
        CASE
            WHEN p.promotion_last_5_years = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_promoted,
    ROUND(
        SUM(
            CASE
                WHEN p.promotion_last_5_years = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(e.employee_id),
        2
    ) AS promotion_rate,
    ROUND(AVG(p.performance_rating), 2) AS average_performance
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN performance p
    ON e.employee_id = p.employee_id
GROUP BY d.department_id, d.department_name
ORDER BY promotion_rate DESC;
