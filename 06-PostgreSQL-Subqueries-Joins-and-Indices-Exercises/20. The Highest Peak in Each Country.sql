WITH ROW_NUMBER AS (
SELECT
	c.country_name,
	p.peak_name,
	p.elevation,
	m.mountain_range,
	ROW_NUMBER() OVER (PARTITION BY c.country_name
ORDER BY
	p.elevation DESC) AS peak_rank
FROM
	countries c
LEFT JOIN mountains_countries mc
		USING (country_code)
LEFT JOIN mountains m ON
	m.id = mc.mountain_id
LEFT JOIN peaks p ON
	p.mountain_id = m.id
)

SELECT
	country_name,
	COALESCE(peak_name,
	'(no highest peak)') AS highest_peak_name,
	COALESCE(elevation,
	0) AS highest_peak_elevation,
	CASE
		WHEN
        	peak_name IS NULL
		OR
        	mountain_range IS NULL THEN '(no mountain)'
		ELSE mountain_range
	END AS mountain
FROM
	ROW_NUMBER
WHERE
	peak_rank = 1
ORDER BY
	country_name,
	highest_peak_elevation DESC;
