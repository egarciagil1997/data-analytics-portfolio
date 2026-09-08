-- Project 01 - Superstore Sales Analysis
-- SQLite
-- Analysis of sales, profit, margins, products, regions and segments


-- 1. Sales and profit by category

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin
FROM Sales
GROUP BY category
ORDER BY total_sales DESC;


-- 2. Performance by sub-category

SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin
FROM Sales
GROUP BY category, sub_category
ORDER BY profit_margin ASC;


-- 3. Products with high sales but negative profit

SELECT
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin
FROM Sales
GROUP BY product_name, category, sub_category
HAVING SUM(sales) > 5000
   AND SUM(profit) < 0
ORDER BY total_profit ASC;


-- 4. Performance by region

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin
FROM Sales
GROUP BY region
ORDER BY total_sales DESC;


-- 5. Performance by customer segment

SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin
FROM Sales
GROUP BY segment
ORDER BY total_sales DESC;


-- 6. High-discount transactions

SELECT
    category,
    COUNT(*) AS total_transactions,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_percentage,
    ROUND(AVG(profit), 2) AS avg_profit
FROM Sales
WHERE discount > 0.20
GROUP BY category
ORDER BY avg_profit ASC;


-- 7. Data Quality Case Study
-- Simulated missing and inconsistent values

SELECT
    COUNT(*) AS total_rows,
    COUNT(customer_name) AS rows_with_customer_name,
    COUNT(*) - COUNT(customer_name) AS missing_customer_name
FROM Sales_Quality_Test;


-- 8. Duplicate Records Case Study
-- Detect possible duplicate row IDs

SELECT
    row_id,
    COUNT(*) AS occurrences
FROM Sales_Duplicate_Test
GROUP BY row_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;


-- 9. Impact of duplicate records

SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM Sales_Duplicate_Test;
