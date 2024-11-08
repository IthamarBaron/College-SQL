-- first question
Select products.ProductName, suppliers.CompanyName From products,suppliers;
-- second question
select products.ProductName, products.ProductID, suppliers.CompanyName From products,suppliers Where suppliers.SupplierID = 1;
-- third question
select 
suppliers.CompanyName,
products.ProductName,
categories.CategoryName 
From suppliers 
INNER JOIN products ON suppliers.SupplierID = products.SupplierID
INNER JOIN categories ON products.CategoryID = categories.CategoryID;

-- forth question
select
orders.OrderID,
orders.CustomerID,
customers.CompanyName,
orders.EmployeeID,
employees.FirstName,
employees.lastName
from orders
Inner Join employees On orders.EmployeeID =employees.EmployeeID
Inner Join customers On orders.CustomerID = customers.CustomerID
WHERE orders.OrderDate BETWEEN '1994-08-01' AND '1994-08-10';
 
 -- fifth question
 select 
employees.FirstName,
COUNT(*) AS OrderCount
from orders
Inner Join employees ON orders.EmployeeID = employees.EmployeeID
GROUP BY employees.FirstName
order by (employees.FirstName);

-- sixth question
select
products.ProductName,
sum(orderdetails.Quantity) as AmountOrdered
from orderdetails
Inner Join products ON  orderdetails.ProductID = products.ProductID
group by orderdetails.ProductID;


-- seventh question 
select
suppliers.companyName,
avg(products.UnitPrice) as AVGPrice
from products
INNER JOIN suppliers ON products.SupplierID = suppliers.SupplierID
GROUP BY suppliers.companyName;

-- eight question
select 
suppliers.CompanyName,
max(products.UnitPrice) as maxPrice
from suppliers
inner join products ON products.SupplierID = suppliers.SupplierID
group by suppliers.CompanyName;

-- ninth question
select customers.CompanyName,
       customers.CustomerID
from customers
Inner Join orders on orders.CustomerID = customers.CustomerID
group by customers.CompanyName, customers.CustomerID
having count(orders.CustomerID) = 1;