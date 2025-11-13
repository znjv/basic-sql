CREATE DATABASE techworld;
USE techworld;

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
salary DECIMAL(10,2)
);

CREATE TABLE departments(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);

CREATE TABLE projects(
proj_id INT PRIMARY KEY,
proj_name VARCHAR(50),
status VARCHAR(20)
);

CREATE USER 'alice'@'localhost' IDENTIFIED BY 'alice@123';
CREATE USER 'bob'@'localhost' IDENTIFIED BY 'bob@123';
CREATE USER 'charlie'@'localhost' IDENTIFIED BY 'charlie@123';

GRANT SELECT, INSERT ON techworld.employees TO 'alice'@'localhost';
GRANT SELECT, UPDATE ON techworld.projects TO 'bob'@'localhost';
GRANT SELECT, INSERT ON techworld.* TO 'charlie'@'localhost';

SHOW GRANTS FOR 'alice'@'localhost';
SHOW GRANTS FOR 'bob'@'localhost';
SHOW GRANTS FOR 'charlie'@'localhost';

REVOKE INSERT ON techworld.employees FROM 'alice'@'localhost';
FLUSH PRIVILEGES;

