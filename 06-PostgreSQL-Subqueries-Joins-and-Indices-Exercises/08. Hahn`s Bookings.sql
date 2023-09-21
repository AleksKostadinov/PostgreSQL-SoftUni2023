SELECT
	count(*)
FROM
	bookings b
JOIN customers c
ON
	b.customer_id = c.customer_id
WHERE
	c.last_name = 'Hahn';
