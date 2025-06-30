create database zomato_db;
use zomato_db;

-- CREATING TABLE 
CREATE TABLE zomato(
	id int auto_increment primary key,
	r_name varchar(100) ,
    online_order varchar(20) ,
    book_table varchar(20) ,
    rate text,
    votes int,
    approx_cost int,
    listed_in varchar(20)
);

SELECT * FROM zomato;


-- Extracted numeric ratings from text(rate) using SUBSTRING_INDEX()
ALTER TABLE zomato ADD numeric_rate DECIMAL(3,1);
UPDATE zomato
SET numeric_rate = CAST(SUBSTRING_INDEX(rate, '/', 1) AS DECIMAL(3,1));


-- List all unique restaurant types.
SELECT DISTINCT listed_in FROM zomato;


-- All restaurants offering both online order and table booking:
SELECT r_name
FROM zomato
WHERE online_order='yes' AND book_table='yes';


-- Find restaurants with a rating above 4.5.
SELECT 
	r_name, numeric_rate
FROM zomato 
WHERE numeric_rate > 4.5;


-- Top 5 most voted restaurants.
SELECT 
	r_name, votes
FROM zomato
ORDER BY votes DESC
LIMIT 5;


-- Compare online order availability across restaurant types.
SELECT
	listed_in, online_order, COUNT(*) AS count
FROM zomato
GROUP BY listed_in, online_order
ORDER BY count DESC; 


-- Average rating per restaurant type:
SELECT listed_in, 
	AVG(numeric_rate) as avg_rating
FROM zomato 
GROUP  BY listed_in
ORDER BY avg_rating DESC;


-- Total votes per restaurant type:
SELECT 
    listed_in, SUM(votes) as total_votes
FROM zomato
GROUP BY listed_in
ORDER BY total_votes DESC;


-- Restaurants with rating greater than 4.0 and cost less than ₹800:
SELECT 
	r_name, 
	numeric_rate,
	approx_cost
FROM zomato
WHERE numeric_rate > 4.0 AND approx_cost<800;


-- Count of restaurants by cost buckets:
SELECT 
	CASE 
      WHEN approx_cost <= 500 THEN 'LOW'
	  WHEN approx_cost BETWEEN 501 AND 1000 THEN 'MEDIUM'
      ELSE 'HIGH'
    END AS cost_category,
    COUNT(*) AS total_restaurants
FROM zomato
GROUP BY cost_category;


-- List the top 3 restaurant types with the highest average rating.
SELECT 
	listed_in, AVG(numeric_rate) AS avg_rating
FROM zomato
GROUP BY listed_in
ORDER BY avg_rating DESC
LIMIT 3;


-- Rating vs Online Order: Count of restaurants offering online order by rating bucket.
SELECT
 CASE
   WHEN numeric_rate >= 4 THEN '4+'
   WHEN numeric_rate >= 3 THEN '3-4'
   WHEN numeric_rate >= 2 THEN '2-3+'
   ELSE 'Below 2'
 END AS rating_category,
 COUNT(*) AS total_restaurants
FROM zomato
WHERE online_order='YES'
GROUP BY rating_category; 



    
    