USE hr_analytics;

WITH employee_analysis AS (
    SELECT
        e.employee_id,
        e.department,
        e.job_role,
        e.salary,
        e.job_satisfaction,
        e.attrition,
        p.performance_rating,
        a.attendance_percentage,
        a.days_absent
    FROM employees e
    JOIN performance p
        ON e.employee_id = p.employee_id
    JOIN attendance a
        ON e.employee_id = a.employee_id
),
risk_analysis AS (
    SELECT
        *,
        CASE
            WHEN job_satisfaction <= 2
                 AND attendance_percentage < 90
                 AND days_absent >= 5
            THEN 'High Risk'
            WHEN job_satisfaction <= 3
                 OR attendance_percentage < 90
                 OR days_absent >= 5
            THEN 'Medium Risk'
            ELSE 'Low Risk'
        END AS risk_level
    FROM employee_analysis
)
SELECT
    risk_level,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM risk_analysis
GROUP BY risk_level
ORDER BY CASE risk_level
    WHEN 'High Risk' THEN 1
    WHEN 'Medium Risk' THEN 2
    WHEN 'Low Risk' THEN 3
END;
