-- How many accounts does Parch and Posey
SELECT COUNT(*) FROM accounts;

-- How much has Parch and Posey made overall
SELECT SUM(total_amt_usd) total_amt
FROM orders;

-- Find the total amount spent on standard_amt_usd 
-- and gloss_amt_usd paper
SELECT
SUM(standard_amt_usd) total_std_amt,
SUM(gloss_amt_usd) total_gloss_amt
FROM orders;

-- Find the standard_amt_usd per unit of standard_qty paper for the first 50 rows
SELECT  standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 50;

-- When was the earliest order ever placed? You only need to return the date
SELECT MIN(occurred_at) earliest_order_date
FROM orders;

-- When did the most recent (latest) web_event occur?
SELECT MAX(occurred_at) latest_event FROM web_events;

-- Which account (by name) placed the earliest order?
-- Your solution should have the account name and the date of the order
SELECT account_id, MIN(occurred_at) earliest_order
FROM orders
GROUP BY account_id
ORDER BY earliest_order;

SELECT name, a.id, MIN(occurred_at) earliest_order
FROM orders AS o
JOIN accounts AS a
ON o.account_id = a.id
GROUP BY name, a.id
ORDER BY earliest_order;
