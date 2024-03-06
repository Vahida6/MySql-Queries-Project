							#SUMMARY ANALYTICS#
 select * from movies;
 select max(imdb_rating) from movies where industry="BOLLywood";
						
select min(imdb_rating) from movies where industry="BOLLywood";

select min(imdb_rating) as min_rating,
max(imdb_rating) as max_rating,
round(avg(imdb_rating),2) as avg_rating from movies 
where studio="Marvel Studios";

select count(*) from movies where industry="Hollywood";

##GROUP BY##

select industry,
 count(*) from movies group by industry;
 
 select studio,
 count(*)  as cnt from movies group by studio order by cnt desc;
 
 select industry,count(industry) as cnt,
 round(avg(imdb_rating),1) as avg_rating from movies 
 group by industry
 order by avg_rating;
 
  select studio,count(studio) as cnt,
 round(avg(imdb_rating),1) as avg_rating from movies 
 group by studio
 order by avg_rating desc;
 
### 'Universal Pictures'  (Right click on result gridUniversal Pictures'(select copy field and paste it here  ###Universal pictures printed twice its because of space in the second field error these are dat errors need to rectify#
## 'Universal Pictures  '###

##One way to rectify this is##

select studio,count(studio) as cnt,
 round(avg(imdb_rating),1) as avg_rating from movies 
 where studio!=" "
 group by studio
 order by avg_rating desc;
 
 ##Exercise - Summary analytics (MIN, MAX, AVG, GROUP BY)

#1. How many movies were released between 2015 and 2022

select count(*) from movies where release_year between 2015 and 2022;

#2) print the max and min movie release year

select max(release_year) as max_year,
min(release_year) as min_year from movies;

#3) print a year and how many movies were released in that year starting with latest year
select release_year ,count(release_year) from movies group by release_year order by release_year desc ;

#OR#
select release_year, count(*) as movies_count 
   from movies group by release_year order by release_year desc




                      