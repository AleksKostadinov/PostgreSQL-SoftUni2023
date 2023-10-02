SELECT
	"id",
	CONCAT_WS(' ', first_name, last_name) AS creator_name,
	email
FROM
	creators c
LEFT JOIN
	creators_board_games cbg
ON
	cbg.creator_id = c."id"
WHERE
	cbg.board_game_id IS NULL
ORDER BY
	creator_name;
