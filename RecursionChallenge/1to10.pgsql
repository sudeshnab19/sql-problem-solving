with recursive cte_rec as (
    select                  --Base query executes first- its output will be used in recursive query
        1 as n
    union all
    select  
        n+1                -- Recursive query executes after base query with output of base query 
    from
        cte_rec
    where
        n<10                --termination condition 
)
select                      --last execution once both base and recursive query executed
    *
from
    cte_rec