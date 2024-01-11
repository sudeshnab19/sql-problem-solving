/*What was the maximum number of pizzas delivered in a single order?*/

SELECT
    count(pizza_id) as max_no_pizza
    ,ord_id
FROM
    customer_orders as c
GROUP BY
    c.ord_id
ORDER BY
    count(pizza_id) DESC
LIMIT 1
;
/*SELECT
    *
FROM
    customer_orders

INSERT INTO customer_orders (ord_id,cust_id,pizza_id,exclusions,extras,order_date)
VALUES(100,110,222,'yes','yes','2023-10-01 11:30:00+05:30')*/


