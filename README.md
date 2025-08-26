# 📚 Bookstore SQL Project

![SQL](https://img.shields.io/badge/SQL-Database-blue?style=for-the-badge&logo=mysql)
![Status](https://img.shields.io/badge/Status-Complete-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

*A comprehensive SQL project for managing and analyzing bookstore data with complex queries and business insights*

---

## 🎯 **Project Overview**

This project demonstrates advanced SQL querying capabilities through a bookstore management system. It includes comprehensive data analysis, from basic CRUD operations to complex analytical queries that provide valuable business insights.

### 🌟 **Key Features**

- 📊 **Complete Database Analysis** - Full exploration of books, customers, and orders
- 🔍 **Advanced Query Techniques** - JOINs, GROUP BY, aggregations, and subqueries  
- 💰 **Business Intelligence** - Revenue analysis, customer behavior, and inventory management
- 📈 **Performance Metrics** - Sales trends, popular genres, and stock optimization

---

## 🏗️ **Database Structure**

### 📖 **Books Table**
```sql
- Book_id (Primary Key)
- Title
- Author  
- Genre
- Price
- Stock
- Published (Year)
```

### 👥 **Customers Table**
```sql
- Customer_id (Primary Key)
- Name
- City
- Country
```

### 🛒 **Orders Table**
```sql
- Order_id (Primary Key)
- Customer_id (Foreign Key)
- Book_id (Foreign Key)
- Quantity
- Order_date
- Total_amount
```

---

## 📁 **Project Files**

```
📦 Bookstore_SQL_Project/
├── 📄 README.md
├── 📄 LICENSE
├── 📄 .gitignore
├── 🗄️ database_schema.sql
└── 📝 queries.sql
```

### File Descriptions:

- **`README.md`** - Project documentation and overview
- **`LICENSE`** - MIT License file
- **`.gitignore`** - Git ignore rules for the project
- **`database_schema.sql`** - Database structure and table creation scripts
- **`queries.sql`** - All SQL queries from basic to advanced

---

## 🚀 **Query Categories**

### 🔰 **Basic Queries (1-11)**

| Query # | Description | Key Learning |
|---------|-------------|--------------|
| **1** | Fiction books retrieval | `WHERE` clause filtering |
| **2** | Books published after 1950 | Date comparisons |
| **3** | Canadian customers | String matching |
| **4** | November 2023 orders | Date range queries |
| **5** | Total book stock | `SUM()` aggregation |
| **6** | Most expensive book | `ORDER BY` with `LIMIT` |
| **7** | Multi-quantity orders | Conditional filtering |
| **8** | High-value orders ($20+) | Numeric comparisons |
| **9** | Available genres | `DISTINCT` selections |
| **10** | Lowest stock books | Sorting and ranking |
| **11** | Total revenue calculation | Business metrics |

### 🎯 **Advanced Queries**

**📊 Genre Analysis**
```sql
-- Total books sold per genre
SELECT b.genre, SUM(o.quantity) as total_sold_books
FROM orders o 
JOIN books b ON o.book_id = b.Book_id
GROUP BY b.genre;
```
*🎓 Learning Focus: JOINs, GROUP BY, Aggregations*

**👑 Customer Insights**
```sql
-- Customers with 2+ orders
SELECT o.customer_id, c.name, COUNT(o.order_id) as order_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(order_id) >= 2;
```
*🎓 Learning Focus: HAVING clause, Customer segmentation*

**📈 Sales Performance**
```sql
-- Most frequently ordered book
SELECT o.book_id, b.title, COUNT(o.order_id) as order_count
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY o.book_id
ORDER BY order_count DESC LIMIT 1;
```
*🎓 Learning Focus: Performance analysis, Ranking*

**📦 Inventory Management**
```sql
-- Stock remaining after orders
SELECT b.book_id, b.title, b.stock, 
       COALESCE(SUM(o.quantity),0) as order_quantity,
       b.stock - COALESCE(SUM(o.quantity),0) as remaining_quantity
FROM books b
LEFT JOIN orders o ON b.Book_id = o.book_id
GROUP BY b.Book_id
ORDER BY b.Book_id;
```
*🎓 Learning Focus: LEFT JOINs, COALESCE, Inventory tracking*

---

## 💡 **Business Insights Generated**

### 📊 **Sales Analytics**
- 🏆 **Best Selling Genres** - Identify most popular book categories
- 💰 **Revenue Streams** - Track total and genre-wise revenue
- 📚 **Author Performance** - Books sold per author analysis

### 👥 **Customer Analytics** 
- 🌟 **VIP Customers** - Identify high-spending customers
- 🗺️ **Geographic Distribution** - Customer location analysis
- 🛍️ **Purchase Behavior** - Order frequency and patterns

### 📦 **Inventory Management**
- ⚠️ **Low Stock Alerts** - Books requiring restocking
- 💎 **Premium Products** - High-value book analysis  
- 📈 **Stock Optimization** - Remaining inventory calculations

---

## 🛠️ **Technical Skills Demonstrated**

| **SQL Concept** | **Complexity** | **Usage** |
|-----------------|----------------|-----------|
| `SELECT`, `WHERE` | 🟢 Basic | Data retrieval & filtering |
| `JOIN` Operations | 🟡 Intermediate | Multi-table relationships |
| `GROUP BY`, `HAVING` | 🟡 Intermediate | Data aggregation |
| `Subqueries` | 🔴 Advanced | Complex data analysis |
| `Window Functions` | 🔴 Advanced | Ranking & analytics |

---

## 🚀 **Getting Started**

### 📋 **Prerequisites**
- MySQL 5.7+ or PostgreSQL 10+
- SQL client (MySQL Workbench, pgAdmin, etc.)

### ⚡ **Quick Setup**

1. **Clone Repository**
   ```bash
   git clone https://github.com/yourusername/Bookstore_SQL_Project.git
   cd Bookstore_SQL_Project
   ```

2. **Setup Database**
   ```sql
   -- Create database
   CREATE DATABASE bookstore_db;
   USE bookstore_db;
   
   -- Run the schema file
   SOURCE database_schema.sql;
   ```

3. **Execute Queries**
   ```sql
   -- Run all queries
   SOURCE queries.sql;
   ```

---

## 📊 **Sample Query Results**

### 🏆 **Top Genre Performance**
```
Genre     | Books Sold | Revenue
----------|------------|--------
Fiction   | 245        | $4,890
Fantasy   | 198        | $3,960
Mystery   | 167        | $3,340
```

### 👑 **VIP Customer Analysis**
```
Customer    | Total Orders | Total Spent
------------|------------- |------------
John Smith  | 8            | $156.50
Sarah Wilson| 6            | $134.75
Mike Johnson| 5            | $98.25
```

---

## 🎯 **Query Complexity Progression**

**Level 1: Basic Operations** → **Level 2: Filtering & Sorting** → **Level 3: Aggregations** → **Level 4: JOINs** → **Level 5: Advanced Analytics**

1. 🔰 Simple SELECT statements
2. 🔍 WHERE clause conditions  
3. 📊 SUM, COUNT, AVG functions
4. 🔗 INNER/LEFT JOIN operations
5. 🎯 Complex business logic

---

## 🔧 **Advanced Features**

### 🎨 **Query Optimization Tips**
- ⚡ Use indexes on frequently queried columns
- 🔍 Optimize JOIN conditions
- 📊 Use EXPLAIN to analyze query performance
- 💾 Consider partitioning for large datasets

### 🚀 **Scaling Considerations**
- 📈 Implement data archiving for old orders
- 🔄 Add stored procedures for complex operations  
- 📊 Create views for commonly used query patterns
- ⚡ Optimize for read-heavy workloads

---

## 🤝 **Contributing**

Contributions are welcome! Please feel free to submit a Pull Request.

### 📝 **How to Contribute**
1. 🍴 Fork the project
2. 🌟 Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. ✅ Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. 📤 Push to the branch (`git push origin feature/AmazingFeature`)
5. 🔄 Open a Pull Request

---
 

## 📜 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### ⭐ **If you found this project helpful, please give it a star!** ⭐

*Made with ❤️ and SQL*
