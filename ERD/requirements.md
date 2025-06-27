
# Entity-Relationship Diagram Requirements

## Entities and Attributes

### 1. User
- id (PK)
- name
- email
- phone_number
- created_at

### 2. Property
- id (PK)
- user_id (FK → User.id)
- title
- description
- address
- city
- price_per_night
- max_guests
- created_at

### 3. Booking
- id (PK)
- user_id (FK → User.id)
- property_id (FK → Property.id)
- check_in_date
- check_out_date
- total_price
- created_at

### 4. Review
- id (PK)
- user_id (FK → User.id)
- property_id (FK → Property.id)
- rating (1 to 5)
- comment
- created_at

### 5. Payment
- id (PK)
- booking_id (FK → Booking.id)
- payment_method
- amount
- payment_date

## Relationships
- A User can own multiple Properties
- A User can book multiple Properties (via Bookings)
- A Property can be booked multiple times
- A Booking is associated with one Property and one User
- A Review is made by a User for a Property
- A Booking can have one Payment associated

> Use tools like Draw.io or Lucidchart to visually represent this structure.
