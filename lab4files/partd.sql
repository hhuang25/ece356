
--declare @tempvar int;
call increase_salary_proc(45, 120.00, @tempvar); 
select @tempvar;

call increase_salary_proc(70, 25.00, @tempvar2); 
select @tempvar2;

select * from Employee where empID = 68;
call increase_salary_proc(68, 20.00, @tempvar); 
select * from Employee where empID = 68;
select @tempvar;

select * from Employee;