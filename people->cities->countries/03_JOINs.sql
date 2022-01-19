-- No direct relation between people and capitals
-- join people with cities and cities to capitals via country_id
SELECT f_name AS "First Name",
       s_name AS "Surname",
       'Mallorca' AS "Location",
       c2.name AS "Capital City"
FROM people
JOIN cities c on people.city_id = c.id
    JOIN capitals c2 on c.country_id = c2.country_id
WHERE city_id = 4;

-- count people in DB from cities if is_capital
SELECT count(person_id) AS "People Count",
       c.name AS "Capital City"
FROM people
JOIN cities c on c.id = people.city_id
WHERE c.is_capital = TRUE
GROUP BY c.name
ORDER BY "People Count" DESC;

-- count people in DB from cities, display DESC + coutry
SELECT count(person_id) AS "People Count",
        c.name AS "Capital City",
        c2.country_name AS "Coutry"
FROM people
JOIN cities c on c.id = people.city_id
JOIN countries c2 on c.country_id = c2.country_id
GROUP BY c.name, c2.country_name
ORDER BY "People Count" DESC;

-- concatenation + escaping '
SELECT CONCAT (countries.country_name, '''s capital is ', capitals.name)
FROM countries
    JOIN capitals on capitals.country_id = countries.country_id
