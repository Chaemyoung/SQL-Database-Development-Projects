-- This function returns the number of bills that are overdue for a specific customer
CREATE OR ALTER FUNCTION fn_CountOverdueBills(@CustomerID INT)
RETURNS INT
AS
BEGIN
    DECLARE @OverdueCount INT

    SELECT @OverdueCount = COUNT(*)
    FROM Billing B
    INNER JOIN Account A ON B.AccountID = A.AccountID
    WHERE A.CustomerID = @CustomerID AND B.IsPaid = 0 AND DATEDIFF(DAY, B.BillDate, GETDATE()) > 30

    RETURN ISNULL(@OverdueCount, 0)
END
