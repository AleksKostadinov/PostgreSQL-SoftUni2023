-- CREATE VIEW view_company_chart AS
--     SELECT CONCAT_WS(' ', first_name, last_name) AS "Full Name",
--     job_title AS "Job Title"
--     FROM employees
--     WHERE manager_id = 184;

CREATE VIEW view_company_chart AS
    SELECT "Full Name", "Job Title"
    FROM company_chart
    WHERE "Manager ID" = 184;

SELECT * FROM view_company_chart;
