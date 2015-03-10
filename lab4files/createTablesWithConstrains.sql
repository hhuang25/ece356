

/* Lab 5 -  Part 1                                        */
/* Change table creation for Employeee and Department     */
/* Changes:                                               */
/* 1)Add primary key and referential integrity constrains */
/* 2) Add 1000 employees to the table to demostrate use   */       /* indexes                                                */


SET storage_engine=MEMORY;

/* replace xxxxx with your user id */
USE ece356db_xxxxx; 


/* Add primary key and foreing key constrains for Employee and Department */



DROP TABLE IF EXISTS Department;           
CREATE TABLE Department(deptID INT PRIMARY KEY NOT NULL,deptName VARCHAR(100),location VARCHAR(100));                    
          
DROP TABLE IF EXISTS Employee;  
CREATE TABLE Employee(empID INT PRIMARY KEY NOT NULL,empName VARCHAR(100),job VARCHAR(100),deptID INT,salary INT,foreign key (deptID) references Department(deptID)
);                  




INSERT INTO Department(deptID, deptName, location) VALUES(3, 'marketing', 'Waterloo');            
INSERT INTO Department(deptID, deptName, location) VALUES(7, 'research', 'Guelph');         
INSERT INTO Department(deptID, deptName, location) VALUES(12, 'software', 'Toronto');
INSERT INTO Department(deptID, deptName, location) VALUES(13, 'computing', 'Toronto');



INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(23, 'Smith', 'programmer', 12, 35000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(45, 'Kelly', 'engineer', 7, 37000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(56, 'Herr', 'janitor', 7, 26000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(89, 'Williams', 'analyst', 12, 36000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(77, 'Hergot', 'secretary', 7, 28000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(66, 'Hess', 'technician', 7, 32000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(92, 'Mays', 'engineer', 7, 45000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(68, 'Morris', 'secretary', 3, 23000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(69, 'Maria', 'engineer', 3, 32000); 


/* Add 1000 employees */

DROP PROCEDURE IF EXISTS INSERT_EMP;



DELIMITER $

CREATE PROCEDURE INSERT_EMP()

BEGIN

DECLARE ROW , SALARY INT; 

SET ROW = 100;
SET SALARY = 10000 ;


  label1: LOOP
    SET ROW = ROW + 1;
    SET SALARY = SALARY + 1;

    
    INSERT INTO Employee(empId, empName, job, deptID, salary)         VALUES(ROW, 'Test', 'programmer', 12, SALARY);

    
   

    IF ROW > 1101 THEN
      LEAVE label1;
    END IF;

    
  END LOOP label1;
  COMMIT;
 
END;
$
DELIMITER ;

CALL INSERT_EMP;



            
          
            



