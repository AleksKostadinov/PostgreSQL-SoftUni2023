CREATE FUNCTION fn_full_name (first_name VARCHAR(30), last_name VARCHAR(30))
RETURNS VARCHAR(30)
AS $$
DECLARE full_name VARCHAR(30);
BEGIN
	SELECT
	INITCAP(CONCAT_WS(' ', first_name, last_name))
	INTO full_name;
	RETURN full_name;
END;
$$ LANGUAGE plpgsql;

SELECT fn_full_name('fred', 'sanford');

DROP FUNCTION fn_full_name;
