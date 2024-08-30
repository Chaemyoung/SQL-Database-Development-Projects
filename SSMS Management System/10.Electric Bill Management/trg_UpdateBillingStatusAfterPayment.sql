-- This trigger ensures that when a record is inserted into the Payments table, it automatically updates the corresponding bill in the Billing table to mark it as paid
CREATE OR ALTER TRIGGER trg_UpdateBillingStatusAfterPayment
ON Payments
AFTER INSERT
AS
BEGIN
    -- Declare variables to hold the inserted BillID and PaymentAmount
    DECLARE @BillID INT

    -- Retrieve the BillID from the inserted record
    SELECT @BillID = i.BillID
    FROM inserted i

    -- Update the corresponding Billing record to mark it as paid
    UPDATE Billing
    SET IsPaid = 1
    WHERE BillID = @BillID
END