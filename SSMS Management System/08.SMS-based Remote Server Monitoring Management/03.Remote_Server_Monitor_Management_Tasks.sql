-- Report of All Active Alerts
SELECT s.ServerName, a.AlertType, a.AlertMessage, a.AlertDate
FROM Alert a
INNER JOIN Server s ON a.ServerID = s.ServerID
WHERE s.Status = 'Down'
ORDER BY a.AlertDate DESC

-- Report of Notifications Sent to Users
SELECT u.Username, u.PhoneNumber, a.AlertType, a.AlertMessage, n.SentDate
FROM Notification n
INNER JOIN [User] u ON n.UserID = u.UserID
INNER JOIN Alert a ON n.AlertID = a.AlertID
ORDER BY n.SentDate DESC

-- Users and the Servers They Are Monitoring
SELECT u.Username, s.ServerName
FROM UserServerMapping usm
INNER JOIN [User] u ON usm.UserID = u.UserID
INNER JOIN Server s ON usm.ServerID = s.ServerID
ORDER BY u.Username, s.ServerName


-- Servers with the Most Alerts
SELECT s.ServerName, COUNT(a.AlertID) AS AlertCount
FROM Alert a
INNER JOIN Server s ON a.ServerID = s.ServerID
GROUP BY s.ServerName
ORDER BY AlertCount DESC


-- Users with the Most Notifications
SELECT u.Username, COUNT(n.NotificationID) AS NotificationCount
FROM Notification n
INNER JOIN [User] u ON n.UserID = u.UserID
GROUP BY u.Username
ORDER BY NotificationCount DESC


-- Alerts Grouped by Type
SELECT a.AlertType, COUNT(a.AlertID) AS AlertCount
FROM Alert a
GROUP BY a.AlertType
ORDER BY AlertCount DESC


-- Recent Alerts for a Specific Server
SELECT s.ServerName, a.AlertType, a.AlertMessage, a.AlertDate
FROM Alert a
INNER JOIN Server s ON a.ServerID = s.ServerID
WHERE s.ServerID = 1 -- Change the ServerID as needed
ORDER BY a.AlertDate DESC
