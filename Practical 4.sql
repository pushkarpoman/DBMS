 CREATE DATABASE Library;
 USE Library;

CREATE TABLE borrower( 
Roll_no INT(10) PRIMARY KEY, 
Name VARCHAR(20) NOT NULL, 
Date_of_issue DATE NOT NULL, 
Name_of_book VARCHAR(20) NOT NULL, 
Status VARCHAR(1) NOT NULL); 

CREATE TABLE fine(
Roll_no INT(10), 
Date DATE NOT NULL, 
Amount INT(10), 
FOREIGN KEY(Roll_no) 
REFERENCES borrower(Roll_no)); 

INSERT INTO borrower(Roll_no, Name, Date_of_issue, Name_of_book, Status) 
VALUES 
(1, 'Jenil', '2024-04-17', 'Half-Blood Prince', 'I'), 
(2, 'Manas', '2024-05-12', 'Sea Monsters', 'I');

SELECT * FROM borrower;

DELIMITER // 
CREATE PROCEDURE A(IN rollno INT(10), IN name1 VARCHAR(20)) 
BEGIN 
DECLARE i_date DATE; 
DECLARE diff INT; 
DECLARE fine_amt INT; 
DECLARE st VARCHAR(1); 
DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'Table not found'; 
SELECT Date_of_issue, Status INTO i_date, st FROM borrower WHERE Roll_no = rollno and Name_of_book = name1; 
IF (st = 'R') THEN 
	SELECT CONCAT('The Book "', name1, '" has already been returned.') AS message; 
ELSE 
    SELECT DATEDIFF(CURDATE(), i_date) INTO diff; 
	IF (diff >= 15 AND diff <= 30) THEN 
		SET fine_amt = (diff - 15) * 5; 
	ELSEIF (diff > 30) THEN 
		SET fine_amt = (diff - 15) * 5 + 75; 
    END IF; 
    UPDATE borrower SET Status = 'R' WHERE Roll_no = rollno AND Name_of_book =  name1; 
    INSERT INTO fine VALUES(rollno, CURDATE(), fine_amt); 
END IF; 
END; 
// 

DELIMITER ; 
CALL A(1, 'Half-Blood Prince');

SELECT * FROM fine; 
SELECT * FROM borrower; 

DELIMITER ; 
CALL A(2, 'Sea Monsters'); 

SELECT * FROM fine; 
SELECT * FROM borrower; 