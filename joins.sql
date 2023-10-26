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






