-- This function returns the full name of a customer by combining their first and last names
CREATE OR ALTER FUNCTION fun_GetCustomerFullName(@CustomerID INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @FullName VARCHAR(100)

    SELECT @FullName = FirstName + ' ' + LastName
    FROM Customer
    WHERE CustomerID = @CustomerID

    RETURN @FullName
END
