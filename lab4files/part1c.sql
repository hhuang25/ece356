select * from Employee where salary >= 30000 AND salary <= 40000;
select d.deptID, d.deptName, d.location, e.empID, e.empName, e.job, e.salary
from Department d
left join Employee e on d.deptID = e.deptID;

EXPLAIN select * from Employee where salary >= 30000 AND salary <= 40000;
EXPLAIN select d.deptID, d.deptName, d.location, e.empID, e.empName, e.job, e.salary
from Department d
left join Employee e on d.deptID = e.deptID;

-- before:
--Employee
--id	select_type	table	type	possible_keys	key	key_len	ref	rows	Extra
--1	SIMPLE	Employee	ALL	""	""	""	""	1011	Using where
--Department
--id	select_type	table	type	possible_keys	key	key_len	ref	rows	Extra
--1	SIMPLE	d	ALL	""	""	""	""	4	""
--1	SIMPLE	e	ref	deptID	deptID	5	ece356db_h53huang.d.deptID	337	""

--After:
--Employee:
--id	select_type	table	type	possible_keys	key	key_len	ref	rows	Extra
--1	SIMPLE	Employee	range	salary_index	salary_index	5	""	1	Using where

--Department:
--id	select_type	table	type	possible_keys	key	key_len	ref	rows	Extra
--1	SIMPLE	d	ALL	""	""	""	""	4	""
--1	SIMPLE	e	ref	department_id	department_id	5	ece356db_h53huang.d.deptID	337	""

--There are 5 rows for Employee instead of 1011 because of the index.
--It uses our new index.
--The join type was "All" before, now it's "range".
