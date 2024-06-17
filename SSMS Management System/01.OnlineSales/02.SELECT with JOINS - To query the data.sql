-- Display FirstName, LastName, OrderId and OrderDate.
SELECT Cus.FirstName, Cus.LastName, Ord.OrderId, Ord.OrderDate
FROM Customer Cus INNER JOIN Orders Ord
ON Cus.CustomerId = Ord.CustomerId

-- Display FirstName, LastName, OrderId and OrderDate for all the matching records in Customer and Order tables and non-matching records in Customer table.
SELECT Cus.FirstName, Cus.LastName, Ord.OrderId, Ord.OrderDate
FROM Customer Cus LEFT JOIN Orders Ord
ON Cus.CustomerId = Ord.CustomerId

-- Display FirstName, LastName, OrderId, OrderDate, ProductId and Quantity.
SELECT Cus.FirstName, Cus.LastName, Ord.OrderId, Ord.OrderDate, OrdD.ProductId, OrdD.Quantity
FROM Customer Cus INNER JOIN Orders Ord
ON Cus.CustomerId = Ord.CustomerId
INNER JOIN OrderDetails OrdD
ON OrdD.OrderId = Ord.OrderId

-- Display  FirstName, LastName, OrderId, OrderDate, ProductId , Quantity,  ProductName and Price.
SELECT Cus.FirstName, Cus.LastName, Ord.OrderId, Ord.OrderDate, OrdD.ProductId, OrdD.Quantity, Prd.ProductName, Prd.Price
FROM Customer Cus INNER JOIN Orders Ord
ON Cus.CustomerId = Ord.CustomerId
INNER JOIN OrderDetails OrdD
ON OrdD.OrderId = Ord.OrderId
INNER JOIN Product Prd
ON Prd.ProductId = OrdD.ProductId

-- Display Full Name (Concatenate FirstName, LastName with space), OrderDate (show only the date part), ProductName, Quantity, TotalPrice (Price * Quantity).
SELECT CONCAT_WS(' ', FirstName, LastName) as FullName, Ord.OrderId, CONVERT(date, Ord.OrderDate, 101) as OrderDateFormat, ProductName, Quantity
FROM Customer Cus INNER JOIN Orders Ord
ON Cus.CustomerId=Ord.CustomerId
INNER JOIN OrderDetails OrdD
ON OrdD.OrderId = Ord.OrderId
INNER JOIN Product Pro
ON Pro.ProductId=OrdD.ProductId

-- Filter the data only for Customer Mike Johnson.
SELECT CONCAT_WS(' ', FirstName, LastName) as FullName, Ord.OrderId, CONVERT(date, Ord.OrderDate, 101) as OrderDateFormat, ProductName, Quantity
FROM Customer Cus INNER JOIN Orders Ord
ON Cus.CustomerId=Ord.CustomerId
INNER JOIN OrderDetails OrdD
ON OrdD.OrderId = Ord.OrderId
INNER JOIN Product Pro
ON Pro.ProductId=OrdD.ProductId
WHERE Cus.CustomerId =1