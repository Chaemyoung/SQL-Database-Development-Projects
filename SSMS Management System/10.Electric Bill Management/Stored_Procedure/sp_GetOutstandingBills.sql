-- This stored procedure retrieves all unpaid bills for a customer
CREATE OR ALTER PROCEDURE sp_GetOutstandingBills
    @CustomerID INT
AS
BEGIN
    SELECT B.BillID, B.BillDate, B.UnitsConsumed, B.AmountDue
    FROM Billing B
    INNER JOIN Account A ON B.AccountID = A.AccountID
    WHERE A.CustomerID = @CustomerID AND B.IsPaid = 0
    ORDER BY B.BillDate DESC
END
