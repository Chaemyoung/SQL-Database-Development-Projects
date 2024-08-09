CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    CustomerType VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    DateCreated DATETIME NOT NULL DEFAULT GETDATE(),
    IsActive BIT NOT NULL
)


CREATE TABLE Account (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    AccountNumber VARCHAR(20) NOT NULL UNIQUE,
    IFSCCode VARCHAR(15) NOT NULL,
    AccountType VARCHAR(50) NOT NULL, -- e.g., Savings, Current
    AccountBalance DECIMAL(18,2) NOT NULL,
    DateOpened DATETIME NOT NULL DEFAULT GETDATE(),
    IsActive BIT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)


CREATE TABLE Card (
    CardID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    CardNumber VARCHAR(16) NOT NULL UNIQUE,
    CardType VARCHAR(50) NOT NULL, -- e.g., Credit, Debit, Gift
    ExpirationDate DATE NOT NULL,
    SecurityCode VARCHAR(4) NOT NULL,
    DateIssued DATETIME NOT NULL DEFAULT GETDATE(),
    IsActive BIT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)


CREATE TABLE [Transaction] (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT NOT NULL,
    TransactionDate DATETIME NOT NULL DEFAULT GETDATE(),
    TransactionType VARCHAR(50) NOT NULL, -- e.g., Credit, Debit
    Amount DECIMAL(18,2) NOT NULL,
    Mode VARCHAR(50) NOT NULL, -- e.g., Online, ATM, Branch
    CreditingParty VARCHAR(100) NOT NULL,
    DebitingParty VARCHAR(100) NOT NULL,
    Status VARCHAR(50) NOT NULL, -- e.g., Success, Failed, Pending
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
)


CREATE TABLE CustomerPurchase (
    PurchaseID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    ProductType VARCHAR(50) NOT NULL, -- e.g., Loan, Insurance, Investment
    ProductDetails VARCHAR(255) NOT NULL,
    PurchaseDate DATETIME NOT NULL DEFAULT GETDATE(),
    Amount DECIMAL(18,2) NOT NULL,
    IsActive BIT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)
