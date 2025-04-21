
/* Print stars in descending order from 20 to 1 */


with recursive cte_rec as (
    select                  --Base query executes first- its output will be used in recursive query
        20 as n,
        repeat('* ', 20) as stars
    union all
    select  
        n-1,
        repeat('* ', n-1) as stars                -- Recursive query executes after base query with output of base query 
    from
        cte_rec
    where
        n>1                --termination condition 
)
select                      --last execution once both base and recursive query executed
    stars
from
    cte_rec