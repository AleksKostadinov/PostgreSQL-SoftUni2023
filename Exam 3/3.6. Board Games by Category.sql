SELECT
	bg."id",
	bg."name",
	bg.release_year,
	c."name" AS category_name
FROM
	board_games bg
JOIN
	categories c
ON
	c."id" = bg.category_id
WHERE
	c."name" = 'Strategy Games'
	OR
	c."name" = 'Wargames'
ORDER BY
	bg.release_year DESC;
