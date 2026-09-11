USE hr_analytics;

SELECT
    e.employee_id,
    e.department,
    e.job_role,
    e.salary,
    p.performance_rating,
    e.job_satisfaction,
    a.attendance_percentage,
    e.overtime,
    e.attrition,
    (
        CASE WHEN p.performance_rating >= 4 THEN 2 ELSE 0 END
        +
        CASE WHEN e.job_satisfaction <= 2 THEN 3 ELSE 0 END
        +
        CASE WHEN a.attendance_percentage < 90 THEN 2 ELSE 0 END
        +
        CASE WHEN e.overtime = 'Yes' THEN 2 ELSE 0 END
        +
        CASE WHEN e.attrition = 'Yes' THEN 3 ELSE 0 END
    ) AS retention_risk_score
FROM employees e
JOIN performance p
    ON e.employee_id = p.employee_id
JOIN attendance a
    ON e.employee_id = a.employee_id
ORDER BY retention_risk_score DESC;
