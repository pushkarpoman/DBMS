 CREATE DATABASE SALE;
 USE SALE;
 
 CREATE TABLE Customers (
 CustomerID INT PRIMARY KEY, 
 CustomerName VARCHAR(255), 
 Country VARCHAR(255)); 
 
 CREATE TABLE Orders (
 OrderID INT PRIMARY KEY, 
 OrderDate DATE, 
CustomerID INT, 
Amount DECIMAL(10, 2), 
FOREIGN KEY (CustomerID) 
REFERENCES Customers(CustomerID)); 

INSERT INTO Customers (CustomerID, CustomerName, Country) 
VALUES 
(1, "Bhavik", "India"), 
(2, "Priya", "Singapore"), 
(3, "Delisha", "China"), 
(4, "Jenil", "Australia");

INSERT INTO Orders (OrderID, OrderDate, CustomerID, Amount) 
VALUES 
(101, '2023-09-12', 1, 250.00), 
(102, '2023-09-10', 2, 450.00), 
(103, '2023-09-15', 1, 150.00), 
(104, '2023-09-18', 4, 300.00), 
(105, '2023-09-20', 3, 200.00);

-- INNER JOIN

SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount 
FROM Customers 
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- LEFT JOIN

SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount 
FROM Customers 
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID; 

-- RIGHT JOIN

SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount 
FROM Customers 
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID; 

-- FULL JOIN THROTUGH LEFT RIGHT JOIN AND UNION OF THEM

SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount 
FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID 
UNION 
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount 
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID; 