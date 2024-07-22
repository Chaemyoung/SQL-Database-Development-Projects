-- Update the information of an artist
CREATE OR ALTER PROCEDURE sp_UpdateArtistInfo
    @ArtistID INT,
    @ArtistFistName VARCHAR(50),
    @ArtistLastName VARCHAR(50),
    @ArtistBio VARCHAR(500),
    @ArtistAchievements VARCHAR(500)
AS 
BEGIN
    UPDATE Artist
    SET FirstName = @ArtistFistName,
        LastName = @ArtistLastName,
        Bio = @ArtistBio,
        Achievements = @ArtistAchievements
    WHERE ArtistID = @ArtistID
END
GO