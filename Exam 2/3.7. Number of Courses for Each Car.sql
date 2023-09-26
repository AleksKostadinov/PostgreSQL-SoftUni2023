SELECT
	c."id" AS car_id,
	c.make,
	c.mileage,
	COUNT(co.car_id) AS count_of_courses,
	ROUND(AVG(co.bill),
	2) AS average_bill
FROM
	cars c
LEFT JOIN courses co
ON
	co.car_id = c.id
GROUP BY
	c."id"
HAVING
	COUNT(co.car_id) <> 2
ORDER BY
	count_of_courses DESC,
	c."id";
