USE university_db;

SELECT course_id, title
FROM course
WHERE course_id IN (
    SELECT course_id
    FROM teaches
    WHERE ID IN (
        SELECT ID
        FROM instructor
        WHERE name = 'Srinivasan'
    )
);