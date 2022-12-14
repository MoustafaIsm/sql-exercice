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

-- Question 5
SELECT name
FROM students
WHERE NOT EXISTS (
    SELECT s.id
    FROM students s, enrolled e
    WHERE s.id = e.student_id)

-- Quetsion 6
SELECT COUNT(e.student_id)
FROM departments d, majorsin m, enrolled e
WHERE d.id = m.department_id AND m.student_id = e.student_id AND d.name = "CS" AND e.crn = "CSC275"

-- Question 7
SELECT COUNT(m.student_id)
FROM majorsin m, departments d
WHERE m.department_id = d.id AND d.name = "CS"

-- Question 8
SELECT m.student_id, COUNT(m.department_id)
FROM majorsin m
GROUP BY m.student_id

-- Question 9
SELECT d.name, COUNT(m.student_id) 
FROM departments d, majorsin m
WHERE d.id = m.department_id
HAVING COUNT(m.student_id) > 1