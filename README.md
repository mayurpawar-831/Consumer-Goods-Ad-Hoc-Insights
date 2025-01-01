# Consumer Goods: Ad-Hoc-Insights

## Project Overview and Problem Statement

Atliq Hardware (imaginary company) is one of the leading computer hardware producers in India and well expanded in other countries too, specializes in selling computers and accessories.

The management noticed that they did not get enough insights to make quick and smart data-informed decisions. 
However, Tony Sharma (Data Analytics Director ) wants to expand their data analytics team by adding several junior data analysts. So he decided to conduct a SQL challenge which will help him understand both tech and soft skills

Now the company wants insights for 10 ad hoc / business requests.

This project is part of the data analytics boot camp at codebasics.

## Data Structure/ Data Modeling and Tools

The 'gdb023' (atliq_hardware_db) database was provided to me to work on and it includes six main tables:

1. dim_customer: contains customer-related data
1. dim_product: contains product-related data
1. fact_gross_price: contains gross price information for each product
1. fact_manufacturing_cost: contains the cost incurred in the production of each product
1. fact_pre_invoice_deductions: contains pre-invoice deductions information for each product
1. fact_sales_monthly: contains monthly sales data for each product.

Here is the Data Model that I have created in Power BI for the Visualization part -

![ad hoc data model](https://github.com/Akashsingh1916/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/assets/146354971/39b5a324-e928-44ab-802b-53afa47eb0ae)


**Tools used -** 

* I used My SQL to answer the questions 
* and Power BI for visualization

## 10 Ad-Hoc Requests and Answers:

### 1. Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.

![1 pic](https://github.com/Akashsingh1916/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/assets/146354971/86337bec-7870-4a37-8804-3abe205b7f5f)


### 2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields, unique_products_2020, unique_products_2021, percentage_chg

![2 pic](https://github.com/Akashsingh1916/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/assets/146354971/763c2c4e-18d1-45f0-80ed-ba12bdf09950)


### 3. Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. The final output contains 2 fields, segment product_count

![3 pic](https://github.com/Akashsingh1916/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/assets/146354971/8d3c2cd3-07d4-44c9-aa59-823a197f07df)


### 4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, segment product_count_2020, product_count_2021, difference

![4 pic](https://github.com/Akashsingh1916/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/assets/146354971/be3b7774-b353-412c-8d18-53683074bf27)


### 5. Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields, product_code, product, manufacturing_cost


![5 new pic](https://github.com/Akashsingh1916/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/assets/146354971/d33ad215-47ea-4e5a-b30c-4285279af6cf)


### 6. Generate a report that contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. The final output contains these fields, customer_code, customer, average_discount_percentage

![6 pic](https://github.com/Akashsingh1916/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/assets/146354971/1f03ade7-9a03-4a65-b640-a20955a2e462)


### 7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get an idea of low and high-performing months and make strategic decisions. The final report contains these columns: Month, Year, Gross sales Amount


![for 2020](https://github.com/Akashsingh1916/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/assets/146354971/644bc1ae-af83-4057-8432-bfa46952a86a)

![for 2021](https://github.com/Akashsingh1916/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/assets/146354971/d080160f-84b3-47a5-ad7a-580e1ab42ebb)


### 8. In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity, --> Quarter, total_sold_quantity

![8 pic](https://github.com/Akashsingh1916/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/assets/146354971/c0a19886-8d49-484c-93db-542d1087c072)


### 9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields --> channel, gross_sales_mln, percentage


![9 pic](https://github.com/Akashsingh1916/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/assets/146354971/d4e11a9c-5f05-4480-b81a-872a1d878085)


### 10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? The final output contains these fields, division, product_code

![10 pic](https://github.com/Akashsingh1916/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/assets/146354971/a8eca595-dd14-4751-89d3-3031c2200ef7)

============================================================================================

**NOTE-**

https://github.com/mayurpawar-831/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/blob/main/ad-hoc-requests.pdf                 In this file, you will find all the Questions 

https://github.com/mayurpawar-831/AtliQ-Hardware-Consumer-Goods-Ad-Hoc-Insights/blob/main/All%20Ad-Hoc%20SQL%20Queries.sql    In this file you will find all the Answers
