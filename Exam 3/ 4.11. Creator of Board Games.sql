CREATE OR REPLACE FUNCTION
	fn_creator_with_board_games(v_first_name VARCHAR(30))
RETURNS INT
AS $$
BEGIN
	RETURN (
		SELECT
			COUNT(*)
		FROM
			creators c
		JOIN
			creators_board_games cbg
		ON
			cbg.creator_id = c."id"
		JOIN
			board_games bg
		ON
			bg."id" = cbg.board_game_id
		WHERE
			c.first_name = v_first_name
	);
END;
$$ LANGUAGE plpgsql;
