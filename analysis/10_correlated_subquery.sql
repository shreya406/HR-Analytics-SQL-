USE hr_analytics;

SELECT
    e.employee_id,
    e.department,
    e.job_role,
    e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department = e.department
)
ORDER BY e.department, e.salary DESC;
