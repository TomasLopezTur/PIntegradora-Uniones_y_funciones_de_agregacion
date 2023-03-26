USE movies_db;
-- 1-1
SELECT series.titulo, genres.name
from series
INNER JOIN genres ON series.genre_id = genres.id;

-- 1-2
select * from episodes;

SELECT  CONCAT(actors.first_name, ' ',actors.last_name) AS Actores,
episodes.title AS 'Episodios'
FROM actor_episode
INNER JOIN actors ON actor_episode.actor_id = actors.id
INNER JOIN episodes ON actor_episode.episode_id = episodes.id;

-- 2
select * from movies;
SELECT DISTINCT CONCAT(actors.first_name, ' ',actors.last_name) AS Actores
FROM actor_movie
INNER JOIN actors ON actor_movie.actor_id = actors.id
INNER JOIN movies ON actor_movie.movie_id = movies.id
WHERE movies.title LIKE 'La Guerra de las galaxias%';

/*OR*/

SELECT DISTINCT actors.first_name AS Nombre, actors.last_name AS Apellido
FROM actors
INNER JOIN actor_movie ON actors.id=actor_movie.actor_id
INNER JOIN movies ON actor_movie.movie_id=movies.id
WHERE movies.title LIKE 'La Guerra de las galaxias%';

-- 3
select * from movies;
SELECT movies.title AS Pelicula, COALESCE(genres.name, 'No tengo género') AS Genero
from movies
LEFT JOIN genres ON movies.genre_id = genres.id;

-- 4
select * from series;
SELECT series.titulo AS Titulos, DATEDIFF(series.end_date, series.release_date) AS Duración 
FROM series;

-- 5
select * from actors;
-- 5-1
SELECT actors.first_name AS Nombre, actors.last_name AS Apellidos FROM actors 
WHERE length(actors.first_name)> 6 ORDER BY actors.first_name; 

-- 5-2
SELECT COUNT(*) FROM episodes;

-- 5-3
select * from seasons;
SELECT series.titulo, count(*) AS 'Cantidad de temporadas' from series
INNER JOIN seasons ON seasons.serie_id = series.id
GROUP BY series.titulo;

-- 5-4
select * from genres;
SELECT genres.name AS Generos, count(movies.title) AS 'Cantidad de peliculas' FROM genres
INNER JOIN movies ON movies.genre_id = genres.id GROUP BY genres.name 
HAVING count(movies.title) >= 3;
