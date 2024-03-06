#Data retrieval multiple tables-sql joins#
select *from movies;
select * from financials;
#JOIN#

select 
	m.movie_id,title,revenue,unit,currency 
from movies m
join financials   #default innerjoin###
on m.movie_id=financials.movie_id;

#LEFT JOIN###
select 
	m.movie_id,title,revenue,unit,currency 
from movies m
left join  financials  
on m.movie_id=financials.movie_id;

#RIGHT JOIN###
select 
	f.movie_id,title,revenue,unit,currency 
from movies m
right join  financials  f
on m.movie_id=f.movie_id;


##FULL JOIN :TO GET ALL RECORDS###

select 
	m.movie_id,title,revenue,unit,currency 
from movies m
left join  financials  f
on m.movie_id=f.movie_id
union
select 
	f.movie_id,title,revenue,unit,currency 
from movies m
right join  financials  f
on m.movie_id=f.movie_id;

select 
	f.movie_id,title,revenue,unit,currency 
from movies m
 join  financials  f
using (movie_id);

###Exercise#

#1. Show all the movies with their language names

select title ,l.name
from movies m 
join languages l 
on m.language_id=l.language_id;

##OR##
SELECT m.title, l.name FROM movies m 
   JOIN languages l USING (language_id);
   
# 2) Show all Telugu movie names (assuming you don't know languageid for Telugu)#
select  m.title
from movies m 
join languages l 
using (language_id)
where l.name like "%TELUGU%";
#OR#
 SELECT title	FROM movies m 
   LEFT JOIN languages l 
   ON m.language_id=l.language_id
   WHERE l.name="Telugu";
   
#3) Show language and number of movies released in that language

select l.name, count(m.title) as cnt
from languages l
left join movies m
using(language_id)
group by language_id
order by cnt desc;

#OR#
SELECT 
            l.name, 
            COUNT(m.movie_id) as no_movies
	FROM languages l
	LEFT JOIN movies m USING (language_id)        
	GROUP BY language_id
	ORDER BY no_movies DESC;


select m.movie_id,title,budget,revenue,unit,
(revenue-budget) as profit
from movies m
join financials f
on m.movie_id=f.movie_id;

select m.movie_id,title,budget,revenue,unit,
case
when unit="Thousands" then round((revenue-budget)/1000,1)
when unit="Billions" then round((revenue-budget)*1000,1)
else round((revenue-budget),1)
end as profit_mln
from movies m
join financials f
on m.movie_id=f.movie_id
where industry="Bollywood"
order by profit_mln desc;

#JOINING MORE THAN TWO TABLES##
#here two rows we ae getting the actors for the same movie#
select m.title, a.name   from movies m
join movie_actor ma on ma.movie_id=m.movie_id
join actors a on a.actor_id=ma.actor_id;
#will use concat#
select m.title, group_concat(a.name separator " | ")  from movies m
join movie_actor ma on ma.movie_id=m.movie_id
join actors a on a.actor_id=ma.actor_id
group by m.movie_id;


#Now I want actor with his all  movies#

select a.name,group_concat(m.title separator " | ") as movie_titles from actors a
join movie_actor ma on ma.actor_id=a.actor_id
join movies m on m.movie_id=ma.movie_id
group by a.actor_id;

#Now I want actor with his all  movies count#

select a.name,group_concat(m.title separator " | ") as movie_titles, 
count(m.title) as movie_count
from actors a
join movie_actor ma on ma.actor_id=a.actor_id
join movies m on m.movie_id=ma.movie_id
group by a.actor_id
order by movie_count desc;

 #Generate a report of all Hindi movies sorted by their revenue amount in millions.
#Print movie name, revenue, currency, and unit#
select m.title as movie_name,f.currency,f.unit,
case 
when unit="Thousands" then revenue/1000
when unit="Billions" then revenue*1000
else revenue
End as revenue_mln 
from movies m join financials f on m.movie_id=f.movie_id
where industry="Bollywood"
order by revenue_mln desc; 


#1) Generate a report of all Hindi movies sorted by their revenue amount in millions. 
#Print movie name, revenue, currency, and unit#

	SELECT 
		title, revenue, currency, unit, 
			CASE 
					WHEN unit="Thousands" THEN ROUND(revenue/1000,2)
			WHEN unit="Billions" THEN ROUND(revenue*1000,2)
					ELSE revenue 
			END as revenue_mln
	FROM movies m
	JOIN financials f
			ON m.movie_id=f.movie_id
	JOIN languages l
			ON m.language_id=l.language_id
	WHERE l.name="Hindi"
	ORDER BY revenue_mln DESC