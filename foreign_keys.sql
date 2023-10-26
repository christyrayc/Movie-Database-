drop table if exists movies;
CREATE TABLE movies (
  movieid INT PRIMARY KEY,
  title TEXT NOT NULL,
  genres TEXT NOT NULL,
  year INT
);
\copy movies from '../../data/movies.csv' DELIMITER ',' CSV HEADER;
drop table if exists ratings;
CREATE TABLE ratings (
    movieid INT REFERENCES movies(movieid),
    userId INT ,
   rating FLOAT,
   "timestamp" INT
);
\copy ratings from '../../data/ratings.csv' DELIMITER ',' CSV HEADER;
drop table if exists links;
CREATE TABLE links (
   movieid INT REFERENCES movies(movieid),
   imdbId  INT,
   tmdbId  INT
);
\copy links from '../../data/links.csv' DELIMITER ',' CSV HEADER;
drop table if exists tags;
CREATE TABLE tags (
    movieid INT REFERENCES movies(movieid),
    userId INT,
   tags VARCHAR(255),
   "timestamp" INT
);
\copy tags from '../../data/tags.csv' DELIMITER ',' CSV HEADER;