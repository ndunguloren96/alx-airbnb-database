-- aggregations_and_window_functions.sql

-- This script demonstrates the use of aggregation and window functions.
-- Assumes the existence of Users, Bookings, and Properties tables.

-- ====================================================
-- Task 2: Apply Aggregations and Window Functions
-- ====================================================

-- 1. Aggregation with COUNT and GROUP BY: Find the total number of bookings made by each user.
-- This query groups bookings by user and counts how many bookings each user has.
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM
    Users u
JOIN
    Bookings b ON u.user_id = b.user_id
GROUP BY
    u.user_id, u.first_name, u.last_name
ORDER BY
    total_bookings DESC;

-- 2. Window Function (ROW_NUMBER): Rank properties based on the total number of bookings they have received.
-- This query first calculates the total bookings for each property in a CTE (Common Table Expression),
-- then uses the ROW_NUMBER() window function to assign a unique rank based on booking count.
-- ROW_NUMBER() assigns a sequential integer to each row within its partition (in this case, the entire result set),
-- starting with 1 for the first row in the order specified. If there are ties in total_bookings,
-- ROW_NUMBER() will assign arbitrary but unique ranks, unlike RANK() which assigns the same rank to ties.
WITH PropertyBookings AS (
    SELECT
        p.property_id,
        p.title,
        COUNT(b.booking_id) AS total_bookings
    FROM
        Properties p
    LEFT JOIN
        Bookings b ON p.property_id = b.property_id
    GROUP BY
        p.property_id, p.title
)
SELECT
    property_id,
    title,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS property_rank
FROM
    PropertyBookings
ORDER BY
    property_rank ASC; -- Order by the new rank to see the ranking clearly
