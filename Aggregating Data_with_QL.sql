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
