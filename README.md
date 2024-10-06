# Human Resources-Report-MySQL-Power BI

![Uploading Screenshot (1).png…]()

## The Data Used

**Data resource** - Human Resource records from 2000-2020 with approximately 22000 rows.

**Data cleaning and analysis** - MySQL Workbench

**Data visualization** - Microsoft Power BI

## Questions asked

1. What is the gender breakdown of employees in the company?
2. What is the race/ethnicity breakdown of employees in the company?
3. What is the age distribution of employees in the company?
4. How many employees work at headquarters versus remote locations?
5. What is the average length of employment for employees who have been terminated?
6. How does the gender distribution vary across departments and job titles?
7. What is the distribution of job titles across the company?
8. Which department has the highest turnover rate?
9. What is the distribution of employees across locations by state?
10. How has the company's employee count changed over time based on hire and term dates?
11. What is the tenure distribution for each department?

## Summary of findings

 - There are generally more male employees than female employees.
 - White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
 - The youngest employee is 22 years old and the oldest is 58 years old
 - 5 age groups were created (20-25, 26-35, 36-45, 46-55, 56-60). A large number of employees were between 26-35 followed by 36-45 while the smallest group was 56-60.
 - A large number of employees work at the headquarters versus those who worked remotely.
 - The average length of employment for terminated employees is around 8 years.
 - The gender distribution across departments is fairly balanced but there are generally more male than female employees.
 - Auditing and Research and Development departments have the highest termination rates respectively while Marketing and Sales have the lowest.
 - A large number of employees come from the state of Ohio.
 - The net change in employees has increased over the years.
 - The average tenure for each department is about 8 years with Auditing and Marketing having the highest and Support having the lowest.

## Limitations faced

 - Some values of age were in the negatives (212 values) and thus had to be excluded from the analysis.
 - Some values of the termdate column were set in the future hence had to be excluded from the analysis.

