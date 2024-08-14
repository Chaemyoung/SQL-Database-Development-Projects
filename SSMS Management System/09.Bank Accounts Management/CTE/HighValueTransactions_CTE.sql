-- CTE for High-Value Transactions by Account
WITH HighValueTransactions_CTE AS (
    SELECT T.TransactionID, A.AccountID,
        C.FirstName + ' ' + C.LastName AS CustomerName, A.AccountNumber,
        T.TransactionDate, T.Amount
    FROM [Transaction] T
    INNER JOIN Account A ON T.AccountID = A.AccountID
    INNER JOIN Customer C ON A.CustomerID = C.CustomerID
    WHERE T.Amount > 10000
)
SELECT AccountID, CustomerName, AccountNumber, MAX(Amount) AS MaxTransactionAmount
FROM HighValueTransactions_CTE
GROUP BY AccountID, CustomerName, AccountNumber
ORDER BY MaxTransactionAmount DESC
