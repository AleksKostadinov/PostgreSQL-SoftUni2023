-- Stored Procedure which output the result
CREATE OR REPLACE PROCEDURE
	sp_animals_with_owners_or_not_1(
        IN animal_name VARCHAR(30),
        OUT owner_name VARCHAR(50))
AS $$
BEGIN
	SELECT
		COALESCE (o."name", 'For adoption')
	INTO
		owner_name
	FROM
		animals a
	LEFT JOIN
		owners o
	ON
		a.owner_id = o.id
	WHERE
		a."name" = animal_name;
END;
$$ LANGUAGE plpgsql;

-- Stored Procedure which return NOTICE
CREATE OR REPLACE PROCEDURE
	sp_animals_with_owners_or_not_2(animal_name VARCHAR(30))
LANGUAGE plpgsql
AS $$
DECLARE
    owner_name VARCHAR(50);
BEGIN
	SELECT
		COALESCE (o."name", 'For adoption')
	INTO
		owner_name
	FROM
		animals a
	LEFT JOIN
		owners o
	ON
		a.owner_id = o.id
	WHERE
		a."name" = animal_name;
	RAISE NOTICE
		'%', owner_name;
END;
$$;

