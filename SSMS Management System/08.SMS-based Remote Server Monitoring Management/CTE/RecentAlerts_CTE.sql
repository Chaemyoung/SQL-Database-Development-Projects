-- Retrieves the most recent alert for each server
WITH RecentAlerts_CTE AS (
    SELECT ServerID, AlertType, AlertMessage, AlertDate,
        ROW_NUMBER() OVER (PARTITION BY ServerID ORDER BY AlertDate DESC) AS RowNum
    FROM Alert
)
SELECT ServerID, AlertType, AlertMessage, AlertDate
FROM RecentAlerts
WHERE RowNum = 1
