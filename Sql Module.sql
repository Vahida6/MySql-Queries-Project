create database MA3

use MA3

-------------------------------Module-2 Assignment---------------

---1.Create a customer table which comprises of these columns – ‘customer_id’, 
----‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’

create table customertable(customer_id int,first_name varchar(15),last_name varchar(10),email varchar(30),address varchar(20),city varchar(20),state varchar(15),zip int)


-----2. Insert 5 new records into the table------------

insert into customertable(customer_id ,first_name,last_name,email ,address,city ,state,zip)
values(1,'nazeer','basha','desire.nazeer@gmail.com','attapur','hyderabad','TS',2563),
(2,'Apurva','Wankade','apurva@yahoo.com','5th Cross','Pune','Mumbai',6894),
(3,'Gautham','Sinha','gautham@yahoo.com','New City','San Jose','CA',12868),
(4,'Vishal','V','vishal@gmail.com','4th Cross','Chennai','TamilNadu',6958),
(5,'Bob','Barly','bob@hotmail.com','3rd Street','Texas','CA',84985);

---------3. Select only the ‘first_name’ & ‘last_name’ columns from the customer table

select first_name,last_name from customertable;

-------4. Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’

select *from customertable where first_name like 'G%' and city='San Jose'


select *from customertable


-