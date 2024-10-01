-- 1. Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(10),
    country VARCHAR(100)
);

-- 2. Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- 3. Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- 4. Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'pending',
    total DECIMAL(10, 2),
    shipping_address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(10),
    country VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. Order Items Table
CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 6. Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 7. Shipping Table
CREATE TABLE Shipping (
    shipping_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    shipping_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    shipping_method VARCHAR(50),
    tracking_number VARCHAR(100),
    status VARCHAR(50) DEFAULT 'pending',
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert Categories
INSERT INTO Categories (category_name)
VALUES 
    ('Electronics'),
    ('Books'),
    ('Clothing'),
    ('Home & Kitchen');

-- Insert Products
INSERT INTO Products (product_name, description, price, stock, category_id)
VALUES
    ('Smartphone', 'Latest model smartphone', 699.99, 50, 1),
    ('Laptop', 'High performance laptop', 999.99, 30, 1),
    ('Fiction Novel', 'Bestselling fiction novel', 14.99, 200, 2),
    ('T-shirt', 'Cotton T-shirt', 19.99, 150, 3);

-- Insert Customers
INSERT INTO Customers (first_name, last_name, email, phone_number, address, city, state, postal_code, country)
VALUES 
    ('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St', 'Springfield', 'IL', '62704', 'USA'),
    ('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak St', 'Metropolis', 'NY', '10001', 'USA');

-- Insert Orders
INSERT INTO Orders (customer_id, total, shipping_address, city, state, postal_code, country)
VALUES
    (1, 719.98, '123 Elm St', 'Springfield', 'IL', '62704', 'USA'),
    (2, 1014.98, '456 Oak St', 'Metropolis', 'NY', '10001', 'USA');

-- Insert Order Items
INSERT INTO OrderItems (order_id, product_id, quantity, price)
VALUES
    (1, 1, 1, 699.99),
    (1, 4, 1, 19.99),
    (2, 2, 1, 999.99),
    (2, 3, 1, 14.99);

-- Insert Payments
INSERT INTO Payments (order_id, amount, payment_method)
VALUES
    (1, 719.98, 'Credit Card'),
    (2, 1014.98, 'PayPal');

-- Insert Shipping Details
INSERT INTO Shipping (order_id, shipping_method, tracking_number, status)
VALUES
    (1, 'UPS Ground', '1Z12345E0205271688', 'shipped'),
    (2, 'FedEx Express', '123456789012', 'processing');

SELECT p.product_name, p.price, c.category_name
FROM Products p
JOIN Categories c ON p.category_id = c.category_id;

SELECT o.order_id, o.order_date, c.first_name, c.last_name, o.total
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

SELECT o.order_id, oi.product_id, p.product_name, oi.quantity, oi.price
FROM Orders o
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE o.order_id = 1;

SELECT o.order_id, s.shipping_method, s.tracking_number, s.status
FROM Orders o
JOIN Shipping s ON o.order_id = s.order_id;

SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold, 
       SUM(oi.price * oi.quantity) AS total_revenue
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING total_orders > 3;

SELECT c.customer_id, c.first_name, c.last_name, 
       AVG(o.total) AS avg_order_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT product_name, stock
FROM Products
WHERE stock < 10;

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, 
       SUM(total) AS total_revenue
FROM Orders
GROUP BY month
ORDER BY month DESC;


SELECT c.customer_id, c.first_name, c.last_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_date < CURDATE() - INTERVAL 6 MONTH
OR o.order_date IS NULL;

SELECT cat.category_name, 
       SUM(oi.quantity * oi.price) AS total_revenue
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY total_revenue DESC
LIMIT 1;

SELECT c.customer_id, c.first_name, c.last_name, 
       AVG(DATEDIFF(o2.order_date, o1.order_date)) AS avg_days_between_orders
FROM Orders o1
JOIN Orders o2 ON o1.customer_id = o2.customer_id AND o2.order_date > o1.order_date
JOIN Customers c ON o1.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;


SELECT o.order_id, o.order_date, s.shipping_date, 
       DATEDIFF(s.shipping_date, o.order_date) AS shipping_delay_days
FROM Orders o
JOIN Shipping s ON o.order_id = s.order_id
WHERE DATEDIFF(s.shipping_date, o.order_date) > 3;

SELECT p.product_id, p.product_name
FROM Products p
LEFT JOIN OrderItems oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING total_orders > 1;

SELECT o.order_id, COUNT(oi.product_id) AS total_products
FROM Orders o
JOIN OrderItems oi ON o.order_id = oi.order_id
GROUP BY o.order_id
ORDER BY total_products DESC
LIMIT 1;

SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

SELECT cat.category_name, AVG(p.price) AS avg_price
FROM Products p
JOIN Categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_name;

SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 10;

