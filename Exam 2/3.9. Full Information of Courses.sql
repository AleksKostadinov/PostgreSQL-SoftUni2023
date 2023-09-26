SELECT
	a."name" AS address,
	CASE
		WHEN EXTRACT(HOUR FROM c."start") BETWEEN 6 AND 20 THEN 'Day'
		ELSE
			'Night'
	END AS day_time,
	c.bill,
	c2.full_name,
	c3.make,
	c3.model,
	c4."name" AS category_name
FROM
	courses c
JOIN
	addresses a
ON
	c.from_address_id = a.id
JOIN
	clients c2
ON
	c2.id = c.client_id
JOIN
	cars c3
ON
	c3.id = c.car_id
JOIN
	categories c4
ON
	c4.id = c3.category_id
ORDER BY
	c."id";
