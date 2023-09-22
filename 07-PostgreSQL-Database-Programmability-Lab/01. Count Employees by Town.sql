CREATE FUNCTION fn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT
AS $$

DECLARE
	count_employees INT;

BEGIN
	SELECT
	COUNT(employee_id)
INTO
	count_employees
FROM
	employees e
JOIN addresses a
	ON
	a.address_id = e.address_id
JOIN towns t
	ON
	t.town_id = a.town_id
WHERE
	t.name = town_name;

RETURN count_employees;
END;

$$ LANGUAGE plpgsql;

SELECT fn_count_employees_by_town('Sofia') AS count;
SELECT fn_count_employees_by_town('Berlin') AS count;
SELECT fn_count_employees_by_town(NULL) AS count;
