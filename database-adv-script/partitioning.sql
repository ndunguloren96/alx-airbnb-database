-- partitioning.sql

-- Drop the table if it already exists to allow for recreation with partitioning.
-- This is useful for development and testing.
DROP TABLE IF EXISTS Booking;

-- Create the Booking table with partitioning based on the start_date column.
-- We are using RANGE partitioning, which is suitable for date-based data.
-- Each partition will store data for a specific date range.
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    booking_status ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    -- Add foreign key constraints (assuming User and Property tables exist)
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    -- Partition for bookings before 2023
    PARTITION p_before_2023 VALUES LESS THAN (2023),
    -- Partition for bookings in 2023
    PARTITION p_2023 VALUES LESS THAN (2024),
    -- Partition for bookings in 2024
    PARTITION p_2024 VALUES LESS THAN (2025),
    -- Partition for bookings in 2025
    PARTITION p_2025 VALUES LESS THAN (2026),
    -- Partition for bookings in 2026 and beyond (or a future cutoff)
    PARTITION p_future VALUES LESS THAN MAXVALUE
);

-- Note: For very large tables with continuous data, you might consider
-- partitioning by month or quarter instead of year, depending on your
-- query patterns and data volume per time unit.
-- Example for monthly partitioning (if start_date was DATETIME and you wanted to use TO_DAYS):
-- PARTITION BY RANGE (TO_DAYS(start_date)) (
--     PARTITION p202301 VALUES LESS THAN (TO_DAYS('2023-02-01')),
--     PARTITION p202302 VALUES LESS THAN (TO_DAYS('2023-03-01')),
--     ...
-- );

-- Ensure that the 'User' and 'Property' tables exist for the foreign key constraints to work.
-- Example (for demonstration, you would have these defined elsewhere):
-- CREATE TABLE User (
--     user_id INT PRIMARY KEY AUTO_INCREMENT,
--     username VARCHAR(255) UNIQUE NOT NULL,
--     email VARCHAR(255) UNIQUE NOT NULL
-- );

-- CREATE TABLE Property (
--     property_id INT PRIMARY KEY AUTO_INCREMENT,
--     property_name VARCHAR(255) NOT NULL,
--     location VARCHAR(255) NOT NULL,
--     price_per_night DECIMAL(10, 2) NOT NULL
-- );

