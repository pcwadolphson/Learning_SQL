select monthname(rental_date) rental_month, count(*) num_rentals
from rental
where rental_date between '2005-05-01' and '2005-08-01'
group by monthname(rental_date);



select 
	sum(case when monthname(rental_date) = 'May' then 1
		else 0 end) May_rentals,
    sum(case when monthname(rental_date) = 'June' then 1
		else 0 end) June_rentals,
	sum(case when monthname(rental_date) = 'July' then 1
		else 0 end) July_rentals
from rental
where rental_date between '2005-05-01' and '2005-08-01';
