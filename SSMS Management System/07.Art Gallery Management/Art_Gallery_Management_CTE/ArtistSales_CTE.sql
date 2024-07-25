-- Rank Artists Based on the Number of Artworks Sold
WITH ArtistSales AS (
    SELECT 
        a.ArtistID,
        COUNT(s.SaleID) AS TotalArtworksSold
    FROM Artist a
    JOIN Art ar ON a.ArtistID = ar.ArtistID
    JOIN Sale s ON ar.ArtID = s.ArtID
    GROUP BY a.ArtistID
)
SELECT ArtistID, TotalArtworksSold, RANK() OVER (ORDER BY TotalArtworksSold DESC) AS ArtistRank
FROM ArtistSales
ORDER BY ArtistRank
