     ### Rrieve data using TEXT query##

SELECT *from movies;
SELECT *from movies where industry="Bollywood";
select count(*) from movies where industry="Bollywood";
select count(*) from movies where industry="Hollywood";
select  distinct  industry from movies;
select *from movies;
select *from movies where title like "%The%";
select *from movies where title like "The%";
select *from movies where title like "%The";
select *from movies where studio="";
select *from movies;
#1) Print all movie titles and release year for all Marvel Studios movies
   SELECT title, release_year from movies where studio="Marvel Studios";

#2) Print all movies that have Avenger in their name

select title from movies where title like "%Avenger%";

#3) Print the year in which "The Godfather" move was released;
 select * from movies;
 select release_year from movies where title="The Godfather";
 
 #4) Print all distinct movie studios on Bollywood industry;
  select distinct studio from movies where industry="Bollywood";

