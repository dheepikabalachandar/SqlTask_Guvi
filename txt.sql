
CREATE TABLE customers(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(100),
  address VARCHAR(255)
  );
  
  CREATE TABLE orders(
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    FOREIGN KEY(customer_id) REFERENCES customers(id)
    );
    
    CREATE TABLE products(
       id INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(100),
      price DECIMAL(10,2),
      description TEXT
      );
      
  SELECT DISTINCT c.name FROM CUSTOMERS c JOIN orders o ON c.id = o.customer_id
        WHERE o.order_date >= CURDATE()-INTERVAL 30 DAY;
        
 SELECT c.name,SUM(o.total_amount) AS total_spent FROM customers c JOIN ORDERS o ON c.id=o.customer_id
    GROUP BY c.name;
   UPDATE products
   SET price=45.00 WHERE name ="C";
   
   ALTER TABLE products
   ADD COLUMN discount DECIMAL(5,2) DEFAULT  0;
   SELECT name ,price FROM products ORDER BY price DESC LIMIT 3;
   
   SELECT DISTINCT c.name FROM customers c JOIN orders o ON c.id =o.customer_id JOIN order_items oi ON o.id= oi.order_id
   JOIN products p ON oi.product_id= p.id WHERE p.name='A';
      
      SELECT c.name,o.order_date FROM customers c  JOIN orders o ON c.id=o.customer_id;
      SELECT * FROM orders WHRERE total_amount>150.00;
      
      CREATE TABLE order_items(
        id INT PRIMARY KEY AUTO_INCREMENT,
        order _id INT,
        product_id INT,
        quantity INT,
        price DECIMAL(10,2),
        FOREIGN KEY (order_id)REFERENCEsorders(id),
        FOREIGN KEY (product_id)REFERENCES products(id)
        );
        SELECT AVG (total_amount) AS average_total  FROM orders ;