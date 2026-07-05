USE financial_analytics;

-- Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM financial_data;

-- Total Profit
SELECT SUM(Profit) AS Total_Profit
FROM financial_data;

-- Total Cost
SELECT SUM(Cost) AS Total_Cost
FROM financial_data;

-- Average Sales
SELECT AVG(Sales) AS Average_Sales
FROM financial_data;

-- Highest Sale
SELECT MAX(Sales) AS Highest_Sale
FROM financial_data;

-- Lowest Sale
SELECT MIN(Sales) AS Lowest_Sale
FROM financial_data;

-- Total Orders
SELECT COUNT(*) AS Total_Orders
FROM financial_data;