select * from (

select c.city_id,c.city,cg.name,
sum(case when r.return_date is not null 
then age(r.return_date,r.rental_date) else interval '0'
end
) as rental_time,



dense_rank() over (
partition by c.city_id
order by sum(case when r.return_date is not null 
then age(r.return_date,rental_date) else interval '0'
end) desc

) as ranked_in_rental_time




from category cg cross join city c

left join film_category using (category_id)
left join film using (film_id)
left join inventory using (film_id)
left join rental r using (inventory_id)
left join customer using (customer_id)
left join address using (address_id)

where c.city like 'a%' or c.city like '%-%'
group by 1,2,3

) as summurized
where  ranked_in_rental_time = 1
order by 2,3



