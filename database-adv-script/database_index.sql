-- This script creates indexes on high-usage columns to improve query performance.
-- Indexes are crucial for speeding up read operations on tables with many rows.

-- ====================================================
-- Task 3: Implement Indexes for Optimization
-- ====================================================

-- An index on a foreign key column is almost always beneficial, as it speeds up JOIN operations.

-- 1. Index on the Users table.
-- Indexing the email column because it's likely to be used in WHERE clauses for user lookups.
-- The email must be unique, so a UNIQUE INDEX is appropriate.
CREATE UNIQUE INDEX idx_users_email ON Users(email);

-- 2. Index on the Bookings table.
-- Indexing foreign keys `user_id` and `property_id` to speed up joins.
-- Indexing `start_date` and `end_date` as they are often used in WHERE clauses to find bookings in a date range.
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_dates ON Bookings(start_date, end_date);

-- 3. Index on the Properties table.
-- Indexing the `host_id` foreign key.
-- Indexing `price_per_night` and `city` as they are common search/filter criteria.
CREATE INDEX idx_properties_host_id ON Properties(host_id);
CREATE INDEX idx_properties_city ON Properties(city);
CREATE INDEX idx_properties_price ON Properties(price_per_night);

-- 4. Index on the Reviews table.
-- Indexing foreign keys `property_id` and `user_id`.
CREATE INDEX idx_reviews_property_id ON Reviews(property_id);
CREATE INDEX idx_reviews_user_id ON Reviews(user_id);


