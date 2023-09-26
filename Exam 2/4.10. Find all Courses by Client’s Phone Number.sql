CREATE OR REPLACE FUNCTION
	fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INT
LANGUAGE plpgsql
AS $$

DECLARE
	number_of_courses INT;
BEGIN
	SELECT
		COUNT(*)
	INTO
		number_of_courses
	FROM
		courses c
	JOIN
		clients cl
	ON
		cl.id = c.client_id
	WHERE
		cl.phone_number = phone_num;
RETURN number_of_courses;
END;
$$;

SELECT fn_courses_by_client('(803) 6386812')

SELECT fn_courses_by_client('(831) 1391236')

SELECT fn_courses_by_client('(704) 2502909')
