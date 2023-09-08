SELECT
    id,
    CONCAT_WS(' ', number, street) AS "Address",
    city_id
FROM addresses
WHERE id >= 20;
