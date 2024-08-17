-- Stored Procedure to Get Customer Details by Customer ID
CREATE OR ALTER PROCEDURE sp_GetCustomerDetails
    @CustomerID INT
AS
BEGIN
    SELECT CustomerID, FirstName, LastName, DateOfBirth, Email, PhoneNumber,
        Address, City, State, ZipCode
    FROM Customer
    WHERE CustomerID = @CustomerID
END
