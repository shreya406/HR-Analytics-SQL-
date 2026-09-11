USE hr_analytics;

WITH department_salary AS (
    SELECT department, AVG(salary) AS average_department_salary
    FROM employees
    GROUP BY department
)
SELECT
    e.employee_id,
    e.department,
    e.job_role,
    e.salary,
    ROUND(ds.average_department_salary, 2) AS department_average_salary,
    ROUND(e.salary - ds.average_department_salary, 2) AS salary_difference
FROM employees e
JOIN department_salary ds
    ON e.department = ds.department
WHERE e.salary > ds.average_department_salary
ORDER BY salary_difference DESC;
