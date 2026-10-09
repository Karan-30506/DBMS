USE university_db;

SELECT s.name, t.course_id, c.title, t.grade
FROM
    student s
    INNER JOIN takes t ON s.ID = t.ID
    INNER JOIN course c ON t.course_id = c.course_id
WHERE
    s.name = "Tanaka";