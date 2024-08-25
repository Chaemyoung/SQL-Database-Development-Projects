-- This CTE calculates the total units consumed and total amount due for each customer in a specific month
WITH MonthlyUsage_CTE AS (
    SELECT C.CustomerID, C.FirstName + ' ' + C.LastName AS CustomerName,
        SUM(B.UnitsConsumed) AS TotalUnitsConsumed, SUM(B.AmountDue) AS TotalAmountDue
    FROM Billing B
    INNER JOIN Account A ON B.AccountID = A.AccountID
    INNER JOIN Customer C ON A.CustomerID = C.CustomerID
    WHERE MONTH(B.BillDate) = 8 AND YEAR(B.BillDate) = 2024
    GROUP BY C.CustomerID, C.FirstName, C.LastName
)
SELECT * FROM MonthlyUsage_CTE
ORDER BY TotalUnitsConsumed DESC
