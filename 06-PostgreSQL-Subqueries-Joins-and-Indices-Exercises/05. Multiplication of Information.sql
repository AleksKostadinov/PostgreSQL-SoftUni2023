SELECT
	b.booking_id,
	CONCAT_WS(' ', c.first_name) AS "Customer Name"
FROM
	bookings b
CROSS JOIN customers c
ORDER BY
	"Customer Name";
