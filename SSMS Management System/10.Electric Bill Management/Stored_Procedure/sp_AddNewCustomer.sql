-- This stored procedure adds a new customer and links them to a vendor
CREATE OR ALTER PROCEDURE sp_AddNewCustomer
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Address VARCHAR(100),
    @ContactNumber VARCHAR(15),
    @VendorID INT
AS
BEGIN
    INSERT INTO Customer (FirstName, LastName, Address, ContactNumber, VendorID)
    VALUES (@FirstName, @LastName, @Address, @ContactNumber, @VendorID)
END
