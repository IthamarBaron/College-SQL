#Ithamar  Baron
#Q1
insert into employees
values (null,"baron","Ithamar","student","2006-7-14","110","EvenYEhuda","IL","4545","Israel",0501234567,0,1);
#Q2
Insert into orders
Values
(null,"ALFKI",10,curdate(),curdate()+4),
(null,"ALFKI",10,curdate(),curdate()+4);

#Q3
insert into orderdetails
values(
(select max(orderID) from orders where CustomerID = "ALFKI"),
(select ProductID from products where ProductName = "Chai"), 
(select UnitPrice from products where productName = "Chai"),
1,
(select Discontinued from products where productName = "Chai")
 );
 
#Q4
Delete from categories
where Not Exists(select 1 from products where products.CategoryID=categories.CategoryID);

#Q5
delete from orders
where ((select city from customers where customers.CustomerID = orders.CustomerID) = "berlin") 
and not exists (select 1 from orderdetails where orderdetails.OrderID = orders.orderID);
 
#Q6
update products 
set unitprice = 30 where productname = "coffe";

#Q7
Update employees
Set Region = 'Rg'
where Region IS Null;

#Q8 
Update Products
Set UnitPrice = UnitPrice * 1.10
Where SupplierID = 1;

#Q9
Update employees
set salary = salary*1.1
where EmployeeID IN (Select EmployeeID From Orders Where year(OrderDate) = 1994 Group by EmployeeID Having Count(OrderID) > 2);