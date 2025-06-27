# Database Normalization to 3NF

## Step 1: First Normal Form (1NF)
- Ensure all tables have primary keys.
- Ensure atomic (indivisible) values in all fields.
- Eliminate repeating groups.

**Status:** Achieved. All tables have primary keys and atomic values.

## Step 2: Second Normal Form (2NF)
- Remove partial dependencies (no non-key attribute depends only on part of a composite key).

**Status:** Achieved. All non-key attributes depend on the full primary key.

## Step 3: Third Normal Form (3NF)
- Remove transitive dependencies (non-key attributes should not depend on other non-key attributes).

**Status:** Achieved. All non-key attributes directly depend on the primary key.

**Conclusion:** The schema is in 3NF. There are no redundancy or dependency issues.

