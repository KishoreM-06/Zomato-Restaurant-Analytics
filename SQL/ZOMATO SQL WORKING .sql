select	c.CountryCode, c.country, z.city 
from zomata z  join country c
on z.CountryCode=c.CountryCode;

# 1. Build a country Map Table

SELECT DISTINCT c.CountryCode,c.Country, z.City
FROM country c  JOIN zomata z
ON c.CountryCode = z.CountryCode;

select*from q1;

# Build a Calendar Table using the Column Datekey

select year(datekey)from zomata;
select monthname(datekey) from zomata;
select month(datekey) from zomata;
select day(datekey),dayname(datekey) from zomata;
select dayofweek(datekey) from zomata;
select weekday(datekey),week(datekey) from zomata;
select quarter(datekey) from zomata;
select concat("Q-", quarter(datekey) )Qtr from zomata;

select datekey, if(month(datekey)>=4,month(datekey)-3,month(datekey)+9)FinancialMonth from zomata;

SELECT datekey, 
CASE WHEN MONTH(datekey) >= 4 
THEN MONTH(datekey) - 3 
ELSE MONTH(datekey) + 9 END AS FinancialMonth 
from zomata;

select datekey,
if(month(datekey)between 4 and 6,"FQ-1",
if(month(datekey)between 7 and 9,"FQ-2",
if(month(datekey)between 10 and 12,"FQ-3","FQ-4"))) FinancialQuarter
FROM Zomata;


select datekey,
case 
when month(datekey) BETWEEN 4 and 6 then "FQ-1"
when month(datekey) BETWEEN 7 and 9  THEN "FQ-2"
when month(datekey) BETWEEN 10 and 12  THEN "FQ-3"
when month(datekey) BETWEEN 1  and 3   THEN "FQ-4" END AS FinancialQuarter
from  zomata;


SELECT DATEKEY, concat(year(datekey),"-",left(monthname(datekey),3))YearMonth from zomata;
SELECT DATEKEY,DATE_FORMAT(datekey, '%Y-%b') AS YearMonth FROM zomata;




