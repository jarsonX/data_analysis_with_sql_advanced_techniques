-- Sandbox is a MS SQL Server database I set up on my locale machine. I use it for learning and experimenting.
USE Sandbox

-- Code based on book Data Analysis with SQL by Cathy Tanimura

-- CHAPTER 2: Data preparation

-- Page 38

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
	customer_id VARCHAR(50),
	order_id VARCHAR(50),
	product VARCHAR(200),
	quantity INT
	);

INSERT INTO orders (customer_id, order_id, product, quantity)
VALUES	('A','1','taco',10),
		('A','1','burger',15),
		('B','2','taco',5),
		('A','3','taco',12),
		('B','4','burger',8),
		('B','4','salad',15),
		('B','4','tomato',20),
		('A','5','taco',5),
		('A','5','salad',8),
		('A','1','burger',15),
		('D','2','taco',5),
		('D','3','taco',12),
		('E','4','burger',8),
		('A','4','salad',15),
		('B','4','tomato',20),
		('E','5','taco',5),
		('A','5','salad',8),
		('B','4','tomato',20),
		('E','5','taco',5),
		('B','5','salad',8),
		('X','4','tomato',20),
		('X','5','taco',5),
		('X','5','salad',8);

SELECT customer_id, COUNT(order_id) AS orders
FROM orders
GROUP BY customer_id

SELECT orders, COUNT(*) AS num_customers
FROM
(
	SELECT customer_id, COUNT(order_id) AS orders
	FROM orders
	GROUP BY customer_id
) AS tbl_1
GROUP BY orders;