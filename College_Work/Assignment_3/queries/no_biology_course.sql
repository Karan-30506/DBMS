USE university_db;

SELECT student.name
FROM student
WHERE ID NOT IN (
    SELECT DISTINCT ID
    FROM takes t
    JOIN course c ON t.course_id = c.course_id
    WHERE c.dept_name = 'Biology'
)