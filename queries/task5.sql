
select first_name,last_name,count(title)
from actor 
join film_actor as f using (actor_id) 
join film using (film_id)
join film_category using (film_id)
join category as c using (category_id)
where c.name = 'Children' 
group  by f.actor_id,first_name,last_name having count(title) in (select k from(
select count(title) as k
from actor 
join film_actor as f using (actor_id) 
join film using (film_id)
join film_category using (film_id)
join category as c using (category_id)
where c.name = 'Children' group  by actor_id  order by 1 desc) group by k order by k desc limit 3) order by 3 desc

