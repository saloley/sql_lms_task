SELECT c.name,SUM(p.amount)
FROM category c
JOIN film_category  USING (category_id)
JOIN film USING (film_id)
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment as p USING (rental_id)
GROUP BY 
    c.category_id, c.name
ORDER BY 
    2 DESC
LIMIT 1;