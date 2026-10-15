USE university_db;

SELECT s.ID, s.name, COUNT(DISTINCT i.dept_name) AS distinct_departments
FROM student s
JOIN advisor a ON s.ID = a.s_ID
JOIN instructor i ON a.i_ID = i.ID
GROUP BY s.ID, s.name
HAVING COUNT(DISTINCT i.dept_name) > 1;