USE financial_analytics;

-- Sales greater than 100000
SELECT *
FROM financial_data
WHERE Sales > 100000;

-- Profit greater than 20000
SELECT *
FROM financial_data
WHERE Profit > 20000;

-- South Region Orders
SELECT *
FROM financial_data
WHERE Region = 'South';

-- Electronics Category
SELECT *
FROM financial_data
WHERE Category = 'Electronics';

-- Quantity greater than or equal to 5
SELECT *
FROM financial_data
WHERE Quantity >= 5;

-- Top 10 Highest Sales
SELECT *
FROM financial_data
ORDER BY Sales DESC
LIMIT 10;

-- Top 10 Lowest Sales
SELECT *
FROM financial_data
ORDER BY Sales ASC
LIMIT 10;

-- Top 10 Highest Profit
SELECT *
FROM financial_data
ORDER BY Profit DESC
LIMIT 10;

-- Latest Orders
SELECT *
FROM financial_data
ORDER BY Order_Date DESC
LIMIT 10;

-- Oldest Orders
SELECT *
FROM financial_data
ORDER BY Order_Date ASC
LIMIT 10;