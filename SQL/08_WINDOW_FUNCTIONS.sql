USE financial_analytics;

-- ============================================
-- 1. ROW_NUMBER()
-- ============================================
SELECT
    Order_ID,
    Product,
    Sales,
    ROW_NUMBER() OVER (ORDER BY Sales DESC) AS `row_num`
FROM financial_data;

-- ============================================
-- 2. RANK()
-- ============================================
SELECT
    Order_ID,
    Product,
    Sales,
    RANK() OVER (ORDER BY Sales DESC) AS `sales_rank`
FROM financial_data;

-- ============================================
-- 3. DENSE_RANK()
-- ============================================
SELECT
    Order_ID,
    Product,
    Sales,
    DENSE_RANK() OVER (ORDER BY Sales DESC) AS `dense_rank`
FROM financial_data;

-- ============================================
-- 4. ROW_NUMBER BY REGION
-- ============================================
SELECT
    Region,
    Order_ID,
    Sales,
    ROW_NUMBER() OVER (
        PARTITION BY Region
        ORDER BY Sales DESC
    ) AS `region_row_num`
FROM financial_data;

-- ============================================
-- 5. RANK BY REGION
-- ============================================
SELECT
    Region,
    Order_ID,
    Sales,
    RANK() OVER (
        PARTITION BY Region
        ORDER BY Sales DESC
    ) AS `region_rank`
FROM financial_data;

-- ============================================
-- 6. RUNNING TOTAL
-- ============================================
SELECT
    Order_Date,
    Sales,
    SUM(Sales) OVER (
        ORDER BY Order_Date
    ) AS `running_total`
FROM financial_data;

-- ============================================
-- 7. LAG()
-- ============================================
SELECT
    Order_Date,
    Sales,
    LAG(Sales,1) OVER (
        ORDER BY Order_Date
    ) AS `previous_sale`
FROM financial_data;

-- ============================================
-- 8. LEAD()
-- ============================================
SELECT
    Order_Date,
    Sales,
    LEAD(Sales,1) OVER (
        ORDER BY Order_Date
    ) AS `next_sale`
FROM financial_data;

-- ============================================
-- 9. HIGHEST SALE IN EACH REGION
-- ============================================
SELECT *
FROM (
    SELECT
        Region,
        Order_ID,
        Sales,
        ROW_NUMBER() OVER (
            PARTITION BY Region
            ORDER BY Sales DESC
        ) AS rn
    FROM financial_data
) t
WHERE rn = 1;

-- ============================================
-- 10. TOP 3 SALES IN EACH REGION
-- ============================================
SELECT *
FROM (
    SELECT
        Region,
        Order_ID,
        Sales,
        DENSE_RANK() OVER (
            PARTITION BY Region
            ORDER BY Sales DESC
        ) AS rnk
    FROM financial_data
) t
WHERE rnk <= 3;