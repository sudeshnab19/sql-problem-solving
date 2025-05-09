
/* TABLE CREATION SCRIPT */
/*
CREATE TABLE emp_details
    (
        id           int PRIMARY KEY,
        name         varchar(100),
        manager_id   int,
        salary       int,
        designation  varchar(100)

    );

INSERT INTO emp_details VALUES (1,  'Shripadh', NULL, 10000, 'CEO');
INSERT INTO emp_details VALUES (2,  'Satya', 5, 1400, 'Software Engineer');
INSERT INTO emp_details VALUES (3,  'Jia', 5, 500, 'Data Analyst');
INSERT INTO emp_details VALUES (4,  'David', 5, 1800, 'Data Scientist');
INSERT INTO emp_details VALUES (5,  'Michael', 7, 3000, 'Manager');
INSERT INTO emp_details VALUES (6,  'Arvind', 7, 2400, 'Architect');
INSERT INTO emp_details VALUES (7,  'Asha', 1, 4200, 'CTO');
INSERT INTO emp_details VALUES (8,  'Maryam', 1, 3500, 'Manager');
INSERT INTO emp_details VALUES (9,  'Reshma', 8, 2000, 'Business Analyst');
INSERT INTO emp_details VALUES (10, 'Akshay', 8, 2500, 'Java Developer');
*/
-- Find out the hierarchy of employees working under Asha
select
    *
from
    emp_details;

with recursive cte_rn as (
SELECT                          -- Base query
    id,
    name,
    manager_id, 
    1 as lvl
from
    emp_details
WHERE
    name='Asha'
union
SELECT                         -- Recursive query
    emp_details.id,            -- columns are coming from Base table
    emp_details.name, 
    emp_details.manager_id, 
    cte_rn.lvl +1 as lvl       -- iteration is for recursive table
from
    cte_rn 
inner JOIN
    emp_details
on
    cte_rn.id=emp_details.manager_id
    )
SELECT
    cte_rn.*
    ,emp_details.name as manager_name
from
    cte_rn
inner JOIN
    emp_details
on
    emp_details.id=cte_rn.manager_id;

-- Find out the hierarchy of Managers for David

with recursive cte_rn as (
SELECT                          -- Base query
    id,
    name,
    manager_id, 
    1 as lvl
from
    emp_details
WHERE
    name='David'
union
SELECT                         -- Recursive query
    emp_details.id,            -- columns are coming from Base table
    emp_details.name, 
    emp_details.manager_id, 
    cte_rn.lvl +1 as lvl       -- iteration is for recursive table
from
    cte_rn 
inner JOIN
    emp_details
on
    cte_rn.manager_id=emp_details.id
    )
SELECT
    cte_rn.*
    ,emp_details.name as manager_name
from
    cte_rn
inner JOIN
    emp_details
on
    emp_details.id=cte_rn.manager_id;
