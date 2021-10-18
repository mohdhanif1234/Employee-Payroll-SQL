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

--UC-6: Alter the table to add gender
alter table employee_payroll add Gender char(1);
update employee_payroll set Gender='M';
update employee_payroll set Gender='F' where Id='1';

--UC-7: Ability to find sum, average, min, max and number of male and female employees
select SUM(Salary) as TotalSalary,Gender from employee_payroll group by Gender;
select AVG(Salary) as AverageSalary from employee_payroll group by Gender;
select count(Salary) as TotalSalary,Gender from employee_payroll group by Gender;
select Min(Salary) as MinSalary,Gender from employee_payroll group by Gender;
select Max(Salary) as MaxSalary,Gender from employee_payroll group by Gender;

--UC-8: Ability to store additional information
alter table employee_payroll add PhoneNumber bigint;
alter table employee_payroll add Department varchar(250) not null default 'HR';
alter table employee_payroll add Address varchar(250) default 'Bengaluru';
select * from employee_payroll;

--UC-9: Extending employee payroll
Exec sp_rename 'employee_payroll.Salary', 'BasicPay';
alter table employee_payroll add TaxablePay float, Deduction float,IncomeTax float,NetPay float;
update employee_payroll set Deduction = '4000' where Department = 'HR';
update employee_payroll set Deduction = '3000' where Department = 'Sales';
update employee_payroll set Deduction = '2000' where Department = 'Customer Service';
update employee_payroll set NetPay = (BasicPay-Deduction);
update employee_payroll set TaxablePay = '1000';
update employee_payroll set IncomeTax = '200';
select * from employee_payroll;

--UC-10: Creating duplicate entries for a single person
insert into employee_payroll(Name,BasicPay,StartDate,Gender,PhoneNumber,Department,Address,TaxablePay,Deduction,IncomeTax,NetPay) values('Terissa','525245','2018/03/01','F','7345787969','Sales','Chennai','1000','4000','200','522245');
insert into employee_payroll(Name,BasicPay,StartDate,Gender,PhoneNumber,Department,Address,TaxablePay,Deduction,IncomeTax,NetPay) values('Terissa','525245','2018/03/01','F','7345787969','Marketing','Chennai','0','0','0','0');