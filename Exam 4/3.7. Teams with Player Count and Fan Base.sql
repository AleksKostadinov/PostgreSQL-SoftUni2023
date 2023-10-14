SELECT
	t.id AS team_id,
	t.name AS team_name,
	count(p.team_id) AS player_count,
	t.fan_base
FROM
    teams t
LEFT JOIN
    players p
ON
    p.team_id = t.id
WHERE
    t.fan_base > 30000
GROUP BY
    team_name,
    t.id
ORDER BY
    player_count desc,
    t.fan_base DESC;
