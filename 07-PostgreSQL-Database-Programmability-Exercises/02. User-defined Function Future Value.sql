CREATE  FUNCTION fn_calculate_future_value(initial_sum NUMERIC, yearly_interest_rate NUMERIC, number_of_years NUMERIC)
RETURNS NUMERIC(10, 4)
AS $$
DECLARE future_value NUMERIC(10, 4);
BEGIN
	SELECT
		TRUNC(initial_sum * POWER((1 + yearly_interest_rate), number_of_years), 4)
	INTO future_value;
	RETURN future_value;
END;
$$ LANGUAGE plpgsql;

SELECT fn_calculate_future_value(500, 0.25, 10);

-- CREATE  FUNCTION fn_calculate_future_value(initial_sum NUMERIC, yearly_interest_rate NUMERIC, number_of_years NUMERIC)
-- RETURNS NUMERIC(10, 4)
-- AS $$
-- DECLARE future_value NUMERIC(10, 4);
-- BEGIN
-- 	RETURN TRUNC(initial_sum * POWER((1 + yearly_interest_rate), number_of_years), 4);
-- END;
-- $$ LANGUAGE plpgsql;
