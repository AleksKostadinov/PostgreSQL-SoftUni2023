CREATE PROCEDURE SP_INCREASE_SALARY_BY_ID(ID INT) LANGUAGE
PLPGSQL AS $$
	$$ BEGIN IF (
	    SELECT COUNT(*)
	    FROM employees
	    WHERE employee_id = id
	) != 1 THEN
	ROLLBACK;
	ELSE
	UPDATE employees
	SET salary = salary * 1.05
	WHERE employee_id = id;
	END IF;
	COMMIT;
	END;
	$$;
