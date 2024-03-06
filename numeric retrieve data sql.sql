## Rrieve data using Numeric query##
select *from movies;
select *from movies where imdb_rating>=9; #it will include the 9.0 also by using >=
select *from movies where imdb_rating>9; #only two movies it will show
select *from movies where imdb_rating<=5 ; 
select *from movies where imdb_rating>=6 and imdb_rating<=8 ; 
select *from movies where imdb_rating between 6 and 8;

select *from movies where release_year=2022 or release_year=2021 or release_year=2019; 
select *from movies where release_year IN (2022,2021,2019);  #we can use IN for both text as well as numeric queries as well;
select *from movies where studio IN ("Marvel Studios","Zee Studios");
select *from movies where imdb_rating is Null;
select *from movies where imdb_rating is not Null;

##ORDERBY CLause##
##descending order#
select *from movies 
where industry="Bollywood"
order by imdb_rating desc;

##ascending order#
select *from movies 
where industry="Bollywood"
order by imdb_rating asc;

#To retrieve TOP5 Rated data#
select *from movies 
where industry="Bollywood"
order by imdb_rating desc LIMIT 5;

# To get top5 movies starting from second highest movies#
select *from movies 
where industry="Bollywood"
order by imdb_rating desc LIMIT 5 offset 1;


##EXCERCISE##

#1. Print all movies in the order of their release year (latest first)
 select * from movies order by release_year desc;
 
 #2.all movies released this year in 2022
 
 select *from movies where release_year=2022;
 
 #3) ok now all the movies released after 2020
 select *from movies where release_year>=2020;
 
 #4) all movies after year 2020 that has more than 8 rating
 select *from movies where release_year>2020 and imdb_rating>=8;
 
 #5) select all movies that are by marvel studios and hombale films
select *from movies where studio in ("marvel studios","hombale films");

#6) select all thor movies by their release year
select *from movies;
select title,release_year from movies where title like "%thor%" order by release_year desc;

#7) select all movies that are not from marvel studios
  select *from movies where studio not in ("marvel studios");
  
						#OR#
			select * from movies where studio!="marvel studios"

