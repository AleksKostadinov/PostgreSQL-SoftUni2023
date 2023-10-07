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


-- SELECT
-- 	"name" AS volunteers,
-- 	phone_number ,
-- 	trim(address, 'Sofia ,') AS address
-- FROM
-- 	volunteers v
-- WHERE
-- 	address LIKE '%Sofia%'
-- 	AND department_id = (
-- 	SELECT
-- 		"id"
-- 	FROM
-- 		volunteers_departments vd
-- 	WHERE
-- 		department_name = 'Education program assistant'
-- 	)
-- ORDER BY
-- 	"name";
