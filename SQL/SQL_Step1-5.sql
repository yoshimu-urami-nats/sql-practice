-- step1

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

-- step2

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories VALUES
(1, 'PC周辺機器'),
(2, 'モニター'),
(3, 'アクセサリ');

ALTER TABLE products
ADD category_id INT;

UPDATE products SET category_id = 1 WHERE product_id IN (1, 2, 4);
UPDATE products SET category_id = 2 WHERE product_id = 3;

SELECT p.product_id, p.name, c.category_name
FROM products AS p
INNER JOIN categories AS c
    ON p.category_id = c.category_id;

UPDATE products
SET category_id = NULL
WHERE product_id = 4;

SELECT p.product_id, p.name, c.category_name
FROM products AS p
LEFT JOIN categories AS c
    ON p.category_id = c.category_id;

UPDATE products
SET category_id = 99
WHERE product_id = 1;

SELECT p.product_id, p.name, c.category_name
FROM products AS p
LEFT JOIN categories AS c
    ON p.category_id = c.category_id;
    
SELECT p.name, c.category_name
FROM products AS p
INNER JOIN categories AS c
    ON p.category_id = c.category_id;

SELECT p.name, p.price, c.category_name
FROM products AS p
LEFT JOIN categories AS c
    ON p.category_id = c.category_id;

SELECT p.name, p.price, c.category_name
FROM products AS p
LEFT JOIN categories AS c
    ON p.category_id = c.category_id
WHERE p.price >= 2000;

-- step3




