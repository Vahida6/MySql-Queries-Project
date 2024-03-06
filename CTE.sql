###CTE-COMMON TABLE EXPRESSION###

#select movies with >500%profit#

select 
*,
  (revenue-budget)*100/budget as pct_profit
from financials 
where (revenue-budget)*100/budget>=500;

#select movies whose rating is less than avg rating
select * from movies 
where imdb_rating <(select avg(imdb_rating) from movies);

##****CTE****####

with x as (select 
	*,
	(revenue-budget)*100/budget as pct_profit
	from financials 
    ),
 y as (select * from movies 
	where imdb_rating <(select avg(imdb_rating) from movies)
    )
select
x.movie_id,x.pct_profit,
y.title,y.imdb_rating
from x 
join y 
on x.movie_id=y.movie_id
where (revenue-budget)*100/budget>=500;

##Select all Hollywood movies released after the year 2000 
#that made more than 500 million $ profit or more profit. 
#Note that all Hollywood movies have millions as a unit hence you don't 
#need to do the unit conversion. Also, you can write this query without CTE as well but you should try to write this using CTE only##

with cte as (select title, release_year, (revenue-budget) as profit
			from movies m
			join financials f
			on m.movie_id=f.movie_id
			where release_year>2000 and industry="hollywood"
	)
	select * from cte where profit>500
		
		

