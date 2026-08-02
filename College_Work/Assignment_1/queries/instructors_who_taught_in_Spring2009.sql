USE university_db;

SELECT
    t.ID,
    i.name AS instructor_name,
    COUNT(t.course_id) AS courses_taught,
    t.semester,
    t.year
FROM teaches t
    INNER JOIN instructor i ON t.ID = i.ID
GROUP BY
    t.ID,
    i.name,
    t.semester,
    t.year
HAVING
    semester = "Spring"
    AND year = 2009
    AND courses_taught >= 3;