UPDATE
    countries
SET
    country_name = 'Burma'
WHERE
    country_name = 'Myanmar';

INSERT INTO
    monasteries(monastery_name, country_code)
VALUES
    ('Hanga Abbey', (
        SELECT
            country_code
        FROM
            countries
        WHERE
            country_name = 'Tanzania')
        ),
    ('Myin-Tin-Daik', (
        SELECT
            country_code
        FROM
            countries
        WHERE
            country_name = 'Myanmar')
        );
    -- ('Hanga Abbey', 'TZ'),
    -- ('Myin-Tin-Daik', 'MM');

SELECT
    co.continent_name,
    co2.country_name,
    COUNT(m.id) AS monasteries_count
FROM
    countries co2
LEFT JOIN
    continents co
USING
    (continent_code)
LEFT JOIN
    monasteries m
USING
    (country_code)
WHERE
    three_rivers = FALSE
GROUP BY
    country_name,
    continent_name
ORDER BY
    monasteries_count DESC,
    country_name;
