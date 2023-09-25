SELECT
	CONCAT_WS(' - ', o."name", a."name") AS "Owners - Animals",
	o.phone_number AS "Phone Number",
	ac.cage_id AS "Cage ID"
FROM
	owners o
JOIN animals a
ON
	a.owner_id = o."id"
JOIN animals_cages ac
ON
	ac.animal_id = a."id"
JOIN
	animal_types at2
ON a.animal_type_id = at2."id"
WHERE
	at2.animal_type = 'Mammals'
ORDER BY
	o."name",
	a."name" DESC;
