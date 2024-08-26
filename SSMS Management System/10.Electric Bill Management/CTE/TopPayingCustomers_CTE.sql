-- This CTE retrieves the top 5 customers based on the total payments they’ve made
WITH TopPayingCustomers_CTE AS (
    SELECT C.CustomerID, C.FirstName + ' ' + C.LastName AS CustomerName,
        SUM(B.AmountDue) AS TotalPaid
    FROM Billing B
    INNER JOIN Account A ON B.AccountID = A.AccountID
    INNER JOIN Customer C ON A.CustomerID = C.CustomerID
    WHERE B.IsPaid = 1
    GROUP BY C.CustomerID, C.FirstName, C.LastName
)
SELECT * FROM TopPayingCustomers_CTE
ORDER BY TotalPaid DESC
