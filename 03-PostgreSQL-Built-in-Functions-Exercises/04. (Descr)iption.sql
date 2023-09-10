SELECT SUBSTRING(description, 5) FROM currencies;


UPDATE currencies
SET description = SUBSTRING(description, 5, LENGTH(description));
SELECT description AS "substring" FROM currencies;
