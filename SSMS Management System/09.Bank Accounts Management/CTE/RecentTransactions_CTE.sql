-- CTE for Recent Transactions
WITH RecentTransactions_CTE AS (
    SELECT T.TransactionID, C.FirstName + ' ' + C.LastName AS CustomerName, 
        A.AccountNumber,T.TransactionDate, T.TransactionType, T.Amount, T.Mode, T.Status
    FROM [Transaction] T
    INNER JOIN Account A ON T.AccountID = A.AccountID
    INNER JOIN Customer C ON A.CustomerID = C.CustomerID
    WHERE T.TransactionDate >= DATEADD(DAY, -7, GETDATE())
)
SELECT TransactionID, CustomerName, AccountNumber, TransactionDate, TransactionType, 
    Amount, Mode, Status
FROM RecentTransactions_CTE
ORDER BY TransactionDate DESC
