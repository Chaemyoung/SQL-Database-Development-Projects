-- Vendor Table
CREATE TABLE Vendor (
    VendorID INT PRIMARY KEY IDENTITY(1,1),
    VendorName VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    ElectricityBoard VARCHAR(100)
)

-- Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(255),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    VendorID INT,
    CONSTRAINT FK_Customer_Vendor FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID)
)

-- Account Table
CREATE TABLE Account (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    AccountNumber VARCHAR(50) NOT NULL,
    CustomerID INT,
    VendorID INT,
    CONSTRAINT FK_Account_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT FK_Account_Vendor FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID)
)

-- Billing Table
CREATE TABLE Billing (
    BillID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT,
    BillDate DATE,
    DueDate DATE,
    UnitsConsumed DECIMAL(10, 2),
    AmountDue DECIMAL(10, 2),
    IsPaid BIT DEFAULT 0,
    CONSTRAINT FK_Billing_Account FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
)

-- Tariff Table
CREATE TABLE Tariff (
    TariffID INT PRIMARY KEY IDENTITY(1,1),
    VendorID INT,
    RatePerUnit DECIMAL(10, 2),
    EffectiveFrom DATE,
    EffectiveTo DATE,
    CONSTRAINT FK_Tariff_Vendor FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID)
)

-- CustomerFeedback Table
CREATE TABLE CustomerFeedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    VendorID INT,
    FeedbackText VARCHAR(500),
    FeedbackDate DATE,
    CONSTRAINT FK_Feedback_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT FK_Feedback_Vendor FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID)
)
