# -Walmart_customer_purchasest
Walmart Customer Purchases Analysis

📌 Project Overview

This project analyzes Walmart's customer purchase data using PostgreSQL. It aims to uncover insights into customer behavior, sales trends, product performance, and payment preferences.

📊 Dataset Information

Database Name: Walmart_customer_purchasest

Table Name: customer_purchases

Columns:

Customer_ID, Age, Gender, City, Category, Product_Name, Purchase_Date, Purchase_Amount, Payment_Method, Discount_Applied, Rating, Repeat_Customer

📈 Business Problems & SQL Solutions

1️⃣ Customer Segmentation & Behavior Analysis

🔹 Identify top customers by spending

SELECT Customer_ID, SUM(Purchase_Amount) AS total_spent  
FROM customer_purchases  
GROUP BY Customer_ID  
ORDER BY total_spent DESC  
LIMIT 5;

🔹 Calculate total purchases by age group and gender

SELECT age, gender, SUM(Purchase_Amount) AS total_purchase  
FROM customer_purchases  
GROUP BY age, gender  
ORDER BY age ASC, gender ASC;

🔹 Find customers who made repeat purchases

SELECT Customer_ID, COUNT(*) AS purchase_count  
FROM customer_purchases  
GROUP BY Customer_ID  
HAVING COUNT(*) > 1  
ORDER BY purchase_count DESC;

2️⃣ Sales & Revenue Insights

🔹 Top 3 product categories by total sales

SELECT category, SUM(Purchase_Amount) AS total_purchase  
FROM customer_purchases  
GROUP BY category  
ORDER BY total_purchase DESC  
LIMIT 3;

🔹 Monthly revenue analysis

SELECT EXTRACT(YEAR FROM Purchase_Date) AS year,  
       EXTRACT(MONTH FROM Purchase_Date) AS month,  
       SUM(Purchase_Amount) AS total_revenue  
FROM customer_purchases  
GROUP BY year, month  
ORDER BY year ASC, month ASC;

3️⃣ Product Performance Analysis

🔹 Top 5 highest-rated products

SELECT Product_Name, ROUND(AVG(Rating), 2) AS avg_rating  
FROM customer_purchases  
GROUP BY Product_Name  
ORDER BY avg_rating DESC  
LIMIT 5;

🔹 Most frequently purchased product in each category

SELECT DISTINCT ON (Category) Category, Product_Name, COUNT(*) AS purchase_count  
FROM customer_purchases  
GROUP BY Category, Product_Name  
ORDER BY Category, purchase_count DESC;

🔹 City with the highest total sales

SELECT City, SUM(Purchase_Amount) AS total_sales  
FROM customer_purchases  
GROUP BY City  
ORDER BY total_sales DESC  
LIMIT 1;

4️⃣ Payment & Transaction Insights

🔹 Most commonly used payment method

SELECT Payment_Method, COUNT(*) AS usage_count  
FROM customer_purchases  
GROUP BY Payment_Method  
ORDER BY usage_count DESC  
LIMIT 1;

🔹 Average purchase amount per payment method

SELECT Payment_Method, ROUND(CAST(AVG(Purchase_Amount) AS NUMERIC), 2) AS avg_purchase_amount  
FROM customer_purchases  
GROUP BY Payment_Method  
ORDER BY avg_purchase_amount DESC;

🔹 Payment method with highest transaction values

SELECT Payment_Method, SUM(Purchase_Amount) AS total_transaction_value  
FROM customer_purchases  
GROUP BY Payment_Method  
ORDER BY total_transaction_value DESC  
LIMIT 1;

5️⃣ Customer Satisfaction & Experience

🔹 Average rating per product category

SELECT Category, ROUND(AVG(Rating), 2) AS avg_rating  
FROM customer_purchases  
GROUP BY Category  
ORDER BY avg_rating DESC;

🔹 Top 3 cities with highest average customer ratings

SELECT City, ROUND(AVG(Rating), 2) AS average_customer_ratings  
FROM customer_purchases  
GROUP BY City  
ORDER BY average_customer_ratings DESC  
LIMIT 3;

🔹 Analyzing how discounts impact repeat purchases

SELECT Repeat_Customer, ROUND(AVG(Discount_Applied), 2) AS avg_discount  
FROM customer_purchases  
GROUP BY Repeat_Customer  
ORDER BY avg_discount DESC;

🛠️ Setup Instructions

Clone the Repository

git clone https://github.com/yourusername/walmart-analysis.git
cd walmart-analysis

Load Data into PostgreSQL

Use customer_purchases.sql to create and import the dataset.

Run SQL Queries

Execute queries in queries.sql to analyze the dataset.

🎯 Insights & Findings

High-value customers contribute significantly to revenue.

Discounts influence repeat purchases but need optimization.

Certain product categories dominate total sales.

Customer ratings vary across cities, affecting regional performance.

Payment preferences impact transaction values and customer spending.

📢 Contributing

Feel free to fork the repository and contribute by improving queries or adding new insights.

📜 License

This project is open-source and available under the MIT License.
