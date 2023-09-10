SELECT continent_name,
TRIM(continent_name) AS "trim"
FROM continents;

SELECT continent_name,
TRIM(LEADING FROM continent_name) AS "trim"
FROM continents;
