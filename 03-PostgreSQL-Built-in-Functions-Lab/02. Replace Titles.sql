SELECT REPLACE(title, 'The', '***') AS "Title"
FROM books
WHERE SUBSTRING(title, 1, 3) = 'The'
ORDER BY id;

SELECT REPLACE(title, 'The', '***') AS "Title"
FROM books
WHERE title LIKE 'The%'
ORDER BY id;

UPDATE books
SET title = REPLACE(title, 'The', '***')
WHERE title LIKE 'The%';

SELECT * from books;
