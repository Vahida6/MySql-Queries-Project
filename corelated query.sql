##SUBQUERIES#

#Select the actor id,name the number of movies they acted in

explain analyze
select a.actor_id ,a.name,count(*)  as movies_count from movie_actor ma
join actors a 
on a.actor_id=ma.actor_id
group by actor_id
order by movies_count desc;

#Using CORELATED QUERY###

#Explain analyze#
select actor_id,name,
(select count(*)  as movies_count from movie_actor ma
where actor_id=actors.actor_id) as movies_count from actors
order by movies_count desc;

##1. Select all the movies with minimum and maximum release_year. 
#Note that there can be more than one movie in min and a 
#max year hence output rows can be more than 2
 select * from movies where release_year in(
 (select max(release_year) from movies),
 (select min(release_year) from movies));
 
#2) select all the rows from movies table whose imdb_rating is higher 
#than the average rating
 select * from movies where imdb_rating>(select avg(imdb_rating) from movies);
 
 