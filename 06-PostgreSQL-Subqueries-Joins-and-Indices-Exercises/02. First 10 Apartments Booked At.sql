SELECT
	"name" AS "Name",
	country AS "Country",
	b.booked_at::date AS "Booked at"
FROM
	apartments a
LEFT JOIN bookings b
ON
	a.booking_id = b.booking_id
LIMIT 10;
