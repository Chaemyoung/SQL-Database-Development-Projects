CREATE OR ALTER FUNCTION fun_GetTotalArtworksByArtist(@ArtistID INT)
RETURNS INT 
AS 
BEGIN 
    DECLARE @numOfArt INT 

    SELECT @numOfArt = COUNT(*)
    FROM Art a 
    WHERE ArtistID = @ArtistID

    RETURN @numOfArt

END