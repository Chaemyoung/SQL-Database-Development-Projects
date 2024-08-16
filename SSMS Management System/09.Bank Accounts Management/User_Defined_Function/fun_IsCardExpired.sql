-- Function to Check if a Card is Expired
CREATE OR ALTER FUNCTION fun_IsCardExpired(@ExpirationDate DATE)
RETURNS BIT
AS
BEGIN
    DECLARE @IsExpired BIT
    IF @ExpirationDate < GETDATE()
        SET @IsExpired = 1
    ELSE
        SET @IsExpired = 0
    RETURN @IsExpired
END
