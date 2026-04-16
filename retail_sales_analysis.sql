CREATE DATABASE retail_db;
USE retail_db;
CREATE TABLE orders (
    Row_ID TEXT,
    Order_ID TEXT,
    Order_Date TEXT,
    Ship_Date TEXT,
    Ship_Mode TEXT,
    Customer_ID TEXT,
    Customer_Name TEXT,
    Segment TEXT,
    Country TEXT,
    City TEXT,
    State TEXT,
    Postal_Code TEXT,
    Region TEXT,
    Product_ID TEXT,
    Category TEXT,
    Sub_Category TEXT,
    Product_Name TEXT,
    Sales TEXT,
    Quantity TEXT,
    Discount TEXT,
    Profit TEXT
);

SET GLOBAL local_infile = 1;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/superstore.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM orders;

SELECT * FROM orders LIMIT 10;

-- Total Sales
SELECT SUM(CAST(Sales AS DECIMAL(10,2))) AS Total_Sales
FROM orders;

-- Total Profit
SELECT SUM(CAST(Profit AS DECIMAL(10,2))) AS Total_Profit
FROM orders;

-- Total Orders
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM orders;

-- CUSTOMER ANALYSIS
-- Top 10 Customers
SELECT Customer_Name,
       SUM(CAST(Sales AS DECIMAL(10,2))) AS Total_Sales
FROM orders
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- CATEGORY PERFORMANCE
-- Sales by Category

	SELECT Category,
       SUM(CAST(Sales AS DECIMAL(10,2))) AS Total_Sales
FROM orders
GROUP BY Category;

-- Profit by Sub-Category
SELECT Sub_Category,
       SUM(CAST(Profit AS DECIMAL(10,2))) AS Total_Profit
FROM orders
GROUP BY Sub_Category
ORDER BY Total_Profit ASC;

-- LOSS ANALYSIS
-- Loss-Making Products
SELECT Product_Name,
       SUM(CAST(Profit AS DECIMAL(10,2))) AS Total_Profit
FROM orders
GROUP BY Product_Name
HAVING Total_Profit < 0
ORDER BY Total_Profit;

-- DISCOUNT IMPACT
-- Discount vs Profit
SELECT Discount,
       AVG(CAST(Profit AS DECIMAL(10,2))) AS Avg_Profit
FROM orders
GROUP BY Discount
ORDER BY Discount;

-- TIME ANALYSIS
-- Monthly Sales Trend
SELECT 
    SUBSTRING(Order_Date, 1, 7) AS Month,
    SUM(CAST(Sales AS DECIMAL(10,2))) AS Total_Sales
FROM orders
GROUP BY Month
ORDER BY Month;
