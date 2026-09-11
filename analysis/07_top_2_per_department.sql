USE hr_analytics;

WITH ranked_employees AS (
    SELECT
        employee_id,
        department,
        job_role,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT
    employee_id,
    department,
    job_role,
    salary,
    salary_rank
FROM ranked_employees
WHERE salary_rank <= 2
ORDER BY department, salary_rank;
