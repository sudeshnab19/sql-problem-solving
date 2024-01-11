SELECT
    sales.*
FROM
   sales 
INNER JOIN
    members 
on
     sales.cus_id=members.cus_id
WHERE
    sales.order_date!=members.join_date

