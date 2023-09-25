SELECT
	a."name" AS "Animal Name",
	TO_CHAR(a.birthdate, 'YYYY') AS "Birth Year",
	at2.animal_type AS "Animal Type"
FROM
	animals a
JOIN
	animal_types at2
ON
	a.animal_type_id = at2."id"
WHERE
	a.owner_id IS NULL
	AND at2.animal_type <> 'Birds'
	AND a.birthdate > '2017-01-01'
ORDER BY
	"Animal Name";
