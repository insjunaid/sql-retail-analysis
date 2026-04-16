# 📊 Retail Sales Analysis using SQL

## 🧭 Project Overview

This project presents an end-to-end **SQL-based business analysis** on a retail dataset to uncover actionable insights related to sales performance, customer behavior, and product profitability.

The objective is to simulate a real-world data analyst role by transforming raw data into meaningful business insights using structured SQL queries.

---

## 📖 Case Study: Improving Retail Profitability

### 🧩 Problem Statement

The business experiences strong sales but inconsistent profitability. Key concerns include:

* Which products are generating losses?
* How do discounts impact profit margins?
* Who are the most valuable customers?
* What trends exist in sales over time?

---

### 🔍 Approach

To address these questions:

* Raw dataset (~10,000 records) was imported into MySQL
* Data was stored in text format to handle inconsistencies safely
* SQL queries were used to transform and analyze data
* Key metrics were calculated using aggregation and casting functions

---

### 📊 Key Findings

* 📉 High discounts significantly reduce profitability
* 📦 Certain sub-categories consistently generate losses
* 🧑 A small group of customers contributes a large portion of revenue
* 📈 Sales trends fluctuate across time, indicating seasonal patterns

---

### 💡 Business Recommendations

* Optimize discount strategies to reduce profit leakage
* Focus retention efforts on high-value customers
* Reassess pricing of loss-making products
* Monitor sales trends to improve forecasting

---

## 🛠️ Tools & Technologies

* MySQL Workbench
* SQL (Structured Query Language)

---

## 🧩 Dataset

* Sample Superstore Dataset
* ~9,994 rows of transactional retail data
* Includes:

  * Sales, Profit, Discount
  * Customer & Product details
  * Order and shipping information

---

## 🧠 Data Handling Strategy

Due to inconsistencies in raw data:

* All columns were initially stored as **TEXT**
* Data types were dynamically handled using:

  * `CAST()` for numeric calculations
* This approach ensures flexibility and error-free ingestion

---

## 📊 Key SQL Analyses

### 💰 Total Sales

```sql
SELECT SUM(CAST(Sales AS DECIMAL(10,2))) AS Total_Sales
FROM orders;
```

---

### 📈 Total Profit

```sql
SELECT SUM(CAST(Profit AS DECIMAL(10,2))) AS Total_Profit
FROM orders;
```

---

### 🧑 Top 10 Customers by Revenue

```sql
SELECT Customer_Name,
       SUM(CAST(Sales AS DECIMAL(10,2))) AS Total_Sales
FROM orders
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;
```
<img width="200" height="200" alt="{23561ECF-B73F-496B-960D-BB7EC0698E0C}" src="https://github.com/user-attachments/assets/72c7a629-4605-454d-b45a-b74d59faf79d" />

---

### 📦 Profit by Sub-Category

```sql
SELECT Sub_Category,
       SUM(CAST(Profit AS DECIMAL(10,2))) AS Total_Profit
FROM orders
GROUP BY Sub_Category
ORDER BY Total_Profit ASC;
```

---

### 🚨 Loss-Making Products

```sql
SELECT Product_Name,
       SUM(CAST(Profit AS DECIMAL(10,2))) AS Total_Profit
FROM orders
GROUP BY Product_Name
HAVING Total_Profit < 0
ORDER BY Total_Profit;
```
<img width="240" height="200" alt="{B7971ED5-AF9B-4DEF-8534-E9A6E3918D5F}" src="https://github.com/user-attachments/assets/6b179379-912d-4f6a-a50b-675b31fc8972" />

---

### 📉 Discount vs Profit Analysis

```sql
SELECT Discount,
       AVG(CAST(Profit AS DECIMAL(10,2))) AS Avg_Profit
FROM orders
GROUP BY Discount
ORDER BY Discount;
```

---

### 📅 Monthly Sales Trend

```sql
SELECT 
    SUBSTRING(Order_Date, 1, 7) AS Month,
    SUM(CAST(Sales AS DECIMAL(10,2))) AS Total_Sales
FROM orders
GROUP BY Month
ORDER BY Month;
```

---

## 📈 Business Impact

This analysis enables:

* Identification of profit leakages
* Data-driven pricing decisions
* Customer-focused marketing strategies
* Improved operational efficiency

---

## 🚀 Project Outcome

This project demonstrates:

* Strong SQL querying skills
* Ability to clean and transform messy data
* Business-oriented analytical thinking
* Real-world problem-solving capability

---

## 📎 Repository Contents

* `retail_sales_analysis.sql` → All SQL queries
* `README.md` → Project documentation

---

## 👤 Author

Junaid Shariff
## 🔗 Connect with Me

- 💼 [LinkedIn](https://www.linkedin.com/in/junaid-shariff10/)

---
