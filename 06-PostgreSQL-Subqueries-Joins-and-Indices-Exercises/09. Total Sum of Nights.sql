SELECT
	a.name,
	SUM(b.booked_for)
FROM
	apartments a
JOIN bookings b
ON
	b.apartment_id = a.apartment_id
GROUP BY
	a.name
ORDER BY
	a.name;
