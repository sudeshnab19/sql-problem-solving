/*how many bikes the shop owns by category
Display the category name and the number of bikes the shop owns in
each category (call this column numberof bikes ). Show only the categories
where the number of bikes is greater than 2.*/

/*Emily needs a list of customer names with the total number of
memberships purchased by each.
For each customer, display the customer's name and the count of
memberships purchased (call this column membership_
count ). Sort the
results by membership_
count , starting with the customer who has purchased
the highest number of memberships.
Keep in mind that some customers may not have purchased any
memberships yet. In such a situation, display 0 for the membership_
count .*/

select * from customer;
select * from bike;
select * from rental;
select * from membership_type;
select * from membership;

--1st problem solved
select
    category
    ,count(category) as numberofbikes 
from
    bike
group by
    category
having
    count(category)>2

--2nd problem solved
-- Left join gives the remaining customer names who do not have any membership
select
    c.name,
    count(m.customer_id) as membership_count
from
    customer as c
left join
    membership as m
on
    m.customer_id = c.id
group by
    c.name
    ,m.customer_id
order by    --alias also works for order by
    membership_count desc 

/* Emily is working on a special offer for the winter months. Can you help her
prepare a list of new rental prices?
For each bike, display its ID, category, old price per hour (call this column
old_price_per_hour ), discounted price per hour (call it new_price_per_hour ), old
price per day (call it old_price_per_day ), and discounted price per day (call it
new_price_per_day ).Electric bikes should have a 10% discount for hourly rentals 
and a 20% discount for daily rentals. Mountain bikes should have a 20% discount for
hourly rentals and a 50% discount for daily rentals. All other bikes should
have a 50% discount for all types of rentals.
Round the new prices to 2 decimal digits.*/

select
    id
    ,category
    ,price_per_hour as old_price_per_hour
    ,case when category='electric' then (price_per_hour*.9) 
        when category='mountain bike' then (price_per_hour*.8) else (price_per_hour*.5)
        end as new_price_per_hour
    ,price_per_day as old_price_per_day
    ,case when category='electric' then (price_per_day*.8)
        when category='mountain bike' then (price_per_day*.5) else (price_per_day*.5)
        end as new_price_per_day
from
    bike

/*4. Emily is looking for counts of the rented bikes and of the available bikes in
each category.
Display the number of available bikes (call this column 
available_bikes_count ) 
and the number of rented bikes (call this column rented_bikes_count )
by bike category. */ 

with cte as (select
    status
    ,category
    ,count(*)
from
    bike
group by
    category, status
having
    status in ('rented','available')
)
select
    cte.category
    ,case when status='available' then count else 0 end as available_bikes_count
    ,case when status='rented' then count else 0 end as rented_bikes_count
from
    cte

/* Emily is preparing a sales report. She needs to know the total revenue
from rentals by month, the total by year, and the all-time across all the
years.Display the total revenue from rentals for each month, the total for each
year, and the total across all the years. 
Do not take memberships into account. 
There should be 3 columns: year , month , and revenue.
Sort the results chronologically. Display the year total after all the month
totals for the corresponding year. Show the all-time total as the last row.
*/

with cte as (select
    extract(year from start_timestamp) as year
    ,extract (month from start_timestamp) as month
    ,extract (day from start_timestamp) as day
    ,duration
    ,total_paid
from
    rental
),
cte_n as (select
    sum(total_paid) over (partition by month, year order by month, year) as revenue
    ,cte.year
    ,cte.month
from
    cte
)
select
    revenue
    ,year
    ,month
from
    cte_n
group by
    year
    ,month