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

-- 2. Window Function (RANK): Rank properties based on the total number of bookings they have received.
-- This query first calculates the total bookings for each property in a CTE (Common Table Expression),
-- then uses the RANK() window function to assign a rank based on booking count.
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
    RANK() OVER (ORDER BY total_bookings DESC) AS property_rank
FROM
    PropertyBookings;


