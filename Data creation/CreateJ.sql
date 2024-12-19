
CREATE DATABASE JewelryFactory;

USE JewelryFactory;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Street VARCHAR(100),
    HouseNumber VARCHAR(10),
    City VARCHAR(50),
    Phone VARCHAR(15),
    TotalPurchaseAmount DECIMAL(10, 2) DEFAULT 0.00,
    CustomerStatus VARCHAR(20)
);


CREATE TABLE JewelryTypes (
    TypeCode INT PRIMARY KEY AUTO_INCREMENT,
    TypeName VARCHAR(50) NOT NULL
);


CREATE TABLE Catalog (
    JewelryID INT PRIMARY KEY AUTO_INCREMENT,
    JewelryName VARCHAR(100) NOT NULL,
    Description TEXT,
    TypeCode INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    ImageFileName VARCHAR(255),
    JewelryStatus VARCHAR(20),
    FOREIGN KEY (TypeCode) REFERENCES JewelryTypes(TypeCode)
);


CREATE TABLE Qualer (
    QualerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Code VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE PriceQuotes (
    QuoteID INT PRIMARY KEY AUTO_INCREMENT,
    QuoteDate DATE NOT NULL,
    CustomerID INT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Discount DECIMAL(10, 2) DEFAULT 0.00,
    AmountToPay DECIMAL(10, 2) NOT NULL,
    QuoteStatus VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE PriceQuoteDetails (
    QuoteDetailID INT PRIMARY KEY AUTO_INCREMENT,
    QuoteID INT NOT NULL,
    JewelryID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (QuoteID) REFERENCES PriceQuotes(QuoteID),
    FOREIGN KEY (JewelryID) REFERENCES Catalog(JewelryID)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE NOT NULL,
    QuoteID INT NOT NULL,
    InvoiceNumber VARCHAR(50),
    OrderStatus VARCHAR(20),
    FOREIGN KEY (QuoteID) REFERENCES PriceQuotes(QuoteID)
);
