CREATE TABLE employees (
  id INT PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  post VARCHAR(50),
  seniority INT,
  salary INT,
  age INT
);

INSERT INTO employees (id, firstname, lastname, post, seniority, salary, age) VALUES
(1, 'Вася', 'Петров', 'Начальник', 40, 100000, 60),
(2, 'Петр', 'Власов', 'Начальник', 8, 70000, 30),
(3, 'Катя', 'Катина', 'Инженер', 2, 70000, 25),
(4, 'Саша', 'Сасин', 'Инженер', 12, 50000, 35),
(5, 'Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
(6, 'Петр', 'Петров', 'Рабочий', 20, 25000, 40),
(7, 'Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
(8, 'Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
(9, 'Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
(10, 'Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
(11, 'Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
(12, 'Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 

SELECT * 
FROM employees 
ORDER BY salary DESC;

SELECT * 
FROM employees 
ORDER BY salary ASC;

-- 2. Выведите 5 максимальных заработных плат (saraly)

SELECT salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT post, SUM(salary) as total_salary
FROM employees
GROUP BY post;

-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.

SELECT COUNT(*) as worker_count
FROM employees
WHERE post = 'Рабочий' AND age >= 24 AND age <= 49;

-- 5. Найдите количество специальностей

SELECT COUNT(DISTINCT post) as total_posts FROM employees;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 

SELECT post
FROM employees
GROUP BY post
HAVING AVG(age) < 30;