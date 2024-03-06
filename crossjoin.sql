#CROSS JOIN###
SELECT * 
FROM food_db.variants
cross join food_db.items;

SELECT * ,concat(name," ",variant_name) as Full_Name,
(price+variant_price) as Full_Price
FROM food_db.variants
cross join food_db.items;
