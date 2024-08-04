-- Assign a user to monitor a specific server
CREATE OR ALTER PROCEDURE sp_AssignUserToServer
    @UserID INT,
    @ServerID INT
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM UserServerMapping 
        WHERE UserID = @UserID AND ServerID = @ServerID
    )
    BEGIN
        INSERT INTO UserServerMapping (UserID, ServerID)
        VALUES (@UserID, @ServerID)
    END
    ELSE
    BEGIN
        PRINT 'User is already assigned to this server.'
    END
END
