SELECT
Q1.*
FROM (
    select
    s.brand1
    ,s.brand2
    ,s.year
    ,s.custom1
    ,s.custom2
    ,s.custom3
    ,s.custom4
    ,row_number() OVER(PARTITION BY s.year) as rn
from
    brands s
WHERE
    s.custom1=s.custom3
AND
    s.custom2=s.custom4
) Q1

WHERE
    Q1.rn=1

UNION

select
    b.brand1
    ,b.brand2
    ,b.year
    ,b.custom1
    ,b.custom2
    ,b.custom3
    ,b.custom4
    ,row_number() OVER(PARTITION BY b.year)
from
    brands b
WHERE
    b.custom1!=b.custom3
AND
    b.custom2!=b.custom4
ORDER by
    brand1 ASC



