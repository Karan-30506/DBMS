USE university_db;

SELECT s.ID, s.name, COUNT(a.i_ID) AS total_advisors
FROM student s
JOIN advisor a ON s.ID = a.s_ID
GROUP BY s.ID, s.name
HAVING COUNT(a.i_ID) > 3;