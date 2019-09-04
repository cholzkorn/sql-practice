select * from Customers
inner join Orders on Customers.CustomerID = Orders.CustomerID
inner join [Order Details] on Orders.OrderID = [Order Details].OrderID;