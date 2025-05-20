# 📰 News Publishing Database System

This project is a structured **Oracle PL/SQL database system** designed to simulate a real-world **news publishing and subscriber management platform**. It includes complete database modeling with data manipulation, control logic, procedures, functions, triggers, and reporting tools using **DBMS_OUTPUT**.

---

## 📁 Project Files

| File Name     | Description |
|---------------|-------------|
| `DDL.sql`     | Defines all tables and constraints (primary keys, foreign keys) |
| `DML.sql`     | Inserts sample data into the tables and performs select queries |
| `PLSQL.sql`   | Demonstrates PL/SQL blocks, procedures, functions, cursors, arrays, conditional logic |
| `Trigger.sql` | Contains database triggers to maintain referential integrity |

---

## 🛠️ Database Schema Overview

### Tables:
- **News**: Contains news articles with `news_id`, `title`, `details`, `topic_id`
- **Topic**: Stores topics with `topic_id` and `title`
- **Feedback**: Records feedback with `news_id` and `feedback` text
- **Subscribers**: Holds subscriber data including `sub_id`, `sub_name`, `sub_age`, and `sub_type`

### Relationships:
- One-to-many from `Topic` → `News`
- One-to-many from `News` → `Feedback`

---

## 🧪 Core Functionalities & Features

### ✅ DDL (Schema Creation)
- Table creation with appropriate data types
- Foreign key relationships defined between entities

### 📦 DML (Data Manipulation)
- Inserts sample records into all tables
- Joins between tables to fetch:
  - News details with topic titles
  - Feedback alongside associated news

---

## 🔁 PL/SQL Features

### 📌 Variable Declaration & Data Fetching
- Using `%TYPE` to declare variables with table data types
- Using `%ROWTYPE` to fetch and store an entire row from a table

### 📍 Cursor Handling
- Explicit cursors to fetch multiple rows
- Cursor `%FOUND` and `%ROWCOUNT` used in loops

### 🧮 Arrays (VARRAY)
- Fixed-size and dynamic VARRAYs to store and print topic titles
- `EXTEND()` method usage for dynamic population

### 🔄 Loops & Control Structures
- `FOR`, `WHILE`, `IF/ELSE`, and `ELSIF` logic to categorize subscriber types

### 🔧 Procedures
- `GreaterAge(IN)` – Displays subscribers older than a given age
- `maxAge(OUT)` – Returns name and age of the oldest subscriber

### 🧮 Functions
- `higher(IN OUT)` – Counts subscribers older than a given age using `IN OUT` parameters

---

## ⚙️ Triggers

### `try`
- **AFTER UPDATE** on `Topic`
- Updates all related `News` entries with the new `topic_id`

### `try2`
- **BEFORE DELETE** on `News`
- Updates `Feedback` records to maintain consistency when news is removed

---

## 📊 Sample Use Cases

- A journalist updates a topic title → all related news retain proper linkage
- A subscriber checks how many are in the "child", "adult", or "senior citizen" category
- The admin fetches the name of the oldest subscriber in the system
- Editors retrieve how many news items exist under a given topic

---

## 🧠 Learning Outcomes

- Deep understanding of Oracle SQL and PL/SQL constructs
- Efficient use of triggers and procedures for data integrity
- Hands-on with cursor-based processing and conditional logic
- Practical experience with `IN`, `OUT`, and `IN OUT` parameter passing

---

## 🏁 How to Run

1. Use any Oracle-supported SQL environment (SQL*Plus, Oracle SQL Developer)
2. Run `DDL.sql` to create tables and constraints
3. Run `DML.sql` to insert data and test queries
4. Run `PLSQL.sql` to test procedures, functions, loops, arrays, and cursors
5. Run `Trigger.sql` to enable automatic update handling on related tables

---

## 📌 Author Notes

This project was built as part of a **Database Systems course** to demonstrate practical Oracle SQL, PL/SQL, and trigger-based programming concepts with a real-world schema.


