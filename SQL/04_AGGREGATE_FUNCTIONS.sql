USE financial_analytics;

-- 1. Sales by Category
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM financial_data
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 2. Profit by Category
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM financial_data
GROUP BY Category
ORDER BY Total_Profit DESC;

-- 3. Sales by Salesperson
SELECT
    Salesperson,
    SUM(Sales) AS Total_Sales
FROM financial_data
GROUP BY Salesperson
ORDER BY Total_Sales DESC;

-- 4. Top 10 Customers by Sales
SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM financial_data
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 5. Average Profit by Region
SELECT
    Region,
    AVG(Profit) AS Average_Profit
FROM financial_data
GROUP BY Region;

-- 6. Total Orders by Category
SELECT
    Category,
    COUNT(*) AS Total_Orders
FROM financial_data
GROUP BY Category
ORDER BY Total_Orders DESC;

-- 7. Highest Profit by Category
SELECT
    Category,
    MAX(Profit) AS Highest_Profit
FROM financial_data
GROUP BY Category;

-- 8. Lowest Profit by Category
SELECT
    Category,
    MIN(Profit) AS Lowest_Profit
FROM financial_data
GROUP BY Category;

-- 9. Total Quantity Sold by Product
SELECT
    Product,
    SUM(Quantity) AS Total_Quantity
FROM financial_data
GROUP BY Product
ORDER BY Total_Quantity DESC;

-- 10. Revenue by Region
SELECT
    Region,
    SUM(Sales) AS Revenue
FROM financial_data
GROUP BY Region
ORDER BY Revenue DESC;