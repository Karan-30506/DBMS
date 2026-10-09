USE university_db;

SELECT name
FROM instructor
WHERE ID IN (
    SELECT ID
    FROM teaches
    WHERE semester = 'Spring' AND year = 2009
);