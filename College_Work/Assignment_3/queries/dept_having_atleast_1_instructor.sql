USE university_db;

SELECT
    dept_name,
    COUNT(ID) AS number_of_instructors
FROM instructor
GROUP BY
    dept_name
HAVING
    number_of_instructors >= 1
ORDER BY number_of_instructors DESC;