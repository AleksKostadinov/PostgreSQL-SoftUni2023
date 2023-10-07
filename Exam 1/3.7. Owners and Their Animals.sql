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


-- SELECT
-- 	o.name AS "owner",
-- 	count(owner_id) AS count_of_animals
-- FROM
-- 	animals a
-- JOIN
-- 	owners o
-- ON
-- 	o.id  = a.owner_id
-- GROUP BY
-- 	o.name
-- ORDER BY
-- 	count_of_animals desc , o."name"
-- LIMIT 5;
