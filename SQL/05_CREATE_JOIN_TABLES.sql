USE financial_analytics;

-- Customers Table
CREATE TABLE customers (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Region VARCHAR(50)
);

INSERT INTO customers (Customer_Name, Region)
SELECT DISTINCT Customer_Name, Region
FROM financial_data;

-- Products Table
CREATE TABLE products (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Unit_Price DECIMAL(10,2)
);

INSERT INTO products (Product_Name, Category, Unit_Price)
SELECT DISTINCT Product, Category, Unit_Price
FROM financial_data;

-- Salespersons Table
CREATE TABLE salespersons (
    Salesperson_ID INT AUTO_INCREMENT PRIMARY KEY,
    Salesperson_Name VARCHAR(100),
    Region VARCHAR(50)
);

INSERT INTO salespersons (Salesperson_Name, Region)
SELECT DISTINCT Salesperson, Region
FROM financial_data;