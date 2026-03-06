use master
go

/********************************************************************************************
NAME: Code FOR School DB
Author: Haritha Madala
Date: 03/02/2026
Purpose: Creating DB with  course master, enrollment master and student master tables 
			inserted few values
			13 queries done
			Views, Select, distinct, aggregate functions, date time, cube,joins, where, group by, order by, having
			
*********************************************************************************************/
DROP database DBSCHOOL
create database DBSCHOOL
go

use DBSCHOOL
go


create table CourseMaster
(
CID			int			Primary Key,
CourseName	Varchar(40)	NOT NULL, 
Category	Char(1)		NULL, check(Category='B' or Category='M' or Category='A'),
Fee			Smallmoney	NOT NULl check(Fee>0)
)
go

insert into CourseMaster values(10,'C','B',5000),
									(15,'C++','M',4500),
										(20,'Java','A',6000),
								             (25,'Python','A',9000),
								                 (30,'SQL','A',15000),
								              (35,'Azure','M',20000),
								          (40,'ML','A',1500),
								      (45,'DS','A',20000),
								  (50,'DA','M',26000),
							   (55,'Big Data','A',30000),
							(60,'Hadoop','A',40000),
						(65,'ASP.Net','M',15000),
					(70,'PHP','M',10000),
						(75,'CSS','A',12000),
							(80,'Jquery','B',18000),
								(85,'BOOTSTRAP','B',16000),
								    (90,'Android','M',12000),
								        (95,'AWS','A',30000),
								            (100,'AI','B',6000),
								                (105,'C#','B',5500),
								            (110,'VMWare','M',40000),
								        (115,'CCNA','A',35000),
								    (120,'zzzz','B', 10),
								(125,'Devops','A',100000)
GO
select * from EnrollmentMaster
select * from StudentMaster
select * from CourseMaster 



sp_help CourseMaster


create table StudentMaster
(
	SID		TinyInt		Primary Key,
	Name	Varchar(40)	NOT NULL,
	Origin	Char(1)		NOT NULL check(Origin='L' or Origin='F'),
	Type	Char(1)		NOT NULL, check(Type='U' or Type='G'),
)
Go


Insert into StudentMaster values(1,'Afrin', 'L','U'),
								   (2,'Amareswari' ,'F','G'),
									  (3,'Anusha','L','G'),
										(4,'Aparna','F','U'),
										   (5,'Arshiya', 'L','U'),
										      (6,'Aswini ','F','G'),
										          (7,' Audinarayana ','L','G'),
										             (8,' Chandu ','F','U'),
										                 (9,' Charitha ','F','U'),
										              (10,' Chiranjeevi ','L','U'),
										          (11,' David ','F','G'),
										       (12,' Divya ','L','G'),
										    (13,' Govardhani','F','U'),
										  (14,' Hari','L','G'),
									   (15,' Hari krishna ','F','U'),
									(16,' Baji ','L','U'),
								(17,' Haripriya ','F','G'),
								    (18,' Huzaifa ','L','G'),
										(19,' Janaki ','F','U'),
									    	(20,' Jyothi ','F','U'),
										       (21,' Jyothirmayee ','F','G'),
										            (22,' Kalyan Kumar ','L','U'),
										                (23,' Kalyan Reddy ','F','G'),
										                    (24,' Keerthi','L','G'), 
										                 (25,' Manjari ','F','U'),
										             (26,'Krishnaveni ','F','U'),
										         (27,' Pradeep','L','U'), 
										     (28,' Lakshmi ','F','G'),
										 (29,'Lokesh yadav ','L','G'),
									 (30,'Madhu Bharath','F','U'),
								 (31,'Sai Charan','L','U'),
							 (32,' maheswari ','F','G'),
						(33,' Mahidhar Reddy ','L','G'),
							 (34,' Mamatha ','F','U'),
								  (35,' Manasa ','F','U'),
									   (36,' Maneesha ','L','U'),
										   (37,' Manoja ','F','G'),
										       (38,' Mastan valli ','L','G'),
										            (39,' Monika ','F','G'),
										                 (40,' Mustaq ali ','F','U'),
										                     (41,' Narendra ','L','U'), 
										                  (42,' Nasreen ','F','G'),
										              (43,' Neeraja ','L','G'),
										          (44,' Nikhitha ','F','U'),
										      (45,' Nikhitha ','L','U'),
										  (46,' Parameswara Reddy ','L','U'),
									  (47,' Prabhavathi ','F','G'),
								  (48,' Prasanna Kumar Reddy','L','G'), 
							  (49,' Prasanthi','L','G'),
				     	  (50,'Pratapa Reddy', 'F','U'),
					  (51,'Venkata Prathyusha','F','G'),
				  (52,' Praveen Kumar','L','U')
GO

SELECT * FROM StudentMaster
GO

 
create table EnrollmentMaster 
(
	CID		int 		NOT NULL Foreign Key references CourseMaster(CID),
	SID		Tinyint		NOT NULL Foreign Key references StudentMaster(SID),
	DOE		Date		NOT NULL,
	FWF 	Bit			NOT NULL,
	Grade	Char(1)		null check(Grade='O' or Grade='A' or Grade='B' or Grade='C')
)
go
select * from CourseMaster where Category='B'
go

select 178*22
select * from courseMaster 
SELECT * FROM EnrollmentMaster 
go
select CID,SID from EnrollmentMaster group by SID,CID
order by CID
insert into EnrollmentMaster (CID, SID, DOE, FWF, Grade)
select
    10 + (abs(checksum(newid())) % 24) * 5 as CID,  -- 10 to 125 step 5
    1 + abs(checksum(newid())) % 52 as SID,         -- 1 to 52
    dateadd(day, -abs(checksum(newid())) % 365, getdate()) as DOE,
    abs(checksum(newid())) % 2 as FWF,
    case abs(checksum(newid())) % 4
        when 0 then 'O'
        when 1 then 'A'
        when 2 then 'B'
        else 'C'
    end as Grade
from sys.objects;

	    	
--get previous year
	select datepart(yy,DATEadd(yy,-1, getdate()))
	go

	select * from EnrollmentMaster where DATEPART(yy,doe)=datepart(yy,DATEadd(yy,-1, getdate()))
	order by DOE
	go

	create view vw_joinalltables
	as 
		select EnrollmentMaster.CID, EnrollmentMaster.SID,
			DOE,FWF,Grade,Name,Origin,Type,CourseName,Category,Fee 
				from EnrollmentMaster join StudentMaster on EnrollmentMaster.SID=StudentMaster.SID 
									  join CourseMaster on CourseMaster.CID=EnrollmentMaster.CID
Go
--USING THE ABOVE TABLE LAYOUTS AS SCHEMA, WRITE T-SQL STATEMENTS FOR THE FOLLOWING REQUIREMENTS:

--1.	List the course wise total no. of Students enrolled. Provide the information only for students 
		--	of foreign origin and only if the total exceeds 10.

				select c1.cid,c1.CourseName,count(c1.CID) as Noofstudents 
					from CourseMaster as c1 join EnrollmentMaster as cs1 on c1.cid=cs1.cid  
							 join StudentMaster as s1 on cs1.sid=s1.sid
							where s1.origin='F'
							group  by  CourseName, c1.CID
							having count(c1.Cid)>10
		go
		

--2.	List the names of the Students who have not enrolled for Java course.

			select distinct Name,SM.SID from EnrollmentMaster 
				as EM left join StudentMaster as SM on EM.SID=SM.SID
					where SM.SID not in
						(select distinct  SID 
							from EnrollmentMaster where CID=20
							group by CID,SID)
			Go

			----- or --------
			select Name from StudentMaster 
				where SID not in 
				( select EM.SID from EnrollmentMaster EM 
						join 
					CourseMaster CM on EM.CID = CM.CID
				where CM.CourseName = 'Java'
				)

--3.	List the name of the advanced course where the enrollment by foreign students is the highest.	
		 
			/*select CourseName,max(count(em.SID))
				from EnrollmentMaster as EM left join StudentMaster as SM on em.SID=SM.SID
					left join CourseMaster as CM on em.CID=CM.CID
						where Origin='F' and Category='A'
				group by CourseName*/
				
		select  top 1 CourseName,COUNT(*) as Total
				from EnrollmentMaster as EM left join StudentMaster as SM on em.SID=SM.SID
					left join CourseMaster as CM on em.CID=CM.CID
						where Origin='F' and Category='A'
				group by CourseName	
		order by 2 desc
		
	-----------View creation--------------------------		
		
		create view vw_tofindmaxForeign
		as
		(select  CourseName,COUNT(*) as Total
				from EnrollmentMaster as EM left join StudentMaster as SM on em.SID=SM.SID
					left join CourseMaster as CM on em.CID=CM.CID
						where Origin='F' and Category='A'
				group by CourseName)
		Go
			
		select * from vw_tofindmaxForeign where Total=(select MAX(total) from vw_tofindmaxForeign)
		Go


		
	--4.	List the names of the students who have enrolled for at least one basic course in the current month.
		
		select distinct Name,EnrollmentMaster.SID from StudentMaster join EnrollmentMaster on
					StudentMaster.SID=EnrollmentMaster.sid
							join CourseMaster on 
						EnrollmentMaster.CID=CourseMaster.CID
					where Category='B' and  month(DOE) =month(getdate()) and YEAR(DOE)=year(getdate()) 
				

					------------with Views----------------
		select distinct Name, SID from vw_joinalltables 
					where Category='B' and  month(DOE) =month(getdate()) and YEAR(DOE)=year(getdate())
Go

--5.	List the names of the Undergraduate, local students who have got a “C” grade in any basic course.
  
			select distinct Name from EnrollmentMaster as EM 
						left join 
				StudentMaster as SM on em.SID=SM.SID
						left join 
				CourseMaster as CM on em.CID=CM.CID
					where Grade='C' 
								and 
							Category='B' 
								and 
							Origin='L' 
								and 
							Type='U'
	GO

	    

--6.	List the names of the courses for which no student has enrolled in the month of May 2016.
select * from EnrollmentMaster where DATEpart(mm,doe)=5 and DATEPART(yy,doe)=2016
select CID,CourseName from CourseMaster  
		where CID not in
			( select CID from EnrollmentMaster where DATEpart(mm,doe)=5 and DATEPART(yy,doe)=2016)

Go

		insert into EnrollmentMaster values(10,15,'2016/5/5',1,'B'),
			(20,20,'2016/5/19',1,'O'),
					(30,50,'2016/5/25',0,'B'),
							(40,45,'2016/5/10',1,'C'),
									(50,19,'2016/5/29',1,'A'),
										(60,30,'2016/5/21',0,'C'),
									(70,26,'2016/5/8',1,'B'),
							(80,40,'2016/5/17',0,'O'),
					(90,50,'2016/5/1',1,'A'),
			(100,50,'2016/5/30',0,'B')
			go

--7.	List name, Number of Enrollments and Popularity for all Courses. 
		--Popularity has to be displayed as “High” 
		 --if number of enrollments is higher than 50,  “Medium” 
			--if greater than or equal to 20 and less than 50, and “Low” if the no. Is less than 20.

	select CM.CourseName,
			COUNT(EM.CID) AS CIDCOUNT ,
			case
				when COUNT(em.cid)>50 then 'High'
				when COUNT(em.cid)>=20 then 'Medium'
				else 'Low'
			end as Popularity
	from EnrollmentMaster as EM left join StudentMaster as SM on em.SID=SM.SID
			 join CourseMaster as CM on em.CID=CM.CID
			GROUP BY  CM.CourseName
			ORDER BY CIDCOUNT DESC
Go
			

--8.	List the most recent enrollment details with information on Student Name, Course name and age of enrollment in days.
					
					select top 5 Name,CourseName,Doe, datediff(dd,doe,getdate()) Days
							from  EnrollmentMaster  as EM left join StudentMaster  as SM on em.SID=SM.SID
									left join CourseMaster as CM on em.CID=CM.CID
						         			order by doe desc
Go


--9.	List the names of the Local students who have enrolled for exactly 3 basic courses. 

			select Name,COUNT(em.CID) as '3basic' from EnrollmentMaster as EM left join StudentMaster as SM on em.SID=SM.SID
				left join CourseMaster as CM on em.CID=CM.CID
				WHERE Origin='L'AND CATEGORY='B'
				group by Name
				having COUNT(em.cid)=3
Go

--10.	List the names of the Courses enrolled by all (every) students.
						
	/*select COURSENAME,COUNT(EnrollmentMaster.CID) AS 'COUNT OF ENROLLED' from EnrollmentMaster
		JOIN CourseMaster ON EnrollmentMaster.CID=CourseMaster.CID
			group by CourseName with cube
				order by 2 
	GO					
	select COURSENAME,SID,COUNT(EnrollmentMaster.CID) AS 'COUNT OF ENROLLED' from EnrollmentMaster
		JOIN CourseMaster ON EnrollmentMaster.CID=CourseMaster.CID
			group by CourseName,SID with cube
				order by 2 
	GO	*/		
	select CM.CourseName from CourseMaster CM join EnrollmentMaster EM on CM.CID = EM.CID
		group by CM.CID, CM.CourseName having count(distinct EM.SID) = (select count(*) from StudentMaster)
	GO
	-----or----------
	select CM.CourseName from CourseMaster CM
join EnrollmentMaster EM on CM.CID = EM.CID
group by CM.CID, CM.CourseName
having count(distinct EM.SID) =
       (select count(*) from StudentMaster)
	GO

--11.	For those enrollments for which fee have been waived, provide the names of students who have got ‘O’ grade.

		select Name from EnrollmentMaster as EM left join StudentMaster as SM on em.SID=SM.SID
			left join CourseMaster as CM on em.CID=CM.CID
		 where Grade='O' and fwf=1
Go

--12.	List the names of the foreign, undergraduate students who have got grade ‘C’ in any basic course.
         select Name from EnrollmentMaster as EM left join StudentMaster as SM on em.SID=SM.SID
			left join CourseMaster as CM on em.CID=CM.CID
			where Grade='C' and Category='B' and Origin='F' and Type='U'
			
			--select * from CourseMaster where Category='B' 
			 --select * from StudentMaster where Origin='F' and Type='U'
			  --select * from EnrollmentMaster where Grade='C'
Go

--13.	List the course name, total no. of enrollments in the current month.

	select CourseName, 
		count(datediff(mm,DOE,getdate())) as total
			from CourseMaster as Cm 
				left join EnrollmentMaster as Em on cm.CID=em.CID
					where datediff(mm,DOE,getdate())=0
						group by CourseName
							order by total desc
				------or----------					
			select CM.CourseName,count(EM.CID) as Total
			from CourseMaster CM left join EnrollmentMaster EM on CM.CID = EM.CID
			where month(EM.DOE)=month(getdate())
			and year(EM.DOE)=year(getdate())
			group by CM.CourseName
			order by Total desc