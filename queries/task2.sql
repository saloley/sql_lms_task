select * from (
select first_name,last_name,COUNT(rental_date) AS rental_count,

dense_rank() over(order by COUNT(rental_date) desc) as desc_rank

from actor 
join film_actor using (actor_id)
join film using(film_id)
join inventory using (film_id)
join rental using (inventory_id)
group by actor_id,1,2

) as ranked 
where desc_rank <=10 
order by 3,4 desc