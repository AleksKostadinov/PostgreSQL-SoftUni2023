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

-- Var.3
CREATE OR REPLACE
PROCEDURE
	sp_animals_with_owners_or_not(
		IN animal_name VARCHAR(30),
		OUT name_of_owner VARCHAR(30)
	)
AS $$
BEGIN
		SELECT
			o.name
		INTO
			name_of_owner
		FROM
					animals a
		LEFT JOIN owners o
				ON
					o.id = a.owner_id
		WHERE
					a.name = animal_name;

		IF name_of_owner IS NULL THEN
				name_of_owner := 'For adoption';
		END IF;
END;

$$ LANGUAGE plpgsql;


-- Var. 4

CREATE OR REPLACE
PROCEDURE
	sp_animals_with_owners_or_not(
		IN animal_name VARCHAR(30),
		OUT name_of_owner VARCHAR(30)
	)
AS $$
BEGIN
		SELECT
			CASE
				WHEN o.name IS NULL THEN 'For adoption'
				ELSE o.name
			END
		INTO
			name_of_owner
		FROM
			animals a
		LEFT JOIN owners o
		ON
			o.id = a.owner_id
		WHERE
			a.name = animal_name;
END;
$$ LANGUAGE plpgsql;
