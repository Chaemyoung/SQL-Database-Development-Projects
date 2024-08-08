-- Calculates the uptime percentage for each server
WITH ServerUptime_CTE AS (
    SELECT ServerID, COUNT(*) AS TotalAlerts, SUM(CASE WHEN AlertType = 'Operational' THEN 1 ELSE 0 END) AS OperationalAlerts
    FROM Alert
    GROUP BY ServerID
)
SELECT ServerID, TotalAlerts, OperationalAlerts, (CASE WHEN TotalAlerts = 0 THEN 0 ELSE (OperationalAlerts * 1.0 / TotalAlerts) * 100 END) AS UptimePercentage
FROM ServerUptime_CTE
