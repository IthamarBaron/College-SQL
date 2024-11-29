--Ithamar Baron
-- 1
Select * from customers where exists (select 1 from orders where customers.CustomerID = orders.CustomerID AND OrderDate > 15/09/1994);
-- 2
Select * from customers where exists (select 1 from orders where orders.CustomerID=customers.CustomerID);
-- 3
Select * from customers where not exists (select 1 from orders where orders.CustomerID=customers.CustomerID);
-- 4 
Select * from customers where CustomerID in (select CustomerID from orders where exists (select 1 from orderdetails where ProductID=42 and orders.OrderID=orderdetails.OrderID) and exists (select 1 from orderdetails where ProductID=11 and orders.OrderID=orderdetails.OrderID));
-- 5
Select CustomerID from orders where not exists (select 1 from orderdetails where orders.OrderID=orderdetails.OrderID and ProductID=11);
-- 6
Select CustomerID from orders where not exists (select 1 from orderdetails where orders.OrderID=orderdetails.OrderID);
-- 7 
Select distinct o.CustomerID from Orders o
join OrderDetails od1 on o.OrderID = od1.OrderID
join OrderDetails od2 on o.OrderID = od2.OrderID
where od1.ProductID = 42
  and od2.ProductID = 55
  and o.CustomerID = o.CustomerID
  and exists (select 1  from Orders o1  join OrderDetails od1_2 on o1.OrderID = od1_2.OrderID where od1_2.ProductID = 42)