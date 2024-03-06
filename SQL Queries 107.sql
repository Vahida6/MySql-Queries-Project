
create database Asgnmnt1

use  Asgnmnt1

----Table Creation
CREATE TABLE studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
-- Insertion
INSERT INTO studies
SELECT 'ANAND','SABHARI','PGDCA',4500 UNION ALL
SELECT 'ALTAF','COIT','DCA',7200 UNION ALL
SELECT 'JULIANA','BDPS','MCA',22000 UNION ALL
SELECT 'KAMALA','PRAGATHI','DCA',5000 UNION ALL
SELECT 'MARY','SABHARI','PGDCA ',4500 UNION ALL
SELECT 'NELSON','PRAGATHI','DAP',6200 UNION ALL
SELECT 'PATRICK','PRAGATHI','DCAP',5200 UNION ALL
SELECT 'QADIR','APPLE','HDCA',14000 UNION ALL
SELECT 'RAMESH','SABHARI','PGDCA',4500 UNION ALL
SELECT 'REBECCA','BRILLIANT','DCAP',11000 UNION ALL
SELECT 'REMITHA','BDPS','DCS',6000 UNION ALL
SELECT 'REVATHI','SABHARI','DAP',5000 UNION ALL
SELECT 'VIJAYA','BDPS','DCA',48000
-- To View
SELECT*FROM studies

--Table Creation
CREATE TABLE software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)
-- Insertion
INSERT INTO software
SELECT 'MARY','README','CPP',300, 1200, 84 UNION ALL
SELECT 'ANAND','PARACHUTES','BASIC',399.95, 6000, 43 UNION ALL
SELECT 'ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 UNION ALL
SELECT 'JULIANA','INVENTORY','COBOL',3000, 3500, 0 UNION ALL
SELECT 'KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7 UNION ALL
SELECT 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4 UNION ALL
SELECT 'MARY','CODE GENERATOR','C',4500, 20000, 23 UNION ALL
SELECT 'PATTRICK','README','CPP',300, 1200, 84 UNION ALL
SELECT 'QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 UNION ALL
SELECT 'QADIR','VACCINES','C',1900, 3100, 21 UNION ALL
SELECT 'RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 UNION ALL
SELECT 'RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 UNION ALL
SELECT 'REMITHA','PC UTILITIES','C',725, 5000, 51 UNION ALL
SELECT 'REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 UNION ALL
SELECT 'REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 UNION ALL
SELECT 'VIJAYA','TSR EDITOR','C',900, 700, 6

-- To View
SELECT *FROM software


---Table Creation
CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)
-- Insertion
INSERT INTO programmer
SELECT 'ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 UNION ALL
SELECT 'ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 UNION ALL
SELECT 'JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 UNION ALL
SELECT 'KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 UNION ALL
SELECT 'MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 UNION ALL
SELECT 'NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 UNION ALL
SELECT 'PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 UNION ALL
SELECT 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 UNION ALL
SELECT 'RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 UNION ALL
SELECT 'REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 UNION ALL
SELECT 'REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 UNION ALL
SELECT 'REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 UNION ALL
SELECT 'VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500
-- To View
SELECT * FROM programmer

---1.Find out the selling cost AVG for packages developed in Pascal.----------

select avg(SCOST) as AVG_COST from software where DEVELOPIN='PASCAL'

---OR---

select DEVELOPIN, avg(SCOST) as AVG_COST from software where DEVELOPIN='PASCAL' group by DEVELOPIN

---2.Display Names, Ages of all Programmers-------------

select PNAME as NAME, DATEDIFF(YY,DOB,getdate()) as AGE from programmer

---OR-----

select PNAME as NAME, YEAR(getdate())-YEAR(DOB) as AGE from programmer

----3.Display the Names of those who have done the DAP Course.------------------------

select PNAME as NAME from studies  where COURSE='DAP'

----4.Display the Names and Date of Births of all Programmers Born in January-----------------

select PNAME as NAME, DOB from programmer where month(DOB)=1

---OR----------

select PNAME as NAME ,DOB from programmer where DATENAME(MM,DOB)='JANUARY'

----5.What is the Highest Number of copies sold by a Package?--------


select max(sold) as Max_sold from software 

select PNAME from software where sold=(select max(sold) from software)

----6.Display lowest course Fee.----

select min(COURSE_FEE) as lowest_fees from studies

-----(OR)

select PNAME,INSTITUTE,COURSE_FEE from studies where COURSE_FEE=(select min(COURSE_FEE) as lowest_fees from studies)


----7.How many programmers done the PGDCA Course?--------------

select count(PNAME) as No_of_Proggrammer from studies where COURSE='PGDCA'

---------(OR)------------------------
 select PNAME,count(PNAME) as No_of_Proggrammer from studies where COURSE='PGDCA'group by PNAME

 ---8.How much revenue has been earned thru sales of Packages Developed in C------------------

 select sum(SCOST*SOLD) from software where DEVELOPIN='C' 

 ---(OR)

 select PNAME,TITLE,DEVELOPIN,(SCOST*SOLD) revenue from software where DEVELOPIN='C' 


 ----9.Display the Details of the Software Developed by Ramesh---------


 select *from software where PNAME='RAMESH'

-----10.How many Programmers Studied at Sabhari?------------------

select count(PNAME)as no_of_programmers from studies where INSTITUTE='SABHARI'

-------------------(OR)----------------------

 select PNAME,count(PNAME)as no_of_programmers from studies where INSTITUTE='SABHARI' group by PNAME

 -------------------(OR)---------------------
 select INSTITUTE,count(PNAME)as no_of_programmers from studies where INSTITUTE='SABHARI' group by INSTITUTE


 ----11.Display details of Packages whose sales crossed the 2000 Mark--------------------------

 ---without in built function--------------
 select TITLE,sum(SCOST*SOLD) as Total_Revenue from software group by TITLE having sum(SCOST*SOLD)>2000

 ----------(OR)------------
 ---with in built function--------------
 select PNAME,TITLE,DEVELOPIN,(SCOST*SOLD) as Total_Revenue from software where (SCOST*SOLD)>2000

 --12.Display the Details of Packages for which Development Cost have been recovered-------------------

 select *from software where (SCOST*SOLD)>DCOST


 -----13.What is the cost of the costliest software development in Basic?---------------

 select TITLE,MAX(SCOST) as Costliest from software where DEVELOPIN='BASIC' group by TITLE

 --------(OR)------------------------------------

  select DEVELOPIN,MAX(SCOST) as Costliest from software where DEVELOPIN='BASIC' group by DEVELOPIN

------14.How many Packages Developed in DBASE?-------

select count(DEVELOPIN) as Pkg_Developed from software where DEVELOPIN='DBASE' 


----15.How many programmers studied in Pragathi?----

select count(PNAME) as No_of_Praogrammers from studies where INSTITUTE='Pragathi'

--------------------------(OR)-------------------------------

select PNAME,count(PNAME) as No_of_Praogrammers from studies where INSTITUTE='Pragathi' group by PNAME

----16. How many Programmers Paid 5000 to 10000 for their course?

select count(PNAME) as No_of_Praogrammers_paid from studies where COURSE_FEE between 5000 and 10000

----17.What is AVG Course Fee

select AVG(COURSE_FEE) as Avg_course_fee from studies

---18. Display the details of the Programmers Knowing C.

select PNAME,DOB,DOJ,GENDER,SALARY from programmer where PROF1='c' or PROF2='c'
				(OR)
select  *from programmer where PROF1='c' or PROF2='c'

----19. How many Programmers know either COBOL or PASCAL.

select count(PNAME) from programmer where PROF1='COBOL' or PROF1='PASCAL' or PROF2='COBOL' or PROF2='PASCAL'

----20.How many Programmers Don’t know PASCAL and C

select count(PNAME) from programmer where PROF1!='PASCAL' and  PROF1!= 'C' and PROF2!='PASCAL' and  PROF2!= 'C' 

----21.How old is the Oldest Male Programmer

   SELECT MAX (FLOOR(Datediff("yyyy",DOB,getdate()))) FROM PROGRAMMER where gender='m';

----22.What is the AVG age of Female Programmers?

Select AVG(Datediff("yyyy",DOB,getdate())) as Average from programmer where gender='F'

----23.Calculate the Experience in Years for each Programmer and Display with their names in Descending order.

Select PNAME,Datediff("yyyy",DOJ,getdate()) as Experience from programmer order by PNAME desc

---24.Who are the Programmers who celebrate their Birthday’s During the Current Month?


 select pname,dob from programmer where month(dob)=month(getdate())


-----25. How many Female Programmers are there?

SELECT COUNT (PNAME) as FEMALE_PROG FROM PROGRAMMER WHERE GENDER='F';

-------26. What are the Languages studied by Male Programmers.

SELECT DISTINCT PROF1 LANGUAGES FROM PROGRAMMER WHERE GENDER='M' UNION
SELECT DISTINCT PROF2 FROM PROGRAMMER WHERE GENDER='M';

-----------27.What is the AVG Salary?

 SELECT AVG (SALARY) AS AVGSAL FROM PROGRAMMER;

 -----28.How many people draw salary 2000 to 4000?

SELECT count(PNAME) FROM PROGRAMMER WHERE SALARY BETWEEN 2000 AND 4000;


----29. Display the details of those who don’t know Clipper, COBOL or PASCAL.-----

SELECT * FROM PROGRAMMER WHERE PROF1 NOT IN ('CLIPPER','COBOL','PASCAL') AND PROF2 NOT IN ('CLIPPER','COBOL','PASCAL');


---30. Display the Cost of Package Developed By each Programmer.-----
      
SELECT PNAME,SUM(DCOST) AS TOTAL_COST FROM SOFTWARE GROUP BY PNAME;

---31. Display the sales values of the Packages Developed by the each Programmer-------------

  SELECT PNAME, SUM(SCOST*SOLD) as Sales_value FROM SOFTWARE GROUP BY PNAME;


----32. Display the Number of Packages sold by Each Programmer.

SELECT PNAME,COUNT(SOLD) AS TOTAL_PACK FROM SOFTWARE GROUP BY PNAME;

----33.Display the sales cost of the packages Developed by each Programmer Language wise.

 SELECT DEVELOPIN, SUM(SCOST) FROM SOFTWARE GROUP BY DEVELOPIN ;


 ----34.Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy-------------

       SELECT DEVELOPIN,AVG(DCOST),AVG(SCOST),AVG(SCOST) FROM SOFTWARE GROUP BY DEVELOPIN;

---35.Display each programmer’s name, costliest and cheapest Packages Developed by him or her.

  SELECT PNAME,MIN(DCOST) as Cheapest_Pkg ,MAX(DCOST) as  Costliest_Pkg  FROM SOFTWARE GROUP BY PNAME;

----36.Display each institute name with number of Courses, Average Cost per Course.

select *from studies

select INSTITUTE,count(COURSE) as Number_of_courses,AVG(COURSE_FEE) as Average_cost_per_Course from studies group by INSTITUTE


---37.Display each institute Name with Number of Students.

 SELECT INSTITUTE,COUNT(PNAME) as Number_of_students FROM STUDIES GROUP BY INSTITUTE;
 

 ---38. Display Names of Male and Female Programmers. Gender also.

 SELECT PNAME,GENDER FROM PROGRAMMER ORDER BY GENDER;

 ----39. Display the Name of Programmers and Their Packages---------

SELECT PNAME,TITLE FROM SOFTWARE ORDER BY PNAME;

---40. Display the Number of Packages in Each Language Except C and C++.

SELECT TITLE,DEVELOPIN from software WHERE DEVELOPIN NOT IN ('C','CPP')

----41.Display the Number of Packages in Each Language for which Development Cost is less than 1000.

SELECT count(TITLE) as Number_of_Pkg,DEVELOPIN from software  where DCOST<1000 group by DEVELOPIN ;

---42. Display AVG Difference between SCOST, DCOST for Each Package.

select TITLE, AVG(DCOST-SCOST) as AVG_DIFF from software group by TITLE;

---43.Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.

SELECT PNAME,SUM(SCOST) TSCOST, SUM(DCOST) TDCOST, SUM(DCOST-(SOLD*SCOST)) amount_to_be_recovered FROM SOFTWARE GROUP BY PNAME
HAVING SUM(DCOST)>SUM(SOLD*SCOST);


---44.Display Highest, Lowest and Average Salaries for those earning more than 2000.

SELECT MAX(SALARY) Max_Salary, MIN(SALARY) Min_Salary, AVG(SALARY) Avg_Salary FROM PROGRAMMER WHERE SALARY > 2000;


---45. Who is the Highest Paid C Programmers?

SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE PROF1 LIKE 'C' OR PROF2 LIKE 'C');

----46. Who is the Highest Paid Female COBOL Programmer?

SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL') and gender like 'F';

----47. Display the names of the highest paid programmers for each Language--------

select p.*
from (select p.*,
             max(salary) over (partition by prof1) as max1,
             max(salary) over (partition by prof2) as max2
      from programmer p
     ) p
where (salary = max1 and max1 >= max2) or
      (salary = max2 and max2 >= max1)


---48.Who is the least experienced Programmer.


SELECT FLOOR(datediff(YYYY,DOB,getdate())) EXP,PNAME
FROM PROGRAMMER
WHERE FLOOR(datediff(YYYY,DOB,getdate())) = (SELECT MIN(FLOOR(datediff(YYYY,DOB,getdate())))
FROM PROGRAMMER)

---49. Who is the most experienced male programmer knowing PASCAL.

SELECT FLOOR(DATEDIFF(YY, programmer.DOJ, getdate())) AS EXP,PNAME,PROF1, PROF2 from programmer
 where Floor( DATEDIFF(YY, programmer.DOJ, getdate()))=(select max(Floor(DATEDIFF(YY, programmer.DOJ, getdate()))) from programmer
  where gender ='m' and PROF1 LIKE 'pascal' or PROF2 LIKE 'pascal');


 
----50.Which Language is known by only one Programmer?

SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1  
HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1)=1 
UNION 
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 
HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1

------51.Who is the Above Programmer Referred in 50?

------Mary------CPP,Oracle
-------VIJAYA-------FoxPRO


----------52.Who is the Youngest Programmer knowing DBASE?

  SELECT FLOOR(DATEDIFF(YY, programmer.DOB, getdate())) AS Age,PNAME,PROF1, PROF2 from programmer
  where Floor( DATEDIFF(YY, programmer.DOB, getdate()))=(select min(Floor(DATEDIFF(YY, programmer.DOB, getdate()))) from programmer
  where PROF1 LIKE 'DBASE' OR PROF2 LIKE 'DBASE');

						-----------(OR)-------------

  SELECT DATEDIFF(YY, programmer.DOB, getdate()) AS Age,PNAME,PROF1, PROF2 from programmer
  where  DATEDIFF(YY, programmer.DOB, getdate())=(select min(DATEDIFF(YY, programmer.DOB, getdate())) from programmer
  where PROF1 LIKE 'DBASE' OR PROF2 LIKE 'DBASE');

  -------53.Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?------------

  SELECT * FROM PROGRAMMER 
  WHERE GENDER = 'F' AND SALARY >3000 AND (PROF1 NOT IN('C','CPP','ORACLE','DBASE') and  PROF2 NOT IN('C','CPP','ORACLE','DBASE'));

----54.Which Institute has most number of Students?-------

 select max(INSTITUTE) as most_no_of_students from studies


 ----To check-------------
 select INSTITUTE, count(PNAME) as no_of_programmers from studies  group by INSTITUTE order by institute desc


 ----55. What is the Costliest course?

 SELECT COURSE FROM STUDIES WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES);

-----56. Which course has been done by the most of the Students?

 SELECT course FROM STUDIES WHERE COURSE = (SELECT MAX(COURSE) FROM STUDIES);


 ----57. Which Institute conducts costliest course.

  SELECT INSTITUTE FROM STUDIES WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES);

  ---58. Display the name of the Institute and Course, which has below AVG course fee.
   
   SELECT INSTITUTE ,course FROM STUDIES WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE) FROM STUDIES);

----59.Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee,

SELECT COURSE FROM STUDIES 
WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE)+1000 FROM STUDIES) AND COURSE_FEE > (SELECT AVG(COURSE_FEE)-1000 FROM STUDIES);


----60. Which package has the Highest Development cost?

select title,DCOST from software
where DCOST=(select max(DCOST) from software)


---61. Which course has below AVG number of Students?

 select 
    course, student_count
    from (
        select 
            course, count(pname) student_count, avg(count(pname)) over() mean 
            from studies group by course
    ) sub
    where student_count <= mean;

-----62. Which Package has the lowest selling cost?

select title,SCOST from software
where SCOST=(select min(SCOST) from software)

----63. Who Developed the Package that has sold the least number of copies?

select PNAME,Sold from software
where Sold=(select min(SOLD) from software)


----64.Which language has used to develop the package, which has the highest sales amount?

select DEVELOPIN,SCOST from software
where SCOST=(select max(SCOST) from software)

----65.How many copies of package that has the least difference between development and selling cost where sold.

SELECT SOLD,TITLE FROM SOFTWARE 
WHERE TITLE = (SELECT TITLE FROM SOFTWARE WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE))

----66.Which is the costliest package developed in PASCAL

SELECT TITLE FROM SOFTWARE 
WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE
WHERE DEVELOPIN LIKE 'PASCAL');


----67.Which language was used to develop the most number of Packages.

SELECT DEVELOPIN FROM SOFTWARE GROUP BY DEVELOPIN HAVING MAX(DEVELOPIN) = (SELECT MAX(DEVELOPIN) FROM SOFTWARE);

---68. Which programmer has developed the highest number of Packages?

SELECT PNAME FROM SOFTWARE GROUP BY PNAME HAVING MAX(PNAME) = (SELECT MAX(PNAME) FROM SOFTWARE);

-----69.Who is the Author of the Costliest Package?

SELECT PNAME FROM SOFTWARE GROUP BY PNAME HAVING MAX(SCOST) = (SELECT MAX(SCOST) FROM SOFTWARE);


----70.Display the names of the packages, which have sold less than the AVG number of copies.

select TITLE,sold from software
where Sold<(select AVG(SOLD) from software)

---71.Who are the authors of the Packages, which have recovered more than double the Development cost?

      SELECT PNAME FROM SOFTWARE WHERE SOLD*SCOST > 2*DCOST;

------72.Display the programmer Name and the cheapest packages developed by them in each language----

SELECT  PNAME,TITLE,DEVELOPIN FROM SOFTWARE WHERE DCOST IN (SELECT MIN(DCOST) FROM SOFTWARE GROUP BY DEVELOPIN);

---73.Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.

SELECT PNAME, DEVELOPIN FROM SOFTWARE 
WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE GROUP BY PNAME) 
UNION 
SELECT PNAME, DEVELOPIN FROM SOFTWARE 
WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY PNAME);

---74.Who is the youngest male Programmer born in 1965?
 
 select PNAME from programmer
where datediff(mm,dob,getdate()) = (select min(datediff(MM,dob,getdate()))
from programmer
where year(dob) = 1965 and GENDER='M')


-----75. Who is the oldest Female Programmer who joined in 1992?

select PNAME from programmer
where datediff(mm,DOJ,getdate()) = (select max(datediff(MM,DOJ,getdate()))
from programmer
where year(DOJ) = 1992 and GENDER='F')


----76. In which year was the most number of Programmers born.

select year(dob) "Year",count(year(dob)) "No. of Programmers Born"
from programmer
group by year(dob)
having count(year(dob)) >= ALL (select count(year(dob))
from programmer
group by year(dob))

---77.In which month did most number of programmers join?

select month(DOJ) "month",count(month(DOJ)) "No. of Programmers join"
from programmer
group by month(DOJ)
having count(month(DOJ)) >= ALL (select count(month(DOJ))
from programmer
group by month(DOJ))

---78. In which language are most of the programmer’s proficient.

SELECT PROF1 as P_proficient FROM PROGRAMMER
GROUP BY PROF1
having count(prof1) >= ALL (select count(PROF1)
from programmer GROUP BY PROF1)
UNION
SELECT PROF2 FROM PROGRAMMER
GROUP BY PROF2
HAVING count(prof1) >= ALL (select count(PROF2)
FROM PROGRAMMER GROUP BY PROF2)


--79.Who are the male programmers earning below the AVG salary of Female Programmers?

SELECT PNAME FROM PROGRAMMER WHERE GENDER = 'M' AND SALARY < (SELECT(AVG(SALARY))FROM PROGRAMMER WHERE GENDER = 'F');

----80.Who are the Female Programmers earning more than the Highest Paid?

SELECT PNAME FROM PROGRAMMER WHERE GENDER = 'F' AND SALARY = (SELECT(max(SALARY))FROM PROGRAMMER WHERE GENDER = 'F');

---81. Which language has been stated as the proficiency by most of the Programmers?

SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 = (SELECT MAX(PROF1) FROM PROGRAMMER);

--82. Display the details of those who are drawing the same salary.

select PNAME,salary from programmer where SALARY=any(select SALARY from programmer p group by salary having salary=p.salary and count(*)>1) order by SALARY desc;


---83.Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.

select DEVELOPIN from programmer p, software s where p.PNAME=s.PNAME and salary>3000 and GENDER='m';

---84.Display the details of the packages developed in Pascal by the Female Programmers.


select s.* from programmer p,software s where p.PNAME=s.PNAME and GENDER='f' and DEVELOPIN='pascal';

----85. Display the details of the Programmers who joined before 1990.

select *from programmer where Year(DOJ)<1990

---86.Display the details of the Software Developed in C By female programmers of Pragathi.

select s.* from software s,studies ST,programmer p where s.pname=ST.pname and p.PNAME=s.PNAME and GENDER='f' and INSTITUTE='pragathi';


---87.Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.


Select studies.INSTITUTE, count(software.DEVELOPIN) No_of_Pkg, count(software.sold) N_of_copies_sold, sum(software.sold*software.scost) Sales_Value from software,studies 
where software.PNAME=studies.PNAME group by studies.INSTITUTE;


---88.Display the details of the software developed in DBASE by Male Programmers, who belong to the institute 
------in which most number of Programmers studied-----

select software.* from programmer,software,studies 
where programmer.Pname=software.PNAME and software.PNAME=studies.PNAME and programmer.PNAME=studies.PNAME 
and  GENDER='m' and DEVELOPIN='dbase'

----89.Display the details of the software Developed by the male programmers Born
--------before 1965 and female programmers born after 1975.

select s.* from programmer p,software s 
where s.PNAME=p.PNAME and GENDER='m' and year(dob)<64 or GENDER='f' and year(dob)>75


---90.Display the details of the software that has developed in the language which is
-------neither the first nor the second proficiency of the programmers.

select s.*  from programmer p,software s where s.pname=p.pname and (DEVELOPIN <> prof1 and DEVELOPIN <> prof2);

---91.Display the details of the software developed by the male students of Sabhari.

select s.* from programmer p,software s,studies st where p.pname=s.pname and s.pname=st.pname and GENDER='m' and INSTITUTE='sabhari';

---92. Display the names of the programmers who have not developed any packages.

      select pname from programmer where pname not in(select pname from software);

----93.What is the total cost of the Software developed by the programmers of Apple?

select sum(scost) from software s,studies st where s.pname=st.pname and INSTITUTE='apple';

----94. Who are the programmers who joined on the same day?

select a.pname,a.doj from programmer a,programmer b where a.doj=b.doj and a.pname <> b.pname;

---95. Who are the programmers who have the same Prof2?

select pname,PROF2 from programmer where prof2 = any(select prof2 from programmer group by prof2 having count(*) >1) order by prof2 desc;


----96. Display the total sales value of the software, institute wise.

select studies.INSTITUTE,sum(software.sold*software.scost) sales_value from software,
studies where studies.pname=software.pname group by studies.INSTITUTE;


---97.In which institute does the person who developed the costliest package studied

select institute from software st,studies s where s.pname=st.pname 
group by INSTITUTE,dcost having max(dcost)=(select max(dcost) from software);

---98.Which language listed in prof1, prof2 has not been used to develop any package.

select prof1 from programmer where prof1 not in(select DEVELOPIN from software)
union 
select prof2 from programmer where prof2 not in(select DEVELOPIN from software);

----99.How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.

select p.salary,s2.course from programmer p,software s,studies s2 
where p.pname=s.pname and s.pname=s2.pname and scost=(select max(scost) from software);

----100.What is the AVG salary for those whose software sales is more than 50,000/-.

select avg(salary) from programmer p,software s where p .pname=s.pname and sold*scost>50000;

----101.How many packages were developed by students, who studied in institute that charge the lowest course fee?

select count(s.pname) Pkg_Developed from software s,studies st 
where s.pname=st.pname group by s.pname,COURSE_FEE having min(COURSE_FEE)=(select min(COURSE_FEE) from studies);

---102.How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?

select count(*)
from programmer p,software s
where s .pname=p.pname group by DEVELOPIN having min(dcost)=(select min(dcost) from software);


---103.How many packages were developed by the female programmers earning more than the highest paid male programmer?

select count(DEVELOPIN) Pkg_D_By_FP from programmer p,software s 
where s.PNAME=p.PNAME and GENDER='f' and salary>(select max(salary) from programmer p,software s 
where s.pname=p.pname and GENDER='m');


------104.How many packages are developed by the most experienced programmer form BDPS.

select count(*)
from software s,programmer p
where p.pname=s.pname group by doj having max(doj)=(select max(doj)
from studies st,programmer p, software s
where p.pname=s.pname and st.pname=p.pname and (institute='bdps'));

---105.List the programmers (form the software table) and the institutes they studied.


 select pname,INSTITUTE from studies where PNAME  in(select PNAME from software)
 

 ---106.List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF.

 select count(*),sum(scost*sold-dcost) "PROFIT"
from software
where DEVELOPIN in (select prof1
from programmer) group by DEVELOPIN;

---107.List the programmer names (from the programmer table) and No. Of Packages each has developed.

select s.pname,count(DEVELOPIN) No_of_Pkgs
from programmer p1,software s
where p1.pname=s.pname group by s.pname;
