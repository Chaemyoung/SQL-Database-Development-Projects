INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, CustomerType, Email, PhoneNumber, Address, DateCreated, IsActive)
VALUES 
(1, 'John', 'Doe', '1980-01-15', 'Individual', 'john.doe@example.com', '1234567890', '123 Elm St, Springfield, IL', GETDATE(), 1),
(2, 'Jane', 'Smith', '1985-05-20', 'Individual', 'jane.smith@example.com', '0987654321', '456 Oak St, Springfield, IL', GETDATE(), 1),
(3, 'Acme Corp', '', '2000-01-01', 'Business', 'contact@acmecorp.com', '1122334455', '789 Pine St, Springfield, IL', GETDATE(), 1)


INSERT INTO Customer (CustomerID, FirstName, LastName, DateOfBirth, CustomerType, Email, PhoneNumber, Address, DateCreated, IsActive)
VALUES 
(1, 'John', 'Doe', '1980-01-15', 'Individual', 'john.doe@example.com', '1234567890', '123 Elm St, Springfield, IL', GETDATE(), 1),
(2, 'Jane', 'Smith', '1985-05-20', 'Individual', 'jane.smith@example.com', '0987654321', '456 Oak St, Springfield, IL', GETDATE(), 1),
(3, 'Acme Corp', '', '2000-01-01', 'Business', 'contact@acmecorp.com', '1122334455', '789 Pine St, Springfield, IL', GETDATE(), 1)


INSERT INTO Card (CardID, CustomerID, CardNumber, CardType, ExpirationDate, SecurityCode, DateIssued, IsActive)
VALUES 
(1, 1, '1111222233334444', 'Credit', '2025-12-31', '123', GETDATE(), 1),
(2, 2, '5555666677778888', 'Debit', '2024-11-30', '456', GETDATE(), 1),
(3, 3, '9999000011112222', 'Business', '2026-10-31', '789', GETDATE(), 1)


INSERT INTO [Transaction] (TransactionID, AccountID, TransactionDate, TransactionType, Amount, Mode, CreditingParty, DebitingParty, Status)
VALUES 
(1, 1, GETDATE(), 'Credit', 500.00, 'Online', 'Company A', 'John Doe', 'Success'),
(2, 2, GETDATE(), 'Debit', 150.00, 'ATM', 'Jane Smith', 'Supermarket', 'Success'),
(3, 3, GETDATE(), 'Credit', 2000.00, 'Branch', 'Client X', 'Acme Corp', 'Pending')


INSERT INTO CustomerPurchase (PurchaseID, CustomerID, ProductType, ProductDetails, PurchaseDate, Amount, IsActive)
VALUES 
(1, 1, 'Loan', 'Home Loan', GETDATE(), 200000.00, 1),
(2, 2, 'Insurance', 'Life Insurance', GETDATE(), 10000.00, 1),
(3, 3, 'Investment', 'Fixed Deposit', GETDATE(), 50000.00, 1)
