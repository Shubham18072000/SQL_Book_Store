# 📚 Bookstore SQL Project

## 📘 Overview
This project explores and analyzes data from a fictional bookstore using SQL.
It includes database design, data cleaning, and analytical queries.

## 🗃️ Database Structure
- **Tables:**
  - `Books` — details about each book
  - `Customers` — customer information
  - `Orders` — purchase details
  - `Authors` — author details

## 🧮 Key Insights
- Top 5 best-selling books
- Monthly sales trend
- Most valuable customers
- Inventory and stock analysis

## 🧠 Technologies Used
- SQL (MySQL / PostgreSQL / SQLite)
- Excel (for visualization)
- DBeaver / MySQL Workbench

## 🚀 How to Use
1. Clone this repository.
2. Run `schema.sql` to create the database.
3. Run `insert_data.sql` to populate tables.
4. Execute queries from `/queries/` folder.

## 📈 Example Query
```sql
SELECT BookTitle, SUM(Quantity) AS TotalSold
FROM Orders
GROUP BY BookTitle
ORDER BY TotalSold DESC
LIMIT 5;

