SELECT *
FROM play_store_apps;

SELECT *
FROM app_store_apps
WHERE "name" ILIKE '%halloween%';
--"Haunted Halloween Escape"

SELECT *
FROM app_store_apps
WHERE rating >4;
--"Plants vs Zombies HD"

SELECT p.name, p.rating
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING (name);

--shows apps from both with no duplicates
SELECT distinct *
FROM play_store_apps
INNER JOIN app_store_apps
USING (name)
WHERE play_store_apps.rating >4
AND app_store_apps.rating >4;
