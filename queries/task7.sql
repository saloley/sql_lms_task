select distinct on (city) city,c.name,sum(age(return_date,rental_date)) as total_rental_hours 
    from category as c 
join film_category using (category_id)
join film using (film_id)
join inventory using (film_id)
join rental using (inventory_id)
join customer using (customer_id)
join address using (address_id)
join city using (city_id)
where return_date is not null and (city ILIKE 'a%' OR city LIKE '%-%')
group by city,c.name order by city,c.name,total_rental_hours desc