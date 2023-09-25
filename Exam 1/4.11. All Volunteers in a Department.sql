CREATE FUNCTION
	fn_get_volunteers_count_from_department(searched_volunteers_department VARCHAR(30))
RETURNS INT
AS $$
DECLARE count_of_volunteers INT;
BEGIN
	SELECT
		COUNT(*)
	INTO
		count_of_volunteers
	FROM volunteers v
	JOIN volunteers_departments vd
	ON v.department_id = vd.id
	WHERE vd.department_name = searched_volunteers_department;
RETURN count_of_volunteers;
END;
$$ LANGUAGE plpgsql;

SELECT fn_get_volunteers_count_from_department('Education program assistant');
SELECT fn_get_volunteers_count_from_department('Guest engagement');
SELECT fn_get_volunteers_count_from_department('Zoo events');
