USE hr_analytics;

SELECT
    CASE
        WHEN salary < 40000 THEN 'Below 40K'
        WHEN salary BETWEEN 40000 AND 60000 THEN '40K - 60K'
        ELSE 'Above 60K'
    END AS salary_range,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY salary_range
ORDER BY attrition_rate DESC;
