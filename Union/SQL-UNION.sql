#Ithmar Baron Union
#Q1
Select city from customers
union all
select city from suppliers;

#Q2
Select city from customers
union
select city from suppliers
union
select city from employees
order by city;

#Q3

Select city from customers where country = "Germany"
union all
select city from suppliers where country = "Germany";

#Q4
SELECT 'customer' as userType,ContactName,city,country
FROM customers
UNION
SELECT 'supplier' ,ContactName,city,country
FROM suppliers;

#Q5
SELECT 'customer' as userType,ContactName,city,country
FROM customers
UNION
SELECT 'supplier' ,ContactName,city,country
FROM suppliers
Union
Select 'employee' , CONCAT(firstName, ' ', lastName),city,country 
from employees;

