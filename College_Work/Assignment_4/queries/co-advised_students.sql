USE university_db;

SELECT s.ID, s.name
FROM student s
JOIN advisor a ON s.ID = a.s_ID
JOIN instructor i ON a.i_ID = i.ID
WHERE i.name IN ('Srinivasan', 'Ashok')
GROUP BY s.ID, s.name
HAVING COUNT(DISTINCT i.name) = 2;