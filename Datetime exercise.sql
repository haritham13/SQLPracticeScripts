/******************************************************************************************
NAME: Few excerceises on Date Time
Author: Haritha Madala
Date: 28/01/2026
Purpose: 
		1) Find out the Last month Name?
		2) Find out the last day of the Current month
		3) Find out the First day Name of the Current month
		4) Week-wise no. of  accounts opened in last month
		5) List the names of account holders who have opened accounts in the last 5 days
		6) List Branch-wise, Product-wise TOTAL amount  as on last Friday
		7) List the Customers, who opened accounts in the first week of last month.
		8) How many customers opened accounts in last date of previous Month?

*******************************************************************************************/
---1) Find out the Last month Name?
			select datename(month,getdate()) as 'current month',
					datename(month,(dateadd(mm,-1,getdate()))) [last month]

--2) Find out the last day of the Current month
			select convert(varchar,getdate(),103) as 'current date', 
					eomonth(getdate()) as 'last date', 
						datename(DD,eomonth(getdate())) as 'last day',
							datename(Dw,eomonth(getdate())) as 'last day name'	

--3) Find out the First day Name of the Current month
	select convert(varchar,getdate(),103) as 'current date',  
			 DATENAME(DW,DATEADD(m, DATEDIFF(MONTH, 0, GETDATE()), 0)) FIRST_DAY_NAME
			 
			
	Select convert(varchar,getdate(),103) as 'CurrentDay',
			dateadd(mm, -1,dateadd(dd, +1, eomonth(getdate()))) as FirstDay, 
					datename(DW,dateadd(mm, -1,dateadd(dd, +1, eomonth(getdate())))) as FirstDayName,
					eomonth(getdate()) as LastDay

Go

--4) Week-wise no. of  accounts opened in last month

		SELECT count(*) 'WeekCount', DATEPART(ww,DOO) 'WeekNum' 
			FROM AccountMaster
				WHERE DATEPART(m,DOO) = DATEPART(m, DATEADD(m, -1, getdate()))
					AND
				DATEPART(yyyy, DOO) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
			group by datepart(ww,doo)
		
		USE INDIAN_BANK
		GO

				
--5) List the names of account holders who have opened accounts in the last 5 days
		SELECT NAME, DOO, DATEDIFF(DD,DOO,GETDATE()) FROM AccountMaster WHERE DATEDIFF(DD,DOO,GETDATE())<=5
		Go

--6) List Branch-wise, Product-wise TOTAL amount  as on last Friday
		SELECT name, DATENAME(DW, DATEPART(DD,DOO)),DOO FROM AccountMaster WHERE DATENAME(DW, DATEPART(DD,DOO))='Friday'
		
		SELECT  BRID,PID,SUM(CBALANCE) 
				FROM AccountMaster 
					WHERE exists 
							(SELECT DATENAME(DW, DATEPART(DD,DOO)),
									DOO FROM AccountMaster 
										WHERE DATENAME(DW, DATEPART(DD,DOO))='Friday')
			GROUP BY BRID, PID
		GO
--7) List the Customers, who opened accounts in the first week of last month.
		
		SELECT * FROM AccountMaster where month(DOO)=month(getdate())-1 and day(DOO) < 8
		go

		SELECT * FROM AccountMaster
				WHERE datepart(ww, DOO)=
						datepart(ww,DATEADD(mm,datediff(mm,0,getdate())-1,0)) 
								and 
							month(DOO)=month(getdate())-1
				go
				


--8) How many customers opened accounts in last date of previous Month?
	select * from AccountMaster
		where DOO=dateadd(mm,-1,EOMONTH(getdate()))
	Go

