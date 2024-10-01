<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<h1>E-commerce Database Management System</h1>

<h2>Project Overview</h2>
<p>
    This project is a simple <strong>E-commerce Database Management System</strong> implemented using pure SQL. It covers core functionalities 
    required in an e-commerce platform, such as managing customers, products, orders, payments, and shipping. The database structure allows 
    tracking product categories, inventory, order statuses, customer data, and more. It also includes advanced queries to retrieve and analyze 
    important information like sales performance, customer activity, and inventory management.
</p>

<h2>Features</h2>
<ul>
    <li><strong>Customer Management:</strong> Stores customer details including names, addresses, and contact info.</li>
    <li><strong>Product Management:</strong> Handles product details, pricing, and stock.</li>
    <li><strong>Order Management:</strong> Manages customer orders, items within orders, and order totals.</li>
    <li><strong>Payment Tracking:</strong> Stores payment information including payment methods and amounts.</li>
    <li><strong>Shipping:</strong> Tracks the shipping details, including shipping method and status.</li>
    <li><strong>Reporting and Analysis:</strong> Provides various queries for sales reports, customer activity, inventory management, and more.</li>
</ul>

<h2>Database Schema</h2>

<h3>Customers Table</h3>
<table border="1">
    <tr>
        <th>Column</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>customer_id</td>
        <td>INT (PK)</td>
        <td>Unique ID for each customer</td>
    </tr>
    <tr>
        <td>first_name</td>
        <td>VARCHAR(100)</td>
        <td>First name of the customer</td>
    </tr>
    <tr>
        <td>last_name</td>
        <td>VARCHAR(100)</td>
        <td>Last name of the customer</td>
    </tr>
    <tr>
        <td>email</td>
        <td>VARCHAR(100)</td>
        <td>Email address (unique)</td>
    </tr>
    <tr>
        <td>phone_number</td>
        <td>VARCHAR(15)</td>
        <td>Customer's contact number</td>
    </tr>
    <tr>
        <td>address</td>
        <td>VARCHAR(255)</td>
        <td>Customer's street address</td>
    </tr>
    <tr>
        <td>city</td>
        <td>VARCHAR(100)</td>
        <td>Customer's city</td>
    </tr>
    <tr>
        <td>state</td>
        <td>VARCHAR(100)</td>
        <td>Customer's state</td>
    </tr>
    <tr>
        <td>postal_code</td>
        <td>VARCHAR(10)</td>
        <td>Postal code</td>
    </tr>
    <tr>
        <td>country</td>
        <td>VARCHAR(100)</td>
        <td>Customer's country</td>
    </tr>
</table>

<h3>Categories Table</h3>
<table border="1">
    <tr>
        <th>Column</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>category_id</td>
        <td>INT (PK)</td>
        <td>Unique ID for each category</td>
    </tr>
    <tr>
        <td>category_name</td>
        <td>VARCHAR(100)</td>
        <td>Name of the category</td>
    </tr>
</table>

<h3>Products Table</h3>
<table border="1">
    <tr>
        <th>Column</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>product_id</td>
        <td>INT (PK)</td>
        <td>Unique ID for each product</td>
    </tr>
    <tr>
        <td>product_name</td>
        <td>VARCHAR(100)</td>
        <td>Name of the product</td>
    </tr>
    <tr>
        <td>description</td>
        <td>TEXT</td>
        <td>Description of the product</td>
    </tr>
    <tr>
        <td>price</td>
        <td>DECIMAL(10, 2)</td>
        <td>Price of the product</td>
    </tr>
    <tr>
        <td>stock</td>
        <td>INT</td>
        <td>Available stock for the product</td>
    </tr>
    <tr>
        <td>category_id</td>
        <td>INT (FK)</td>
        <td>Foreign key referring to Categories</td>
    </tr>
</table>

<h3>Orders Table</h3>
<table border="1">
    <tr>
        <th>Column</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>order_id</td>
        <td>INT (PK)</td>
        <td>Unique ID for each order</td>
    </tr>
    <tr>
        <td>customer_id</td>
        <td>INT (FK)</td>
        <td>Foreign key referring to Customers</td>
    </tr>
    <tr>
        <td>order_date</td>
        <td>TIMESTAMP</td>
        <td>Date and time of the order</td>
    </tr>
    <tr>
        <td>status</td>
        <td>VARCHAR(50)</td>
        <td>Status of the order</td>
    </tr>
    <tr>
        <td>total</td>
        <td>DECIMAL(10, 2)</td>
        <td>Total amount for the order</td>
    </tr>
    <tr>
        <td>shipping_address</td>
        <td>VARCHAR(255)</td>
        <td>Shipping address</td>
    </tr>
    <tr>
        <td>city</td>
        <td>VARCHAR(100)</td>
        <td>Shipping city</td>
    </tr>
    <tr>
        <td>state</td>
        <td>VARCHAR(100)</td>
        <td>Shipping state</td>
    </tr>
    <tr>
        <td>postal_code</td>
        <td>VARCHAR(10)</td>
        <td>Shipping postal code</td>
    </tr>
    <tr>
        <td>country</td>
        <td>VARCHAR(100)</td>
        <td>Shipping country</td>
    </tr>
</table>

<h3>Order Items Table</h3>
<table border="1">
    <tr>
        <th>Column</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>order_item_id</td>
        <td>INT (PK)</td>
        <td>Unique ID for each order item</td>
    </tr>
    <tr>
        <td>order_id</td>
        <td>INT (FK)</td>
        <td>Foreign key referring to Orders</td>
    </tr>
    <tr>
        <td>product_id</td>
        <td>INT (FK)</td>
        <td>Foreign key referring to Products</td>
    </tr>
    <tr>
        <td>quantity</td>
        <td>INT</td>
        <td>Quantity of product in the order</td>
    </tr>
    <tr>
        <td>price</td>
        <td>DECIMAL(10, 2)</td>
        <td>Price of the product at the time</td>
    </tr>
</table>

<h3>Payments Table</h3>
<table border="1">
    <tr>
        <th>Column</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>payment_id</td>
        <td>INT (PK)</td>
        <td>Unique ID for each payment</td>
    </tr>
    <tr>
        <td>order_id</td>
        <td>INT (FK)</td>
        <td>Foreign key referring to Orders</td>
    </tr>
    <tr>
        <td>payment_date</td>
        <td>TIMESTAMP</td>
        <td>Date and time of the payment</td>
    </tr>
    <tr>
        <td>amount</td>
        <td>DECIMAL(10, 2)</td>
        <td>Total amount paid</td>
    </tr>
    <tr>
        <td>payment_method</td>
        <td>VARCHAR(50)</td>
        <td>Payment method used (e.g., Credit Card, PayPal)</td>
    </tr>
</table>

<h3>Shipping Table</h3>
<table border="1">
    <tr>
        <th>Column</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>shipping_id</td>
        <td>INT (PK)</td>
        <td>Unique ID for each shipping entry</td>
    </tr>
    <tr>
        <td>order_id</td>
        <td>INT (FK)</td>
        <td>Foreign key referring to Orders</td>
    </tr>
    <tr>
        <td>shipping_date</td>
        <td>TIMESTAMP</td>
        <td>Date of shipping</td>
    </tr>
    <tr>
        <td>shipping_method</td>
        <td>VARCHAR(50)</td>
        <td>Method used for shipping (e.g., UPS, FedEx)</td>
    </tr>
    <tr>
        <td>tracking_number</td>
        <td>VARCHAR(100)</td>
        <td>Tracking number for shipment</td>
    </tr>
    <tr>
        <td>status</td>
        <td>VARCHAR(50)</td>
        <td>Shipping status (e.g., Shipped, Pending)</td>
    </tr>
</table>

<h2>Setup Instructions</h2>

<h3>Prerequisites</h3>
<ul>
    <li>MySQL or any SQL-compatible database engine.</li>
    <li>SQL client to run queries (e.g., MySQL Workbench, DBeaver).</li>
</ul>

<h3>Steps to Set Up</h3>
<ol>
    <li><strong>Create Database</strong>
        <pre><code>CREATE DATABASE ecommerce_db;
USE ecommerce_db;</code></pre>
    </li>
    <li><strong>Create Tables</strong>
        <p>Use the SQL provided in the schema section above to create tables for <code>Customers</code>, <code>Categories</code>, <code>Products</code>, <code>Orders</code>, <code>OrderItems</code>, <code>Payments</code>, and <code>Shipping</code>.</p>
    </li>
    <li><strong>Insert Sample Data</strong>
        <p>Populate the tables with some initial data (you can use the INSERT statements provided in the schema section).</p>
    </li>
    <li><strong>Run Queries</strong>
        <p>Execute the advanced queries provided in this README to extract meaningful insights from the data.</p>
    </li>
</ol>

<h2>Advanced SQL Queries</h2>

<h3>1. Top 5 Products by Total Sales</h3>
<pre><code>SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold, 
       SUM(oi.price * oi.quantity) AS total_revenue
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;</code></pre>

<h3>2. Customers Who Have Made More Than 3 Orders</h3>
<pre><code>SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING total_orders &gt; 3;</code></pre>

<h3>3. Average Order Value per Customer</h3>
<pre><code>SELECT c.customer_id, c.first_name, c.last_name, 
       AVG(o.total) AS avg_order_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;</code></pre>

<h2>Contributing</h2>
<p>
    Feel free to submit pull requests with additional features, optimizations, or new advanced queries that could improve the functionality of this system.
</p>

<h2>License</h2>
<p>
    This project is licensed under the MIT License. See the <code>LICENSE</code> file for more details.
</p>

</body>
</html>


