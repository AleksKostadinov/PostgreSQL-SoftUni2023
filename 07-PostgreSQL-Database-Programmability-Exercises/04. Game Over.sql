CREATE FUNCTION fn_is_game_over(is_game_over BOOL)
RETURNS TABLE (
	v_name VARCHAR(50),
	i_game_type_id INT,
	b_is_finished BOOL
)
AS $$
BEGIN
	RETURN QUERY
	SELECT
		g.name,
		g.game_type_id,
		g.is_finished
	FROM games g
	WHERE is_game_over = g.is_finished;
END;
$$ LANGUAGE plpgsql;


SELECT fn_is_game_over(true);
SELECT fn_is_game_over(false);
