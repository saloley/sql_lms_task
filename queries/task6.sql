SELECT city,SUM(active) AS active_customers,SUM(1 - active) AS inactive_customers
FROM city
    JOIN address USING (city_id)
    JOIN customer USING (address_id)
GROUP BY city_id, city
ORDER BY inactive_customers DESC;