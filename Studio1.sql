SELECT title, year_released FROM movies
ORDER BY year_released DESC;

SELECT * FROM directors
ORDER BY country ASC;

SELECT * FROM directors
ORDER BY country ASC, last_name ASC;

INSERT INTO directors (first_name, last_name, country)
VALUES ("Rob", "Reiner", "USA");

SELECT last_name, director_id FROM directors
WHERE last_name="Reiner";

INSERT INTO movies (title, year_released, director_id)
VALUES ("The Princess Bride", 1987, 11);

SELECT * FROM movies;

SELECT title, year_released, last_name
FROM movies
INNER JOIN directors ON movies.director_id = directors.director_id;

SELECT title, first_name, last_name
FROM movies
INNER JOIN directors ON movies.director_id = directors.director_id
ORDER BY last_name ASC;

SELECT first_name, last_name FROM directors
WHERE director_id = 2;

SELECT last_name, country
FROM directors
INNER JOIN movies ON directors.director_id = movies.director_id
WHERE movies.title = "Roma";

DELETE FROM movies
WHERE movie_id = 1;

SELECT * FROM movies;

SELECT * FROM directors;

DELETE FROM directors
WHERE first_name = "Brad";

SELECT * FROM directors;

