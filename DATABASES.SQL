--weekly pqoject


--Data Wrangling, Exploration and Cleaning
--Solve the one-liner challenges to answer various questions

---Display the total row count of the ratings table.
SELECT COUNT(*) AS total_rows
FROM ratings;

-------------------------------------------------

---Display the total count of different genres combinations in the movies table.

SELECT COUNT(DISTINCT genres) AS total_genre_combinations
FROM movies;

---------------------------------------------


---Display unique tags for movie with id equal 60756. Use tags table.
select distinct * from tags 
where movieid = 60756;


----------------------------------------------------------------------

---Display the count of movies in the years 1990-2000 using the movies table. Display year and movie_count.
select year ,count(*) as movie_count from movies 
where year between 1990 and 2000
group by year
order by movie_count desc;



--------------------------------------------

---Display the year where most of the movies u=in the database are from.
select * from movies;

SELECT year, COUNT(*) AS movie_count
FROM movies
GROUP BY year
ORDER BY movie_count DESC
LIMIT 1;



--------------------------------------------------------

---Display 10 movies with the most ratings. Use ratings table. Display movieid, count_movie_ratings.


SELECT movieId, COUNT(*) AS count_movie_ratings
FROM ratings
GROUP BY movieId
ORDER BY count_movie_ratings DESC
LIMIT 10;
-------------------------------------------------
----Display the top 10 highest rated movies by average that have at least 50 ratings. Display the movieid, average rating and rating count. Use the ratings table.


SELECT movieId, AVG(rating) AS average_rating, COUNT(*) AS rating_count
FROM ratings
GROUP BY movieId
HAVING COUNT(*) >= 50
ORDER BY average_rating DESC
LIMIT 10;


----------------------------------------------------------------------

--Create a view that is a table of only movies that contain drama as one of it’s genres. Display the first 10 movies in the view.

CREATE VIEW drama_movies_view AS
SELECT *
FROM movies
WHERE genres LIKE '%Drama%';

SELECT *
FROM drama_movies_view
LIMIT 10;

----------------------------------------------------------------

-----Create table definitions with SQL
drop table if exists movies;
CREATE TABLE movies (
  movie_id INT PRIMARY KEY,
  title TEXT NOT NULL,
  genres TEXT NOT NULL,
  year INT
);
\copy movies from '../../data/movies.csv' DELIMITER ',' CSV HEADER;
drop table if exists ratings;
CREATE TABLE ratings (
    userId INT ,
   movieId INT,
   rating FLOAT,
  "timestamp" INT
);
\copy ratings from '../../data/ratings.csv' DELIMITER ',' CSV HEADER;
drop table if exists links;
CREATE TABLE links (
   movieId INT,
   imdbId  INT,
   tmdbId  INT
);
\copy links from '../../data/links.csv' DELIMITER ',' CSV HEADER;
drop table if exists tags;
CREATE TABLE tags (
   userId INT,
   movieId INT,
   tags VARCHAR(255),
   "timestamp" INT
);
\copy tags from '../../data/tags.csv' DELIMITER ',' CSV HEADER;


---------------------------------------------------------------------

---Analyze Data
---Perform exploratory data analysis
---Continue exploratory data analysis with grouped data
---Continue exploratory data analysis with joined tables

---Using a JOIN display 5 movie titles with the lowest imdb ids
SELECT m.title
FROM movies m
JOIN (
  SELECT movieId, MIN(movieId) AS min_movieId
  FROM movies
  GROUP BY movieId
  ORDER BY min_movieId
  LIMIT 5
) AS sub ON m.movieId = sub.movieId;
-----------------------------------------------------------------

--Display the count of drama movies
SELECT COUNT(*) AS drama_count
FROM genres
WHERE genre = 'Drama';
--------------------------------------------------------------------

--Using a JOIN display all of the movie titles that have the tag fun
select movies.title, tags.tag 
from movies 
join tags 
on movies.movie_id = tags.movie_id
where tags.tag = 'fun';

----------------------------------------------------------------------

--Using a JOIN find out which movie title is the first without a tag
select movies.title, tags.tag 
from movies 
left join tags
on movies.movie_id = tags.movie_id
where tag is null
limit 1;
---------------------------------------------------------------------

--Using a JOIN display the top 3 genres and their average rating
select genres.genre,avg(ratings.rating)
from genres 
join ratings 
on genres.movie_id = ratings.movie_id
group by genre
order by avg desc
limit 3;
-------------------------------------------------------------------

--Using a JOIN display the top 10 movie titles by the number of ratings

select movies.title,sum(ratings.rating) as number_of_ratings
from movies
join ratings 
on movies.movie_id = ratings.movie_id
group by title
order by number_of_ratings desc
limit 10;
---------------------------------------------------------------------

--Using a JOIN display all of the Star Wars movies in order of average rating where the film was rated by at least 40 users
select movies.title ,avg(ratings.rating) as average_ratings,count(ratings.rating) as count_users
from movies 
join ratings 
using (movie_id)
group by title
having count(ratings.rating)> 40 and title ilike '%star wars%'
order by average_ratings desc;
------------------------------------------------------------------------

--Create a derived table from one or more of the above queries-
create table rating_users as (
select movies.title ,avg(ratings.rating) as average_ratings,count(ratings.rating) as count_users
from movies 
join ratings 
using (movie_id)
group by title
having count(ratings.rating)> 40 and title ilike '%star wars%'
order by average_ratings desc

);
------------------------------------------------------------------

























