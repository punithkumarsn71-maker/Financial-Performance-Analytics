USE financial_analytics;

-- Total Sales by Region
SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM financial_data
GROUP BY Region;

-- Total Profit by Region
SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM financial_data
GROUP BY Region;

-- Number of Orders by Region
SELECT
    Region,
    COUNT(*) AS Total_Orders
FROM financial_data
GROUP BY Region;

-- Average Sales by Region
SELECT
    Region,
    AVG(Sales) AS Average_Sales
FROM financial_data
GROUP BY Region;

-- Highest Sale in each Region
SELECT
    Region,
    MAX(Sales) AS Highest_Sale
FROM financial_data
GROUP BY Region;