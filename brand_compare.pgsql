WITH cte as 
    (
        SELECT
            b.*
            ,CASE WHEN b.brand1>b.brand2 THEN concat(b.brand1,b.brand2,year)
                ELSE concat(b.brand2,b.brand1,year) END as pair_id
        FROM
            brands b
        ),  
    cte_rn as
        (
        SELECT
        *
        ,row_number() OVER (PARTITION BY pair_id) as rn
        FROM
            cte
        )
SELECT
     brand1
    ,brand2
    ,year
    ,custom1
    ,custom2
    ,custom3
    ,custom4
FROM
    cte_rn
WHERE
    rn=1
OR
    custom2!=custom4
AND
    custom1!=custom3
ORDER BY
    brand1 ASC