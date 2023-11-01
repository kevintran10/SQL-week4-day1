-- Verify connection to DB using the Actor Table
SELECT *
FROM actor;

-- SELECT first_name and last_name
-- FROM actor TABLE
SELECT last_name, first_name
FROM actor;

-- Query first_name which equals 'Nick'
-- Using the WHERE Clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Query first_name which equals 'Nick'
-- Using LIKE clause
-- NOTE: ( = ) is looking for a literal string
-- while the LIKE Clause allows use for wildcards
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Using LIKE Clause and WILD CARD ( % )
-- Get all J names
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- Single Character Wild Card ( _ )
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_names that start with 'K__%' has two letters, anything goes after
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%';


----- Comparasion Operators:
-- = Equals to
-- > Greater Than
-- < Less Than
-- >= Greater Than or Equal to
-- <= Less Than or Equal to
-- <> Not equals

-- Using Comparasion Operators with the Payment Table
SELECT *
FROM payment;

-- Query WHERE amount GREATER THAN $10.
SELECT amount
FROM payment
WHERE amount > 10;
-- Query amounts BETWEEN $10-$15
-- NOTE: When using BETWEEN both values are inclusive
SELECT amount
FROM payment
WHERE amount >= 10 AND amount <= 16;

-- Order the payments by amount
-- Using the ORDER BY
-- ASC for ascending order (Default)
-- DESC for decending order
SELECT amount
FROM payment
ORDER BY amount DESC;

-- Query all payments NOT EQUAL to 2.99
SELECT amount
FROM payment
WHERE amount <> 2.99;

----- Aggregate Functions
-- MIN()
-- MAX()
-- SUM()
-- AVG()
-- COUNT()

-- Query the SUM of amounts GREATER THAN OR EQUAL TO 5.99
SELECT SUM(amount)
FROM payment
WHERE amount >= 5.99;

-- Query the AVG of amounts GREATER THAN OR EQUAL TO 5.99
SELECT AVG(amount)
FROM payment
WHERE amount >= 5.99;

-- Query the COUNT of amounts GREATER THAN OR EQUAL TO 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount >= 5.99;

-- Query to display the COUNT of DISTINCT amounts paid
SELECT COUNT(DISTINCT amount)
FROM payment;

-- Query to display the MIN paid using alias
SELECT MIN(amount) AS min_amount_paid
FROM payment;

-- Query to display the MAX paid using alias
SELECT MAX(amount) AS max_amount_paid
FROM payment;

-- GROUP BY (Used with aggregate functions)
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id;

-- Query the customer that paid the most
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

-- HAVING works with aggregates, WHERE does not.
SELECT customer_id, SUM(amount)
FROM payment
WHERE amount > 10
GROUP BY customer_id
HAVING SUM(amount) > 100;





-- Week 5 - Monday Questions
--1. How many actors are there with the last name ‘Wahlberg’?
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';
-- Reasoning...
-- After setting up the sequence block, it pulls up only 2 actors with


-- 2. How many payments were made between $3.99 and $5.99?
SELECT amount
FROM payment
WHERE amount >= 3.99 AND amount <= 5.99;
-- Reasoning...
-- When setting the payments to the range of 3.99-5.99. There was no data.
-- So, just to make sure I just ran SELECT amount FROM payment; to check the whole list
-- and it is true there were no amounts between that range.


-- 3. What film does the store have the most of? (search in inventory)
SELECT MAX(film_id)
FROM inventory;

SELECT film_id, title
FROM film
WHERE film_id = 1000; 
-- Reasoning...
-- The film Zorro Ark came up as the film with the most.


-- 4. How many customers have the last name ‘William’?
SELECT customer_id, last_name
FROM customer
WHERE last_name LIKE 'William';
-- Reasoning...
-- There are no customers with the last name William.


-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, rental_id
FROM rental;
WHERE staff_id = 1;
-- there was 8040 transactions
SELECT staff_id, rental_id
FROM rental;
WHERE staff_id = 2;
-- there was 8004 transactions

-- The other way that someone else got an answer was staff_id 1
SELECT COUNT(payment_id), staff_id
FROM payment
GROUP BY staff_id
ORDER BY COUNT(payment_id) DESC;

SELECT first_name, last_name
FROM staff
WHERE staff_id = '2';
--Reasoning...
-- Jon Stephens would be the employee for staff_id 2.


-- 6. How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;
-- GROUP BY district;   I guess this way works too if you want to do a 3-liner
-- Reasoning..
-- There are 378 district names. I also checked without using COUNT and it does say the total is 603 at the bottom right corner.


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id 
ORDER BY COUNT(actor_id) DESC;

SELECT film_id, title
FROM film
WHERE film_id = 508;
-- Reasoning...
-- Lambs Cincinatti is pulled up when running lines 190-192.


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT store_id, last_name
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;
-- Reasoning..
-- There are 13 customers with the last name ending 'es' according to the data and .


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

-- Personal attempt
SELECT rental_id, COUNT(amount), customer_id
FROM payment
WHERE rental_id BETWEEN 380 AND 430
GROUP BY amount
HAVING customer_id > 250;


SELECT *
FROM payment;

--Dylan help
--the amount of distinct payments
--condition the pament amout was used for more than 250 rentals
--contion rentals made by customers is id's between 380 and 430
SELECT COUNT(amount), amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;
-- The answer is 3. (-415.01, -419.01, -417.01)


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;

--Reasoning...
--There are 5 total ratings. PG-13, NC-17, R, PG and G. and There are 224 movies with the rating of PG-13.