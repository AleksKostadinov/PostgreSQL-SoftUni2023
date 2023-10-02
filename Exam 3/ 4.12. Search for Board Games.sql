CREATE TABLE search_results (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(50),
    release_year INT,
    rating FLOAT,
    category_name VARCHAR(50),
    publisher_name VARCHAR(50),
    min_players VARCHAR(50),
    max_players VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE
	usp_search_by_category(IN category VARCHAR(50))
LANGUAGE plpgsql
AS $$
BEGIN
	TRUNCATE TABLE search_results;

INSERT INTO
		search_results(
			"name",
		 	release_year,
		    rating,
		   	category_name,
		   	publisher_name,
		    min_players,
		    max_players
	    )
	SELECT
		bg."name",
	    bg.release_year,
	    bg.rating,
	    c."name" AS category_name,
	    p."name" AS publisher_name,
	    CONCAT(pr.min_players, ' people'),
	    CONCAT(pr.max_players, ' people')
FROM
		board_games bg
JOIN
		publishers p
	ON
		p."id" = bg.publisher_id
JOIN
		players_ranges pr
	ON
		pr."id" = bg.players_range_id
JOIN
		categories c
	ON
		c."id" = bg.category_id
WHERE
		c."name" = category
ORDER BY
	publisher_name,
	release_year DESC;
END;
$$;
