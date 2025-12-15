select * from (


SELECT c.name,dense_rank() over(order by SUM(p.amount) desc) as desc_rank
FROM category c
JOIN film_category  USING (category_id)
JOIN film USING (film_id)
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment as p USING (rental_id)
GROUP BY   c.category_id,1

) as ranked
where desc_rank = 1