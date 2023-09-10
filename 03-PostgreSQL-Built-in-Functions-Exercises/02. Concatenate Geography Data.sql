CREATE VIEW view_continents_countries_currencies_details AS
SELECT
    CONCAT(TRIM(c1.continent_name), ': ', c1.continent_code) AS "Continent Details",
    CONCAT(c2.country_name, ' - ', c2.capital, ' - ', c2.area_in_sq_km, ' - ', 'km2') AS "Country Information",
    CONCAT(c3.description, ' ', '(', c3.currency_code, ')') AS "Currencies"
FROM continents c1
JOIN countries c2 ON c1.continent_code = c2.continent_code
JOIN currencies c3 ON c2.currency_code = c3.currency_code
ORDER BY "Country Information", "Currencies";

