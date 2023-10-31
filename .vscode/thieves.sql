SELECT *
FROM actor;

SELECT last_name, first_name
FROM actor;

-- query first_name which equals 'Nick'
-- using the WHERE clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

--query first_name which equals 'Nick'
--Using LIKE clause
--NOTE: (=) is looking for literal clause

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

--Using LIKE Clause and WILD CARD (%)
-- Get all J names

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- Single character WILD CARD ( _ )

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%';

SELECT *
FROM payment;
-- SELECT * FROM payment;     works as well ONE LINER

SELECT amount
FROM payment
WHERE amount > 10;

SELECT amount
FROM payment
WHERE amount >= 10 AND amount <= 16;
-- WHERE amount BETWEEN 10 AND 15;

SELECT amount
FROM payment
ORDER BY amount DESC;

SELECT amount
FROM payment
WHERE amount <> 2.99;