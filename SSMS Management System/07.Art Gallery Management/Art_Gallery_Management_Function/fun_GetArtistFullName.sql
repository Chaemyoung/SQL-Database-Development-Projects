CREATE OR ALTER FUNCTION fun_GetArtistFullName (@ArtistID INT) 
RETURNS VARCHAR(100) 
AS
BEGIN

    DECLARE @FullName VARCHAR(100)

    SELECT @FullName = FirstName +  ' ' + LastName
    FROM Artist
    WHERE ArtistID = @ArtistID

    RETURN @FullName

END 