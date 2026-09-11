USE hr_analytics;

SELECT
    employee_id,
    department,
    job_role,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees
ORDER BY department, salary_rank;
