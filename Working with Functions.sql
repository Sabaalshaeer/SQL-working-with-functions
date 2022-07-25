sp_help Obsolete_Titles

Select*
from Obsolete_Titles

--Performing Data Calculations
--List the details of obsolete book titles , along with the year in which they were pubished, and the age of the book
Select bktitle
   , pubdate
   , Datepart ( Year, pubdate) as year
   , Datediff(year, pubdate, Getdate()) as age
From Obsolete_Titles
where pubdate between '1/1/1994' and '12/31/2003'

--modify the query to use just the year
--DateDiff() is used to calculate the difference between 2 dates.DatePart is used
--when you want a specific part want to display from date specified format
Select bktitle
   , Datepart ( Year, pubdate) as year
   , Datediff(year, pubdate, Getdate()) as age
From Obsolete_Titles
where Datepart(year,pubdate) between 1994 and 2003

--Calculating Data using Aggregate Functions
--List all titles that were developed in 2017
Select *
From Titles
Where DatePart(year, pubdate) = 2017

--Display the total number of titles released, the total cost of development for all times,
--and the average development cost for a title in a year 2017
Select Count(bktitle) as title_count
   , SUM(devcost) as devcost_total
   , AVG(devcost) as devcost_average
from titles
where Datepart(year,pubdate) = 2017

--Find the number of unique prices
--note:Count would show a result of all records while count distinct will result
--in showing only distinct count. example: a table has 5 records as a,a,b,c,c, then
-- count is 5 while count distinct is 3.
Select Count(*) as #_rows
	, count(bktitle) as title_count
	, Count(slprice) Asprice_count
	, Count(distinct slprice) as distinct_price_count
	, Count(devcost) as devcost_count
	, SUM(devcost) as devcost_total
	, AVG(devcost) as devcost_average
from titles
where Datepart(year,pubdate) = 2017





