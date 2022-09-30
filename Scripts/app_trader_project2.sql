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

SELECT *
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
