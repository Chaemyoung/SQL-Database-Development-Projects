SELECT * FROM Customer
SELECT * FROM Orders
SELECT * FROM OrderDetails

--  Using INSERT command add 4 records to Customer table.
INSERT INTO Customer(FirstName, LastName, UserName, MembershipStartDate)
VALUES ('Mike', 'Johnson', 'mJohnson', '2020-05-16'), ('Terri', 'O''reilly', 'toreilly', '2022-10-15'), ('David', 'Ryan', 'dryan', '2024-02-11'), ('Tad', 'Yoon', 'Taddii', '2024-06-12')

-- Using INSERT command add 2 records to Product table.
INSERT INTO Product(ProductName, ShortDesc, Price, QuantityInStock)
VALUES ('Front Brakes', 'Front Brakes for bikes', 23.67, 10), ('LL Mountain Pedal', 'LL Mountain Pedal for bikes', 15.76, 5)

--  Add data to Orders and OrderDetails table.
INSERT INTO Orders(CustomerId, Orderdate)
VALUES (1, GETDATE())

INSERT INTO OrderDetails(OrderId, ProductId, Quantity)
VALUES (1000, 3000, 2)

INSERT INTO OrderDetails(OrderId, ProductId, Quantity)
VALUES (1000, 3002, 4)

INSERT INTO Orders(CustomerId, Orderdate)
VALUES (6, '2024-01-14')

INSERT INTO Orders(CustomerId, OrderDate)
VALUES ((SELECT CustomerId FROM Customer WHERE FirstName='Terri'), '2024-01-14')

INSERT INTO OrderDetails(OrderId, ProductId, Quantity)
VALUES (1003, 3002, 1)

