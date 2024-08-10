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

