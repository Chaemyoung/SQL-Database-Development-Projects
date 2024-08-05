-- Concatenates the first and last names of a user to return their full name
CREATE OR ALTER FUNCTION fun_GetFullUsername(@UserID INT)
RETURNS NVARCHAR(200)
AS
BEGIN
    DECLARE @FullName NVARCHAR(200)
    
    SELECT @FullName = Username + ' ' + COALESCE(PhoneNumber, '') + ' ' + COALESCE(Email, '')
    FROM [User]
    WHERE UserID = @UserID
    
    RETURN @FullName
END
