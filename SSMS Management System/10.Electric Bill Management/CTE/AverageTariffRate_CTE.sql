-- This CTE calculates the average tariff rate for each vendor across all time periods
WITH AverageTariffRate_CTE AS (
    SELECT V.VendorName, AVG(T.RatePerUnit) AS AvgTariffRate
    FROM Tariff T
    INNER JOIN Vendor V ON T.VendorID = V.VendorID
    GROUP BY V.VendorName
)
SELECT * FROM AverageTariffRate_CTE
ORDER BY AvgTariffRate DESC
