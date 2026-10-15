USE university_db;
SET SQL_SAFE_UPDATES = 0;

-- Sample Data for testing
INSERT INTO section VALUES ('CS-190', '1', 'Spring', 2025, 'Taylor', '3128', 'E');
INSERT INTO section VALUES ('PHY-101', '1', 'Fall', 2025, 'Watson', '100', 'A');
INSERT INTO teaches VALUES ('83821', 'CS-190', '1', 'Spring', 2025);
INSERT INTO teaches VALUES ('22222', 'PHY-101', '1', 'Fall', 2025);
INSERT INTO takes VALUES ('54321', 'CS-190', '1', 'Spring', 2025, 'A');
INSERT INTO takes VALUES ('44553', 'PHY-101', '1', 'Fall', 2025, 'A-');
INSERT INTO teaching_assistant VALUES ('12345', 'CS-190', '1', 'Spring', 2025);

-- Verifying before deletion
SELECT 'section' AS table_name, COUNT(*) AS total_rows, MIN(year) AS oldest_year, MAX(year) AS newest_year FROM section
UNION ALL
SELECT 'teaches', COUNT(*), MIN(year), MAX(year) FROM teaches
UNION ALL
SELECT 'takes', COUNT(*), MIN(year), MAX(year) FROM takes
UNION ALL
SELECT 'teaching_assistant', COUNT(*), MIN(year), MAX(year) FROM teaching_assistant;

-- Delete records older than 10 years
DELETE FROM teaching_assistant WHERE year < (YEAR(CURDATE()) - 10);
DELETE FROM takes WHERE year < (YEAR(CURDATE()) - 10);
DELETE FROM teaches WHERE year < (YEAR(CURDATE()) - 10);
DELETE FROM section WHERE year < (YEAR(CURDATE()) - 10);

-- After Delete
SELECT 'section' AS table_name, COUNT(*) AS total_rows, MIN(year) AS oldest_year, MAX(year) AS newest_year FROM section
UNION ALL
SELECT 'teaches', COUNT(*), MIN(year), MAX(year) FROM teaches
UNION ALL
SELECT 'takes', COUNT(*), MIN(year), MAX(year) FROM takes
UNION ALL
SELECT 'teaching_assistant', COUNT(*), MIN(year), MAX(year) FROM teaching_assistant;

SET SQL_SAFE_UPDATES = 1;