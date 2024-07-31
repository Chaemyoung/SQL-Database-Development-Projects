INSERT INTO [User] (Username, PasswordHash, PhoneNumber, Email)
VALUES 
('admin', 'hashed_password_1', '+1234567890', 'admin@example.com'),
('john_doe', 'hashed_password_2', '+1234567891', 'john@example.com'),
('jane_smith', 'hashed_password_3', '+1234567892', 'jane@example.com'),
('alice_jones', 'hashed_password_4', '+1234567893', 'alice@example.com'),
('bob_brown', 'hashed_password_5', '+1234567894', 'bob@example.com'),
('charlie_davis', 'hashed_password_6', '+1234567895', 'charlie@example.com'),
('danielle_evans', 'hashed_password_7', '+1234567896', 'danielle@example.com'),
('frank_garcia', 'hashed_password_8', '+1234567897', 'frank@example.com'),
('grace_harris', 'hashed_password_9', '+1234567898', 'grace@example.com'),
('henry_king', 'hashed_password_10', '+1234567899', 'henry@example.com')


INSERT INTO Server (ServerName, IPAddress, Status)
VALUES 
('Server1', '192.168.1.1', 'Operational'),
('Server2', '192.168.1.2', 'Operational'),
('Server3', '192.168.1.3', 'Operational'),
('Server4', '192.168.1.4', 'Operational'),
('Server5', '192.168.1.5', 'Operational'),
('Server6', '192.168.1.6', 'Operational'),
('Server7', '192.168.1.7', 'Operational'),
('Server8', '192.168.1.8', 'Operational'),
('Server9', '192.168.1.9', 'Operational'),
('Server10', '192.168.1.10', 'Operational')


INSERT INTO UserServerMapping (UserID, ServerID)
VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 1),
(6, 3),
(7, 5),
(7, 7),
(8, 9),
(8, 2),
(9, 4),
(9, 6),
(10, 8),
(10, 10)


INSERT INTO Alert (ServerID, AlertType, AlertMessage, AlertDate)
VALUES 
(1, 'Error', 'CPU usage is over 90%', '2024-07-28 10:00:00'),
(2, 'Error', 'Memory usage is over 90%', '2024-07-28 11:00:00'),
(3, 'Warning', 'Disk space is over 80%', '2024-07-28 12:00:00'),
(4, 'Error', 'Network latency is high', '2024-07-28 13:00:00'),
(5, 'Warning', 'Server temperature is high', '2024-07-28 14:00:00'),
(6, 'Error', 'Application crashed', '2024-07-28 15:00:00'),
(7, 'Error', 'Service unavailable', '2024-07-28 16:00:00'),
(8, 'Warning', 'Low battery on UPS', '2024-07-28 17:00:00'),
(9, 'Error', 'Unauthorized access detected', '2024-07-28 18:00:00'),
(10, 'Warning', 'Backup failed', '2024-07-28 19:00:00')


INSERT INTO Notification (UserID, AlertID, SentDate)
VALUES 
(1, 1, '2024-07-28 10:01:00'),
(1, 2, '2024-07-28 11:01:00'),
(2, 3, '2024-07-28 12:01:00'),
(2, 4, '2024-07-28 13:01:00'),
(3, 5, '2024-07-28 14:01:00'),
(3, 6, '2024-07-28 15:01:00'),
(4, 7, '2024-07-28 16:01:00'),
(4, 8, '2024-07-28 17:01:00'),
(5, 9, '2024-07-28 18:01:00'),
(5, 10, '2024-07-28 19:01:00'),
(6, 1, '2024-07-28 10:01:00'),
(6, 3, '2024-07-28 12:01:00'),
(7, 5, '2024-07-28 14:01:00'),
(7, 7, '2024-07-28 16:01:00'),
(8, 9, '2024-07-28 18:01:00'),
(8, 2, '2024-07-28 11:01:00'),
(9, 4, '2024-07-28 13:01:00'),
(9, 6, '2024-07-28 15:01:00'),
(10, 8, '2024-07-28 17:01:00'),
(10, 10, '2024-07-28 19:01:00')
