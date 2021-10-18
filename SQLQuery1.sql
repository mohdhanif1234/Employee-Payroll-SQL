--UC-1: Creating a database
create database payroll_service;

--UC-2: Creating a table
create table employee_payroll(
	Id int identity(1,1) primary key,
	Name varchar (200),
	Salary float,
	StartDate date
	);

--UC-3: Performing CRUD operations
insert into employee_payroll values
('Varun','125245','2016/03/01') ,
('Hanif','13335','2018/01/05'),
('Deeptimayee','525245','2019/03/01'),
('Ameeja','541236','2016/11/29'),
('Naveen','147853','2020/07/14');

--UC-4: Retrieve all data
select * from employee_payroll;

--UC-5: Retrieving specific data
select Name,StartDate from employee_payroll where Name='Hanif';
select * from employee_payroll where StartDate between cast('2005-01-01' as date) and getdate();