/*DROP TABLE IF EXISTS purchasesreturn;
CREATE TABLE purchasesreturn 
(
    purchase_id 	INT,
    customer_id 	INT,
    purchase_date 	DATE,
    return_date		DATE
);
INSERT INTO purchasesreturn VALUES
(1, 101, '2025-04-30', '2025-05-01'),
(2, 102, '2025-04-29', '2025-04-29'),
(3, 101, '2025-04-30', NULL),
(4, 101, '2025-04-05', NULL),
(5, 103, '2025-04-17', NULL),
(6, 102, '2025-04-29', NULL),
(7, 102, '2025-05-09', NULL),
(8, 103, '2025-05-01', '2025-05-10'); */

select * from purchasesreturn;

-- Problem 1: Successful Purchases
-- Problem Statement: Find customers with successful 
-- multiple purchases in the last 1 month. 
-- Purchase is considered successful if they are not 
-- returned within 1 week of purchase. 

with cte as (select
    customer_id
    ,purchase_date
    ,return_date
    ,purchase_date+7 as new_date
from
    purchasesreturn
order by
    customer_id
)
,cte_new as (select
    *
    ,case when return_date<=new_date then 'return' else 'successful' end as Flag
from
    cte
)
, cte_new1 as (select
    *
    ,case when return_date is null and flag = 'successful' then 0 else 1 end as elimination
from
    cte_new
)
select
    customer_id,
    count(customer_id)
from    
    cte_new1
where
    elimination=0
or
    flag='successful'
group by
    customer_id

/*
select customer_id
from purchasesreturn
where purchase_date > cast(current_date - interval '1 month' as date)
and (return_date is null 
    or return_date > cast(purchase_date + interval '1 week' as date))
group by customer_id
having count(customer_id) > 1
*/