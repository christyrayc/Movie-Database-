--1
--What is the data structure? What information do we have available for movies?
--Display the (whole) movies table.
select * 
from movies

--2
--In the movies table there is a field called movieId. Sometimes we will not need this field for the analysis.
--Display only title and genres of the first 10 entries from the movies table that is sorted alphabetically (starting from A) by the movie titles.

select title, genres from movies 
order by title 
limit 10;

--3
--How many movies do we have the data for?

--Display the total row count


SELECT COUNT(*) AS total_rows
FROM movies;



--4
---Display first 10 pure Drama movies. Only Drama is in the genre column.
---Display the count of pure Drama movies.


SELECT *
FROM movies
WHERE genres = 'Drama'
LIMIT 10;

SELECT COUNT(*) AS drama_count
FROM movies
WHERE genres = 'Drama';

--5
--Display the count of drama movies that can also contain other genres.


SELECT COUNT(*) AS drama_count
FROM movies
WHERE genres LIKE '%Drama%';



---6
---Display the count of movies don’t have drama (in any combination) as assigned genre


SELECT COUNT(*) AS drama_free_count
FROM movies
WHERE genres NOT LIKE '%Drama%';



--7
--Display the count of movies that were released in 2003.

SELECT COUNT(*) AS movies_2003_count
FROM movies
WHERE year = 2003;


--8
--Find all movies with a year lower 1910.
  select * from movies 
where year < 1910;

--9
--Retrieve all Star Wars movies from the movie table.

SELECT *
FROM movies
WHERE title LIKE '%Star Wars%';

