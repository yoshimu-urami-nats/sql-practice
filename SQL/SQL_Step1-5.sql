CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name       VARCHAR(100),
    price      INT,
    stock      INT
);

INSERT INTO products (product_id, name, price, stock) VALUES
(1, 'Keyboard Pro', 2980, 12),
(2, 'Mouse Lite', 980, 50),
(3, 'Monitor 24inch', 12800, 5),
(4, 'USB Cable', 300, 100);

SELECT * FROM products;

SELECT name, price
FROM products
WHERE price >= 2000;

SELECT name, price
FROM products
ORDER BY price ASC;

SELECT *
FROM products
WHERE name LIKE '%Pro%';



