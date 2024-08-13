-- CTE for Customers with Total Account Balance
WITH CustomerTotalBalance AS (
    SELECT C.CustomerID, C.FirstName + ' ' + C.LastName AS CustomerName,
        SUM(A.AccountBalance) AS TotalBalance
    FROM Customer C
    INNER JOIN Account A ON C.CustomerID = A.CustomerID
    GROUP BY C.CustomerID, C.FirstName, C.LastName
)
SELECT CustomerID, CustomerName, TotalBalance
FROM CustomerTotalBalance
ORDER BY TotalBalance DESC