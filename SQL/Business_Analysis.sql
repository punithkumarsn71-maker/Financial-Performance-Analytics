USE financial_analytics;

-- =====================================================
-- 1. Overall Business KPIs
-- =====================================================

SELECT
COUNT(*) AS Total_Orders,
SUM(Sales) AS Total_Revenue,
SUM(Cost) AS Total_Cost,
SUM(Profit) AS Total_Profit,
ROUND(AVG(Sales),2) AS Average_Order_Value,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin_Percentage
FROM financial_data;

-- =====================================================
-- 2. Revenue by Region
-- =====================================================

SELECT
Region,
SUM(Sales) AS Revenue,
SUM(Profit) AS Profit
FROM financial_data
GROUP BY Region
ORDER BY Revenue DESC;

-- =====================================================
-- 3. Revenue by Category
-- =====================================================

SELECT
Category,
SUM(Sales) AS Revenue,
SUM(Profit) AS Profit
FROM financial_data
GROUP BY Category
ORDER BY Revenue DESC;

-- =====================================================
-- 4. Revenue by Product
-- =====================================================

SELECT
Product,
SUM(Sales) Revenue,
SUM(Profit) Profit
FROM financial_data
GROUP BY Product
ORDER BY Revenue DESC;

-- =====================================================
-- 5. Top 10 Customers
-- =====================================================

SELECT
Customer_Name,
SUM(Sales) Revenue,
SUM(Profit) Profit
FROM financial_data
GROUP BY Customer_Name
ORDER BY Revenue DESC
LIMIT 10;

-- =====================================================
-- 6. Top 10 Salespersons
-- =====================================================

SELECT
Salesperson,
SUM(Sales) Revenue,
SUM(Profit) Profit
FROM financial_data
GROUP BY Salesperson
ORDER BY Revenue DESC
LIMIT 10;

-- =====================================================
-- 7. Monthly Revenue
-- =====================================================

SELECT
YEAR(Order_Date) Year,
MONTH(Order_Date) Month,
SUM(Sales) Revenue,
SUM(Profit) Profit
FROM financial_data
GROUP BY YEAR(Order_Date),MONTH(Order_Date)
ORDER BY Year,Month;

-- =====================================================
-- 8. Quarterly Revenue
-- =====================================================

SELECT
YEAR(Order_Date) Year,
QUARTER(Order_Date) Quarter_No,
SUM(Sales) Revenue
FROM financial_data
GROUP BY YEAR(Order_Date),QUARTER(Order_Date)
ORDER BY Year,Quarter_No;

-- =====================================================
-- 9. Top 5 Products in each Region
-- =====================================================

SELECT *
FROM
(
SELECT
Region,
Product,
SUM(Sales) Revenue,
DENSE_RANK() OVER(PARTITION BY Region ORDER BY SUM(Sales) DESC) Ranking
FROM financial_data
GROUP BY Region,Product
) x
WHERE Ranking<=5;

-- =====================================================
-- 10. Daily Revenue Trend
-- =====================================================

SELECT
Order_Date,
SUM(Sales) Revenue
FROM financial_data
GROUP BY Order_Date
ORDER BY Order_Date;