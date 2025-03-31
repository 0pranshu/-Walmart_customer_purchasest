create table customer_purchases
(
Customer_ID varchar (50),
Age int,
Gender	varchar (50),
City	varchar (50),
Category	varchar (50),
Product_Name	varchar (50),
Purchase_Date	Date ,
Purchase_Amount	float,
Payment_Method	varchar (50),
Discount_Applied	varchar (50),
Rating	int ,
Repeat_Customer varchar (50)

);

select * from customer_purchases

--Data Cleaning  (Check Null )
select Customer_ID from customer_purchases
where Customer_ID = null;
select age from customer_purchases
where Age = null;
select Gender from customer_purchases
where Gender = null;
select City from customer_purchases
where City = null;

-- Solve Business
-- * Customer Segmentation & Behavior Analysis

-- 1.Find the top 5 customers who have spent the most money.
SELECT Customer_ID, SUM(Purchase_Amount) AS total_spent  
FROM customer_purchases  
GROUP BY Customer_ID  
ORDER BY total_spent DESC  
LIMIT 5;

-- 2.Calculate total purchase amounts grouped by age group and gender.
SELECT age, gender, SUM(Purchase_Amount) AS total_purchase  
FROM customer_purchases  
GROUP BY age, gender  
ORDER BY age ASC, gender ASC;  -- Sorting first by age, then by gender


-- 3.Identify customers who have made repeat purchases.
SELECT Customer_ID, COUNT(*) AS purchase_count  
FROM customer_purchases  
GROUP BY Customer_ID  
HAVING COUNT(*) > 1  
ORDER BY purchase_count DESC;

-- * Sales & Revenue Insights
-- 4.Find the top 3 product categories that contribute the most to total sales.
select category , SUM(Purchase_Amount) AS total_purchase  from customer_purchases
group by category
order by total_purchase desc
limit 3

-- 5.Analyze the total revenue generated per month.
SELECT 
    EXTRACT(YEAR FROM Purchase_Date) AS year,
    EXTRACT(MONTH FROM Purchase_Date) AS month,
    SUM(Purchase_Amount) AS total_revenue
FROM customer_purchases
GROUP BY year, month
ORDER BY year ASC, month ASC;

-- *Product Performance Analysis
-- 7.Retrieve the top 5 highest-rated products.
SELECT Product_Name, ROUND(AVG(Rating), 2) AS avg_rating  
FROM customer_purchases  
GROUP BY Product_Name  
ORDER BY avg_rating DESC  
LIMIT 5;

-- 8.Find the most frequently purchased product in each category.
SELECT DISTINCT ON (Category) Category, Product_Name, COUNT(*) AS purchase_count
FROM customer_purchases
GROUP BY Category, Product_Name
ORDER BY Category, purchase_count DESC;


-- 9.Identify the city with the highest total sales.
SELECT City, SUM(Purchase_Amount) AS total_sales  
FROM customer_purchases  
GROUP BY City  
ORDER BY total_sales DESC  
LIMIT 1;


-- *Payment & Transaction Insights
-- 10.Determine the most commonly used payment method.

SELECT Payment_Method, COUNT(*) AS usage_count  
FROM customer_purchases  
GROUP BY Payment_Method  
ORDER BY usage_count DESC  
LIMIT 1;

-- 11.Find the average purchase amount for each payment method.


SELECT Payment_Method, 
       ROUND(CAST(AVG(Purchase_Amount) AS NUMERIC), 2) AS avg_purchase_amount  
FROM customer_purchases  
GROUP BY Payment_Method  
ORDER BY avg_purchase_amount DESC;

-- 12.Identify the payment method associated with the highest transaction values.
SELECT Payment_Method, 
       SUM(Purchase_Amount) AS total_transaction_value  
FROM customer_purchases  
GROUP BY Payment_Method  
ORDER BY total_transaction_value DESC  
LIMIT 1;

-- *Customer Satisfaction & Experience
-- 13.Find the average rating given by customers for each product category.
SELECT Category, 
       ROUND(AVG(Rating), 2) AS avg_rating  
FROM customer_purchases  
GROUP BY Category  
ORDER BY avg_rating DESC;

-- 14.Identify the top 3 cities with the highest average customer ratings.
SELECT City, 
       ROUND(AVG(Rating), 2) AS average_customer_ratings  
FROM customer_purchases  
GROUP BY City  
ORDER BY average_customer_ratings DESC  
LIMIT 3;


-- 15.Analyze how discounts impact repeat purchases.
SELECT Repeat_Customer, 
       ROUND(AVG(Discount_Applied), 2) AS avg_discount  
FROM customer_purchases  
GROUP BY Repeat_Customer  
ORDER BY avg_discount DESC;


