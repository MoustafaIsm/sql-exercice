SELECT m.name, m.earnings_rank
FROM movies m, oscars o
WHERE m.id = o.movie_id AND o.type = "Best-Picture"
ORDER BY m.earnings_rank ASC LIMIT 1;