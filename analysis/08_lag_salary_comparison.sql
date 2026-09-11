USE hr_analytics;

WITH salary_comparison AS (
    SELECT
        employee_id,
        department,
        job_role,
        salary,
        LAG(salary) OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS previous_salary
    FROM employees
)
SELECT
    employee_id,
    department,
    job_role,
    salary,
    previous_salary,
    ROUND(salary - previous_salary, 2) AS salary_difference
FROM salary_comparison
ORDER BY department, salary DESC;
