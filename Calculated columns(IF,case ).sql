#CHAPTER2# HAVING CLAUSE,CALCULATED COLUMNS(IF,CASE,YEAR,CURYEAR)#

select *from movies;
select release_year,count(*) as movies_count 
from movies 
group by release_year
having movies_count>2
order by movies_count desc;

### ORDER HOW SQL PERFORMS ITS OPERATIONS#

#####   FROM---->WHERE---->GROUPBY----->Having----->Order by---------###
##  IMP is that to use HAVING clause it must be in the select clause 
#otherwise it wont work whereas where can use the column where it must not be 
#in select column VVVVIMP 
# always use having clause for the derived column or for the aggregate columns only------####

select release_year,count(*) as movies_count 
from movies 
where imdb_rating>6
group by release_year
having movies_count>2
order by movies_count desc;

###GROUP BY and HAVING Clauses always used together-####

select release_year,count(*) as movies_count 
from movies 
group by release_year
having imdb_rating>6
order by movies_count desc;   ### This will throw an error###


###CALCULATED COLUMNS####

select *from actors;

select *, year(curdate())-birth_year as age from actors;

select *from financials;
select *,(revenue-budget) as profit from financials;

select *,
if(currency="USD",revenue*80,revenue) as revenue_inr
from financials;
select distinct unit from financials;


billions--->revenue*1000
thousand---->revenue/1000
millions--->revenue


SELECT *,
CASE
    WHEN unit="Thousands" THEN revenue/1000
    WHEN unit="Billions"  THEN revenue*1000
    ELSE revenue
END AS revenue_mln
FROM financials;

###1) Print profit % for all the movies 

select *,(revenue-budget) as profit from financials;

   select 
        *, 
    (revenue-budget) as profit, 
    (revenue-budget)*100/budget as profit_pct 
   from financials;
   
   
SELECT * from financials WHERE movie_id % 2 = 0;
SELECT * from financials WHERE movie_id % 2 = 1;

SELECT count(distinct imdb_rating), STDDEV(imdb_rating) from movies;


   

