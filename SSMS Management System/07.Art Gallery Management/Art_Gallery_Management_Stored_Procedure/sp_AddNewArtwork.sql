-- Add a new artwork with details
CREATE OR ALTER PROCEDURE sp_AddNewArtwork
    @ArtTitle VARCHAR(100),
    @ArtType VARCHAR(50),
    @ArtMedium VARCHAR(50)
AS
BEGIN
    INSERT INTO Art (Title, Type, Medium)
    VALUES (@ArtTitle, @ArtType, @ArtMedium)
END
GO
