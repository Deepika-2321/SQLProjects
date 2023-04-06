/* 
	Project : Querying a large relational database

	Problem Statement : How to get details about customers by querying a database

	Highlights : Table basics and data types
		     Various SQL operators
		     Various SQL functions
	
	Task 1: Download Adventure Works database from Github
	Task 2: Restore a backup of the database into the SQL Server
	Task 3: Perform the following with help of the above database

*/


-----------Get all details from Person table including email ID, Phone number, and phone number type


select * from 
[Person].[Person],[Person].[EmailAddress],[Person].[PersonPhone],[Person].[PhoneNumberType]



-----------Get the details of the sales header order made in May 2011


select * from [Sales].[SalesOrderHeader]

select convert(varchar(20),orderdate,106) from [Sales].[SalesOrderHeader]

alter table [Sales].[SalesOrderHeader]
add header_order_date varchar(20)

update [Sales].[SalesOrderHeader]
set header_order_date=convert(varchar(20),orderdate,106) from [Sales].[SalesOrderHeader]

select * from [Sales].[SalesOrderHeader] where header_order_date='31 May 2011'


----------------Get details of the sales header order made in the month of May 2011


select *  from [Sales].[SalesOrderDetail]

select *,modifieddate,day(modifieddate),year(modifieddate) from [Sales].[SalesOrderDetail] where day(modifieddate)=31 and year(modifieddate)=2011


select modifieddate,day(modifieddate),year(modifieddate) from [Sales].[SalesOrderDetail] where day(modifieddate)=31 and year(modifieddate)=2011


---------------Get the total sales made in  May 2011


select sum(orderqty*unitprice) from [Sales].[SalesOrderDetail] where day(modifieddate)=31 and year(modifieddate)=2011


---------------Get the total sales made in the year 2011 by month order by increasing sales


select sum(orderqty*unitprice) as sales,month(modifieddate) as month from [Sales].[SalesOrderDetail] 
where year(modifieddate)=2011 group by month(modifieddate) order by sales asc
 


