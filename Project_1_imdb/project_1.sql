--- Project 1
--- Jagandeep Singh
USE imdb;

--- 1.
SELECT title FROM movies
WHERE year = 2008;

--- 2.
SELECT birth FROM people
WHERE name = 'Emma Stone';

--- 3.
SELECT title FROM movies
WHERE year >= 2018
ORDER BY title;

--- 4.
SELECT title, year FROM movies
WHERE title LIKE 'Harry Potter%'
ORDER BY year;

--- 5. 
SELECT COUNT(*) AS 'Movies with a 10.0 rating' FROM ratings
WHERE rating = 10.0;

--- 6.
SELECT AVG(rating) AS 'Average rating in 2012' FROM ratings AS r, movies AS m
WHERE m.id = r.movie_id AND year = 2012;

--- 7. 
SELECT title, rating FROM ratings AS r, movies AS m
WHERE m.id = r.movie_id AND year = 2010
ORDER BY rating DESC, title;

--- 8. 
SELECT name FROM movies m
JOIN stars s on s.movie_id = m.id
JOIN people p on p.id = s.person_id
WHERE title = 'Toy Story';

--- 9. 
SELECT name FROM movies m
JOIN stars s on s.movie_id = m.id
JOIN people p on p.id = s.person_id
WHERE year = 2004
ORDER BY birth;

--- 10. 
SELECT name FROM movies m
JOIN directors d on d.movie_id = m.id
JOIN people p on p.id = d.person_id
JOIN ratings r on m.id = r.movie_id
WHERE rating > 8.9;

--- 11. 
SELECT title FROM movies m
JOIN stars s on s.movie_id = m.id
JOIN people p on p.id = s.person_id
JOIN ratings r on m.id = r.movie_id
WHERE name = 'Chadwick Boseman'
ORDER BY rating DESC
LIMIT 5;

--- 12. 
SELECT title FROM movies m
JOIN stars s on s.movie_id = m.id
JOIN people p on p.id = s.person_id
WHERE name = 'Johnny Depp' 
OR name = 'Helena Bonham Carter'
GROUP BY title
HAVING COUNT(title) > 1;

--- 13. 
SELECT name FROM movies m
INNER JOIN (
SELECT movie_id FROM movies m
JOIN stars s on s.movie_id = m.id
JOIN people p on p.id = s.person_id
WHERE name = 'Kevin Bacon' AND birth = 1958
) as temp on temp.movie_id = m.id
JOIN stars s on s.movie_id = m.id
JOIN people p on p.id = s.person_id
WHERE name != 'Kevin Bacon';