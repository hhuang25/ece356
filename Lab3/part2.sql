
/* Lab 3- Part 2- Add  constraints to DB 

 You must add to each table:
 a) Primary key constrains
 b) A referencial integrity constrains

*/
SET storage_engine=INNODB;

/* 2.a - Add primary key constrains 
Example, for the Department table you can do this with the commands:

ALTER TABLE Department ADD PRIMARY KEY(deptID);
or
DROP TABLE IF EXISTS Department;           
CREATE TABLE Department(deptID INT PRIMARY KEY,deptName VARCHAR(100),location VARCHAR(100));  


/* 2.b - Add referencial integrity constrains
Example, Employee table has a column that depends on column   deptID of the Dep[artment table

You will add the following to your CREATE statement (or you can use an ALTER command as well):

foreign key (deptID) references Department(deptID)

DROP TABLE IF EXISTS Employee;  
CREATE TABLE Employee( INT PRIMARY KEY,empName VARCHAR(100),job VARCHAR(100),deptID INT,salary INT,foreign key (deptID) references Department(deptID) );

/* Tables created in lab 1 */

USE ece356db_h53huang; 

DROP TABLE IF EXISTS Assigned;             
CREATE TABLE Assigned(empID INT,projID INT,role VARCHAR(100));  

DROP TABLE IF EXISTS Department;           
CREATE TABLE Department(deptID INT ,deptName VARCHAR(100),location VARCHAR(100));                    
          
DROP TABLE IF EXISTS Employee;  
CREATE TABLE Employee(empID INT,empName VARCHAR(100),job VARCHAR(100),deptID INT,salary INT);

               

DROP TABLE IF EXISTS ProjectSupply;  
         
CREATE TABLE ProjectSupply(projectID INT,
supplyID INT, supplyCount Int); 

        
DROP TABLE IF EXISTS Project;           
CREATE TABLE Project(projID INT,title VARCHAR(100),budget INT,funds INT);

Alter Table Department Add Primary Key(deptID);
Alter Table Employee Add Primary Key(empID);
Alter Table Project Add Primary Key (projID);


-- For the Assigned table, you need ti specify a  
-- primary key that includes two columns      

Alter Table Assigned Add Primary Key(empID, projID);
Alter Table Assigned Add Foreign Key (empID) references Employee(empID) ON DELETE CASCADE ON UPDATE CASCADE;
Alter Table Assigned Add Foreign Key (projID) references Project(projID)ON DELETE CASCADE ON UPDATE CASCADE;

/* Tables created in lab 2 */

DROP TABLE IF EXISTS Supply; 
         
CREATE TABLE Supply(supplyID INT,
supplyDescription VARCHAR(100),
unitDescription VARCHAR(100),
costPerunit DECIMAL(8,2), 
typeID INT
); 

DROP TABLE IF EXISTS SupplyType;  
         
CREATE TABLE SupplyType(supplyTypeID INT,
description VARCHAR(100)); 


Alter Table SupplyType Add Primary Key (supplyTypeID);
Alter Table Supply Add Primary Key (supplyID);
Alter Table Supply Add Foreign Key (typeID) references SupplyType(supplyTypeID);


/* Add here statements to create your ProjectSupply table ( from your solution to part 1), adding primary key and foreign key constrains. */


Alter Table ProjectSupply Add Primary Key (projectID, supplyID);
Alter Table ProjectSupply Add Foreign Key (supplyID) references Supply(supplyID);
--show index from SupplyType;
/* Reinsert data into all tables 

You can use the INSERT statements provided in createTables.sql, and in  your solution for part1 (in your modified part1.sql)

Bonus: Practice using the MySQL autoincrement feature when inserting data into a table. 

*/

ALTER TABLE Employee MODIFY COLUMN empID INT auto_increment;
/*
DROP TABLE IF EXISTS Assigned;             
CREATE TABLE Assigned(empID INT,projID INT,role VARCHAR(100));  
               
DROP TABLE IF EXISTS Department;           
CREATE TABLE Department(deptID INT,deptName VARCHAR(100),location VARCHAR(100));                    
          
DROP TABLE IF EXISTS Employee;  
CREATE TABLE Employee(empID INT,empName VARCHAR(100),job VARCHAR(100),deptID INT,salary INT);
        
DROP TABLE IF EXISTS Project;           
CREATE TABLE Project(projID INT,title VARCHAR(100),budget INT,funds INT);
*/


INSERT INTO Department(deptID, deptName, location) VALUES(3, 'marketing', 'Waterloo');           
INSERT INTO Department(deptID, deptName, location) VALUES(7, 'research', 'Guelph');          
INSERT INTO Department(deptID, deptName, location) VALUES(12, 'software', 'Toronto');
INSERT INTO Department(deptID, deptName, location) VALUES(13, 'computing', 'Toronto');



INSERT INTO Employee(empName, job, deptID, salary) VALUES('Smith', 'programmer', 12, 35000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Kelly', 'engineer', 7, 37000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Herr', 'janitor', 7, 26000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Williams', 'analyst', 12, 36000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Hergot', 'secretary', 7, 28000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Hess', 'technician', 7, 32000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Mays', 'engineer', 7, 45000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Morris', 'secretary', 3, 23000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Maria', 'engineer', 3, 32000);
            

           
INSERT INTO Project(projID, title, budget, funds) VALUES(345, 'compiler', 500000, 250000);
INSERT INTO Project(projID, title, budget, funds) VALUES(123, 'display', 650000, 370000);
          
            
INSERT INTO Assigned(empID, projID, role) VALUES(1, 345, 'programmer');  
INSERT INTO Assigned(empID, projID, role) VALUES(1, 123, 'programmer');            
INSERT INTO Assigned(empID, projID, role) VALUES(6, 123, 'programmer');        
INSERT INTO Assigned(empID, projID, role) VALUES(5, 123, 'secretary');           
INSERT INTO Assigned(empID, projID, role) VALUES(2, 123, 'manager'); 
INSERT INTO Assigned(empID, projID, role) VALUES(4, 345, 'manager');     
INSERT INTO Assigned(empID, projID, role) VALUES(7, 123, 'engineer'); 



INSERT INTO SupplyType (Select distinct typeID, typeDescription  FROM SupplyData);
INSERT INTO Supply (Select supplyID, supplyDescription, unitDescription, costPerUnit, typeID FROM SupplyData);

INSERT INTO ProjectSupply Values(123, 103, 10);
INSERT INTO ProjectSupply Values(345, 104, 2);
INSERT INTO ProjectSupply Values(345, 101, 15);


