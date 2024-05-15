select pymnt_grps.name, count(*) num_customers
from 
	(select customer_id, count(*) num_rentals, sum(amount) tot_payments
	from payment
	group by customer_id) pymnt
	inner join
	(SELECT 'Small Fry' name, 0 low_limit, 74.99 high_limit
		UNION ALL
	SELECT 'Average Joes' name, 75 low_limit, 149.99 high_limit
		UNION ALL
	SELECT 'Heavy Hitters' name, 150 low_limit, 9999999.99 high_limit) pymnt_grps
	ON pymnt.tot_payments
		between pymnt_grps.low_limit and pymnt_grps.high_limit
	GROUP BY pymnt_grps.name;
