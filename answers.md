1. Difference between INNER and LEFT JOIN?

INNER JOIN: Returns only the rows that have matching values in both tables. If a row in the left table has no match in the right table (or vice-versa), it is excluded from the result. It's used for finding the intersection of data.

LEFT JOIN (or LEFT OUTER JOIN): Returns all rows from the left table, and the matched rows from the right table. If a row in the left table has no match in the right table, the result will still include that row, but with NULL values for all columns from the right table. It's used for "all of A, and any matching B."

2. What is a FULL OUTER JOIN?

A FULL OUTER JOIN (or FULL JOIN) combines the results of both a LEFT JOIN and a RIGHT JOIN. It returns all rows from both tables.

If a row has a match in the other table, the columns are combined in the result.

If a row from the left table has no match in the right, it appears with NULL values for the right table's columns.

If a row from the right table has no match in the left, it appears with NULL values for the left table's columns.

(Note: MySQL and SQLite do not support this syntax directly; it must be emulated using a LEFT JOIN and a RIGHT JOIN combined with a UNION.)

3. Can joins be nested?

Yes. While you typically "chain" joins (e.g., T1 JOIN T2 ON ... JOIN T3 ON ...), you can also use a "nested join" (also called a derived table or subquery in the FROM clause). You can JOIN a table to the result of another join.

Example (Nested):

SELECT
    c.customer_name,
    OrderReport.total_items
FROM
    Customers c
INNER JOIN (
    SELECT
        so.order_id,
        so.customer_id,
        SUM(oi.quantity) AS total_items
    FROM
        SalesOrders so
    JOIN
        OrderItems oi ON so.order_id = oi.order_id
    GROUP BY
        so.order_id, so.customer_id
) AS OrderReport ON c.customer_id = OrderReport.customer_id;


4. How to join more than 2 tables?

You "chain" the JOIN clauses one after another. The database logically joins the first two tables, then joins the result of that to the third table, then joins the result of that to the fourth table, and so on.

Example:

SELECT
    a.col, b.col, c.col, d.col
FROM
    TableA a
INNER JOIN
    TableB b ON a.id = b.a_id
INNER JOIN
    TableC c ON b.id = c.b_id
INNER JOIN
    TableD d ON c.id = d.c_id;


5. What is a cross join?

A CROSS JOIN returns the Cartesian product of two tables. This means it takes every single row from the first table and pairs it with every single row from the second table. It does not use an ON clause. If Table A has 10 rows and Table B has 5 rows, a CROSS JOIN will result in 10 * 5 = 50 rows. It's useful for generating all possible combinations.

6. What is a natural join?

A NATURAL JOIN is a type of join that automatically joins tables based on all columns that have the same name and data type in both tables. You do not specify an ON clause.

Warning: This is often considered dangerous and bad practice. If two tables have multiple columns with the same name (e.g., id, last_updated), the join will try to match on all of them, which can lead to unexpected results or no results at all. It's always safer to use an explicit ON or USING clause.

7. Can you join tables without foreign key?

Yes, absolutely. A foreign key is a constraint that enforces data integrity (i.e., you can't add a sale for a product_id that doesn't exist).

A JOIN's ON clause, however, is just a logical condition. You can join any two tables on any condition that evaluates to true. For example, you could join SalesReps and Customers ON SalesReps.region = Customers.state. This is a common and valid "non-equi" join, even if no formal foreign key exists.

8. What is a self-join?

A SELF JOIN is a query where a table is joined to itself. To do this, you must use at least two different aliases for the table, treating it as if it were two separate tables. This is useful for querying hierarchical data (e.g., finding an employee's manager, where the manager is also in the Employees table) or finding pairs of rows that share a common property.

9. What causes Cartesian product?

A Cartesian product (where every row from one table is combined with every row from another) is caused by two main things:

Using the CROSS JOIN keyword explicitly.

Accidentally: Writing a JOIN (e.g., FROM TableA, TableB) but forgetting to provide the ON or WHERE clause to link them. This is a very common and often costly mistake.

10. How to optimize joins?

Indexes: This is the most important optimization. Ensure that the columns used in your ON clauses (your "join keys," like product_id, customer_id) are indexed. This allows the database to find matches quickly without scanning the entire table.

Select Specific Columns: Don't use SELECT *. Only select the columns you actually need. This reduces the amount of data that needs to be processed and moved.

Filter Early: Use WHERE clauses to filter out unnecessary rows as early as possible. This reduces the number of rows that need to be processed by the join.

Use INNER JOIN by default: Only use LEFT/RIGHT/FULL joins when you specifically need the unmatched rows, as they are generally more resource-intensive.

Analyze the Query Plan: Use EXPLAIN (or EXPLAIN ANALYZE) to see how the database is executing your join. This can reveal if it's using indexes correctly or if a full table scan is happening.
