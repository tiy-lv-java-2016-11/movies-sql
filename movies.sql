/*Select all columns and rows from the movies table*/
SELECT *
FROM movies;
/*Select only the title and id of the first 10 rows*/
SELECT title, movieid
FROM movies
LIMIT 10;
/*Find the movie with the id of 485*/
SELECT  movieid, title, genres
FROM movies
WHERE movieid = '485';
/*Find the id (only that column) of the movie Made in America (1993)*/
SELECT movieid
FROM movies
WHERE lower(title) like 'made in america (1993)';
/*Find the first 10 sorted alphabetically*/
SELECT movieid, title
FROM movies
ORDER BY  movieid ASC , title DESC
LIMIT 10;
/*Find all movies from 2002*/
SELECT title
FROM movies
WHERE title LIKE '%2002%';
/*Find out what year the Godfather came out*/
SELECT title
FROM movies
WHERE title LIKE '%Godfather%'; /*1972*/
/*Without using joins find all the comedies*/
SELECT genres, title
FROM movies
WHERE genres LIKE '%Comedy%';
/*Find all comedies in the year 2000*/
SELECT genres, title
FROM movies
WHERE genres LIKE '%Comedy%' AND title LIKE '%(2000)%';
/*Find any movies that are about death and are a comedy*/
SELECT genres, title
FROM movies
WHERE genres LIKE '%Comedy%' AND title LIKE '%Death%';
/*Find any movies from either 2001 or 2002 with a title containing super*/
SELECT title
FROM movies
WHERE (title LIKE '%Super%' AND title LIKE '%(2001)%') OR (title LIKE '%Super%' AND title LIKE '%(2002)%');
/*With Joins
Find all the ratings for the movie Godfather, show just the title and the rating*/
SELECT title, ratings.rating
FROM movies
LEFT JOIN ratings ON movies.movieid = ratings.movieid
WHERE title LIKE '%Godfather, The%';
/*Order the previous objective by newest to oldest*/
SELECT title, ratings.rating
FROM movies
LEFT JOIN ratings ON movies.movieid = ratings.movieid
WHERE title LIKE '%Godfather, The%'
ORDER BY title ASC;
/*Find the comedies from 2005 and get the title and imdbid from the links table*/
SELECT title, imdbid
FROM movies
JOIN links ON links.movieid = movies.movieid
WHERE genres = 'Comedy' AND title LIKE '%(2005)%';
/*Find all movies that have no rating*/
SELECT title, rating
FROM movies
LEFT JOIN ratings ON movies.movieid = ratings.movieid
WHERE ratings.movieid IS NULL;





