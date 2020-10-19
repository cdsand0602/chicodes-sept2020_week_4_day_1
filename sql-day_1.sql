-- Hello World SQL Query, SELECT all records from actor table
SELECT *
FROM actor;

-- Query for first_name and last_name in the actor table
SELECT first_name,last_name
FROM actor;

-- Query for a first_name that equals Nick using the WHERE clause
SELECT first_name,last_name 
FROM actor
WHERE first_name = 'Nick';

-- Query for a first_name that is equal to Nick using the LIKE and WHERE clauses
SELECT first_name,last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_name data that starts with a J using the LIKE and WHERE clauses -- using the wildcard
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_name data that starts with K and has 2 letters after the K using LIKE and WHERE clauses -- using underscore
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_name data that starts with a K and ends with th
-- using the LIKE and WHERE clauses -- using BOTH wildcard AND underscore
SELECT first_name,actor_id
FROM actor
WHERE first_name LIKE 'K__%th';


-- Comparing operators are: 
-- Greater Than (>) -- Less Than (<)
-- Greater or Equal (>=) -- Less or Equal (<=)
-- Not Equal (<>)

-- Explore Data with SELECT All Query (Specific to changing into new table)
SELECT *
FROM payment;

-- Query for data that shows customers who paid
-- an amount GREATER than $2
SELECT customer_id, amount
FROM payment
WHERE amount > 2.00;

-- Query for data that shows customers who paid
-- an amount LESS than $7.99
SELECT customer_id,amount
FROM payment
WHERE amount < 7.99;

-- Query for data that shows customers who paid
-- an amount LESS than or EQUAL to $7.99
SELECT customer_id,amount
FROM payment
WHERE amount <= 7.99;

--Query for data that shows customers who paid
--an amount GREATER that or EQUAL to $2.00
-- in ascending order
SELECT customer_id,amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;

-- Query for data that shows customers who paid
-- an amount BETWEEN $2.00 and $7.99
SELECT customer_id,amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- Query for data that shows customers who paid
-- an amount NOT EUQAL to  to $0.00
-- Ordered in DESCENDING order
SELECT customer_id,amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;

-- SQL Aggregations => SUM(),AVG(),COUNT(),MIN(),MAX()

-- Query to display sum of amounts paid that are greater than 5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;


-- Query to display average of amounts paid that are greater than $5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the count of amounts paid that are greater than 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the count of DISTINCT amounts paid that are greater than 5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- Query to display min amount greater than 7.99
SELECT MIN(amount) as Min_Num_Payments
FROM payment
WHERE amount > 7.99;

-- Query to display max amount greater than 7.99
SELECT MAX(amount) as Max_Num_Payments
FROM payment
WHERE amount  > 7.99;

-- Query to display all amounts
SELECT amount
FROM payment
WHERE amount = 11.99;


-- Query to display different amounts grouped together
-- and count the anmounts
SELECT amount,COUNT(amount)
FROM payment
GROUP BY amount
ORDER by amount;

-- Query to display customer_ids with the summed amounts for each customer_id
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;

-- Query to display customer_ids with the summed amounts for each customer_id -- Seperate example of
-- a different way to use Group by
SELECT customer_id,amount
FROM payment
GROUP BY amount,customer_id
ORDER BY customer_id DESC;

-- Query to explore the data inside of the customer table
SELECT * 
FROM customer;

-- Query to display customer_ids that show up more than 5 times
-- Grouping by the customer's email
SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 0;

-- Homework - Week 4 - Day 1
-- 1. How many actors are there with the last name 'Wahlberg'?
SELECT last_name,COUNT(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg'
GROUP BY last_name;

--2. How many payments were made between $3.99 and $5.99
SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;

--3. What film does the store have the most of?
SELECT * 
FROM inventory;

SELECT store_id,MAX(film_id) 
FROM inventory
GROUP BY store_id;

--4. How many customers have the last name 'William'?
SELECT COUNT(customer_id)
FROM customer
WHERE last_name LIKE 'William';

--5. What store employee sold the most rentals?
SELECT staff_id,COUNT(rental_id)
FROM rental
GROUP BY staff_id;

--6. How many different distinct names are there?
SELECT first_name, last_name, COUNT(DISTINCT first_name), COUNT(DISTINCT last_name)
FROM customer
GROUP BY first_name, last_name
ORDER BY last_name;

--7. What film has the most actors in it?
SELECT film_id,COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT desc;


--8. From store_id 1, how many customers have a last name ending with 'es?'
SELECT last_name,COUNT(customer_id)
FROM customer
WHERE last_name like '%es' AND store_id = '1'
GROUP BY last_name;

--9. How many payment amounts had a number of rentals about 250 for customers with ids between 380 and 430?
SELECT COUNT(amount),customer_id
FROM payment
WHERE customer_id 
BETWEEN 380 and 430
GROUP BY customer_id
HAVING COUNT(rental_id) > 250
ORDER BY customer_id;

--10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT rating,COUNT(DISTINCT rating),COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;










