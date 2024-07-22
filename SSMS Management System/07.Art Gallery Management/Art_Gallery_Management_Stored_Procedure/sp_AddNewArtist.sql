--  Add a new artist with details
CREATE OR ALTER PROCEDURE sp_AddNewArtist
    @ArtistFistName VARCHAR(50),
    @ArtistLastName VARCHAR(50),
    @ArtistBio VARCHAR(500),
    @ArtistAchievements VARCHAR(500)
AS 
BEGIN 
    INSERT INTO Artist (FirstName, LastName, Bio, Achievements)
    VALUES (@ArtistFistName, @ArtistLastName, @ArtistBio, @ArtistAchievements)
END
GO