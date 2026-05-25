USE sales_dashboard;
-- 1. Total Sales and Profit
SELECT ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit FROM sales;

-- 2. Sales by Region
SELECT region, ROUND(SUM(sales), 2) AS total_sales FROM sales GROUP BY region ORDER BY total_sales DESC;

-- 3. Profit by Category
SELECT category,ROUND(SUM(profit), 2) AS total_profit FROM sales GROUP BY category ORDER BY total_profit DESC;

-- 4. Monthly Sales Trend
SELECT DATE_FORMAT(STR_TO_DATE(order_date, '%d-%m-%Y'), '%Y-%m') AS month,ROUND(SUM(sales), 2) AS monthly_sales
FROM sales WHERE STR_TO_DATE(order_date, '%d-%m-%Y') IS NOT NULL GROUP BY month ORDER BY month;

-- 5. Top 10 Products
SELECT product_name,ROUND(SUM(sales), 2) AS total_sales FROM sales GROUP BY product_name ORDER BY total_sales DESC LIMIT 10;

-- 6. Top 10 Customers
SELECT customer_name, ROUND(SUM(sales), 2) AS total_sales FROM sales GROUP BY customer_name ORDER BY total_sales DESC LIMIT 10;