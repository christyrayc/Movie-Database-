drop table if exists movies;
CREATE TABLE movies (
  movie_id INT PRIMARY KEY,
  title TEXT NOT NULL,
  genres TEXT NOT NULL,
  year INT
);
drop table if exists ratings;
CREATE TABLE ratings (
    userId INT ,
   movieId INT,
   rating FLOAT,
  "timestamp" INT
);
drop table if exists links;
CREATE TABLE links (
   movieId INT,
   imdbId  INT,
   tmdbId  INT
);
drop table if exists tags;
CREATE TABLE tags (
   userId INT,
   movieId INT,
   tags VARCHAR(255),
   "timestamp" INT
);