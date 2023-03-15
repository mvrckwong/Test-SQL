-- Testing SQL Queries

-- Write a query to list the candidates who possess all of 
-- the required skills for the job. Sort the output by candidate 
-- ID in ascending order.
SELECT candidate_id
FROM candidates
WHERE skill
    IN ('Python','Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY COUNT(skill);


-- Write a query that determines which parts have begun the assembly process 
-- but are not yet finished.
SELECT DISTINCT(part)
FROM parts_assembly
WHERE finish_date IS NULL;

-- Write a query to find the top 2 power users who sent the most messages on 
-- Microsoft Teams in August 2022. Display the IDs of these 2 users along with 
-- the total number of messages they sent. Output the results in descending 
-- count of the messages.
SELECT
    sender_id,
    COUNT(message_id) AS count_messages
FROM messages
WHERE
    EXTRACT(MONTH FROM sent_date) = '8' AND
    EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY count_messages DESC
LIMIT 2;

-- Write a query to list the top three cities that have the most completed 
-- trade orders in descending order.
SELECT 
  users.city,
  COUNT(trades.order_id) AS "total_order"
FROM trades
INNER JOIN users
  ON trades.user_id = users.user_id
WHERE trades.status = 'Completed'
GROUP BY users.city
ORDER BY total_order DESC
LIMIT 3;