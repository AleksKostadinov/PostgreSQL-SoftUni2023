SELECT
	v."name" AS "Volunteers Name",
	v.phone_number AS "Phone Number",
	TRIM(v.address, ' Sofia ,') AS "Address"
FROM
	volunteers v
JOIN
	volunteers_departments vd
ON
	v.department_id = vd.id
WHERE
	vd.department_name = 'Education program assistant'
AND
	v.address LIKE '%Sofia%'
ORDER BY
	"Volunteers Name";
