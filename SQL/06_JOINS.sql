USE financial_analytics;

-- 1. INNER JOIN - Customer with Region
SELECT
    c.Customer_ID,
    c.Customer_Name,
    f.Order_ID,
    f.Product,
    f.Sales,
    f.Profit,
    c.Region
FROM financial_data f
INNER JOIN customers c
ON f.Customer_Name = c.Customer_Name;

-- 2. INNER JOIN - Product Details
SELECT
    f.Order_ID,
    p.Product_Name,
    p.Category,
    p.Unit_Price,
    f.Quantity,
    f.Sales
FROM financial_data f
INNER JOIN products p
ON f.Product = p.Product_Name;

-- 3. INNER JOIN - Salesperson Details
SELECT
    f.Order_ID,
    s.Salesperson_Name,
    s.Region,
    f.Product,
    f.Sales,
    f.Profit
FROM financial_data f
INNER JOIN salespersons s
ON f.Salesperson = s.Salesperson_Name;

-- 4. LEFT JOIN
SELECT
    c.Customer_Name,
    c.Region,
    f.Order_ID,
    f.Product,
    f.Sales
FROM customers c
LEFT JOIN financial_data f
ON c.Customer_Name = f.Customer_Name;

-- 5. RIGHT JOIN
SELECT
    c.Customer_Name,
    f.Order_ID,
    f.Product,
    f.Sales
FROM customers c
RIGHT JOIN financial_data f
ON c.Customer_Name = f.Customer_Name;

-- 6. Multiple Table JOIN
SELECT
    f.Order_ID,
    c.Customer_Name,
    s.Salesperson_Name,
    p.Product_Name,
    p.Category,
    f.Quantity,
    f.Sales,
    f.Profit
FROM financial_data f
INNER JOIN customers c
ON f.Customer_Name = c.Customer_Name
INNER JOIN products p
ON f.Product = p.Product_Name
INNER JOIN salespersons s
ON f.Salesperson = s.Salesperson_Name
LIMIT 20;