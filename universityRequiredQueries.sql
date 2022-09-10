-- Question 1
SELECT *
FROM rooms r
WHERE r.capacity > 99;

-- Question 2
SELECT *
FROM courses c
HAVING c.start_time = MIN(c.start_time)

