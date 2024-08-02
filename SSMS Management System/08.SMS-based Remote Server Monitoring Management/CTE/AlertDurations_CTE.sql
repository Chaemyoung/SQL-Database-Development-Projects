-- Get Average Time Between Alerts
WITH AlertDurations_CTE AS (
    SELECT ServerID,
        DATEDIFF(MINUTE, LAG(AlertDate) OVER (PARTITION BY ServerID ORDER BY AlertDate), AlertDate) AS TimeBetweenAlerts
    FROM Alert
)
SELECT ServerID, AVG(TimeBetweenAlerts) AS AvgTimeBetweenAlerts
FROM AlertDurations
GROUP BY ServerID
