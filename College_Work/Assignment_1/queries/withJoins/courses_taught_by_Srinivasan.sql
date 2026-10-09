USE university_db;

SELECT
    i.ID AS instructor_id,
    i.name AS instructor_name,
    t.course_id,
    c.title AS course_name,
    c.credits
FROM
    teaches t
    INNER JOIN instructor i ON t.ID = i.ID
    INNER JOIN course c ON t.course_id = c.course_id
WHERE
    i.name = "Srinivasan";