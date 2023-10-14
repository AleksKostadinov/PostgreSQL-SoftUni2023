SELECT
	p.id,
	concat_ws(' ', first_name, last_name) AS full_name,
	"age",
	"position",
	salary,
	s.pace,
	s.shooting
FROM
    players p
LEFT JOIN
    skills_data s
ON
    s.id = p.skills_data_id
WHERE
    p.team_id IS NULL
AND
    p.position = 'A'
AND
    s.pace + s.shooting > 130;
