select * from `human resources`;

alter table `human resources`

change id emp_id varchar(20)null;

describe `human resources`;
select birthdate from `human resources`;

set sql_safe_updates=0;

update `human resources`
set birthdate=case
when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
else null
end;

alter table `human resources`
modify column birthdate date;
select birthdate from `human resources`;

update `human resources`
set hire_date=case
when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
else null
end;

alter table `human resources`
modify column hire_date date;

select hire_date from `human resources`;

update `human resources`
set termdate = if(termdate is not null and termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
where true;

set sql_mode = 'allow_invalid_dates';
alter table `human resources`
modify column termdate date;

select termdate from `human resources`;

alter table `human resources` add column age int;
update `human resources`
set age=timestampdiff(year, birthdate, curdate());
select
min(age)as youngest,
max(age)as oldest
from `human resources`;

select count(*) from `human resources` where age<18;

select age from `human resources`;

