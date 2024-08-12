-- 1) List of Active Customers
SELECT * 
FROM Customer 
WHERE IsActive = 1


-- 2) Transaction History for a Specific Account
SELECT SUM(AccountBalance) AS TotalBalance 
FROM Account 
WHERE CustomerID = @CustomerID


-- 3) All Cards Issued to a Specific Customer
SELECT * 
FROM Card 
WHERE CustomerID = @CustomerID AND IsActive = 1


-- 4) Products Purchased by a Customer
SELECT * 
FROM CustomerPurchase 
WHERE CustomerID = @CustomerID AND IsActive = 1


-- 5) Transaction History for a Specific Account
SELECT * 
FROM [Transaction] 
WHERE AccountID = @AccountID 
ORDER BY TransactionDate DESC


-- 6) Total Balance for All Accounts by Customer
SELECT C.CustomerID, C.FirstName + ' ' + C.LastName AS CustomerName, SUM(A.AccountBalance) AS TotalBalance
FROM Customer C
INNER JOIN Account A ON C.CustomerID = A.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY TotalBalance DESC


-- 7) Transactions in the Last 30 Days
SELECT T.TransactionID, C.FirstName + ' ' + C.LastName AS CustomerName, A.AccountNumber,
    T.TransactionDate, T.TransactionType, T.Amount, T.Mode, T.Status
FROM [Transaction] T
INNER JOIN Account A ON T.AccountID = A.AccountID
INNER JOIN  Customer C ON A.CustomerID = C.CustomerID
WHERE T.TransactionDate >= DATEADD(DAY, -30, GETDATE())
ORDER BY T.TransactionDate DESC


-- 8) Active Credit Cards by Customer
SELECT C.CustomerID, C.FirstName + ' ' + C.LastName AS CustomerName,
    Cd.CardNumber, Cd.CardType, Cd.ExpirationDate
FROM Customer C
INNER JOIN Card Cd ON C.CustomerID = Cd.CustomerID
WHERE Cd.IsActive = 1 AND Cd.CardType = 'Credit'
ORDER BY C.CustomerID, Cd.ExpirationDate


-- 9) High-Value Transactions (Above $10,000)
SELECT T.TransactionID,C.FirstName + ' ' + C.LastName AS CustomerName, 
    A.AccountNumber, T.TransactionDate, T.TransactionType, T.Amount, T.Mode
FROM [Transaction] T
INNER JOIN Account A ON T.AccountID = A.AccountID
INNER JOIN Customer C ON A.CustomerID = C.CustomerID
WHERE T.Amount > 10000
ORDER BY T.Amount DESC


-- 10) Customers with Loans or Insurance Products
SELECT C.CustomerID, C.FirstName + ' ' + C.LastName AS CustomerName,
    CP.ProductType, CP.ProductDetails, CP.PurchaseDate, CP.Amount
FROM Customer C
INNER JOIN CustomerPurchase CP ON C.CustomerID = CP.CustomerID
WHERE CP.ProductType IN ('Loan', 'Insurance')
ORDER BY CP.PurchaseDate DESC
