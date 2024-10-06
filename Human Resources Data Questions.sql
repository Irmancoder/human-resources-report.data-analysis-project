-- QUESTIONS
select * from `human resources`;

-- 1. What is the gender breakdown of employees in the company?
select gender, count(*) as count
from `human resources`
where age>=18 and termdate = '0000-00-00'
group by gender;

-- 2. What is the race/ethnicity breakdown of employees in the company?
select race, count(*) as count
from `human resources`
where age>=18 and termdate='0000-00-00'
group by race;

-- 3. What is the age distribution of employees in the company?
select 
min(age) as youngest,
max(age) as oldest
from `human resources`
where age>=18 and termdate = '0000-00-00';

select
case
when age>=20 and age<=25 then '20-25'
when age>=26 and age<=35 then '26-35'
when age>=36 and age<=45 then '36-45'
when age>=46 and age<=55 then '46-55'
when age>=56 and age<=60 then '56-60'
else '60+'
end as age_group,
count(*) as count
from `human resources`
where age>=18 and termdate='0000-00-00'
group by age_group
order by age_group;

select 
min(age) as youngest,
max(age) as oldest
from `human resources`
where age>=18 and termdate = '0000-00-00';

select
case
when age>=20 and age<=25 then '20-25'
when age>=26 and age<=35 then '26-35'
when age>=36 and age<=45 then '36-45'
when age>=46 and age<=55 then '46-55'
when age>=56 and age<=60 then '56-60'
else '60+'
end as age_group, gender,
count(*) as count
from `human resources`
where age>=18 and termdate='0000-00-00'
group by age_group, gender
order by age_group, gender;


-- 4. How many employees work at headquarters versus remote locations?
select location, count(*) as count
from `human resources`
where age>=18 and termdate = '0000-00-00'
group by location;

-- 5. What is the average length of employment for employees who have been terminated?
select
round(avg(datediff(termdate, hire_date))/365,0) as avg_employment_length
from`human resources`
where age>=18 and termdate != '0000-00-00' and termdate<= curdate();

-- 6. How does the gender distribution vary across departments and job titles?
select department, gender, count(*) as count
from `human resources`
where age>=18 and termdate = '0000-00-00'
group by department, gender
order by department;



-- 7. What is the distribution of job titles across the company?
select jobtitle,department, count(*) as count
from `human resources`
where age>=18 and termdate = '0000-00-00'
group by jobtitle, department
order by department;

-- 8. Which department has the highest turnover rate?
select department,
total_count,
terminated_count,
terminated_count/total_count as termination_rate
from(
select department,
count(*) as total_count,
sum(case when termdate !='0000-00-00' and termdate <= curdate()then 1 else 0 end)as terminated_count
from `human resources`
where age>=18
group by department
)as subquery
order by termination_rate desc;



-- 9. What is the distribution of employees across locations by city and state?
select location_state, count(*) as count
from `human resources`
where age>=18 and termdate = '0000-00-00'
group by location_state
order by count desc;



-- 10. How has the company's employee count changed over time based on hire and term dates?
select
year,
hires,
terminations,
hires-terminations as net_change,
round((hires-terminations)/hires*100,2) as net_change_percent
from(
select
YEAR(hire_date) as year,
count(*) as hires,
sum(case when termdate !='0000-00-00' and termdate <= curdate()then 1 else 0 end)as terminations
from `human resources`
where age>=18
group by year(hire_date)
)as subquery
order by year asc;

-- 11. What is the tenure distribution for each department?
select department, round(avg(datediff(termdate, hire_date)/365),0)as avg_tenure
from `human resources`
where termdate !='0000-00-00' and termdate <= curdate() and age>=18
group by department;