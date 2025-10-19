/*drop table if exists student_dets;
create table student_dets (
    id int,
    studesnt_name varchar(50),
    enrolled_course varchar(50)
);
insert into student_dets values (1, 'Jacob','C1');
insert into student_dets values (1, 'Jacob','C2');
insert into student_dets values (2, 'Elon','C2');
insert into student_dets values (3, 'Larry','C3');
insert into student_dets values (4, 'Maria','C4');
*/

select
    *
from
    student_dets;

/*drop table if exists course_dets;
create table course_dets(
    course_id varchar(50),
    details varchar(50)
);
insert into course_dets values ('C1','Python for beginners');
insert into course_dets values ('C2','Snowflake for beginners');
insert into course_dets values ('C3','PowerBI DAX');
insert into course_dets values ('C4','Microsoft Azure fundamentals');
*/

SELECT
    *
from
    course_dets;

--Display the student name and their enrolled course name

SELECT
    s.studesnt_name,
    c.details
from
    student_dets as s
INNER join
    course_dets as c
on
    s.enrolled_course=c.course_id