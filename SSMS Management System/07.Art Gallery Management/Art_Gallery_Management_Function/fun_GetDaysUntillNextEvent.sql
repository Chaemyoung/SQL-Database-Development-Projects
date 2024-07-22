CREATE OR ALTER FUNCTION function_GetDaysUntillNextEvent(@NextEventDay DATE)
RETURNS INT 
AS 
BEGIN 
    DECLARE @DayCount INT 

    SET @DayCount = DATEDIFF(day, @NextEventDay, GETDATE())

    RETURN @DayCount

END 