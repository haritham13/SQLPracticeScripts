/****************************************************************************

NAME: HARITHA
TOPIC: EMP EXCERCISE AND PRACTICE ON CREATING IDENTITY
DATE: 12/2/2026
Purpose:
	basic select statment
	Date Time functions
	where clause, Gorup by, Having, Not, aggregate, between
**********************************************************************************/
use master
go

create database Employee
go

use Employee
go

create table Emp
(
	EID		INT				PRIMARY KEY,
	NAME	VARCHAR(100)	NOT NULL,
	GENDER  CHAR(1)         NOT NULL,
	SALARY	MONEY			NOT NULL,
	DOB		DATETIME		NOT NULL,
	CITY	VARCHAR(10)		NOT NULL

)
go
use Employee
go

create table ident
(
id		int			primary key identity(1,1),
Name	varchar(10)	not null,
place	varchar(10) null,

)
go

alter table ident add Gender  char(1)		not null check(Gender='M' or Gender='F')
go
truncate table ident


insert into ident values('jjj','chn','M')

insert into ident values('Haritha', 'Bangalore','F'),
						('Teja','Bangalore','M'),
						('Sabari','Chennai','F'),
						('Gayatri','Guntur','F'),	
						('Kalyani','Chennai','F'),
						('Priyanka','Himachal','F'),
						('sreenu','Chennai','M'),
						('Kalyan','Chennai','M'),
						('Teja','Hyderabad','F'),
						('Prudhvi','Hyderabad','M'),
						('Harshith','Pune','M'),
						('Ritu','Hyderabad','F'),
						('Neelima','Chennai','F'),
						('venky','Bangalore','M'),
						('Madhu','Bangalore','F')
go

select * from ident
go

delete from ident where id=3
go

SET IDENTITY_INSERT ident ON
go

INSERT INTO ident(id,Name,place,Gender) VALUES (3, 'Akhil','Vizag','M')
GO
INSERT INTO ident(id,Name,place,Gender) VALUES (17, 'Ram','Hyderabad','M')
GO
select @@IDENTITY
GO
INSERT INTO ident(id,Name,place,Gender) VALUES (16, 'chaitu','Chennai','M')
GO
select @@IDENTITY
GO

SET IDENTITY_INSERT ident OFF
GO
----Not able to add this after identity insert is OFF
INSERT INTO ident(id,Name,place,Gender) VALUES (25, 'cha','Chennai','M')
GO
insert into ident values('venu', 'Chennai','M')
GO
select * from ident
GO
select @@IDENTITY
GO


SELECT * FROM Emp


insert into Emp values(1,'Haritha','F',22000,'1991/07/12','BLR'),
						(2,'Teja','M',60000,'1989/5/20','BLR'),
						(3, 'Akhil','M',75000,'1988/7/8','Vizag'),
						(4,'Gayatri','F',45000,'1986/9/25','Guntur'),
						(5,'Kalyani','F',20000,'1992/10/5','CHN'),
						(6,'Priyanka','F',30000,'1980/2/6','Himachal'),
						(7,'sreenu','M',70000,'1993/12/16','CHN'),
						(8,'Kalyan','M',33000,'1996/6/12','CHN'),
						(9,'Teja','F',41000,'1995/4/8','HYD'),
						(10,'Prudhvi','M',86000,'1993/12/12','HYD'),
						(11,'Harshith','M',32000,'1991/11/7','Pune'),
						(12,'Ritu','F',50000,'1983/4/8','HYD'),
						(13,'Neelima','F',19000,'1994/7/13','CHN'),
						(14,'venky','M',56000,'1987/6/5','BLR'),
						(15,'Madhu','F',36000,'1987/1/19','BLR'),
						(16, 'Chaitu','M',43000,'1997/3/7','CHN'),
						(17, 'Ram','M',7000,'1990/8/7','HYD'),
						(18,'venu','M',82000,'1994/3/3','CHN')
	GO
	
	/*********************************************************************************************
						QUESTIONS
	*********************************************************************************************/
	
	---1) Find out no of employees
	SELECT COUNT(*) AS [NO OF EMPLOYEES] FROM Emp 
	go

	--2) Find out no of employees in Chennai City 
/*	select * from Emp 
	GO

	select CITY ,COUNT(*) AS CHN_EMP  from Emp  GROUP BY CITY 
	go

	*/
	
			select CITY ,COUNT(*) AS CHN_EMP  from Emp  
				WHERE CITY='CHN' GROUP BY CITY 
			go

		select count(*) 'Chennaiemp' from Emp
					where CITY='CHN'

	--3) Find out no of employees in Chennai  and Hyderabad Cities
				select CITY, COUNT(*) 'TOTAL' from Emp 
					where CITY IN('CHN','HYD') GROUP BY CITY
				GO

		
	--4) Find out no of employees, ONLY MALE in Bangalore City

				SELECT GENDER,CITY, COUNT(*) COUNT_M_BLR FROM Emp
					WHERE CITY IN ('BLR' ) AND  GENDER='M'
						GROUP BY GENDER,CITY
				GO

	--5) Find out no of employees in Hyderabad, Chennai, Bangalore Cities
			SELECT CITY,COUNT(EID) 'COUNT' FROM Emp
				where city IN( 'CHN' ,'BLR' ,'HYD') 
					GROUP BY CITY
			
			GO

	--6) Find out City wise total salary and no of employees
			SELECT 	CITY, 
					COUNT(EID) AS 'NO_OF_EMP',
					SUM(SALARY) AS TOTAL FROM EMP 
				GROUP BY CITY
			GO

	--7) Find out Gender wise and City Wise no of employees only for Hyderabad
	SELECT GENDER,
			CITY,
			COUNT(EID) AS NoOfEmp FROM EMP  
			WHERE CITY='HYD' 
			GROUP BY GENDER, CITY
	go

	--8) Find out Max Salary in Chennai City
	SELECT CITY, MAX(SALARY)AS MaxAtCHN FROM EMP 
	WHERE CITY='CHN'
	group by CITY
	GO
				------or-----

	SELECT MAX(SALARY)AS MaxAtCHN FROM EMP 
	WHERE CITY='CHN'
	GO
	--9) Find out Min Salary FOR Male Employees
			SELECT MIN(SALARY)AS MINSAL_Male FROM Emp where GENDER='M'
			GO

		--------OR-----
		SELECT GENDER, MIN(SALARY)AS MINSAL_Male FROM Emp 
		where GENDER='M' 
		GROUP BY GENDER
		GO

	---10)Find out Gender wise and City Wise no of employees only for FEMALE employees
			SELECT CITY, GENDER,  COUNT(EID) AS 'FEMALE EMP'  FROM EMP 
			WHERE GENDER='F' 
			GROUP BY GENDER, CITY
			GO

	--11)Find out no of employees City wise
	SELECT CITY, COUNT(EID) AS TOTAL FROM EMP GROUP BY CITY
	GO

	--12)Find out no of employees Gender Wise
	SELECT GENDER, COUNT(EID) FROM EMP GROUP BY GENDER
	GO
	
	--13)Find out no of employees City wise and Gender wise
	SELECT CITY,GENDER,COUNT(EID)AS COUNTID FROM EMP GROUP BY CITY,GENDER
	GO

	--14)Find out no of employees in Hyderabad City, whose Salary > 15000 
	SELECT CITY,COUNT(*) AS 'HYD_15KABOVE' FROM EMP
	WHERE SALARY>15000 
					AND 
			CITY='HYD' 
		GROUP BY CITY
	GO

	--15)Find out no of employees who is not staying in Chennai City 
		SELECT * FROM EMP WHERE CITY != 'CHN'
		go
				 ----or----------
		SELECT COUNT(EID) otherchennai FROM EMP WHERE CITY != 'CHN' 
		go

	
	
	--16)Find out city, which has hieghest no of employees 
		SELECT  top 1 CITY, COUNT(EID) AS [TOTAL] FROM EMP
				GROUP BY CITY 
				ORDER BY 2 DESC
		    GO



	--17)Find out employees, who born between March 1980 to Jan 1990
	select * from emp where dob between '1980/3/1' and '1990/1/30'


	--18)Find out employees, who are not born in month of May 1985  
	select * from emp 
	where dob not between '1985-05-01' and '1985-05-31'
				
				-----or -----------

		select * ,YEAR(DOB) as 'year' ,datename(mm,DOB) as 'Month' from Emp
		where Not ((year(DOB)=1985) AND (datename(mm,DOB)= 'May'))
	
	  ------or----
	 select * from emp where  DOB < '1985-05-01'
										 OR
							DOB > '1985-05-31'

	--19)Find out employees, who born on Thursday.
			select * ,datename(DW,DOB) as'bornThursday' from EMP
			where datename(DW,DOB)='Thursday'

			----or-------
		select * from Emp where datepart(WEEKDAY, DOB) = 5

		-----or----------
		select * from Emp where format(DOB, 'dddd') = 'Thursday'

	--20)Find city wise no of employees, display the data if the count is greater than 5.
			
			SELECT CITY, COUNT(EID) AS CITY_NO_EMP  FROM EMP
			GROUP BY CITY
			HAVING COUNT(EID)>5

	