-- Register a new user with details
CREATE OR ALTER PROCEDURE sp_RegisterNewUser 
    @UserFirstName VARCHAR(50),
    @UserLastName VARCHAR(50),
    @UserEmail VARCHAR(100),
    @UserPhone VARCHAR(15)
AS
BEGIN
    IF NOT EXISTS (SELECT 1,2 FROM User WHERE Email = @UserEmail)
    BEGIN
        INSERT INTO User (FirstName, LastName, Email, Phone)
        VALUES (@UserFirstName, @UserLastName, @UserEmail, @UserPhone)
    END

    ELSE
    BEGIN
        PRINT 'Email already exists'
    END
END
GO