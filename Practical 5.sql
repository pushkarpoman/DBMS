CREATE DATABASE calculation;
use calculation;
CREATE TABLE areas(r INT, area FLOAT(10,2));

DELIMITER // 
CREATE PROCEDURE proc_area() 
BEGIN 
DECLARE r INT(10); 
DECLARE area FLOAT(10, 2); 
DECLARE pi FLOAT(10, 2); 
set pi = 3.14; 
set r = 5; 
l1 
: 
while r <= 9 do 
	SET area = pi * POWER(r, 2); 
    INSERT INTO areas VALUES(r, area); 
    SET r = r + 1; 
    END 
while l1; 
END 
// 


 DELIMITER ; 
CALL proc_area(); 
SELECT * FROM areas;
