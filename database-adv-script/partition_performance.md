# Advanced SQL Scripts for Airbnb Database

This directory contains advanced SQL scripts for the **ALX Airbnb project**.  
Each script demonstrates a specific SQL concept and performance improvement strategy.

---

## 📁 Scripts

### `joins_queries.sql`
Demonstrates the use of:
- `INNER JOIN`
- `LEFT JOIN`
- `FULL OUTER JOIN`

### `subqueries.sql`
Provides examples of:
- Correlated subqueries  
- Non-correlated subqueries

### `aggregations_and_window_functions.sql`
Covers:
- Aggregate functions (`SUM`, `COUNT`, `AVG`, etc.)  
- Window functions (`ROW_NUMBER()`, `RANK()`, `OVER(PARTITION BY ...)`)

### `database_index.sql`
Includes:
- Commands for creating indexes  
- Notes on performance benefits of indexing

### `perfomance.sql`
Contains:
- A complex, less-performant SQL query  
- An optimized version of the same query for improved performance

### `partitioning.sql`
Demonstrates:
- How to partition a large table  
- Benefits of partitioning in query execution time

---

## 📄 Reports

### `index_performance.md`
- Explains why specific indexes were created  
- Discusses expected improvements in query performance

### `optimization_report.md`
- Details the steps taken to optimize a complex SQL query  
- Includes before-and-after performance metrics (if applicable)

### `partition_performance.md`
- Discusses scenarios where partitioning is beneficial  
- Highlights performance benchmarks (if tested)

### `performance_monitoring.md`
- Suggests a structured strategy for ongoing database performance monitoring  
- Recommends tools, frequency, and what to track (e.g., slow query logs, execution plans)

---

## 📌 Summary

This collection is useful for:
- SQL performance tuning
- Learning best practices in query optimization
- Building scalable database systems

Applicable for relational databases like **PostgreSQL**, **MySQL**, or **MariaDB**.  
Adapt syntax as needed based on your SQL engine.
