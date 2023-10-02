SELECT
	bg."name",
	bg.rating,
	c."name" AS category_name
FROM
	board_games bg
JOIN
	categories c
ON
	c."id" = bg.category_id
JOIN
	players_ranges pr
ON
	pr."id" = bg.players_range_id
WHERE
	bg.rating > 7
	OR
	(bg.name LIKE '%a%'
		AND
	bg.rating > 7.5)
	AND
	(pr.min_players >= 2
		AND pr.max_players <= 5)
ORDER BY
	"name",
	rating DESC
LIMIT 5;
