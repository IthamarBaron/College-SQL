#Ithamar baron 8/12/24
#requirment for ex
ALTER TABLE Employees
ADD COLUMN startDate DATE;

#Q1
CREATE OR REPLACE VIEW mynorthwind.empinfo AS
SELECT EmployeeID, FirstName, BirthDate, year(current_date())-year(BirthDate) AS "age" FROM employees;

#Q1 - Test
SELECT * FROM empinfo;

#Q2
CREATE OR REPLACE VIEW mynorthwind.betterempinfo AS
SELECT FirstName, LastName, StartDate, ADDDATE(StartDate, INTERVAL 1 YEAR) AS SalCall 
FROM Employees
WHERE TIMESTAMPDIFF(YEAR, StartDate, CURRENT_DATE()) < 1;


-- Add start dates to a few employees for testing
UPDATE Employees
SET StartDate = '2024-06-15' 
WHERE EmployeeID = 3;  

UPDATE Employees
SET StartDate = '2018-10-01' 
WHERE EmployeeID = 7;  

UPDATE Employees
SET StartDate = '2019-04-25' 
WHERE EmployeeID = 8;  


select * from betterempinfo;




#Q4
CREATE OR REPLACE VIEW CustomersWithLongGapOrders AS
SELECT c.CustomerID, 
       c.CompanyName, 
       c.ContactName, 
       c.ContactTitle, 
       c.Address, 
       c.City, 
       c.Region, 
       c.PostalCode, 
       c.Country, 
       o1.OrderID AS FirstOrderID,
       o1.OrderDate AS FirstOrderDate,
       o2.OrderID AS SecondOrderID,
       o2.OrderDate AS SecondOrderDate,
       TIMESTAMPDIFF(DAY, o1.OrderDate, o2.OrderDate) AS OrderGapDays
FROM Customers c
JOIN Orders o1 ON c.CustomerID = o1.CustomerID
JOIN Orders o2 ON c.CustomerID = o2.CustomerID
WHERE TIMESTAMPDIFF(DAY, o1.OrderDate, o2.OrderDate) > 500;
