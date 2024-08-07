-- Calculates the average number of alerts per day for each server
WITH AlertCounts_CTE AS (
    SELECT ServerID, COUNT(*) AS AlertCount, DATEDIFF(DAY, MIN(AlertDate), MAX(AlertDate)) + 1 AS TotalDays
    FROM Alert
    GROUP BY ServerID
)
SELECT ServerID, AlertCount, TotalDays, (AlertCount * 1.0) / TotalDays AS AvgAlertsPerDay
FROM AlertCounts_CTE
