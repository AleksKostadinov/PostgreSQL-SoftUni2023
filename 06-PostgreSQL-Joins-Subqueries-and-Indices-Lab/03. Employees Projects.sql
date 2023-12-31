SELECT
    e.employee_id,
    CONCAT_WS(' ', e.first_name, e.last_name) AS full_name,
    p.project_id,
    p.name AS project_name
FROM employees AS e
JOIN employees_projects AS e_p
ON e.employee_id = e_p.employee_id
JOIN projects AS p
ON e_p.project_id = p.project_id
WHERE p.project_id = 1;
