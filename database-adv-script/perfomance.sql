-- This script demonstrates query optimization.
-- It includes an initial, potentially inefficient query and a refactored, optimized version.
-- Assumes tables: Bookings, Users, Properties, Payments.

-- ====================================================
-- Task 4: Optimize Complex Queries
-- ====================================================

-- Scenario: Retrieve details for all bookings made in the last year,
-- including user's full name, property title, and payment amount and status.

-- ---------------------------------
-- 1. Initial (Potentially Inefficient) Query
-- ---------------------------------
-- This query uses multiple JOINs. Without proper indexing or by selecting
-- unnecessary columns (*), it can be slow.
SELECT
    * -- Selecting all columns can be inefficient
FROM
    Bookings b
JOIN
    Users u ON b.user_id = u.user_id
JOIN
    Properties p ON b.property_id = p.property_id
JOIN
    Payments pay ON b.booking_id = pay.booking_id
WHERE
    b.start_date >= '2023-01-01'; -- Using a magic string for date

-- ---------------------------------
-- 2. Refactored (Optimized) Query
-- ---------------------------------
-- Improvements:
-- a. Select only the necessary columns instead of using `*`. This reduces data transfer.
-- b. Ensure indexes exist on the JOIN columns (`user_id`, `property_id`, `booking_id`).
-- c. Use a more explicit date function for clarity and potential optimization.
SELECT
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
    b.start_date >= DATE('now', '-1 year'); -- Using a dynamic date range (SQLite syntax)
    -- For PostgreSQL: b.start_date >= NOW() - INTERVAL '1 year'
    -- For MySQL: b.start_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)


