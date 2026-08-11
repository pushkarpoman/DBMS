CREATE DATABASE shops;
USE shops;

CREATE TABLE employees (employee_id INT AUTO_INCREMENT PRIMARY KEY, 
first_name VARCHAR(50) NOT NULL, 
last_name VARCHAR(50) NOT NULL, 
email VARCHAR(100) NOT NULL UNIQUE); 

CREATE TABLE customers 
(customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL, 
email VARCHAR(100) NOT NULL UNIQUE);

INSERT INTO employees (first_name, last_name, email) 
VALUES ('Jenil', 'Rathod', 'rjenil@gmail.com');

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Zaid', 'Kharadi', 'kharadiz@gmail.com');

CREATE VIEW employee_basic_info AS SELECT employee_id, first_name, last_name, email FROM employees; 

SELECT * FROM employee_basic_info; 

SELECT c.first_name AS customer_name, e.first_name AS employee_name, e.email AS employee_contact 
FROM customers c 
JOIN employees e ON c.customer_id = e.employee_id WHERE c.customer_id = 1; 

UPDATE employees SET email = 'rathodjenil@gmail.com'  WHERE employee_id = 1; 

SELECT * FROM employees;

delete from employees where employee_id = 1; 

SELECT * FROM employee_basic_info; 

 SELECT first_name, last_name, email FROM customers WHERE email LIKE '%@gmail.com'; 
 
UPDATE customers SET last_name = 'Merchant' WHERE customer_id = 1;

SELECT * FROM customers; 

INSERT INTO employees (first_name, last_name, email) 
VALUES 
('Sudeep', 'Gupta', 'sudeep.gupta@gmail.com'), 
('Manas', 'Singh', 'manas.singh@gmail.com'), 
('Rohit', 'Verma', 'rohit.verma@gmail.com'), 
('Sangita', 'Patel', 'sangita.patel@gmail.com'); 

SELECT first_name, last_name, email FROM employees;