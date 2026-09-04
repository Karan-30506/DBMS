USE university_db;

SELECT *
FROM course
WHERE course_id NOT IN (
	SELECT DISTINCT
	course_id
	FROM prereq
);