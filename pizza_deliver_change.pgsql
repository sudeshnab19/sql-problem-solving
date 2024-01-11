/*For each customer, how many delivered pizzas had at least 1 change and how many had no changes?*/

select
    c.cust_id
    ,count(c.ord_id)
    ,c.exclusions as changes
from
    customer_orders as c
INNER JOIN
    runners_orders as r
ON
    c.ord_id=r.ord_id
WHERE
    r.cancellation='no'
GROUP BY
    c.cust_id
    ,c.exclusions
HAVING
    c.exclusions='yes'
OR
    c.exclusions='no'


