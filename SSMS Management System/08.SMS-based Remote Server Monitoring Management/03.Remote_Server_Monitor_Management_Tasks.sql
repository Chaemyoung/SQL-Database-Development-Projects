-- Report of All Active Alerts
SELECT s.ServerName, a.AlertType, a.AlertMessage, a.AlertDate
FROM Alert a
JOIN Server s ON a.ServerID = s.ServerID
WHERE s.Status = 'Down'
ORDER BY a.AlertDate DESC

-- Report of Notifications Sent to Users
SELECT u.Username, u.PhoneNumber, a.AlertType, a.AlertMessage, n.SentDate
FROM Notification n
JOIN [User] u ON n.UserID = u.UserID
JOIN Alert a ON n.AlertID = a.AlertID
ORDER BY n.SentDate DESC;

