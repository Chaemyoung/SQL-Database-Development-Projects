-- Updates a bill’s status to "Paid" based on the customer’s ID and billing date
CREATE OR ALTER PROCEDURE sp_MarkBillAsPaid
    @CustomerID INT,
    @BillDate DATE
AS
BEGIN
    UPDATE Billing
    SET IsPaid = 1
    WHERE AccountID = (SELECT AccountID FROM Account WHERE CustomerID = @CustomerID)
    AND BillDate = @BillDate
END
