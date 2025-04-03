#INNER JOIN
SELECT Orders.order_id, Orders.total_amount, Customers.first_name, Customers.last_name
FROM Orders
INNER JOIN Customers ON Orders.customer_id = Customers.customer_id;

#LEFT JOIN
SELECT Orders.order_id, Products.product_name, Order_Items.quantity
FROM Orders
LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id
LEFT JOIN Products ON Order_Items.product_id = Products.product_id;

#UPDATE
UPDATE Orders
SET status = 'Shipped'
WHERE order_id = 1;

#DELETE
DELETE FROM Customers
WHERE customer_id = 1;

#Aggregation Queries
#COUNT
SELECT Customers.first_name, Customers.last_name, COUNT(Orders.order_id) AS order_count
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id;

#AVG
SELECT Customers.first_name, Customers.last_name, AVG(Orders.total_amount) AS average_order_amount
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id;

#SUM
SELECT Customers.first_name, Customers.last_name, SUM(Orders.total_amount) AS total_spent
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id;

#HAVING
SELECT Customers.first_name, Customers.last_name, SUM(Orders.total_amount) AS total_spent
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id
HAVING total_spent > 500;
