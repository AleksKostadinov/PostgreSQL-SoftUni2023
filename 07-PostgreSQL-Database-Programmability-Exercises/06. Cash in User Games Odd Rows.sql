CREATE OR REPLACE FUNCTION fn_cash_in_users_games(game_name VARCHAR(50))
RETURNS TABLE (total_cash NUMERIC)
AS $$
BEGIN
	RETURN QUERY
	SELECT
		ROUND(SUM(cash)::NUMERIC, 2)
	FROM (
		SELECT
			cash,
			ROW_NUMBER() OVER (ORDER BY cash DESC) AS row_num
		FROM users_games ug
		JOIN games g on g.id = ug.game_id
        WHERE g.name = game_name
	) AS ranked
	WHERE row_num % 2 = 1;
END;
$$ LANGUAGE plpgsql;

SELECT fn_cash_in_users_games('Love in a mist');
SELECT fn_cash_in_users_games('Delphinium Pacific Giant');

