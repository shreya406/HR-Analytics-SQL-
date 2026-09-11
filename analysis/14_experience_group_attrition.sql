USE hr_analytics;

SELECT
    CASE
        WHEN experience_years < 3 THEN '0-2 Years'
        WHEN experience_years BETWEEN 3 AND 6 THEN '3-6 Years'
        ELSE '7+ Years'
    END AS experience_group,
    COUNT(*) AS total_employees,
    ROUND(AVG(salary), 2) AS average_salary,
    ROUND(AVG(job_satisfaction), 2) AS average_satisfaction,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY experience_group
ORDER BY attrition_rate DESC;
