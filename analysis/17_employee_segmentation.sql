USE hr_analytics;

SELECT
    e.employee_id,
    e.department,
    e.job_role,
    e.salary,
    p.performance_rating,
    e.job_satisfaction,
    e.attrition,
    CASE
        WHEN p.performance_rating >= 4
             AND e.job_satisfaction >= 3
        THEN 'High Performer - Stable'
        WHEN p.performance_rating >= 4
             AND e.job_satisfaction <= 2
        THEN 'High Performer - At Risk'
        WHEN p.performance_rating <= 3
             AND e.job_satisfaction <= 2
        THEN 'Low Performance - At Risk'
        ELSE 'Moderate'
    END AS employee_segment
FROM employees e
JOIN performance p
    ON e.employee_id = p.employee_id
ORDER BY
    CASE
        WHEN p.performance_rating >= 4
             AND e.job_satisfaction <= 2
        THEN 1
        WHEN p.performance_rating <= 3
             AND e.job_satisfaction <= 2
        THEN 2
        WHEN p.performance_rating >= 4
             AND e.job_satisfaction >= 3
        THEN 3
        ELSE 4
    END,
    e.employee_id;
