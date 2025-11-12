CREATE DATABASE online_store;
USE online_store;

-- creating a table customers
CREATE TABLE customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
email VARCHAR (100)UNIQUE KEY,
phone VARCHAR(15),
city VARCHAR(50)
);


-- creating a table products
CREATE TABLE products (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(100),
category VARCHAR (100),
price DECIMAL(10,2),
stock INT
);


-- creating a table payments
CREATE TABLE payments (
payment_id INT PRIMARY KEY AUTO_INCREMENT,
payment_mode VARCHAR(50),
payment_date DATE,
amount DECIMAL(10,2)
);

-- creating a table orders connect with customers, products, and payments
CREATE TABLE orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
product_id INT,
payment_id INT,
order_date DATE,
quantity INT,

FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (payment_id) REFERENCES payments(payment_id)
);

INSERT INTO customers (name,  email, phone, city) VALUES 
                      ('Amit', 'amit@gmail.com', 9875432256, 'chennai'),
                      ('Aadhavan', 'aadav@gmail.com', 8976453278, 'cheenai'),
                      ('Arjun', 'arjun@gmail.com', 8838892685, 'coimbatore'),
                      ('Bhavan', 'bhavan@gamil.com', 9867453478,'trichy'),
                      ('Boopathi', 'boopathi@gmail.com', 8976456789, 'thalli'),
                      ('Bhuvi', 'bhuvi@gmail.com', 8977654456, 'kochi'),
                      ('Bairav','bairav@gmail.com', 9087654567, 'kochi'),
                      ('chin', 'chin@gmail.com', 8999764555, 'delhi'),
                      ('dinesh', 'dinesh56@gmail.com', 9088675546, 'delhi'),
                      ('eeshwar', 'eeshwaryt2025@gmail.com', 9877554567, 'delhi'),
                      ('faruk', 'faruk567@gmail.com', 9087564467, 'chennai'),
                      ('gandhi', 'gandhi@gmail.com', 9088765567, 'kochi');
                      
SELECT * FROM customers;

INSERT INTO products (product_name, category, price, stock) VALUES
('iPhone 15', 'Electronics', 79999.00, 25),
('Samsung TV', 'Electronics', 55000.00, 15),
('Bluetooth Speaker', 'Accessories', 3500.00, 100),
('Gaming Laptop', 'Electronics', 120000.00, 10),
('Office Chair', 'Furniture', 8500.00, 50),
('Wrist Watch', 'Accessories', 6000.00, 40),
('Microwave Oven', 'Home Appliances', 15000.00, 20),
('Table Lamp', 'Home Decor', 2500.00, 60),
('Headphones', 'Accessories', 4500.00, 80),
('Refrigerator', 'Home Appliances', 48000.00, 8);


INSERT INTO payments (payment_mode, payment_date, amount) VALUES
('Credit Card', '2024-03-10', 79999.00),
('UPI', '2024-04-05', 3500.00),
('Net Banking', '2024-06-12', 120000.00),
('Debit Card', '2024-06-30', 8500.00),
('Cash', '2024-07-15', 55000.00),
('Credit Card', '2024-07-20', 4500.00),
('UPI', '2024-08-05', 6000.00),
('Debit Card', '2024-09-09', 48000.00),
('UPI', '2024-09-18', 15000.00),
('Net Banking', '2024-10-01', 2500.00),
('Credit Card', '2024-10-15', 9500.00),
('UPI', '2024-11-01', 18500.00);


INSERT INTO orders (customer_id, product_id, payment_id, order_date, quantity) VALUES
					(1, 1, 1, '2024-03-10', 1),   
					(2, 3, 2, '2024-04-05', 2),   
					(3, 4, 3, '2024-06-12', 1),   
					(4, 5, 4, '2024-06-30', 1),  
					(5, 2, 5, '2024-07-15', 1),  
					(6, 9, 6, '2024-07-20', 1),  
					(7, 6, 7, '2024-08-05', 1),   
					(8, 10, 8, '2024-09-09', 1),  
					(9, 7, 9, '2024-09-18', 1),   
					(10, 8, 10, '2024-10-01', 2), 
					(11, 9, 11, '2024-10-15', 1), 
					(12, 1, 12, '2024-11-01', 1);
                                       
                                       
SELECT o.order_id, c.name, p.product_name, pay.payment_mode, pay.amount, o.order_date 
FROM  orders o
JOIN 
customers c ON o.customer_id = c.customer_id
JOIN
products p ON o.product_id = p.product_id
JOIN
payments pay ON o.payment_id = pay.payment_id
ORDER BY
o.order_date;

SELECT name, city from customers;

SELECT name FROM customers WHERE city = 'chennai';

SELECT product_name FROM products WHERE price > 10000;

SELECT category, count(product_id) AS total_products FROM products GROUP BY category;
 
 SELECT category,avg(price) FROM products GROUP BY category;
 
 SELECT name FROM customers WHERE name LIKE 'A%';
 
 SELECT category, avg(price) FROM products WHERE price > 5000 GROUP BY category;
 
 SELECT * FROM products WHERE category = 'Accessories';
 
 DELETE  FROM products WHERE category = 'Accessories';
 
 SELECT product_name,price FROM products ORDER BY price desc;
 
 SELECT product_name,price FROM products ORDER BY price desc LIMIT 3;

UPDATE products SET price = price*1.10 WHERE category = 'Electronics';

SELECT product_name, price FROM products WHERE category = 'Electronics'; 