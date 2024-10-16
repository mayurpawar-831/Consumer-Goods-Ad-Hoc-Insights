/* 1. Provide the list of markets in which customer "Atliq Exclusive" operates 
its business in the APAC region */

SELECT customer, (market) 
FROM dim_customer
WHERE customer = "AtliQ Exclusive" AND region = "APAC";


# 2. What is the percentage of unique product increase in 2021 vs. 2020?

WITH CTE1 AS (
SELECT COUNT(DISTINCT product_code) AS unique_products_2020
FROM fact_sales_monthly
WHERE fiscal_year = 2020
),
CTE2 AS (
SELECT COUNT(DISTINCT product_code) AS unique_products_2021
FROM fact_sales_monthly
WHERE fiscal_year = 2021
)
SELECT unique_products_2020, unique_products_2021,
CONCAT(ROUND((unique_products_2021-unique_products_2020)*100/unique_products_2020, 2), "%")
AS percentage_chg
FROM CTE1, CTE2;


/* 3. Provide a report with all the unique product counts for each segment and 
sort them in descending order of product counts */

SELECT segment,
COUNT(DISTINCT product_code) as product_count
FROM dim_product
GROUP BY segment
ORDER BY product_count DESC;


/* 4. Which segment had the most increase in unique products in
2021 vs 2020? */

WITH CTE1 AS (
SELECT segment,
COUNT(DISTINCT s.product_code) AS product_count_2020
FROM dim_product p
JOIN fact_sales_monthly s
USING (product_code)
WHERE fiscal_year = 2020
GROUP BY segment
),
CTE2 AS (
SELECT segment,
COUNT(DISTINCT s.product_code) AS product_count_2021
FROM dim_product p
JOIN fact_sales_monthly s
USING (product_code)
WHERE fiscal_year = 2021
GROUP BY segment
)
SELECT segment,
product_count_2020,
product_count_2021,
(product_count_2021 - product_count_2020) AS difference
FROM CTE1
JOIN CTE2
USING (segment)
ORDER BY difference DESC;


/* 5. Get the products that have the highest and lowest manufacturing costs */

WITH max_cost AS (
SELECT p.product_code, p.product,
m.manufacturing_cost
FROM dim_product p
JOIN fact_manufacturing_cost m
USING (product_code)
WHERE m.manufacturing_cost = 
		(SELECT max(manufacturing_cost) FROM fact_manufacturing_cost)
),
min_cost AS (
SELECT p.product_code, p.product,
m.manufacturing_cost
FROM dim_product p
JOIN fact_manufacturing_cost m
USING (product_code)
WHERE m.manufacturing_cost = 
		(SELECT min(manufacturing_cost) FROM fact_manufacturing_cost)
)
SELECT * FROM max_cost
UNION
SELECT * FROM min_cost;


/* 6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market */

SELECT c.customer, c.customer_code, 
CONCAT(ROUND(AVG(pi.pre_invoice_discount_pct*100),2), "%") 
AS average_discount_percentage
FROM dim_customer c
JOIN fact_pre_invoice_deductions pi
USING (customer_code)
WHERE c.market = "India" AND pi.fiscal_year = 2021
GROUP BY c.customer, c.customer_code
ORDER BY AVG(pi.pre_invoice_discount_pct*100) DESC
LIMIT 5;


/* 7.Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions */

SELECT 
MONTHNAME(s.date) AS Month, s.fiscal_year,
CONCAT(ROUND(SUM(s.sold_quantity*g.gross_price)/1000000,2)," M") AS gross_sales_amount
FROM dim_customer c
JOIN fact_sales_monthly s
USING (customer_code)
JOIN fact_gross_price g
USING (product_code)
WHERE c.customer = "AtliQ Exclusive"
GROUP BY MONTHNAME(s.date), s.fiscal_year
ORDER BY s.fiscal_year, SUM(s.sold_quantity*g.gross_price)/1000000 DESC;


/* 8.In which quarter of 2020, got the maximum total_sold_quantity? */

SELECT
CASE
	WHEN MONTH(DATE) IN (9,10,11)
THEN "Q1"
	WHEN MONTH(DATE) IN (12,1,2)
THEN "Q2"
	WHEN MONTH(DATE) IN (3,4,5)
THEN "Q3"
	WHEN MONTH(DATE) IN (6,7,8)
THEN "Q4"
	END AS Quarters,
CONCAT(ROUND(SUM(sold_quantity)/1000000,2), " M") AS total_sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarters
ORDER BY total_sold_quantity DESC;


/* 9.Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? */

WITH CTE AS (
SELECT 
c.channel,
ROUND(SUM(g.gross_price*s.sold_quantity)/1000000, 2)
AS gross_sales_mln
FROM fact_sales_monthly s
JOIN dim_customer c
USING (customer_code)
JOIN fact_gross_price g
USING (product_code)
WHERE s.fiscal_year = 2021
GROUP BY c.channel
)
SELECT channel, gross_sales_mln,
ROUND(gross_sales_mln*100/(SELECT SUM(gross_sales_mln) FROM CTE),2)
AS percentage FROM CTE
ORDER BY gross_sales_mln DESC;


/* 10.Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021 */

WITH CTE AS (
SELECT p.division, s.product_code, p.product, 
CONCAT(ROUND(SUM(s.sold_quantity)/1000000, 2), " M") as total_sold_quantity,
DENSE_RANK() OVER(PARTITION BY p.division ORDER BY SUM(s.sold_quantity) DESC)
AS rank_order
FROM dim_product p
JOIN fact_sales_monthly s
USING (product_code)
WHERE s.fiscal_year = 2021
GROUP BY p.division, s.product_code, p.product
)
SELECT * FROM CTE
WHERE rank_order <=3
ORDER BY division, rank_order;
