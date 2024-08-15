-- Function to Calculate Account Age in Years
CREATE OR ALTER FUNCTION fun_GetAccountAge(@AccountOpenedDate DATE)
RETURNS INT
AS
BEGIN
    DECLARE @AccountAge INT
    SET @AccountAge = DATEDIFF(YEAR, @AccountOpenedDate, GETDATE())
    RETURN @AccountAge
END
