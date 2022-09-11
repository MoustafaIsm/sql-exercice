-- Question 1
SELECT *
FROM rooms r
WHERE r.capacity > 99;

-- Question 2
SELECT *
FROM courses c
HAVING c.start_time = MIN(c.start_time)

-- Question 4 
SELECT c.name
FROM departments d, majorsin m, enrolled e, courses c
WHERE d.id = m.department_id AND m.student_id = e.student_id AND c.crn = e.crn AND d.name = "BIF"
