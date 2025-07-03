-- This script provides examples of correlated and non-correlated subqueries.
-- Assumes the existence of Properties, Reviews, Users, and Bookings tables.

-- =============================================
-- Task 1: Practice Subqueries
-- =============================================

-- 1. Non-Correlated Subquery: Find all properties where the average rating is greater than 4.0.
-- The inner query calculates the average rating for each property and can be run independently.
SELECT
    p.property_id,
    p.title
FROM
    Properties p
WHERE
    p.property_id IN (
        SELECT
            r.property_id
        FROM
            Reviews r
        GROUP BY
            r.property_id
        HAVING
            AVG(r.rating) > 4.0
    );

-- 2. Correlated Subquery: Find users who have made more than 3 bookings.
-- The inner query is dependent on the outer query's `u.user_id`.
-- It recounts the bookings for each user from the outer query.
SELECT
    u.user_id,
    u.first_name,
    u.last_name
FROM
    Users u
WHERE
    (
        SELECT
            COUNT(*)
        FROM
            Bookings b
        WHERE
            b.user_id = u.user_id
    ) > 3;


