Task 5: SQL Joins - Advanced (Pharma Sales Database)

Objective

The goal of this task is to learn and master the use of all SQL join types by creating and querying a realistic, multi-table database. This project provides a deep dive into INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN (emulation), CROSS JOIN, and SELF JOIN, with over 30 practical examples.

Database Schema

A new 6-table database, "PharmaPlus," was created to simulate a pharmaceutical sales distributor. This schema is intentionally designed to be interconnected, providing rich and realistic opportunities for complex join queries that mirror real-world reporting scenarios.

Tables:

Manufacturers: (Primary Key: manufacturer_id)

This is a simple "lookup" or "dimension" table.

It stores the companies that manufacture or supply the medicines (e.g., MediGen, BioLife). This table holds the source-level information for the items in our catalog, such as the official company name and their country of origin. This allows for high-level reporting (e.g., "show total sales grouped by manufacturer's country"). These details can then be joined to the Products table.

Products: (Primary Key: product_id, Foreign Key: manufacturer_id)

Stores the catalog of individual product info (name, category, price).

The manufacturer_id foreign key creates a direct one-to-many relationship, linking each product back to its single manufacturer.

SalesReps: (Primary Key: rep_id, Foreign Key: manager_id)

Stores sales rep information (name, region).

Critically, it features a self-referencing manager_id (which points to another rep_id in the same table). This structure creates a parent-child hierarchy, enabling powerful SELF JOIN queries to build reports like "show all employees under a specific manager."

Customers: (Primary Key: customer_id)

Another key dimension table, storing the list of all clients, such as pharmacies, hospitals, and diagnostic labs that purchase goods.

SalesOrders: (Primary Key: order_id, Foreign Keys: customer_id, rep_id)

This is the "header" or "fact" table for a transaction. It captures the "who" and "when" of a sale.

It links to the Customers (who placed the order) and the SalesReps (who is credited with the sale), acting as a central hub for reporting.

OrderItems: (Primary Key: order_item_id, Foreign Keys: order_id, product_id)

This is the "detail" table for an order, capturing the "what" and "how many."

It links to a specific SalesOrder (its header) and a specific Product.

This table is essential as it resolves the many-to-many relationship between orders and products. An order can contain many products, and a product can be in many different orders. This structure is the standard way to model such relationships in a relational database.
