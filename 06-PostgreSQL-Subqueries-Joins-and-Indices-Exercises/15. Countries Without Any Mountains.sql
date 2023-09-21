SELECT
	COUNT(*) AS countries_without_mountains
FROM
	countries c
WHERE
	country_code NOT IN (
	SELECT
		mc.country_code
	FROM
		mountains_countries mc
	);
    
