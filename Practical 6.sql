CREATE DATABASE Grade;
USE Grade; 
 
CREATE TABLE Stud_Marks (name VARCHAR(50), total_marks INT);

CREATE TABLE Result (
Roll INT AUTO_INCREMENT PRIMARY KEY, 
Name VARCHAR(50), 
Class VARCHAR(30));

INSERT INTO Stud_Marks (name, total_marks) 
VALUES 
('Zaid', 1450), 
('Jenil', 980), 
('Sudeep', 860), 
('Durva', 820);

DELIMITER // 
CREATE PROCEDURE proc_Grade (IN p_name VARCHAR(50), IN p_total_marks INT) 
BEGIN 
DECLARE student_class VARCHAR(30); 
IF p_total_marks <= 1500 AND p_total_marks >= 990  THEN 
	SET student_class = 'Distinction'; 
ELSEIF p_total_marks <= 989 AND p_total_marks >= 900 THEN 
    SET student_class = 'First Class'; 
ELSEIF p_total_marks <= 899 AND p_total_marks >= 825 THEN 
    SET student_class = 'Higher Second Class'; 
ELSEIF p_total_marks <= 824 AND p_total_marks >= 525 THEN 
	SET student_class = 'Pass'; 
ELSE 
    SET student_class = 'Fail'; 
END IF; 
INSERT INTO Result (Name, Class) VALUES (p_name, student_class); 
END; 
// 

DELIMITER ; 
DELIMITER // 
CREATE FUNCTION func_CallGrade(p_name VARCHAR(50), p_total_marks INT) 
RETURNS VARCHAR(100) 
DETERMINISTIC 
BEGIN 
CALL proc_Grade(p_name, p_total_marks); 
RETURN CONCAT(p_name, ' has been graded successfully.'); 
END; 
// 

DELIMITER ;
SELECT func_CallGrade('Zaid', 1450); 

SELECT func_CallGrade('Jenil', 980); 

SELECT func_CallGrade('Sudeep', 860); 

SELECT func_CallGrade('Durva', 820);

 SELECT * FROM Result;

