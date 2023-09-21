SELECT
	b.booking_id,
	c.companion_full_name
FROM
	bookings b
JOIN customers c
		USING (customer_id)
WHERE
	b.apartment_id IS NULL;
