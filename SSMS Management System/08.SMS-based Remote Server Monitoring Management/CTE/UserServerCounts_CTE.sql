-- Finds the users who are assigned to the most servers
WITH UserServerCounts_CTE AS (
    SELECT UserID, COUNT(ServerID) AS ServerCount
    FROM UserServerMapping
    GROUP BY UserID
)
SELECT UserID, ServerCount
FROM UserServerCounts_CTE
ORDER BY ServerCount DESC
