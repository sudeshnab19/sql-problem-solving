
/*DROP TABLE IF EXISTS s_customers;
CREATE TABLE s_customers 
(
    id     INT,
    name   VARCHAR(50)
);
INSERT INTO s_customers VALUES
(101, 'David'),
(102, 'Robin'),
(103, 'Carol'),
(104, 'Ali');

DROP TABLE IF EXISTS orders;
CREATE TABLE orders 
(
    id              INT,
    customer_id     INT,
    total_cost      DECIMAL,
    order_date      DATE
);
INSERT INTO orders VALUES
(1, 101, 100, '2025-04-15'),
(2, 102, 40, '2025-04-20'),
(3, 101, 80, '2025-03-12'),
(4, 101, 120, '2025-03-12'),
(5, 103, 60, '2025-04-20'),
(6, 103, 50, '2025-04-20');
*/

SELECT * FROM s_customers;
SELECT * FROM orders;

with cte as (SELECT
    c.name,
    o.order_date as order_date,
    o.customer_id,
    sum(o.total_cost) as totalamount,
    dense_rank() over (partition by o.customer_id order by order_date desc) as rank
FROM
    s_customers as c
inner join
    orders as o
on
    c.id=o.customer_id
group by
    o.order_date, 
    o.customer_id,
    c.name
)
select
    name,
    order_date,
    totalamount
from
    cte
where
    rank=1
union all
select
    name,
    cast('9999-01-01' as DATE) as order_date,
    0 as totalamount
from
    s_customers
where
    s_customers.id not in (
        select
            customer_id
        from
            orders
    )