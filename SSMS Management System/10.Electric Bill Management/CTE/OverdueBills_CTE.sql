-- This CTE lists all bills that are unpaid and overdue by more than 30 daysCTE to List Overdue Bills
WITH OverdueBills_CTE AS (
    SELECT B.BillID, C.FirstName + ' ' + C.LastName AS CustomerName, B.BillDate, B.AmountDue,
        DATEDIFF(DAY, B.BillDate, GETDATE()) AS DaysOverdue
    FROM Billing B
    INNER JOIN Account A ON B.AccountID = A.AccountID
    INNER JOIN Customer C ON A.CustomerID = C.CustomerID
    WHERE B.IsPaid = 0 AND DATEDIFF(DAY, B.BillDate, GETDATE()) > 30
)
SELECT * FROM OverdueBills_CTE
ORDER BY DaysOverdue DESC
