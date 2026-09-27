-- Zepto Inventory SQL Analysis
-- Database schema

CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150),
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);

-- Import data with:
-- COPY zepto(category, name, mrp, discountPercent, availableQuantity, discountedSellingPrice, weightInGms, outOfStock, quantity)
-- FROM 'C:\Users\Public\zepto_v3.csv'
-- WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');
