USE financial_analytics;

-- 1. Categories with Sales greater than 2 Crore
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM financial_data
GROUP BY Category
HAVING SUM(Sales) > 20000000;

-- 2. Regions with Profit greater than 30 Lakhs
SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM financial_data
GROUP BY Region
HAVING SUM(Profit) > 3000000;

-- 3. Salespersons with more than 500 Orders
SELECT
    Salesperson,
    COUNT(*) AS Orders_Count
FROM financial_data
GROUP BY Salesperson
HAVING COUNT(*) > 500;

-- 4. Customers whose total purchase is above Average Sales
SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM financial_data
GROUP BY Customer_Name
HAVING SUM(Sales) >
(
    SELECT AVG(Sales)
    FROM financial_data
);

-- 5. Orders having Sales greater than Overall Average Sales
SELECT *
FROM financial_data
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM financial_data
);

-- 6. Highest Sale
SELECT *
FROM financial_data
WHERE Sales =
(
    SELECT MAX(Sales)
    FROM financial_data
);

-- 7. Highest Profit
SELECT *
FROM financial_data
WHERE Profit =
(
    SELECT MAX(Profit)
    FROM financial_data
);

-- 8. Products with Sales greater than Average Product Sales
SELECT
    Product,
    SUM(Sales) AS Total_Sales
FROM financial_data
GROUP BY Product
HAVING SUM(Sales) >
(
    SELECT AVG(Sales)
    FROM financial_data
);

-- 9. Customers from the same Region as 'Rahul Sharma'
SELECT *
FROM financial_data
WHERE Region =
(
    SELECT Region
    FROM financial_data
    WHERE Customer_Name = 'Rahul Sharma'
    LIMIT 1
);

-- 10. Top Performing Categories
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM financial_data
GROUP BY Category
ORDER BY Total_Profit DESC;