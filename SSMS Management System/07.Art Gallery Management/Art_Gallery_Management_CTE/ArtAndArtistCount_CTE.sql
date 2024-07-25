-- Calculate the Total Number of Arts and Artists in Each Gallery Event
WITH ArtAndArtistCount_CTE AS (
    SELECT 
        g.GalleryID,
        g.[Date] AS EventDate,
        COUNT(DISTINCT a.ArtistID) AS TotalArtists,
        COUNT(a.ArtID) AS TotalArts
    FROM ArtGallery g
    INNER JOIN Art a ON g.GalleryID = a.GalleryID
    GROUP BY g.GalleryID, g.[Date]
)
SELECT GalleryID, EventDate, nTotalArtists, TotalArts
FROM ArtAndArtistCount
ORDER BY EventDate
