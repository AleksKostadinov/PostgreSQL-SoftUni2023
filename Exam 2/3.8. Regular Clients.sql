SELECT
	c.full_name,
	COUNT(c2.car_id) AS count_of_cars,
	SUM(c2.bill) AS total_sum
FROM
	clients c
JOIN courses c2
ON
	c.id = c2.client_id
WHERE
	c.full_name LIKE '_a%'
GROUP BY
	c.full_name
HAVING
	COUNT(c2.car_id) > 1
ORDER BY
	c.full_name;



-- Second Variant
SELECT
	c.full_name,
	COUNT(c."id") AS count_of_cars,
	SUM(co.bill) AS total_sum
FROM
	clients c
JOIN
	courses co
ON
	co.client_id = c."id"
WHERE
	SUBSTRING(c.full_name, 2, 1) = 'a'
GROUP BY
	c."id"
HAVING
	COUNT(c."id") > 1
ORDER BY
	c.full_name;





