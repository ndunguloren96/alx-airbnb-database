-- perfomance.sql

-- This script demonstrates query optimization.
-- It includes an initial, potentially inefficient query and a refactored, optimized version.
-- It also includes EXPLAIN statements to analyze query performance.
-- Assumes tables: Bookings, Users, Properties, Payments.

-- ====================================================
-- Task 4: Optimize Complex Queries
-- ====================================================

-- Scenario: Retrieve details for all bookings made within a specific date range (e.g., last year),
-- including user's full name, property title, and payment amount and status.

-- ---------------------------------
-- 1. Initial (Potentially Inefficient) Query
-- ---------------------------------
-- This query uses multiple JOINs and selects all columns (*), which can be inefficient.
-- It also uses fixed date strings, which might not be dynamic.

-- Use EXPLAIN to analyze the execution plan of this query.
-- This will show how MySQL processes the query, including join order,
-- index usage, and rows examined.
EXPLAIN SELECT
    * -- Selecting all columns can be inefficient and transfer more data than needed
FROM
    Bookings b
JOIN
    Users u ON b.user_id = u.user_id
JOIN
    Properties p ON b.property_id = p.property_id
JOIN
    Payments pay ON b.booking_id = pay.booking_id
WHERE
    b.start_date >= '2023-01-01' AND b.start_date <= '2023-12-31'; -- Added AND for a specific date range

-- ---------------------------------
-- 2. Refactored (Optimized) Query
-- ---------------------------------
-- Improvements:
-- a. Select only the necessary columns instead of using `*`. This reduces data transfer.
-- b. Ensure indexes exist on the JOIN columns (`user_id`, `property_id`, `booking_id`).
--    (Note: Index creation is typically done in a separate DDL script, not here).
-- c. Use dynamic date functions for flexibility (MySQL syntax: DATE_SUB, CURDATE()).
-- d. Explicitly define a date range using AND for better filtering.

-- Use EXPLAIN to analyze the execution plan of the optimized query.
-- Compare this output with the initial query's EXPLAIN output to see improvements.
EXPLAIN SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    CONCAT(u.first_name, ' ', u.last_name) AS user_full_name,
    p.title AS property_title,
    pay.amount,
    pay.status AS payment_status
FROM
    Bookings b
JOIN
    Users u ON b.user_id = u.user_id
JOIN
    Properties p ON b.property_id = p.property_id
JOIN
    Payments pay ON b.booking_id = pay.booking_id
WHERE
    -- Filter bookings from the last year up to today
    b.start_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    AND b.start_date <= CURDATE();
    -- For PostgreSQL: b.start_date >= NOW() - INTERVAL '1 year' AND b.start_date <= NOW()
    -- For SQLite: b.start_date >= DATE('now', '-1 year') AND b.start_date <= DATE('now')

-- To further optimize, ensure you have appropriate indexes on foreign key columns
-- and frequently queried columns like `start_date`.
-- Example index creation (not part of this file, but for context):
-- CREATE INDEX idx_bookings_user_id ON Bookings (user_id);
-- CREATE INDEX idx_bookings_property_id ON Bookings (property_id);
-- CREATE INDEX idx_bookings_start_date ON Bookings (start_date);
-- CREATE INDEX idx_payments_booking_id ON Payments (booking_id);
