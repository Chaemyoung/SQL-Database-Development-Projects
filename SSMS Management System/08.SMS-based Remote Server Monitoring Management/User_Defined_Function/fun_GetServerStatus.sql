-- Retrieves the current status of a server
CREATE OR ALTER FUNCTION fun_GetServerStatus(@ServerID INT)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @Status NVARCHAR(50)
    
    SELECT @Status = Status
    FROM Server
    WHERE ServerID = @ServerID
    
    RETURN @Status
END
