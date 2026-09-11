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
    e.attrition
FROM employees e
JOIN performance p
    ON e.employee_id = p.employee_id
JOIN attendance a
    ON e.employee_id = a.employee_id
WHERE p.performance_rating >= 4
  AND (
        e.job_satisfaction <= 2
        OR a.attendance_percentage < 90
        OR e.overtime = 'Yes'
      )
ORDER BY p.performance_rating DESC,
         e.job_satisfaction ASC;
