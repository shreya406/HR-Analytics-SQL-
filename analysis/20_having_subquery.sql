USE hr_analytics;

SELECT
    department,
    COUNT(*) AS total_employees,
    ROUND(AVG(salary), 2) AS average_salary,
    ROUND(AVG(job_satisfaction), 2) AS average_satisfaction
FROM employees
GROUP BY department
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY average_salary DESC;
