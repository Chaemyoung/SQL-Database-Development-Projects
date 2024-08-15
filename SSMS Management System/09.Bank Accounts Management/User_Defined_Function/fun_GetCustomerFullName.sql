-- Function to Get Full Customer Name
CREATE OR ALTER FUNCTION fun_GetCustomerFullName(@CustomerID INT)
RETURNS VARCHAR(200)
AS
BEGIN
    DECLARE @FullName VARCHAR(200)
    SELECT @FullName = FirstName + ' ' + LastName 
    FROM Customer
    WHERE CustomerID = @CustomerID
    RETURN @FullName
END
