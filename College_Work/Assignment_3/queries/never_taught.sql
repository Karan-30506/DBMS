USE university_db;

SELECT COUNT(*) AS never_taught
FROM instructor
WHERE ID NOT IN (
	SELECT DISTINCT ID FROM teaches
)