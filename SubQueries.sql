#SUB QUERIES###

select * from movies;
select *from movies order by imdb_rating desc limit 1;
select max(imdb_rating) from movies;

#writing subquery#
select *from movies
where imdb_rating=(select max(imdb_rating) from movies);

select *from movies
where imdb_rating=(select min(imdb_rating) from movies);
#returned a single value#

 select * from movies 
 where imdb_rating in (
      (select min(imdb_rating) from movies),
      (select max(imdb_rating) from movies));
      #It returns list of values#
      
      #select all the age of actors  whose age is >70 and <80#
   select*from actors;   

select name,year(curdate())-birth_year as age from actors
 having age>70 and age<85;
 
select *from 
(select name,year(curdate())-birth_year as age from actors) as actors_age
where age>70 and age<85;

#Any,ALL OPERATORS###

#find the actors in the movies where the actors acted in any of these movie ids ared (101,110,121)
select * from actors a where actor_id in(
select actor_id from movie_actor m where movie_id in (101,110,121));

select * from actors a where actor_id=any(
select actor_id from movie_actor m where movie_id in (101,110,121));

#select all the movies whose ratings higher than any of the marvel ratings#
 select *from movies where imdb_rating>some(
 select imdb_rating from movies where studio="Marvel Studios");

select *from movies where imdb_rating>any(
 select imdb_rating from movies where studio="Marvel Studios");
 
 #select all the movies whose ratings higher than**ALL** of the marvel ratings#
select *from movies where imdb_rating>ALL(
 select imdb_rating from movies where studio="Marvel Studios");
					#OR#
 select *from movies where imdb_rating>(
 select max(imdb_rating) from movies where studio="Marvel Studios");
 
 