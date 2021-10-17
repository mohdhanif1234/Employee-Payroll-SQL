--UC-1: Creating a database
create database payroll_service;

--UC-2: Creating a table
create table employee_payroll(
	Id int identity(1,1) primary key,
	Name varchar (200),
	Salary float,
	StartDate date
	);