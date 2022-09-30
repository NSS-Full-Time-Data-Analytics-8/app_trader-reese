--Ranked by App Store Rating
SELECT DISTINCT p.name, p.rating AS play_rating, a.rating AS app_rating
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
USING (name)
GROUP BY p.name, play_rating, app_rating
ORDER BY app_rating DESC;

--Ranked by Play Store Rating with Price
SELECT DISTINCT p.name, p.rating AS play_rating, p.price AS play_price, a.rating AS app_rating, a.price as app_price
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
USING (name)
WHERE p.price::money <= '2.5'
AND a.price::money <='2.5'
GROUP BY p.name, p.rating, p.price, a.rating, a.price
ORDER BY play_rating DESC
LIMIT 20;

--Ranked by App Store Rating with Price
SELECT DISTINCT p.name, p.rating AS play_rating, p.price AS play_price, a.rating AS app_rating, a.price as app_price
FROM play_store_apps AS p
INNER JOIN app_store_apps AS a
USING (name)
WHERE p.price::money <= '2.5'
AND a.price::money <='2.5'
GROUP BY p.name, p.rating, p.price, a.rating, a.price
ORDER BY app_rating DESC
LIMIT 20;


