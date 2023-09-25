SELECT
	o."name" AS "Owner",
	count(*) AS "Count of animals"
FROM
	owners o
JOIN animals a
ON
	a.owner_id = o."id"
GROUP BY
	o.id
ORDER BY
	"Count of animals" DESC,
	"Owner"
LIMIT 5;
