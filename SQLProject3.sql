/*

Project 3 : Relational Database Design

Problem Statement : How to convert a relational design into tables in SQL Server?

Topics : In this project, I have worked on converting a relational design that enlists various users, their roles,
user accounts, and their statuses into different tables in SQL Server and insert data into them.
Having at least 2 rows in each of the tables,I have ensured to create respective foreign keys.


Tasks:
1. Define relations/attributes
2. Define primary keys
3. Create foreign keys

*/

---------------Creating tables

----Table 1

create table user_has_role
(id int primary key,
user_account_id int references user_account(id),
role_id int references role(id)
);

----Table 2

create table role
(id int primary key,
role_name varchar(100)
)

----Table 3

create table user_account
(id int primary key,
user_name varchar(100),
email varchar(254),
password varchar(200),
password_salt varchar(50) not null,
password_hash_algorithm varchar(50)
)

----Table 4

create table status
(
id int primary key,
status_name varchar(100),
is_user_working BIT
)

----Table 5

create table user_has_status
(
id int primary key,
user_account_id int references user_account(id),
status_id int references status(id)
)


-----------Inserting values into tables


insert into role values(1,'admin')
insert into role values(2,'user')


insert into user_account values(11,'Sam','sam1@gmail.com','smjng67edfc4647','smj647','aaaa')
insert into user_account values(22,'Ray','ray12@gmail.com','lwdwkied877xs335','lwd335','bbbb')


----select * from user_has_role

insert into user_has_role values(777,11,1,default)
insert into user_has_role values(888,22,2,default)

--ALTER TABLE user_has_role
--ALTER column role_start_time add DEFAULT CURRENT_TIMESTAMP();

--SELECT CURRENT_TIMESTAMP;

--ALTER TABLE user_has_role
--ADD CONSTRAINT df
--DEFAULT CURRENT_TIMESTAMP FOR role_start_time;

sp_help user_has_role


--ALTER TABLE user_has_role ADD DEFAULT CURRENT_TIMESTAMP FOR role_start_time

execute [dbo].[sp_helpconstraint] 'user_has_role'

--correct one

ALTER TABLE user_has_role
    ADD role_start_time DATETIME2(3) NOT NULL DEFAULT CURRENT_TIMESTAMP

insert into status values(123,'online',0)
insert into status values(234,'offline',1)

ALTER TABLE user_has_status
    ADD status_start_time DATETIME2(3) NOT NULL DEFAULT CURRENT_TIMESTAMP

select * from user_has_status

insert into user_has_status values(001,11,123,default)
insert into user_has_status values(002,22,234,default)


------------------Deleting all the data from each of the tables

-----Using TRUNCATE to delete all the date from tables while keeping the structure of the table.

--1

truncate table [dbo].[user_has_role]

--2

truncate table [dbo].[user_has_status]

-----Dropping constraints first off the tables to be able to truncate them

execute [dbo].[sp_helpconstraint] user_has_status

alter table user_has_status drop constraint FK__user_has___statu__160F4887

--Commands completed successfully.

--3

truncate table [dbo].[status]

---Dropping constraints

execute [dbo].[sp_helpconstraint] user_account

execute [dbo].[sp_helpconstraint] user_has_role

alter table user_has_role drop constraint FK__user_has___user___10566F31

--Commands completed successfully.

execute [dbo].[sp_helpconstraint] user_has_role

alter table user_has_role drop constraint FK__user_has___role___114A936A

--Commands completed successfully.

execute [dbo].[sp_helpconstraint] user_has_status

alter table user_has_status drop constraint FK__user_has___user___151B244E

--Commands completed successfully.

--4

truncate table [dbo].[user_account]

--Commands completed successfully.

--5

truncate table [dbo].[user_has_role]

--Commands completed successfully.


---------------------------Successfully deleted all the data from all of the tables.


/*
End of the Project
*/