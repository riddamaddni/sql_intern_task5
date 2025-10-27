-- CREATE DATABASE PharmaPlus;

USE PharmaPlus;


-- CREATE TABLE Manufacturers (
--     manufacturer_id INT PRIMARY KEY,
--     manufacturer_name VARCHAR(100) NOT NULL,
--     country VARCHAR(50)
-- );

-- CREATE TABLE Products (
--     product_id INT PRIMARY KEY,
--     product_name VARCHAR(100) NOT NULL,
--     category VARCHAR(50),
--     price DECIMAL(10, 2),
--     manufacturer_id INT, -- Foreign Key
--     FOREIGN KEY (manufacturer_id) REFERENCES Manufacturers(manufacturer_id)
-- );

-- CREATE TABLE SalesReps (
--     rep_id INT PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     region VARCHAR(50),
--     manager_id INT, -- Self-referencing Foreign Key
--     FOREIGN KEY (manager_id) REFERENCES SalesReps(rep_id)
-- );

-- CREATE TABLE Customers (
--     customer_id INT PRIMARY KEY,
--     customer_name VARCHAR(100) NOT NULL,
--     city VARCHAR(50),
--     state VARCHAR(50)
-- );

-- CREATE TABLE SalesOrders (
--     order_id INT PRIMARY KEY,
--     customer_id INT, -- Foreign Key
--     rep_id INT,      -- Foreign Key
--     order_date DATE,
--     total_amount DECIMAL(10, 2),
--     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
--     FOREIGN KEY (rep_id) REFERENCES SalesReps(rep_id)
-- );

-- CREATE TABLE OrderItems (
--     order_item_id INT PRIMARY KEY,
--     order_id INT,    -- Foreign Key
--     product_id INT,  -- Foreign Key
--     quantity INT,
--     unit_price DECIMAL(10, 2), -- Price at the time of sale
--     FOREIGN KEY (order_id) REFERENCES SalesOrders(order_id),
--     FOREIGN KEY (product_id) REFERENCES Products(product_id)
-- );


-- INSERT INTO Manufacturers (manufacturer_id, manufacturer_name, country) VALUES
-- (1, 'MediGen', 'India'),
-- (2, 'PharmaCore', 'USA'),
-- (3, 'BioLife', 'Germany'),
-- (4, 'HealthWave', 'India');


-- INSERT INTO Products (product_id, product_name, category, price, manufacturer_id) VALUES
-- (1, 'Paracetamol 500mg', 'Pain Relief', 50.00, 1),
-- (2, 'Amoxicillin 250mg', 'Antibiotic', 120.00, 2),
-- (3, 'Insulin Glargine', 'Diabetes', 800.00, 3),
-- (4, 'Atorvastatin 20mg', 'Cholesterol', 250.00, 4),
-- (5, 'Metformin 500mg', 'Diabetes', 70.00, 1),
-- (6, 'Losartan 50mg', 'Hypertension', 150.00, 2),
-- (7, 'Azithromycin 500mg', 'Antibiotic', 220.00, 4),
-- (8, 'Vitamins C 1000mg', 'Supplement', 90.00, 1),
-- (9, 'Ondansetron 4mg', 'Nausea', 180.00, 3);

-- INSERT INTO SalesReps (rep_id, first_name, last_name, region, manager_id) VALUES
-- (101, 'Asha', 'Rao', 'National', NULL),
-- (102, 'Rohan', 'Gupta', 'North', 101),
-- (103, 'Priya', 'Singh', 'South', 101),
-- (104, 'Amit', 'Patel', 'West', 101),
-- (105, 'Meera', 'Reddy', 'South', 103),
-- (106, 'Sunil', 'Kumar', 'North', 102);


-- INSERT INTO Customers (customer_id, customer_name, city, state) VALUES
-- (1001, 'Apollo Pharmacy', 'Mumbai', 'Maharashtra'),
-- (1002, 'City Hospital', 'Delhi', 'Delhi'),
-- (1003, 'MedPlus', 'Chennai', 'Tamil Nadu'),
-- (1004, 'Fortis Hospital', 'Bangalore', 'Karnataka'),
-- (1005, 'Suburban Diagnostics', 'Mumbai', 'Maharashtra'),
-- (1006, 'Care Pharmacy', 'Delhi', 'Delhi'),
-- (1007, 'Wellness Forever', 'Pune', 'Maharashtra');

-- INSERT INTO SalesOrders (order_id, customer_id, rep_id, order_date, total_amount) VALUES
-- (1, 1001, 104, '2024-10-01', 37500.00),
-- (2, 1002, 102, '2024-10-01', 18000.00),
-- (3, 1003, 103, '2024-10-02', 40000.00),
-- (4, 1002, 102, '2024-10-03', 44000.00),
-- (5, 1001, 104, '2024-10-04', 35000.00),
-- (6, 1003, 103, '2024-10-05', 12000.00),
-- (7, 1004, 105, '2024-10-05', 30000.00),
-- (8, 1005, 104, '2024-10-06', 7000.00),
-- (9, 1006, 102, '2024-10-07', 4500.00);

-- INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity, unit_price) VALUES
-- -- Order 1
-- (1, 1, 1, 500, 50.00),  -- Paracetamol
-- (2, 1, 5, 150, 70.00),  -- Metformin
-- -- Order 2
-- (3, 2, 2, 150, 120.00), -- Amoxicillin
-- -- Order 3
-- (4, 3, 3, 50, 800.00),  -- Insulin
-- -- Order 4
-- (5, 4, 7, 200, 220.00), -- Azithromycin
-- -- Order 5
-- (6, 5, 4, 100, 250.00), -- Atorvastatin
-- (7, 5, 5, 100, 70.00),  -- Metformin
-- (8, 5, 8, 100, 90.00), -- Vitamin C
-- -- Order 6
-- (9, 6, 2, 100, 120.00), -- Amoxicillin
-- -- Order 7
-- (10, 7, 6, 200, 150.00), -- Losartan
-- -- Order 8
-- (11, 8, 5, 100, 70.00),  -- Metformin
-- -- Order 9
-- (12, 9, 8, 50, 90.00);   -- Vitamin C


-- SELECT
--     so.order_id,
--     c.customer_name,
--     c.city
-- FROM
--     SalesOrders so
-- INNER JOIN
--     Customers c ON so.customer_id = c.customer_id;



-- SELECT
--     oi.order_id,
--     p.product_name,
--     oi.quantity
-- FROM
--     OrderItems oi
-- INNER JOIN
--     Products p ON oi.product_id = p.product_id;

-- SELECT
--     p.product_name,
--     m.manufacturer_name,
--     m.country
-- FROM
--     Products p
-- INNER JOIN
--     Manufacturers m ON p.manufacturer_id = m.manufacturer_id;


-- SELECT
--     so.order_id,
--     c.customer_name,
--     CONCAT(sr.first_name, ' ', sr.last_name) AS rep_name
-- FROM
--     SalesOrders so
-- INNER JOIN
--     Customers c ON so.customer_id = c.customer_id
-- INNER JOIN
--     SalesReps sr ON so.rep_id = sr.rep_id;

-- SELECT
--     so.order_id,
--     c.customer_name,
--     p.product_name,
--     oi.quantity
-- FROM
--     SalesOrders so
-- INNER JOIN
--     Customers c ON so.customer_id = c.customer_id
-- INNER JOIN
--     OrderItems oi ON so.order_id = oi.order_id
-- INNER JOIN
--     Products p ON oi.product_id = p.product_id;

-- SELECT
--     so.order_id,
--     so.order_date,
--     c.customer_name,
--     CONCAT(sr.first_name, ' ', sr.last_name) AS rep_name,
--     p.product_name,
--     m.manufacturer_name,
--     oi.quantity,
--     oi.unit_price
-- FROM
--     SalesOrders so
-- INNER JOIN
--     Customers c ON so.customer_id = c.customer_id
-- INNER JOIN
--     SalesReps sr ON so.rep_id = sr.rep_id
-- INNER JOIN
--     OrderItems oi ON so.order_id = oi.order_id
-- INNER JOIN
--     Products p ON oi.product_id = p.product_id
-- INNER JOIN
-- 	Manufacturers m ON p.manufacturer_id = m.manufacturer_id;

-- SELECT
--     p.product_name,
--     oi.quantity,
--     c.customer_name
-- FROM
--     SalesOrders so
-- INNER JOIN
--     Customers c ON so.customer_id = c.customer_id
-- INNER JOIN
--     OrderItems oi ON so.order_id = oi.order_id
-- INNER JOIN
--     Products p ON oi.product_id = p.product_id
-- WHERE
--     c.city = 'Mumbai';


-- SELECT
--     c.customer_name,
--     SUM(so.total_amount) AS total_spent
-- FROM
--     SalesOrders so
-- INNER JOIN
--     Customers c ON so.customer_id = c.customer_id
-- GROUP BY
--     c.customer_name;

-- SELECT
--     CONCAT(sr.first_name, ' ', sr.last_name) AS rep_name,
--     SUM(so.total_amount) AS total_sales
-- FROM
--     SalesOrders so
-- INNER JOIN
--     SalesReps sr ON so.rep_id = sr.rep_id
-- GROUP BY
--     rep_name;

-- SELECT
--     p.product_name,
--     SUM(oi.quantity) AS total_quantity_sold
-- FROM
--     OrderItems oi
-- INNER JOIN
--     Products p ON oi.product_id = p.product_id
-- GROUP BY
--     p.product_name;


-- SELECT
--     m.manufacturer_name,
--     SUM(oi.quantity * oi.unit_price) AS total_revenue
-- FROM
--     OrderItems oi
-- INNER JOIN
--     Products p ON oi.product_id = p.product_id
-- INNER JOIN
--     Manufacturers m ON p.manufacturer_id = m.manufacturer_id
-- GROUP BY
--     m.manufacturer_name;



-- SELECT
--     c.customer_name,
--     so.order_id,
--     so.order_date
-- FROM
--     Customers c
-- LEFT JOIN
--     SalesOrders so ON c.customer_id = so.customer_id;

-- SELECT
--     c.customer_name,
--     c.city
-- FROM
--     Customers c
-- LEFT JOIN
--     SalesOrders so ON c.customer_id = so.customer_id
-- WHERE
--     so.order_id IS NULL;

-- SELECT
--     CONCAT(sr.first_name, ' ', sr.last_name) AS rep_name,
--     sr.region,
--     so.order_id
-- FROM
--     SalesReps sr
-- LEFT JOIN
--     SalesOrders so ON sr.rep_id = so.rep_id;


-- SELECT
--     p.product_name,
--     p.category,
--     oi.order_item_id
-- FROM
--     Products p
-- LEFT JOIN
--     OrderItems oi ON p.product_id = oi.product_id;

-- SELECT
--     CONCAT(sr.first_name, ' ', sr.last_name) AS rep_name,
--     COALESCE(SUM(so.total_amount), 0) AS total_sales
-- FROM
--     SalesReps sr
-- LEFT JOIN
--     SalesOrders so ON sr.rep_id = so.rep_id
-- GROUP BY
--     rep_name;


-- SELECT
--     c.customer_name,
--     so.order_id
-- FROM
--     SalesOrders so
-- RIGHT JOIN
--     Customers c ON so.customer_id = c.customer_id;

-- SELECT
--     c.customer_name,
--     c.city
-- FROM
--     SalesOrders so
-- RIGHT JOIN
--     Customers c ON so.customer_id = c.customer_id
-- WHERE
--     so.order_id IS NULL;

-- (
--     SELECT
--         c.customer_name,
--         CONCAT(sr.first_name, ' ', sr.last_name) AS rep_name
--     FROM
--         Customers c
--     LEFT JOIN
--         SalesOrders so ON c.customer_id = so.customer_id
--     LEFT JOIN
--         SalesReps sr ON so.rep_id = sr.rep_id
-- )
-- UNION
-- (
--     SELECT
--         c.customer_name,
--         CONCAT(sr.first_name, ' ', sr.last_name) AS rep_name
--     FROM
--         SalesReps sr
--     LEFT JOIN
--         SalesOrders so ON sr.rep_id = so.rep_id
--     LEFT JOIN
--         Customers c ON so.customer_id = c.customer_id
-- );

-- SELECT
--     CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
--     e.region AS employee_region,
--     CONCAT(m.first_name, ' ', m.last_name) AS manager_name
-- FROM
--     SalesReps e 
-- INNER JOIN
--     SalesReps m ON e.manager_id = m.rep_id;

-- SELECT
--     CONCAT(e.first_name, ' ', e.last_name) AS employee_name
-- FROM
--     SalesReps e
-- INNER JOIN
--     SalesReps m ON e.manager_id = m.rep_id
-- WHERE
--     m.first_name = 'Priya' AND m.last_name = 'Singh';


-- SELECT
--     CONCAT(sr.first_name, ' ', sr.last_name) AS rep_name,
--     p.category
-- FROM
--     SalesReps sr
-- CROSS JOIN
--     Products p
-- GROUP BY
--     rep_name, p.category;

-- SELECT
--     RepSales.rep_name,
--     AVG(RepSales.total_amount) AS average_order_value,
--     COUNT(RepSales.order_id) AS total_orders
-- FROM (
--     SELECT
--         CONCAT(sr.first_name, ' ', sr.last_name) AS rep_name,
--         so.order_id,
--         so.total_amount
--     FROM
--         SalesOrders so
--     INNER JOIN
--         SalesReps sr ON so.rep_id = sr.rep_id
-- ) AS RepSales
-- GROUP BY
--     RepSales.rep_name;


-- SELECT
--     c.customer_name,
--     SUM(so.total_amount) AS total_spent
-- FROM
--     Customers c
-- INNER JOIN
--     SalesOrders so ON c.customer_id = so.customer_id
-- GROUP BY
--     c.customer_name
-- HAVING
--     SUM(so.total_amount) > 50000;

