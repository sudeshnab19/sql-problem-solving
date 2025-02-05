/*CREATE TABLE employees_ac  (employee_id int,employee_name varchar(15), email_id varchar(15) );

INSERT INTO employees_ac (employee_id,employee_name, email_id) VALUES ('101','Liam Alton', 'li.al@abc.com');
INSERT INTO employees_ac (employee_id,employee_name, email_id) VALUES ('102','Josh Day', 'jo.da@abc.com');
INSERT INTO employees_ac (employee_id,employee_name, email_id) VALUES ('103','Sean Mann', 'se.ma@abc.com'); 
INSERT INTO employees_ac (employee_id,employee_name, email_id) VALUES ('104','Evan Blake', 'ev.bl@abc.com');
INSERT INTO employees_ac (employee_id,employee_name, email_id) VALUES ('105','Toby Scott', 'jo.da@abc.com');
INSERT INTO employees_ac (employee_id,employee_name, email_id) VALUES ('106','Anjali Chouhan', 'JO.DA@ABC.COM');
INSERT INTO employees_ac (employee_id,employee_name, email_id) VALUES ('107','Ankit Bansal', 'AN.BA@ABC.COM');

select
    *
from
    employees_ac;
*/

select
    count(employee_id)
    ,email_id
from    
    employees_ac
group by
    email_id
having
    count(employee_id)>1;

select
    employee_id
from    
    employees_ac
where
    email_id like 
(select
    email_id
from    
    employees_ac
group by
    email_id
having
    count(employee_id)>1);
