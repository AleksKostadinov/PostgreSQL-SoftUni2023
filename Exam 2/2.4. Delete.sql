DELETE
FROM
	clients
WHERE
	LENGTH(full_name) > 3
	AND clients.id NOT IN (
	SELECT
		client_id
	FROM
		courses
);
