-- 2 select
SELECT * FROM dog_room;

-- 3 where
SELECT cat_id from cat_room
WHERE hotel_id = 2;

-- 4 sort
SELECT * from pet_owner
ORDER BY owner_age DESC;

-- 5 count
SELECT count(cat_id)
FROM cat
WHERE cat_age >=3;

-- 6 delete
DELETE from cat
WHERE cat_age <= 2;

DELETE from dog
WHERE dog_age <= 2;
