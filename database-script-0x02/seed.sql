-- Seed Users
INSERT INTO users (name, email, phone_number) VALUES
('Alice Kim', 'alice@example.com', '0712345678'),
('Brian Mwangi', 'brian@example.com', '0723456789'),
('Clara Otieno', 'clara@example.com', '0734567890');

-- Seed Properties
INSERT INTO properties (user_id, title, description, address, city, price_per_night, max_guests) VALUES
(1, 'Nairobi CBD Apartment', 'Modern 2-bedroom near city center.', '123 Kenyatta Ave', 'Nairobi', 4500.00, 4),
(2, 'Diani Beach House', 'Oceanfront 3-bedroom with pool.', 'Beach Rd', 'Diani', 8500.00, 6);

-- Seed Bookings
INSERT INTO bookings (user_id, property_id, check_in_date, check_out_date, total_price) VALUES
(3, 1, '2025-07-01', '2025-07-03', 9000.00),
(1, 2, '2025-08-10', '2025-08-13', 25500.00);

-- Seed Reviews
INSERT INTO reviews (user_id, property_id, rating, comment) VALUES
(3, 1, 5, 'Perfect stay, very clean!'),
(1, 2, 4, 'Great house but WiFi was slow.');

-- Seed Payments
INSERT INTO payments (booking_id, payment_method, amount) VALUES
(1, 'M-Pesa', 9000.00),
(2, 'Credit Card', 25500.00);
