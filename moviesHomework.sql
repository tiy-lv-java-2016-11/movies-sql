/*Select all columns and rows from the movies table*/
SELECT *
FROM movies;

/*Select only the title and id of the first 10 rows*/
SELECT title, movieid
FROM movies
LIMIT 10;

/*find the movie with the id of 485*/
SELECT *
FROM movies
WHERE movies.movieid = 485;

/*Find the id (only that column) of the movie Made in America (1993)*/
SELECT *
FROM movies
WHERE lower(title) LIKE '%made in america (1993)%';

/*Find the first 10 sorted alphabetically*/

SELECT *
FROM movies
ORDER BY title ASC
LIMIT 10;

/*Find all movies from 2002*/
SELECT *
FROM movies
WHERE title like '%2002%';

/*Find out what year the Godfather came out*/
SELECT *
FROM movies
WHERE lower(title) LIKE '%godfather, the%';

/*Without using joins find all the comedies*/
SELECT *
FROM movies
WHERE lower(genres) LIKE '%comedy%';

/*Find all comedies in the year 2000*/
SELECT *
FROM movies
WHERE lower(title) LIKE '%2000%' AND lower(genres) LIKE '%comedy%';

/*Find any movies that are about death and are a comedy*/
SELECT *
FROM movies
WHERE lower(genres) LIKE '%comedy%' AND lower(title) LIKE '%death%';

/*Find any movies from either 2001 of 2002 with a title containing super*/
SELECT *
FROM movies
WHERE (lower(title) LIKE '%2001%' or lower(title) LIKE '%2002%') and lower("title") LIKE '%super%';

/*Find all the ratings for the movie Godfather, show just the tile and the rating*/
SELECT title, rating
FROM movies
  JOIN ratings on ratings.movieid = movies.movieid
WHERE lower(title) LIKE '%godfather, the%';

/*Order the previous objective by newest to oldest*/
SELECT title, rating, timestamp
FROM movies
  JOIN ratings on ratings.movieid = movies.movieid
WHERE lower(title) like '%godfather, the%'
ORDER BY timestamp DESC;

/*Find the comedies from 2005 and get the title and imdbid from the links table*/
SELECT title, imdbid
FROM movies
  JOIN links on links.movieid = movies.movieid
WHERE lower(title) LIKE '%2005%' and lower(genres) LIKE '%comedy%';

/*Find all movies that have no ratings*/
SELECT title, rating
FROM movies
  LEFT JOIN ratings on movies.movieid = ratings.movieid
WHERE ratings.rating is NULL;










