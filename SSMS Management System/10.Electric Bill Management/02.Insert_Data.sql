-- Insert data into Vendor Table
INSERT INTO Vendor (VendorName, Address, ContactNumber, Email, ElectricityBoard)
VALUES 
('PowerGrid Corp', '123 Main St, City A', '123-456-7890', 'info@powergrid.com', 'Electricity Board A'),
('LightWave Energy', '456 Elm St, City B', '098-765-4321', 'support@lightwave.com', 'Electricity Board B'),
('SunVolt Solutions', '789 Oak St, City C', '555-123-4567', 'contact@sunvolt.com', 'Electricity Board C'),
('BrightSpark Utilities', '321 Maple St, City D', '444-555-6666', 'hello@brightspark.com', 'Electricity Board D'),
('Energia Networks', '654 Pine St, City E', '777-888-9999', 'care@energia.com', 'Electricity Board E')

-- Insert data into Customer Table
INSERT INTO Customer (FirstName, LastName, Address, ContactNumber, Email, VendorID)
VALUES
('John', 'Doe', '123 Maple Ave, City A', '111-222-3333', 'john.doe@example.com', 1),
('Jane', 'Smith', '456 Oak St, City B', '222-333-4444', 'jane.smith@example.com', 2),
('Mike', 'Johnson', '789 Pine St, City C', '333-444-5555', 'mike.johnson@example.com', 3),
('Sarah', 'Williams', '321 Elm St, City D', '444-555-6666', 'sarah.williams@example.com', 4),
('Emma', 'Brown', '654 Main St, City E', '555-666-7777', 'emma.brown@example.com', 5)

-- Insert data into Account Table
INSERT INTO Account (AccountNumber, CustomerID, VendorID)
VALUES
('ACC001', 1, 1),
('ACC002', 2, 2),
('ACC003', 3, 3),
('ACC004', 4, 4),
('ACC005', 5, 5)

-- Insert data into Billing Table
INSERT INTO Billing (AccountID, BillDate, DueDate, UnitsConsumed, AmountDue, IsPaid)
VALUES
(1, '2024-08-01', '2024-08-15', 150, 75.00, 0),
(2, '2024-08-01', '2024-08-15', 200, 100.00, 1),
(3, '2024-08-01', '2024-08-15', 250, 125.00, 0),
(4, '2024-08-01', '2024-08-15', 180, 90.00, 1),
(5, '2024-08-01', '2024-08-15', 220, 110.00, 0)

-- Insert data into Tariff Table
INSERT INTO Tariff (VendorID, RatePerUnit, EffectiveFrom, EffectiveTo)
VALUES
(1, 0.50, '2024-01-01', '2024-12-31'),
(2, 0.55, '2024-01-01', '2024-12-31'),
(3, 0.60, '2024-01-01', '2024-12-31'),
(4, 0.52, '2024-01-01', '2024-12-31'),
(5, 0.58, '2024-01-01', '2024-12-31')

-- Insert data into CustomerFeedback Table
INSERT INTO CustomerFeedback (CustomerID, VendorID, FeedbackText, FeedbackDate)
VALUES
(1, 1, 'Service is reliable, but billing is a bit unclear.', '2024-07-10'),
(2, 2, 'Good service, but customer support could be better.', '2024-07-11'),
(3, 3, 'Affordable pricing and timely bills.', '2024-07-12'),
(4, 4, 'Very satisfied with the service quality.', '2024-07-13'),
(5, 5, 'Happy with the service but would appreciate more clarity on tariff rates.', '2024-07-14')
