create index salary_index on Employee(salary) using BTREE;

-- create index department_id on Department(deptID) using HASH;
create index department_id on Employee(deptID) using HASH;
