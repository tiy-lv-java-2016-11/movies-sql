-- Select all columns and rows from the movies table
SELECT * FROM movies;

-- Select only the title and id of the first 10 rows
SELECT title, movieid FROM movies LIMIT 10;

-- Find the movie with the id of 485
SELECT * FROM movies WHERE movieid = 485;

-- Find the id (only that column) of the movie Made in America (1993)
SELECT movieid FROM movies WHERE title = 'Made in America (1993)';

-- Find the first 10 sorted alphabetically
SELECT * FROM movies ORDER BY title ASC LIMIT 10;

-- Find all movies from 2002
SELECT * FROM movies WHERE title LIKE '%2002%';

-- Find out what year the Godfather came out
SELECT * FROM movies WHERE title LIKE '%Godfather, The%';

-- Without using joins find all the comedies
SELECT * FROM movies WHERE genres LIKE '%Comedy';

-- Find all comedies in the year 2000\
SELECT * FROM movies WHERE genres LIKE '%Comedy' AND title LIKE '%2000%';

-- Find any movies that are about death and are a comedy
SELECT * FROM movies WHERE lower(title) LIKE '%death%' and lower(genres) LIKE 'comedy';

-- Find any movies from either 2001 or 2002 with a title containing super
SELECT * FROM movies WHERE (title LIKE '%2001%' OR title LIKE '%2002%') AND lower(title) like '%super%';

-- Find all the ratings for the movie Godfather, show just the title and the rating
SELECT title, rating
FROM movies
  LEFT JOIN ratings ON movies.movieid = ratings.movieid
WHERE movies.title LIKE 'Godfather, The%';

-- Order the previous objective by newest to oldest
SELECT title, rating
FROM movies
  LEFT JOIN ratings ON movies.movieid = ratings.movieid
WHERE movies.title LIKE 'Godfather, The%'
ORDER BY ratings.timestamp DESC;

-- Find the comedies from 2005 and get the title and imdbid from the links table
SELECT title, imdbid FROM movies m
  LEFT JOIN links ON m.movieid = links.movieid
WHERE m.title LIKE '%(2005)' and m.genres LIKE '%Comedy%';

-- Find all movies that have no ratings
SELECT * FROM movies m
  LEFT JOIN ratings r ON m.movieid = r.movieid
WHERE r.rating is NULL;

-- Find all fantasy movies using the many to many join between movies and genres through movie_genre table.
SELECT * FROM movies m
  LEFT JOIN movie_genre mg ON m.movieid = mg.movieid
  LEFT JOIN genre g ON mg.genre_id = g.id
WHERE g.genres = 'Fantasy';

-- Use concat and research about internet movie database to produce a valid url from the imdbid
SELECT CONCAT('http://www.imdb.com/title/tt', imdbid)
FROM movies m
  LEFT JOIN links l ON m.movieid = l.movieid
WHERE m.title LIKE 'Godfather, The%';

-- Use concat and research about the movie database to produce a valid url from tmdbid
SELECT CONCAT('http://www.themoviedb.org/movie/', tmdbid)
FROM movies m
  LEFT JOIN links l ON m.movieid = l.movieid
WHERE m.title LIKE 'Godfather, The%';

-- Get the ratings for The Usual Suspects and convert the timestamp into a human readable date time
SELECT title, to_char(to_timestamp(timestamp), 'DD Mon YYYY HH12:MI:SS')
FROM movies m
  LEFT JOIN ratings r ON m.movieid = r.movieid
WHERE m.title like 'Usual Suspects%';

-- Using SQL normalize the tags in the tags table. Make them lowercase and replace the spaces with -
SELECT title, regexp_replace(tag, ' ', '-')
FROM movies m
  LEFT JOIN tags t ON m.movieid = t.movieid;

-- The movie_genre table was produced by a sql query that could match a movie to the appropriate rows in genre without the use of the join table. Reproduce that query.
CREATE TABLE movie_tag AS
  SELECT m.movieid, t.id as tagid
  FROM movies m
    LEFT JOIN tags t ON m.movieid = t.movieid;
