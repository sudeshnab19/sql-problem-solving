SELECT
    *
from
    product_demo;
with cte as (
select
    store_id,
    case when ltrim(product_1) ilike 'apple%' then 1 else 0 end as product1,
    case when ltrim(product_2) ilike 'apple%' then 1 else 0 end as product2
from
    product_demo
)
SELECT
    store_id,
    sum(product1) as P1,
    sum(product2) as P2
from
    cte
GROUP by
    cte.store_id
order by
    store_id