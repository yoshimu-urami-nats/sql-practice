-- 従業員テーブル
CREATE TABLE employees (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
department VARCHAR(50),
salary INT,
hire_date DATE
);

-- 部門テーブル
CREATE TABLE departments (
dept_id INT AUTO_INCREMENT PRIMARY KEY,
dept_name VARCHAR(50)
);

select * from employees;