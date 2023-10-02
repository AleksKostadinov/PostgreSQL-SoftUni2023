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

-- Var. 2
-- SELECT
-- 	COUNT(*) AS countries_without_mountains
-- FROM
-- 	countries c
-- LEFT JOIN
-- 	mountains_countries mc
-- USING
-- 	(country_code)
-- WHERE
-- 	mc.country_code IS NULL;
