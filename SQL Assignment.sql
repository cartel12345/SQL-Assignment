select * from "assignment".international_debt_with_missing_values idwmv;

--what is the total amount of debt owed by all countries
select * 
from assignment.international_debt_with_missing_values;

select (sum (debt)/1000000)::numeric(12,2)
from assignment.international_debt_with_missing_values; 

--how many distinct countries are recorded in the database

select 
count (distinct country_name)as unique_countries
from assignment.international_debt_with_missing_values idwmv ;

--what are the distinct types of debt indicators, what do they represent 
select * 


select 
distinct indicator_name
from assignment.international_debt_with_missing_values idwmv ;

select country_name,
max(debt)
from assignment.international_debt_with_missing_values idwmv 
group by country_name 
order by sum(debt) desc;

select distinct country_name
sum(debt) as total debt
--average debt across debt indicators

select distinct indicator_name,
avg(debt)
from assignment.international_debt_with_missing_values idwmv 
group by indicator_name;

--highest principle payments
select distinct country_name,
sum (debt)
from assignment.international_debt_with_missing_values idwmv 
where indicator_name like'%Principal repayments%'
group by country_name
having sum(debt)>=0
order by sum(debt) desc;

--What is the most common debt indicator across all countries?
select indicator_name,
count (indicator_name)
from assignment.international_debt_with_missing_values idwmv 
group by idwmv.indicator_name 
order by count (indicator_name) desc;
