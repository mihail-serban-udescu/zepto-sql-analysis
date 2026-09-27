-- Zepto Inventory SQL Analysis
-- All analysis queries
-- Database: zepto_analysis | Table: zepto (3732 rows)

-- Q1: Total number of products
SELECT COUNT(*) AS total_products FROM zepto;

-- Q2: Products per category
SELECT category, COUNT(*) AS num_products
FROM zepto
GROUP BY category
ORDER BY num_products DESC;

-- Q3: Top 10 categories by inventory value
SELECT category,
       SUM(availableQuantity * discountedSellingPrice) AS inventory_value
FROM zepto
WHERE outOfStock = FALSE
GROUP BY category
ORDER BY inventory_value DESC
LIMIT 10;

-- Q4: Top 10 products by discount
SELECT name, category, mrp, discountPercent, discountedSellingPrice
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

-- Q5: In stock vs out of stock
SELECT outOfStock, COUNT(*) AS count
FROM zepto
GROUP BY outOfStock;

-- Q6: Average price per gram by category
SELECT category,
       ROUND(AVG(discountedSellingPrice / NULLIF(weightInGms, 0)), 2) AS avg_price_per_gram
FROM zepto
WHERE weightInGms > 0
GROUP BY category
ORDER BY avg_price_per_gram DESC;

-- Q7: Products requiring urgent restock (< 10 units)
SELECT name, category, availableQuantity
FROM zepto
WHERE outOfStock = FALSE
  AND availableQuantity < 10
ORDER BY availableQuantity ASC
LIMIT 20;

-- Q8: Average discount per category
SELECT category,
       ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC;
