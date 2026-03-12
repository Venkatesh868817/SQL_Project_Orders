# 📊 SQL Data Analysis Project – Orders Dataset

## 📌 Project Overview

This project demonstrates **data analysis using SQL** on an Orders dataset.
The dataset contains information about customer orders including **sales, profit, region, shipping details, product categories, and customer information**.

The main objective of this project is to practice **SQL querying, filtering, aggregation, grouping, and data analysis techniques** using a relational database.

---

## 📂 Dataset Description

The dataset contains order-level and product-level information with the following fields:

* `row_id`
* `order_id`
* `order_date`
* `ship_date`
* `ship_mode`
* `customer_id`
* `customer_name`
* `segment`
* `country`
* `city`
* `state`
* `postal_code`
* `region`
* `product_id`
* `product_name`
* `category`
* `sub_category`
* `sales`
* `quantity`
* `discount`
* `profit`

---

## ⚙️ Technologies Used

* SQL
* MySQL
* MySQL Workbench

---

## 📈 SQL Concepts Implemented

This project covers many important SQL concepts such as:

### 1️⃣ Data Filtering

Using `WHERE` clause to filter data based on conditions.
Examples:

* Orders within a date range
* Orders from specific regions
* Orders with negative profit

### 2️⃣ Pattern Matching

Using `LIKE` operator to search specific patterns in customer names.

Example:

```sql
SELECT * 
FROM orders
WHERE customer_name LIKE '_a_d%';
```

---

### 3️⃣ Aggregation Functions

Using functions like:

* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`
* `COUNT()`

Example:

```sql
SELECT category,
SUM(profit) AS total_profit
FROM orders
GROUP BY category;
```

---

### 4️⃣ Grouping Data

Using `GROUP BY` to summarize data by category, region, or city.

Example:

```sql
SELECT region,
SUM(sales) AS total_sales
FROM orders
GROUP BY region;
```

---

### 5️⃣ Conditional Aggregation

Analyzing sales by year using `CASE` statements.

Example:

```sql
SELECT category,
SUM(CASE WHEN YEAR(order_date)=2019 THEN sales ELSE 0 END) AS total_sales_2019,
SUM(CASE WHEN YEAR(order_date)=2020 THEN sales ELSE 0 END) AS total_sales_2020
FROM orders
GROUP BY category;
```

---

### 6️⃣ Data Analysis Queries

Some analytical queries implemented in this project:

* Category wise sales
* Region wise sales
* Top cities by shipping time
* Orders containing only one product
* Number of occurrences of characters in customer names
* Extracting first name and last name from `customer_name`

Example:

```sql
SELECT customer_name,
SUBSTRING_INDEX(customer_name,' ',1) AS first_name
FROM orders;
```

---

### 7️⃣ Shipping Analysis

Calculate the number of days between order date and ship date.

```sql
SELECT order_id,
DATEDIFF(ship_date, order_date) AS shipping_days
FROM orders;
```

---

### 8️⃣ Hierarchical Sales Analysis

Sales analysis across different hierarchy levels such as:

* Category
* Sub-category
* Ship mode

---

## 📊 Sample Business Questions Answered

This project answers several business-related questions such as:

* Which category generates the highest sales?
* Which region has the most orders?
* What are the top cities based on shipping time?
* Which orders contain only one product?
* How does sales vary by category across different years?

---

## 🚀 Learning Outcomes

Through this project, the following skills were practiced:

* Writing optimized SQL queries
* Performing data aggregation and grouping
* Data cleaning and transformation
* Extracting insights from structured datasets
* Implementing analytical SQL queries

---

## 🔗 Connect With Me

If you found this project useful or would like to connect:

**LinkedIn:**
https://www.linkedin.com/in/sangem-venkatesh-7ba284301/

---
