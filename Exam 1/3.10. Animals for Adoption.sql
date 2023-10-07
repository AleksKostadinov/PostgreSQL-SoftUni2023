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


-- SELECT
-- 	"name" AS animal,
-- 	TO_CHAR(birthdate,
-- 	'YYYY') AS birth_year,
-- 	at2.animal_type
-- FROM
-- 	animals a
-- JOIN animal_types at2
-- ON
-- 	at2.id = a.animal_type_id
-- WHERE
-- 	owner_id IS NULL
-- 	AND
-- 	animal_type <> 'Birds'
-- 	AND
-- 	birthdate > '2022-01-01'::DATE - INTERVAL '5 years'
-- ORDER BY
-- 	name;

-- SELECT
-- 	"name" AS animal,
-- 	TO_CHAR(birthdate,
-- 	'YYYY') AS birth_year,
-- 	at2.animal_type
-- FROM
-- 	animals a
-- JOIN animal_types at2
-- ON
-- 	at2.id = a.animal_type_id
-- WHERE
-- 	owner_id IS NULL
-- 	AND
-- 	animal_type <> 'Birds'
-- 	AND
-- 	EXTRACT(YEAR FROM AGE('2022-01-01', birthdate)) < 5
-- ORDER BY
-- 	name;

