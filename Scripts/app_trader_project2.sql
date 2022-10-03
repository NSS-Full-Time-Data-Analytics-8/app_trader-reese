--Price range <$2.50, so that App Trader doesn't have to spend more than $25,000
--Star rating, predicts longevity of app

SELECT *
FROM app_store_apps
WHERE "name" ILIKE '%halloween%';
--"Haunted Halloween Escape" rating: 4.5, free, 

SELECT *
FROM play_store_apps
WHERE "name" ILIKE '%halloween%';
--"Connect'Em Halloween" rating: 4.5, free, 500,000+ installs

SELECT DISTINCT p.name,a.name,p.price,a.price,p.rating,a.rating
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
USING (name)
WHERE "name" ILIKE '%zombie%'
AND p.rating >3
AND a.rating >3;
--"Zombie Catcher" rating: above 4.0 in both stores, free
--"Plants vs. Zombies 2" rating: above 4.0 in both stores, free

SELECT DISTINCT name,p.price, a.price, p.rating, a.rating
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
USING (name)
WHERE "name" ILIKE '%chick%'
--"Chick-fil-A" free app, rating 4.3 in play store, 3.5 in apple store


WITH both_rating AS (SELECT DISTINCT name, ROUND((a.rating + p.rating)/2, 2) AS avg_rating
					 FROM app_store_apps AS a
					 INNER JOIN play_store_apps AS p
					 USING(name)),
       both_cost AS (SELECT DISTINCT name, (a.price::money + p.price::Money)/2 AS avg_price
					 FROM app_store_apps AS a
					 INNER JOIN play_store_apps AS p
					 USING (name))
SELECT both_rating.name, both_rating.avg_rating, both_cost.avg_price
FROM both_rating
INNER JOIN both_cost
USING(name)
WHERE both_rating.avg_rating >= 4.0
 AND both_cost.avg_price BETWEEN '$0.00' AND '$2.50'
ORDER BY both_rating.avg_rating DESC
LIMIT 10;


WITH both_rating AS (SELECT DISTINCT name, ROUND((a.rating + p.rating)/2, 2) AS avg_rating
					 FROM app_store_apps AS a
					 INNER JOIN play_store_apps AS p
					 USING(name)),
       both_cost AS (SELECT DISTINCT name, (a.price::money + p.price::Money)/2 AS avg_price
					 FROM app_store_apps AS a
					 INNER JOIN play_store_apps AS p
					 USING (name))
SELECT both_rating.name, both_rating.avg_rating, both_cost.avg_price
FROM both_rating
INNER JOIN both_cost
USING(name)
WHERE both_rating.name ILIKE '%chick%'
  OR both_rating.name ILIKE '%halloween%'
  OR both_rating.name ILIKE '%zombie%'
ORDER BY both_rating.avg_rating DESC;
