SELECT
	a."name",
	an.animal_type,
	TO_CHAR(a.birthdate, 'DD.MM.YYYY')
FROM
	animals a
JOIN animal_types an
ON
	an."id" = a.animal_type_id
ORDER BY
	"name";
