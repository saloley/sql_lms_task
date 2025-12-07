
select first_name,last_name, count(rental_date)  from
actor 
join film_actor using (actor_id) 
join film using(film_id) 
join inventory using (film_id) 
join rental using (inventory_id) 

group  by actor_id,first_name,last_name order by 3 desc limit 10;