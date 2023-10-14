SELECT
	concat_ws(' ', c.first_name, c.last_name) AS  coach_full_name,
	concat_ws(' ', p.first_name, p.last_name) AS  player_full_name,
	t.name AS team_name,
	sd."passing",
	sd.shooting ,
	sd.speed
FROM
    coaches c
JOIN
    players_coaches pc
ON
    pc.coach_id = c.id
JOIN
    players p
ON
    p.id = pc.player_id
JOIN
    teams t
ON
    t.id = p.team_id
JOIN
    skills_data sd
ON
    sd.id = p.skills_data_id
ORDER BY
    coach_full_name,
    player_full_name DESC;
