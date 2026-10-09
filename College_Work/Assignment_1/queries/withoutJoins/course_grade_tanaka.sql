USE university_db;

SELECT course_id, grade
FROM takes
WHERE ID IN (
    SELECT ID 
    FROM student 
    WHERE name = 'Tanaka'
);