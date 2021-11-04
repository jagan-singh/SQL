--- Project 1
USE imdb;

--- 1. write a SQL query to list the titles of all movies released in 2008.
SELECT title FROM movies
WHERE year = 2008;

--- 2. write a SQL query to determine the birth year of Emma Stone.
SELECT birth FROM people
WHERE name = 'Emma Stone';

--- 3. write a SQL query to list the titles of all movies with a release date on or after 2018, in alphabetical order.
SELECT title FROM movies
WHERE year >= 2018
ORDER BY title;

--- 4. write a SQL query to list the titles and release years of all Harry Potter movies, in chronological order.
SELECT title, year FROM movies
WHERE title LIKE 'Harry Potter%'
ORDER BY year;

--- 5. write a SQL query to determine the number of movies with an IMDb rating of 10.0.
SELECT COUNT(*) AS 'Movies with a 10.0 rating' FROM ratings
WHERE rating = 10.0;

--- 6. write a SQL query to determine the average rating of all movies released in 2012.
SELECT AVG(rating) AS 'Average rating in 2012' FROM ratings AS r, movies AS m
WHERE m.id = r.movie_id AND year = 2012;

--- 7. write a SQL query to list all movies released in 2010 and their ratings, in descending order by rating. For movies with the same rating, order them alphabetically by title.
SELECT title, rating FROM ratings AS r, movies AS m
WHERE m.id = r.movie_id AND year = 2010
ORDER BY rating DESC, title;

--- 8. write a SQL query to list the names of all people who starred in Toy Story.
SELECT name FROM movies m
JOIN stars s on s.movie_id = m.id
JOIN people p on p.id = s.person_id
WHERE title = 'Toy Story';

--- 9. write a SQL query to list the names of all people who starred in a movie released in 2004, ordered by birth year.
SELECT name FROM movies m
JOIN stars s on s.movie_id = m.id
JOIN people p on p.id = s.person_id
WHERE year = 2004
ORDER BY birth;

--- 10. write a SQL query to list the names of all people who have directed a movie that received a rating of at least 9.0.
SELECT name FROM movies m
JOIN directors d on d.movie_id = m.id
JOIN people p on p.id = d.person_id
JOIN ratings r on m.id = r.movie_id
WHERE rating > 8.9;

--- 11. write a SQL query to list the titles of the five highest rated movies (in order) that Chadwick Boseman starred in, starting with the highest rated.
SELECT title FROM movies m
JOIN stars s on s.movie_id = m.id
JOIN people p on p.id = s.person_id
JOIN ratings r on m.id = r.movie_id
WHERE name = 'Chadwick Boseman'
ORDER BY rating DESC
LIMIT 5;

--- 12. write a SQL query to list the titles of all movies in which both Johnny Depp and Helena Bonham Carter starred.
SELECT title FROM movies m
JOIN stars s on s.movie_id = m.id
JOIN people p on p.id = s.person_id
WHERE name = 'Johnny Depp' 
OR name = 'Helena Bonham Carter'
GROUP BY title
HAVING COUNT(title) > 1;

--- 13. write a SQL query to list the names of all people who starred in a movie in which Kevin Bacon also starred.
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